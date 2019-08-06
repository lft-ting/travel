package com.lft.entity;

public class Schedule {

	private int id;
	private int scenicId;
	private String schedule;
	private int hotelId;
	
	
	public Schedule() {
		super();
	}


	public Schedule(int id, int scenicId, String schedule, int hotelId) {
		super();
		this.id = id;
		this.scenicId = scenicId;
		this.schedule = schedule;
		this.hotelId = hotelId;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getScenicId() {
		return scenicId;
	}


	public void setScenicId(int scenicId) {
		this.scenicId = scenicId;
	}


	public String getSchedule() {
		return schedule;
	}


	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}


	public int getHotelId() {
		return hotelId;
	}


	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}


	@Override
	public String toString() {
		return "Schedule [id=" + id + ", scenicId=" + scenicId + ", schedule=" + schedule + ", hotelId=" + hotelId
				+ "]";
	}
	
	
}
