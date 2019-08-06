package com.lft.service.impl;

import java.sql.Connection;
import java.util.List;

import com.lft.dao.IOrderDao;
import com.lft.dao.impl.OrderDaoImpl;
import com.lft.entity.Order;
import com.lft.entity.OrderDetail;
import com.lft.service.IOrderService;
import com.lft.util.DBUtil_pool;

public class OrderServiceImpl implements IOrderService {

	//2.自身创建一个对象，用private final static修饰
	private final static IOrderService instance = new OrderServiceImpl();
	
	//1.构造函数私有化，用private修饰
	private OrderServiceImpl()
	{
		
	}
	
	//3.对外提供公共方法，返回当前对象
	public static IOrderService getInstance()
	{
		return instance;
	}
	@Override
	public boolean insertOrder(Order order,OrderDetail orderDetail) {

		 Connection conn = null;
		 try {
			//1. 获取数据库连接-
			 conn = DBUtil_pool.getConnection();
			//2. 开启事务：将自动提交功能关闭-
			 DBUtil_pool.openTransaction(conn);
			 
			 IOrderDao orderDao = new OrderDaoImpl(conn);
			 boolean result1 = orderDao.insertOrder(order);
			 orderDetail.setOrderid(order.getId());
			 boolean result2 = orderDao.insertOrderDetail(orderDetail);
			 System.out.println("订单id：" + order.getId() +"详细id"+ orderDetail.getOrderid());

			 if(result1 && result2){
				 DBUtil_pool.commitTransaction(conn);
			 }else{
				 DBUtil_pool.rollbackTransaction(conn);
			 }
			 return result1 && result2;
		} catch (Exception ex) {
			// 4.出现异常立马回滚 ,回滚事务------------------------------
			DBUtil_pool.rollbackTransaction(conn);
		} finally{
			//5. 关闭连接------------------------------
			DBUtil_pool.close(conn);
		}
		return false;
	}

	@Override
	public boolean deleteOrder(int[] ids) {
		Connection conn = null;
		try{
			//1. 获取数据库连接------------------------------------------------------
			conn = DBUtil_pool.getConnection();
			
			//2. 开启事务：将自动提交功能关闭-------------------------------------------
			DBUtil_pool.openTransaction(conn);
			
			//==============================业务逻辑核心代码区    start==========================================
			IOrderDao orderDao = new OrderDaoImpl(conn);
			 boolean result = orderDao.deleteOrder(ids);
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
	public List<Order> selectOrder(int userId) {
		
		Connection conn = null;
		try {
			conn = DBUtil_pool.getConnection();
			IOrderDao orderDao = new OrderDaoImpl(conn);
			List<Order> orderList = orderDao.selectOrder(userId);
			
			return orderList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		
		return null;
	}

	@Override
	public List<Order> selectOrderBy(String orderBy) {
		Connection conn = null;
		try {
			conn = DBUtil_pool.getConnection();
			IOrderDao orderDao = new OrderDaoImpl(conn);
			List<Order> orderByList = orderDao.selectOrderBy(orderBy);
			
			return orderByList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

}
