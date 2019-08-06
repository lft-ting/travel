package com.lft.service;

import java.util.List;

import com.lft.entity.City;
import com.lft.entity.Province;
import com.lft.entity.ScenicSpot;

public interface IScenicService {

	public List<ScenicSpot> selectScenics();
	public List<ScenicSpot> selectCityScenics(String father);
	public List<Province> selectProvince();
	public List<ScenicSpot> selectAllScenics(ScenicSpot scenicSpot);
	public boolean insertScenic(ScenicSpot scenicSpot);
	public boolean updateScenic(ScenicSpot scenicSpot);
	public boolean deleteScenicBatch(int[] ids);
	public ScenicSpot selectDetails(int scenicId);
	public List<City> getCityByProvinceId(String provinceId);
}
