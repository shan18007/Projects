package com.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

public class MailBean {
	
	public MailBean() {
		
	}
	//credential to send mail
	final String USERNAME = "examorganizer09@gmail.com";
	final String PASSWORD = "Onlineexam@1234";
	
	
	//method which send mail
	public String sendMail(String emailTo, String sub, String msg) {
		
		Properties properties = new Properties();
		
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getDefaultInstance(properties, 
		  new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(USERNAME, PASSWORD);
			}
		});
		
		try {
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("examorganizer09@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(emailTo));
			//aading subject for message
			message.setSubject(sub);
			
            //message which sent to user
            message.setText(msg+" : "+new Date());
			
			Transport.send(message);
			System.out.println("Message Sent");
			return "success";
			
			
		} catch (MessagingException e) {
			return e.getMessage();
		}
	}
	
	
	//send group mail
	public String sendGroupMail(ArrayList<String> toEmails, String sub, String msg) {
		
		try {
			
			Properties emailProperties;
			Session mailSession;
			MimeMessage emailMessage;
		
			emailProperties = System.getProperties();
			emailProperties.put("mail.smtp.port", "587");
			emailProperties.put("mail.smtp.auth", "true");
			emailProperties.put("mail.smtp.starttls.enable", "true");

			mailSession = Session.getDefaultInstance(emailProperties, null);
			emailMessage = new MimeMessage(mailSession);
			
			for (int i = 0; i < toEmails.size(); i++) {
				emailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(toEmails.get(i)));
			}
			
			emailMessage.setSubject(sub);
			//	emailMessage.setContent(msg, "text/html");//for a html email
			emailMessage.setText(msg);// for a text email
			
			String emailHost = "smtp.gmail.com";
			String fromUser = USERNAME;
			String fromUserEmailPassword = PASSWORD;
			
			Transport transport = mailSession.getTransport("smtp");
			
			transport.connect(emailHost, fromUser, fromUserEmailPassword);
			transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
			transport.close();
			return "sucess";
			
			
		} 
		catch (Exception e) {
			return e.getMessage();
		}
		
	}
	
}
