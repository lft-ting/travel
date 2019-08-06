package com.lft.service;

import com.lft.entity.User;

public interface IUserService {

	
	/**
	 * 注册
	 * @param user 封装的注册用户的信息
	 * @return true 注册成功 false注册失败
	 */
	public boolean register(User user);
	
	/**
	 * 登陆
	 * @param userphone 手机号
	 * @param password 密码
	 * @return 根据用户名、密码匹配到的用户信息
	 */
	public User login(String userphone,String password);
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
