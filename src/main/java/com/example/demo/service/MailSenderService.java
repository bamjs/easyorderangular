package com.example.demo.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.example.demo.model.Order;

@Service
public class MailSenderService {
	@Autowired
	private JavaMailSender mailsender;
	@Autowired
	private OrderService orderservice;

	public void sendSimpleEmail(String toAddress, String subject, String msgbody) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("esayorder.mailsender@gmail.com");
		message.setTo(toAddress);
		message.setSubject(subject);
		message.setText(msgbody);
		mailsender.send(message);
		System.out.println("mail sent");
	}

	public void sendmimeEmail(Long OrderID, String toAddress, String subject) {
		MimeMessage mimemsg = mailsender.createMimeMessage();
		try {
			MimeMessageHelper mimemessagehelper = new MimeMessageHelper(mimemsg, true);
			mimemessagehelper.setTo(toAddress);
			mimemessagehelper.setSubject(subject);
			mimemessagehelper.setText(updatemsgbody(OrderID), true);
			mailsender.send(mimemsg);
			System.out.println("mime msg sent ");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private String updatemsgbody(Long OrderID) {
		Order order = orderservice.getOrderDetailsByID(OrderID);
		String paymentstatus = order.getstatus();
		if(paymentstatus.equals("Payment Succesful")){
			paymentstatus = "<h1>Your Payment Has been Recevied Successfull!!!</h1><br><h3>Order Placed</h3>";
	
		}else if(paymentstatus.equals("Payment Started")){
			
			paymentstatus = "<h1>Your Payment Has been Started But not Successfull !!!</h1><br><h3> Order not Placed</h3>";
			
		}else if(paymentstatus.equals("Payment Failed")) {
			paymentstatus = "<h1>Your Payment Has been Failed You will Get get Refund if Ammount has been Deducted</h1><br><h3> Order not Placed</h3>";

		}
		System.out.println(paymentstatus);

		return "  <body>" + paymentstatus
				+ "<table style=\"border:2px solid blue;width:300px;height:200px\"><tr style=\"border:1px solid black;width:300px;\" ><th>Total Ammount</th><td>"
				+ order.getamount()
				+ "</td></tr><tr style=\\\"border:1px solid black;width:100px;\\\"><th>Total Quanitty</th><td>"
				+ order.getquantity()
				+ "</td><tr style=\\\"border:1px solid black;width:100px;\\\"><th>Order Date</th><td>"
				+ order.getorderDate() + "</td></tr></tr></table></body></html>";
	}
}
