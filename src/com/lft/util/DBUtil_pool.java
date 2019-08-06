package com.lft.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * 数据库工具类
 */
public class DBUtil_pool {

	private static DataSource dataSource = null;
	
	static{
		try {
			//1.获取上下文对象
			Context context = new InitialContext();
			
			//2.查找数据源对象,根据名称name查找对象DataSource，名称的固定格式：java:comp/env/ + context.xml中name属性值
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 登陆数据库（获取数据库的连接）
	 * @return
	 */
	public static Connection getConnection()
	{
		Connection conn = null;
		try {
			
			//3.获取数据库连接
			conn = dataSource.getConnection();
			
			return conn;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 释放资源（关闭数据库资源）
	 * @param conn
	 * @param stat
	 * @param rs
	 */
	public static void close(Connection conn,Statement stat,ResultSet rs)
	{
		//7.关闭连接
		//使用顺序：Connection->Statement->ResultSet  关闭顺序：ResultSet -> Statement->Connection
		try {
			if(rs != null)
			{
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(stat != null)
			{
				stat.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn != null)
			{
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 释放资源（关闭数据库资源）----给dao使用
	 * @param conn
	 * @param stat
	 * @param rs
	 */
	public static void close(Statement stat,ResultSet rs)
	{
		//7.关闭连接
		//使用顺序：Connection->Statement->ResultSet  关闭顺序：ResultSet -> Statement->Connection
		try {
			if(rs != null)
			{
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(stat != null)
			{
				stat.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 释放资源（关闭数据库资源）-----给service使用
	 * @param conn
	 * @param stat
	 * @param rs
	 */
	public static void close(Connection conn)
	{
		//7.关闭连接
		//使用顺序：Connection->Statement->ResultSet  关闭顺序：ResultSet -> Statement->Connection
		try {
			if(conn != null)
			{
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 开启事务
	 * @param conn
	 */
	public static void openTransaction(Connection conn)
	{
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 提交事务
	 * @param conn
	 */
	public static void commitTransaction(Connection conn)
	{
		try {
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 回滚事务
	 * @param conn
	 */
	public static void rollbackTransaction(Connection conn)
	{
		try {
			conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
