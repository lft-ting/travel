package com.lft.service.impl;

import java.sql.Connection;
import java.util.List;

import com.lft.dao.IOrtherDao;
import com.lft.dao.impl.OrtherDaoImpl;
import com.lft.entity.Label;
import com.lft.entity.SpotType;
import com.lft.service.IOrtherService;
import com.lft.util.DBUtil_pool;

public class OtherServiceImpl implements IOrtherService {

	//2.自身创建一个对象，用private final static修饰
	private final static IOrtherService instance = new OtherServiceImpl();
	
	//1.构造函数私有化，用private修饰
	private OtherServiceImpl()
	{
		
	}
	
	//3.对外提供公共方法，返回当前对象
	public static IOrtherService getInstance()
	{
		return instance;
	}
	@Override
	public List<SpotType> selectType() {
		Connection conn = null;
		try{
			conn = DBUtil_pool.getConnection();
			IOrtherDao otherDao = new OrtherDaoImpl(conn);
			List<SpotType> spotTypeList = otherDao.selectType();
			
			return spotTypeList;
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

	@Override
	public List<Label> selectLabel() {
		Connection conn = null;
		try{
			conn = DBUtil_pool.getConnection();
			IOrtherDao otherDao = new OrtherDaoImpl(conn);
			List<Label> labelList = otherDao.selectLabel();
			
			return labelList;
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

}
