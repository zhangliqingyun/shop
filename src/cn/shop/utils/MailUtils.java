package cn.shop.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

/*
 * 
 * 邮件激活工具类
 */
public class MailUtils {
  
	/*
	 * 发送邮件的方法 
	 * to:邮件人
	 * code:验证码
	 */
	public static void sendMail(String to,String code){
		/*
		 * 1.创建Session对象
		 * 2.创建代表邮件的Message
		 * 3.发送邮件的Transport
		 */
		
		//1.获得连接对象
		Properties props=new Properties();
		props.setProperty("mail.host", "localhost");
	    Session session= Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("service@shop.com", "111");
			}	
	    });
	    
	    //2.创建邮件对象message
	    Message message=new MimeMessage(session);
	    try {
	    	  //设置发件人
			message.setFrom(new InternetAddress("service@shop.com"));
			//设置收件人
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			//设置邮件标题
			message.setSubject("来自清云商城官网的激活邮箱");
			//设置邮件内容
			//message.setContent("<h1>清云商城激活邮件！点下面链接完成激活</h1><h3><a href='http://10.12.111.73:8080/shop/user_active.action'>http://10.12.111.73:8080/shop/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			message.setContent("<h1>清云商城激活邮件！点下面链接完成激活</h1><h3><a href='http://10.12.111.73:8080/shop/user_active.action?code="+code+"'>http://10.12.111.73:8080/shop/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			//发送邮件
			Transport.send(message);
	    } catch (Exception e) {	
			e.printStackTrace();
		}
	}
	
}
