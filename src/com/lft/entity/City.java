package com.lft.entity;

import com.lft.entity.Province;

public class City {
	/**编号（主键）*/
	private int id;
	/**城市ID*/
	private String cityId;
	/**城市名称*/
	private String cityName;
	/**所在省份编号*/
	private String father;
	
	/**所在省份对象*/
	private Province province;//复合属性
	
	/**构造函数*/
	public City() {
		super();
	}
	public City(int id, String cityId, String cityName, String father) {
		super();
		this.id = id;
		this.cityId = cityId;
		this.cityName = cityName;
		this.father = father;
	}

	/**访问器getter与setter*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getFather() {
		return father;
	}

	public void setFather(String father) {
		this.father = father;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	@Override
	public String toString() {
		return "City [id=" + id + ", cityId=" + cityId + ", cityName=" + cityName + ", father=" + father + ", province="
				+ province + "]";
	}
}
