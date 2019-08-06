package com.lft.entity;

import java.util.Date;

public class Message {

	
	private int id;
	private String context;
	private  int userId;
	private Date createTime;
	private int scenicId;
	
	private User user;

	public Message() {
		super();
	}

	

	public Message(int id, String context, int userId,Date date ,int scenicId) {
		super();
		this.id = id;
		this.context = context;
		this.userId = userId;
		this.createTime = date;
		this.scenicId = scenicId;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

	public int getScenicId() {
		return scenicId;
	}



	public void setScenicId(int scenicId) {
		this.scenicId = scenicId;
	}



	@Override
	public String toString() {
		return "Message [id=" + id + ", context=" + context + ", userId="
				+ userId + ", createTime=" + createTime + ", user=" + user
				+ "]";
	}
	
	
	
	
	
}
