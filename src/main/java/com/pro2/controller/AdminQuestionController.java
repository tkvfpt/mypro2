package com.pro2.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pro2.dao.QuestionDAO;
import com.pro2.dao.entity.Question;
import com.pro2.dao.entity.ShopInfo;

@Controller
@RequestMapping("/admin")
public class AdminQuestionController {
	
	@Autowired
	QuestionDAO questionDAO;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	JavaMailSender mailSender;
	
	SimpleMailMessage simpleMessage;
	
	public static final Logger LOG = Logger.getLogger(AdminQuestionController.class);
	
	@RequestMapping(value="/question/all", method=RequestMethod.GET)
	public String showAll(Model model){
		List<Question> list = questionDAO.getAll();
		model.addAttribute("list",list);
		LOG.info("showAll running");
		return "admin/question/list";
	}
	
	@RequestMapping(value="/question/detail")
	public String detail(Model model, HttpServletRequest request){
		Question question =(Question) questionDAO.getObject(Integer.parseInt(request.getParameter("id")));
		model.addAttribute("question",question);
		return "admin/question/update";
	}
	
	@RequestMapping(value="/question/reply",method=RequestMethod.POST)
	public String reply(Model model, HttpServletRequest request, @RequestParam MultipartFile attachment) {
		MimeMessage message = mailSender.createMimeMessage();
		simpleMessage = new SimpleMailMessage();
		 
		simpleMessage.setFrom(( (ShopInfo) model.asMap().get("shop") ).getMail());
		simpleMessage.setTo(request.getParameter("mail"));
		simpleMessage.setSubject(request.getParameter("title"));
		simpleMessage.setText(request.getParameter("reply"));
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(simpleMessage.getFrom());
			helper.setTo(simpleMessage.getTo());
			helper.setSubject(simpleMessage.getSubject());
			helper.setText(simpleMessage.getText());
			FileSystemResource file = new FileSystemResource(attachment.getName());
			helper.addAttachment(file.getFilename(), file);
		} catch (MessagingException e) {
			LOG.info(e);
			e.printStackTrace();
		}
		return "redirect:/admin/question/all";
	}
}