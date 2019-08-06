package com.lft.dao;

import java.util.List;

import com.lft.entity.City;
import com.lft.entity.Province;
import com.lft.entity.ScenicSpot;
import com.lft.util.PageUtil;


public interface IScenicDao {
	
	public List<ScenicSpot> selectScenics();
	public List<Province> selectProvince();
	public List<ScenicSpot> selectCityScenics(String father);
	public List<ScenicSpot> selectAllScenics(ScenicSpot scenicSpot);
	public boolean insertScenic(ScenicSpot scenicSpot);
	public boolean updateScenic(ScenicSpot scenicSpot);
	/**
	 * 批量删除---根据用户id编号的数组删除
	 * @param ids 用户编号数组int[]
	 * @return true删除成功  false删除失败
	 */
	public boolean deleteScenicBatch(int[] ids);
	
	public ScenicSpot selectDetails(int scenicId);
	public List<City> getCityByProvinceId(String provinceId);
}
