package com.pro2.controller;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro2.dao.CustomerDAO;
import com.pro2.dao.entity.Customer;
import com.pro2.dao.entity.Question;
import com.pro2.dao.entity.ShopInfo;
import com.pro2.dao.utils.CommonUtils;

@Controller
@RequestMapping("/customer")
public class ClientCustomerController {
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	MailSender mailSender;
	
	public static final Logger logger = Logger.getLogger(AdminProductController.class);
	
	@RequestMapping("/login")
	public String login(Model model, HttpSession session,HttpServletRequest request) {
		Customer cus = (Customer)customerDAO.getObject(request.getParameter("username"),request.getParameter("password"));
		if(Objects.isNull(cus)) {
			request.setAttribute("emessage","Account not exists");
			return "client/auth";
		}
		session.setAttribute("client",cus);
		session.setMaxInactiveInterval(60*60*30*12);
		return "redirect:/";
	}
	
	@RequestMapping("/auth")
	public String loginpage(Model model, HttpSession session,HttpServletRequest request) {
			return "client/auth";
	}
	@RequestMapping("/signup")
	public String signup(Model model, HttpSession session,HttpServletRequest request, Customer customer) {
		customerDAO.saveObject(customer);
		request.setAttribute("message", "sign up");
		return "client/success";
	}
	
	@RequestMapping("/question")
	public String question(Model model, HttpSession session,HttpServletRequest request) {
			String msg = request.getParameter("message");
			Customer cus = (Customer)session.getAttribute("client");
			ShopInfo shop = (ShopInfo)model.asMap().get("shop");
			CommonUtils.sendMail(mailSender,shop.getMail() , msg, "Question from "+cus.getEmail());
			Question question = new Question();
			question.setCustomer(cus);
			question.setDesc(msg);
			question.setEmail(cus.getEmail());
			question.setTitle("Question");
			question.setPhone(cus.getPhone());
			customerDAO.saveObject(question);
			request.setAttribute("message", "sent question");
			return "client/success";
	}
}