package com.lft.entity;

import java.util.Date;

public class OrderDetail {

	private int id;
	private int orderid;
	private int scenicId;
	private String name;
	private String phone;
	private int num;
	private Date goDate;
	private int total;
	private ScenicSpot Scenic;
	
	public OrderDetail() {
		super();
	}


	public OrderDetail(int id, int orderid, int scenicId, String name,
			String phone, int num, Date goDate, int total) {
		super();
		this.id = id;
		this.orderid = orderid;
		this.scenicId = scenicId;
		this.name = name;
		this.phone = phone;
		this.num = num;
		this.goDate = goDate;
		this.total = total;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getOrderid() {
		return orderid;
	}


	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}


	public int getScenicId() {
		return scenicId;
	}


	public void setScenicId(int scenicId) {
		this.scenicId = scenicId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public Date getGoDate() {
		return goDate;
	}


	public void setGoDate(Date goDate) {
		this.goDate = goDate;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}
	


	public ScenicSpot getScenic() {
		return Scenic;
	}


	public void setScenic(ScenicSpot scenic) {
		Scenic = scenic;
	}


	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", orderid=" + orderid + ", scenicId="
				+ scenicId + ", name=" + name + ", phone=" + phone + ", num="
				+ num + ", goDate=" + goDate + ", total=" + total + "]";
	}


	
	
	
	
}
