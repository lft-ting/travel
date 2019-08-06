package com.lft.entity;

import java.util.Date;

public class User {

	/**用户编号*/
	private int id;
	/**登录手机号*/
	private String userphone;
	/**密码*/
	private String password;
	/**权限(1、管理员 2、普通用户)*/
	private String rule;
	/**昵称*/
	private String username;
	/**真实姓名*/
	private String realName;
	/**性别(1、男 2、女)*/
	private String sex;
	/**生日*/
	private Date birthday;
	/**用户头像路径*/
	private String imagePath;
	/**备注信息*/
	private String content;
	/**注册时间*/
	private Date registDate;
	
	public User(){
		
	}
	public User(int id, String userphone, String password, String rule,
			String username, String realName, String sex, Date birthday,
			String imagePath, String content, Date registDate) {
		super();
		this.id = id;
		this.userphone = userphone;
		this.password = password;
		this.rule = rule;
		this.username = username;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.imagePath = imagePath;
		this.content = content;
		this.registDate = registDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userphone=" + userphone + ", password=" + password + ", rule=" + rule
				+ ", username=" + username + ", realName=" + realName + ", sex=" + sex + ", birthday=" + birthday
				+ ", imagePath=" + imagePath + ", content=" + content + ", registDate=" + registDate + "]";
	}
}
