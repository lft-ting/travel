package com.lft.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lft.dao.IUserDao;
import com.lft.entity.User;
import com.lft.util.DBUtil_pool;
import com.lft.util.DateUtil;
public class UserDaoImpl implements IUserDao {
	
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	public UserDaoImpl(Connection conn)
	{
		this.conn = conn;
	}
	
	@Override
	public boolean insertUser(User user) {
		
		try {
			
			//4.获取PreparedStatement对象
			stat = conn.prepareStatement("insert into tab_user(id, userphone, password, rule, username, realname, sex, birthday, imagepath, content, registdate) values(TAB_USER_SEQ.Nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			//5.绑定变量值（绑定?的值）
			int k =1;
			stat.setString(k++, user.getUserphone());
			stat.setString(k++, user.getPassword());
			stat.setString(k++, user.getRule());
			stat.setString(k++, user.getUsername());
			stat.setString(k++, user.getRealName());
			stat.setString(k++, user.getSex());
			stat.setDate(k++, null);
			stat.setString(k++, user.getImagePath());
			stat.setString(k++, user.getContent());
			stat.setDate(k++, new Date(user.getRegistDate().getTime()));
			
			//6.执行新增
			int result = stat.executeUpdate();
			
			
			//7.判断结果
			if(result > 0)
			{
				return true;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return false;
	}

	@Override
	public User selectUser(String userphone, String password) {

		//4.获取PreparedStatement对象
		try {
			stat = conn.prepareStatement("select id, userphone, password, rule, username, realname, sex, birthday, imagepath, content, registdate from tab_user where userphone = ? and password = ?");
			//5.绑定变量值（绑定?的值）
			int k = 1;
			stat.setString(k++, userphone);
			stat.setString(k++, password);
			
			//6.执行新增
			rs = stat.executeQuery();
			
			//7.判断结果
			if(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUserphone(rs.getString("userphone"));
				user.setPassword(rs.getString("password"));
				user.setRule(rs.getString("rule"));
				user.setUsername(rs.getString("username"));
				user.setRealName(rs.getString("realname"));
				user.setSex(rs.getString("sex"));
				user.setBirthday(rs.getDate("birthday"));
				user.setImagePath(rs.getString("imagepath"));
				user.setContent(rs.getString("content"));
				user.setRegistDate(rs.getDate("registdate"));
				
				return user;
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}

	@Override
	public boolean updateUser(User user) {
		
		
		try {
			//4.获取PreparedStatement对象
			stat = conn.prepareStatement("update tab_user set userphone = ?,password = ?,rule = ?,username = ?,realname = ?,sex = ?,birthday = ?,imagepath = ?,content = ? where id = ?");
			//5.绑定变量值（绑定?的值）
			int k =1;
			stat.setString(k++, user.getUserphone());
			stat.setString(k++, user.getPassword());
			stat.setString(k++, user.getRule());
			stat.setString(k++, user.getUsername());
			stat.setString(k++, user.getRealName());
			stat.setString(k++, user.getSex());
			stat.setDate(k++, new Date(user.getBirthday().getTime()));
			stat.setString(k++, user.getImagePath());
			stat.setString(k++, user.getContent());
			stat.setInt(k++, user.getId());

			System.out.println(user);
			//6.执行新增
			int result = stat.executeUpdate();
			//7.判断结果
			if(result > 0)
			{	
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil_pool.close(stat, rs);
		}
		return false;
	}

	@Override
	public boolean selectUser(String userphone) {
		//4.获取PreparedStatement对象
		try {
			stat = conn.prepareStatement("select id, userphone, password, rule, username, realname, sex, birthday, imagepath, content from tab_user where userphone = ?");
			//5.绑定变量值（绑定?的值）
			int k = 1;
			stat.setString(k++, userphone);
			
			//6.执行新增
			rs = stat.executeQuery();
			
			//7.判断结果
			if(rs.next()){
				System.out.println("有结果");
				return true;				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return false;
	}



}
