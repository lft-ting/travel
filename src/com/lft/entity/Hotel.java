package com.lft.entity;

public class Hotel {

	private int id;
	private String name;
	private String roomType;
	private String address;
	private String telephone;
	
	
	public Hotel() {
		super();
	}
	public Hotel(int id, String name, String roomType, String address, String telephone) {
		super();
		this.id = id;
		this.name = name;
		this.roomType = roomType;
		this.address = address;
		this.telephone = telephone;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	@Override
	public String toString() {
		return "Hotel [id=" + id + ", name=" + name + ", roomType=" + roomType + ", address=" + address + ", telephone="
				+ telephone + "]";
	}
	
	
}
