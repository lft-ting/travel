package com.lft.dao;

import com.lft.entity.User;

public interface IUserDao {
	/**
	 * 新增用户
	 * @param user 封装用户信息的user对象
	 * @return true新增成功  false新增失败
	 */
	public boolean insertUser(User user);
	
	/**
	 * 根据用户名、密码查询用户信息 
	 * @param username 用户名
	 * @param password 密码
	 * @return 返回查询到的用户信息
	 */
	public User selectUser(String userphone,String password);
	
	/**
	 * 查询已注册用户
	 * @param username 用户名
	 * @param 
	 * @return 根据用户名匹配到的用户信息
	 */
	public boolean selectUser(String userphone);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user);
}
