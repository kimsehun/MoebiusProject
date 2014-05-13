package kr.co.moebius.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MailAction {
	private static final Logger logger = LoggerFactory.getLogger(MailAction.class);
	
	public static boolean sendMail(String smtpHost, String fromAddr, String toAddr, String subject, String mailBody){
		
	
	boolean result = false;
	
	MimeMessage message = null;
	
	Session session = null;
	Properties props = null;
	InternetAddress iaFrom = null;
	InternetAddress iaTo = null;

	props = new Properties();
	props.put("mail.smtp.host",smtpHost);
	
	session = Session.getDefaultInstance(props);
	
		try {
			iaFrom = new InternetAddress(fromAddr);
			iaTo = new InternetAddress(toAddr);
			
			message = new MimeMessage(session);
			message.setFrom(iaFrom);
			message.setRecipient(Message.RecipientType.TO, iaTo);
			message.setSubject(subject,"UTF-8");
			message.setContent(mailBody,"text/html; charset=UTF-8");
			Transport.send(message);
			result = true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info(e.getMessage());
		}
	return result;
	}
}
	
