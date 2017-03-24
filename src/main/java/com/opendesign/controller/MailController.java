package com.opendesign.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.opendesign.vo.MailVO;
 
@Controller
public class MailController {
	@RequestMapping(value="/email")
	public ModelAndView emailView(){
		return new ModelAndView("email");
	}

	@RequestMapping(value="/emailSubmit", method=RequestMethod.POST)
//	public ModelAndView emailSend(@ModelAttribute("mailVO")MailVO mailVO, BindingResult result) throws SQLException, AddressException, MessagingException{
	public ModelAndView emailSend(HttpServletRequest request) throws SQLException, AddressException, MessagingException{
		
		String page = "emailSubmit";
//		EmailValidator validator = new EmailValidator();
//		validator.validate(mailVO, result);
//		if(result.hasErrors()){
//			page = "no";
//		}
		
		String add = request.getParameter("address");
		String name = request.getParameter("name");
		String messagelog = request.getParameter("message");
		String subject = request.getParameter("subject");
		
		System.out.println(add);
		System.out.println(name);
		System.out.println(messagelog);
		System.out.println(subject);

	    try
	    {
	      // create a mysql database connection
	      String myDriver = "com.mysql.jdbc.Driver";
	      String myUrl = "jdbc:mysql://113.198.210.237:13306/opendesign?useUnicode=true&characterEncoding=UTF-8";
	      Class.forName(myDriver);
	      Connection conn = DriverManager.getConnection(myUrl, "kim", "crc503");

	      // the mysql insert statement
	      String query = " insert into t_contact (email_address, full_name, message, subject)"
	        + " values (?, ?, ?, ?)";

	      // create the mysql insert preparedstatement
	      PreparedStatement preparedStmt = conn.prepareStatement(query);
	      preparedStmt.setString (1, add);
	      preparedStmt.setString (2, name);
	      preparedStmt.setString (3, messagelog);
	      preparedStmt.setString (4, subject);

	      // execute the preparedstatement
	      preparedStmt.execute();
	      
	      conn.close();
	    }
	    catch (Exception e)
	    {
	      System.err.println("Got an exception!");
	      System.err.println(e.getMessage());
	    }						
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.quitwait", "false");
         
        Authenticator auth = new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("opensrcdesign@gmail.com", "1q2w3e!@");
            }
        };
    
        Session session = Session.getDefaultInstance(props,auth);
         
        MimeMessage message = new MimeMessage(session);
        message.setSender(new InternetAddress("opensrcdesign@gmail.com"));
        message.setSubject("Hello We are OpenSrcDesign");
 //받는 사람 메
//        message.setRecipient(Message.RecipientType.TO, new InternetAddress("gudwns999@naver.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(add));
         
        Multipart mp = new MimeMultipart();
        MimeBodyPart mbp1 = new MimeBodyPart();
        mbp1.setText(messagelog);
        mp.addBodyPart(mbp1);
        
        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
        CommandMap.setDefaultCommandMap(mc);

       message.setContent(mp);
         
        Transport.send(message);


		return new ModelAndView(page);
	}
}
