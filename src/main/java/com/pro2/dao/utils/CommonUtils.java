package com.pro2.dao.utils;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.Objects;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.pro2.constants.ECommerceGlobalConstant;

public class CommonUtils {

	private static final Logger LOG = Logger.getLogger("commonUtils");

	private CommonUtils() {
		throw new IllegalStateException("Utility class");
	}

	/**
	 * this method used for setting properties from client request for obj
	 * 
	 * @param obj
	 *            {@link Object}
	 * @param request
	 *            {@link HttpServletRequest}
	 * @return obj {@link Object}
	 */
	public static Object settingAttributeForObject(Object obj, HttpServletRequest request) {
Map<String, String[]> requestParams = request.getParameterMap();	
		
		Field[] objFields = getObjFields(obj);		
		for (int i = 0; i < objFields.length; i++) {
			objFields[i].setAccessible(true);
			try {
				if(Objects.isNull(requestParams.get(objFields[i].getName()))){
					continue;
				}
				if(objFields[i].getType().getName().equals("int")){
					objFields[i].set(obj, getFieldValueByType(requestParams.get(objFields[i].getName())));
				}else{
					objFields[i].set(obj, requestParams.get(objFields[i].getName())[0]);
				}
				
			} catch (IllegalArgumentException | IllegalAccessException e) {
				LOG.info(e.getMessage());
			}
		}
		return obj;
	}

	/**
	 * this method is used for getting field value by its type
	 * 
	 * @param obj
	 *            {@link String[]}
	 * @return {@link Object}
	 */
	private static Object getFieldValueByType(String[] obj) {		
		if (checkInteger(obj[0])) {
			return new Integer(obj[0]);
		}
		return obj[0];
	}

	/**
	 * 
	 * @param str
	 *            {@link String}
	 * @return {@link boolean}
	 */
	private static boolean checkInteger(String str) {
		try {
			new Integer(str);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static Field[] getObjFields(Object obj) {
		return obj.getClass().getDeclaredFields();
	}
	/**
	 * Send Mail
	 * @param mailSender
	 */
	public static void sendMail(MailSender mailSender, String to) {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(to);
			message.setSubject("Successfully Order");
			message.setText("We've received your order. Thank you for shopping with us");
			mailSender.send(message);
		}catch(Exception e) {
			LOG.info("commonUtils.sendMail() "+e.getMessage());
		}
	}
	
	public static String getValidImageName(String name) {
		String[] names = name.split(" ");
		if(Objects.nonNull(names)) {
			StringBuilder builder = new StringBuilder();
			for(String n : names) {
				builder.append(n);
				builder.append(ECommerceGlobalConstant.UNDERSCORE);
			}
			builder.deleteCharAt(builder.lastIndexOf(ECommerceGlobalConstant.UNDERSCORE));
		}
		return name;
	}
}
