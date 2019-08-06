package com.lft.entity;

import java.util.Date;

import com.lft.entity.City;

public class ScenicSpot {
	/**景点编号*/
	private int scenicId;
	/**类型编号*/
	private int typeId;
	/**城市编号*/
	private String cityId;
	/**标签编号*/
	private int labelId;
	private String image;
	private String title;
	private String details;
	private int price;
	private Date createTime;
	
	private SpotType spotType;
	private Label label;
	private City city;
	
	private Schedule schedule;
	private Hotel hotel;
	
	public ScenicSpot(){
		
	}
	public ScenicSpot(int scenicId, int typeId, String cityId, int labelId,
			String image, String title, String details, int price, Date createTime) {
		super();
		this.scenicId = scenicId;
		this.typeId = typeId;
		this.cityId = cityId;
		this.labelId = labelId;
		this.image = image;
		this.title = title;
		this.details = details;
		this.price = price;
		this.createTime = createTime;
	}
	public int getScenicId() {
		return scenicId;
	}
	public void setScenicId(int scenicId) {
		this.scenicId = scenicId;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public int getLabelId() {
		return labelId;
	}
	public void setLabelId(int labelId) {
		this.labelId = labelId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public SpotType getSpotType() {
		return spotType;
	}
	public void setSpotType(SpotType spotType) {
		this.spotType = spotType;
	}
	public Label getLabel() {
		return label;
	}
	public void setLabel(Label label) {
		this.label = label;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	
	
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	@Override
	public String toString() {
		return "ScenicSpot [scenicId=" + scenicId + ", typeId=" + typeId
				+ ", cityId=" + cityId + ", labelId=" + labelId + ", image="
				+ image + ", title=" + title + ", details=" + details
				+ ", price=" + price + ", createTime=" + createTime
				+ ", spotType=" + spotType + ", label=" + label + ", city="
				+ city + "]";
	}
	
	
	
	
	
}
