package com.lft.entity;
/**
 * 映射tab_province省份表的实体类
 */
public class Province {
	
	/**编号（主键）*/
	private int id;
	/**省份ID*/
	private String provinceId;
	/**省份名称*/
	private String provinceName;
	
	private String imagePath;
	
	/**构造函数*/
	public Province() {
		super();
	}

	public Province(int id, String provinceId, String provinceName ,String imagePath) {
		super();
		this.id = id;
		this.provinceId = provinceId;
		this.provinceName = provinceName;
		this.imagePath = imagePath;
	}

	/**访问器getter与setter*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Province [id=" + id + ", provinceId=" + provinceId
				+ ", provinceName=" + provinceName + ", imagePath=" + imagePath
				+ "]";
	}

	
}
