package com.example.demo.model;

public class Mail {

	private String toAddress;
	private String subject;
	private String text;
	private Long orderID;
	private String paymentStatus;
	public Mail(String toAddress, String subject, String text, Long orderID,String paymentStatus) {
		this.toAddress = toAddress;
		this.subject = subject;
		this.text = text;
		this.orderID = orderID;
		this.paymentStatus=paymentStatus;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Long getorderID() {
		return this.orderID;
	}

	public void setorderID(Long orderID) {
		this.orderID = orderID;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
