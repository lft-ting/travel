package com.lft.entity;

import java.util.Date;
import java.util.List;

public class Order {

	private int id;
	private int userId;
	private int orderId;
	private Date createTime;
	private String note;
	private OrderDetail orderDetail;
	public Order() {
		super();
	}
	public Order(int id, int userId, int orderId, Date createTime, String note) {
		super();
		this.id = id;
		this.userId = userId;
		this.orderId = orderId;
		this.createTime = createTime;
		this.note = note;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
	public OrderDetail getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", userId=" + userId + ", orderId=" + orderId + ", createTime=" + createTime
				+ ", note=" + note + "]";
	}
	
	
}
