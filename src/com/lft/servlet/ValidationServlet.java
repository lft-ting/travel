package com.lft.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lft.entity.User;
import com.lft.service.IUserService;
import com.lft.service.impl.UserServiceImpl;

/**
 * Ajax校验servlet
 */
@WebServlet("/ValidationServlet")
public class ValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet...........");
		
		//1.获取用户名的参数信息
		String userphone = request.getParameter("userphone");
		System.out.println("登录名：" + userphone);
		
		//2.调用service方法判断用户名是否存在
		IUserService service = UserServiceImpl.getInstance();
		boolean result = service.selectUser(userphone);
		System.out.println("用户是否存在：" + result);
		//伪校验，假设用户名为tomcat，表示重复名称，用户名为nicolascage，表示不重复
		PrintWriter writer = response.getWriter();
		if(result)
		{
			writer.write("用户名重复");
		}
		else
		{
			writer.write("用户名合法");
		}
		writer.flush();
		writer.close();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost...........");
		//处理post请求的乱码
		request.setCharacterEncoding("utf-8");
		//1.获取用户名的参数信息
		String userphone = request.getParameter("userphone");
		System.out.println("登录名：" + userphone);
		
		//2.调用service方法判断用户名是否存在
		IUserService service = UserServiceImpl.getInstance();
		boolean result = service.selectUser(userphone);
		System.out.println("用户是否存在：" + result);
		//处理响应的乱码
		response.setCharacterEncoding("utf-8");//指定响应输出的内容为utf-8编码
		response.setContentType("text/plain;charset=utf-8");//
		//伪校验，假设用户名为tomcat，表示重复名称，用户名为nicolascage，表示不重复
		PrintWriter writer = response.getWriter();
		if(result)
		{
			writer.write("该手机号已注册");
		}
		else
		{
			writer.write("用户名合法");
		}
		writer.flush();
		writer.close();
	}

}
