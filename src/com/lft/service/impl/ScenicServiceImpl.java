package com.lft.service.impl;

import java.sql.Connection;
import java.util.List;

import com.lft.dao.IScenicDao;
import com.lft.dao.IUserDao;
import com.lft.dao.impl.ScenicDaoImpl;
import com.lft.entity.City;
import com.lft.entity.Province;
import com.lft.entity.ScenicSpot;
import com.lft.service.IScenicService;
import com.lft.util.DBUtil_pool;


public class ScenicServiceImpl implements IScenicService {

		//2.自身创建一个对象，用private final static修饰
		private final static IScenicService instance = new ScenicServiceImpl();
		
		//1.构造函数私有化，用private修饰
		private ScenicServiceImpl()
		{
			
		}
		
		//3.对外提供公共方法，返回当前对象
		public static IScenicService getInstance()
		{
			return instance;
		}
	@Override
	public List<ScenicSpot> selectScenics() {
		Connection conn = null;
		try{
			conn = DBUtil_pool.getConnection();
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			List<ScenicSpot> scenicList = scenicDao.selectScenics();
			
			return scenicList;
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		
		return null;
	}

	@Override
	public List<ScenicSpot> selectCityScenics(String father) {
		Connection conn = null;
		try{
			conn = DBUtil_pool.getConnection();
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			List<ScenicSpot> cityScenicsList = scenicDao.selectCityScenics(father);
			
			return cityScenicsList;
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

	@Override
	public List<Province> selectProvince() {
		Connection conn = null;
		try{
			conn = DBUtil_pool.getConnection();
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			List<Province> provinceList = scenicDao.selectProvince();
			
			return provinceList;
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}
	@Override
	public List<City> getCityByProvinceId(String provinceId) {
		Connection conn = null;
		try{
			conn = DBUtil_pool.getConnection();
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			List<City> cityList = scenicDao.getCityByProvinceId(provinceId);
			
			return cityList;
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}
	@Override
	public List<ScenicSpot> selectAllScenics(ScenicSpot scenicSpot) {
		Connection conn = null;
		try{
			conn = DBUtil_pool.getConnection();
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			List<ScenicSpot> allscenicList = scenicDao.selectAllScenics(scenicSpot);
			
			return allscenicList;
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

	@Override
	public boolean insertScenic(ScenicSpot scenicSpot) {

		Connection conn = null;
		
		try {
			//1. 获取数据库连接------------------------------------------------------
			conn = DBUtil_pool.getConnection();
			
			//2. 开启事务：将自动提交功能关闭-------------------------------------------
			DBUtil_pool.openTransaction(conn);
			
			//==============================业务逻辑核心代码区    start==========================================
			//一期需求：  ①.将景点信息新增到数据库
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			boolean result = scenicDao.insertScenic(scenicSpot);//----只有在新增tab_user表时才会生成id值（序列生成）
			System.out.println("景点【"+scenicSpot.getScenicId()+"】保存成功---111");
			
			//3.当所有的数据库操作成功，提交事务--------
			if(result)
			{
				DBUtil_pool.commitTransaction(conn);
			}else{
				//3.或者任意数据库操作失败，返回false,回滚事务----
				DBUtil_pool.rollbackTransaction(conn);
			}
			return result;
		} catch (Exception ex) {
			// 4.出现异常立马回滚 ,回滚事务------------------------------
			DBUtil_pool.rollbackTransaction(conn);
		}finally{
			//5. 关闭连接------------------------------
			DBUtil_pool.close(conn);
		}
		return false;
	}

	@Override
	public boolean updateScenic(ScenicSpot scenicSpot) {

		Connection conn = null;
		try {
			//1. 获取数据库连接------------------------------------------------------
			conn = DBUtil_pool.getConnection();
			
			//2. 开启事务：将自动提交功能关闭-------------------------------------------
			DBUtil_pool.openTransaction(conn);
			
			//==============================业务逻辑核心代码区    start==========================================
			//一期需求：  ①.将景点信息新增到数据库
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			boolean result = scenicDao.updateScenic(scenicSpot);
			System.out.println("景点更新成功---111");
			
			//3.当所有的数据库操作成功，提交事务--------
			if(result)
			{
				DBUtil_pool.commitTransaction(conn);
			}else{
				//3.或者任意数据库操作失败，返回false,回滚事务----
				DBUtil_pool.rollbackTransaction(conn);
			}
			return result;
		} catch (Exception ex) {
			// 4.出现异常立马回滚 ,回滚事务------------------------------
			DBUtil_pool.rollbackTransaction(conn);
		}finally{
			//5. 关闭连接------------------------------
			DBUtil_pool.close(conn);
		}
		return false;
	}

	@Override
	public boolean deleteScenicBatch(int[] ids) {

		Connection conn = null;
		try{
			//1. 获取数据库连接------------------------------------------------------
			conn = DBUtil_pool.getConnection();
			
			//2. 开启事务：将自动提交功能关闭-------------------------------------------
			DBUtil_pool.openTransaction(conn);
			
			//==============================业务逻辑核心代码区    start==========================================
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			boolean result = scenicDao.deleteScenicBatch(ids);
			//==============================业务逻辑核心代码区     end==========================================

			//3.当所有的数据库操作成功，提交事务---------------------------------------
			if(result)
			{
				DBUtil_pool.commitTransaction(conn);
			}
			//3.或者任意数据库操作失败，返回false,回滚事务------------------------------
			else
			{
				DBUtil_pool.rollbackTransaction(conn);
			}
			return result;
			
		}catch(Exception ex){
			// 4.出现异常立马回滚 ,回滚事务------------------------------
			DBUtil_pool.rollbackTransaction(conn);
		} finally {
			//5. 关闭连接------------------------------
			DBUtil_pool.close(conn);
		}
		return false;
	}

	@Override
	public ScenicSpot selectDetails(int scenicId) {

		Connection conn = null;
		
		try {
			conn = DBUtil_pool.getConnection();
			IScenicDao scenicDao = new ScenicDaoImpl(conn);
			ScenicSpot scenicsSpot = scenicDao.selectDetails(scenicId);
			return scenicsSpot;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

	

}
