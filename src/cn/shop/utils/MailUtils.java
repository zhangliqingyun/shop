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
 * �ʼ��������
 */
public class MailUtils {
  
	/*
	 * �����ʼ��ķ��� 
	 * to:�ʼ���
	 * code:��֤��
	 */
	public static void sendMail(String to,String code){
		/*
		 * 1.����Session����
		 * 2.���������ʼ���Message
		 * 3.�����ʼ���Transport
		 */
		
		//1.������Ӷ���
		Properties props=new Properties();
		props.setProperty("mail.host", "localhost");
	    Session session= Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("service@shop.com", "111");
			}	
	    });
	    
	    //2.�����ʼ�����message
	    Message message=new MimeMessage(session);
	    try {
	    	  //���÷�����
			message.setFrom(new InternetAddress("service@shop.com"));
			//�����ռ���
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			//�����ʼ�����
			message.setSubject("���������̳ǹ����ļ�������");
			//�����ʼ�����
			//message.setContent("<h1>�����̳Ǽ����ʼ���������������ɼ���</h1><h3><a href='http://10.12.111.73:8080/shop/user_active.action'>http://10.12.111.73:8080/shop/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			message.setContent("<h1>�����̳Ǽ����ʼ���������������ɼ���</h1><h3><a href='http://10.12.111.73:8080/shop/user_active.action?code="+code+"'>http://10.12.111.73:8080/shop/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			//�����ʼ�
			Transport.send(message);
	    } catch (Exception e) {	
			e.printStackTrace();
		}
	}
	
}
