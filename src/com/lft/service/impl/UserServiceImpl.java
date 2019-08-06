package com.lft.service.impl;

import java.sql.Connection;

import com.lft.entity.User;
import com.lft.service.IUserService;
import com.lft.util.DBUtil_pool;
import com.lft.dao.IUserDao;
import com.lft.dao.impl.UserDaoImpl;
import com.lft.service.impl.UserServiceImpl;
/**
 *单例模式在内存中仅存在一个对象（仅new一次）  
 * 		好处：1. 节省内存   2.共享对象
 */
public class UserServiceImpl implements IUserService {

	
	//2.自身创建一个对象，用private final static修饰
	private final static IUserService instance = new UserServiceImpl();
	
	//1.构造函数私有化，用private修饰
	private UserServiceImpl()
	{
		
	}
	
	//3.对外提供公共方法，返回当前对象
	public static IUserService getInstance()
	{
		return instance;
	}
	
	
	@Override
	public boolean register(User user) {
		Connection conn = null;
		
		try {
			//1. 获取数据库连接------------------------------------------------------
			conn = DBUtil_pool.getConnection();
			
			//2. 开启事务：将自动提交功能关闭-------------------------------------------
			DBUtil_pool.openTransaction(conn);
			
			//==============================业务逻辑核心代码区    start==========================================
			//一期需求：  ①.将用户信息新增到数据库tab_user表
			IUserDao userDao = new UserDaoImpl(conn);
			boolean result = userDao.insertUser(user);//----只有在新增tab_user表时才会生成id值（序列生成）
			System.out.println("用户【"+user.getUserphone()+"】保存成功---111");
			
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
	public User login(String userphone, String password) {

		Connection conn = null;
		try{
			//1. 获取数据库连接
			conn = DBUtil_pool.getConnection();
			
			//==============================业务逻辑核心代码区    start==========================================
			//根据手机号密码，查询用户信息
			IUserDao userDao = new UserDaoImpl(conn);
			User user = userDao.selectUser(userphone, password);
			//==============================业务逻辑核心代码区     end==========================================

			return user;
			
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

	@Override
	public boolean updateUser(User user) {

		Connection conn = null;
		try{
			//1. 获取数据库连接------------------------------------------------------
			conn = DBUtil_pool.getConnection();
			
			//2. 开启事务：将自动提交功能关闭-------------------------------------------
			DBUtil_pool.openTransaction(conn);
			//==============================业务逻辑核心代码区    start==========================================
			IUserDao userDao = new UserDaoImpl(conn);
			boolean result = userDao.updateUser(user);
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
	public boolean selectUser(String userphone) {
		Connection conn = null;
		try{
			//1. 获取数据库连接
			conn = DBUtil_pool.getConnection();
			
			//==============================业务逻辑核心代码区    start==========================================
			//根据手机号，查询用户信息
			IUserDao userDao = new UserDaoImpl(conn);
			boolean result = userDao.selectUser(userphone);
			System.out.println("servicejieguo");
			//==============================业务逻辑核心代码区     end==========================================

			return result;
			
		}catch(Exception ex){
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return false;
	}

}
