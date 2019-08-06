package com.lft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lft.entity.User;
import com.lft.service.IUserService;
import com.lft.service.impl.UserServiceImpl;
import com.lft.util.DateUtil;
import com.lft.util.MD5Util;

/**
 * Servlet implementation class RegistServlet
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理post请求的乱码
		request.setCharacterEncoding("utf-8");
		//1.获取界面用户输入的信息
		//用户名
		String userphone = request.getParameter("userphone");
		//密码
		String password = request.getParameter("password");
		
		System.out.println(userphone + " " + password);
		
		//2.封装user对象
		User user = new User(0, userphone, MD5Util.md5(password), "2", "放心行会员", "", "1", null, "/image/lvxing.png", "", new Date());
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		//3.调用service方法，完成注册功能
		IUserService userService = UserServiceImpl.getInstance();
		boolean result = userService.register(user);
		
		System.out.println("注册结果：" + result);
		
		//处理响应的乱码
		response.setCharacterEncoding("utf-8");//指定响应输出的内容为utf-8编码
		response.setContentType("text/plain;charset=utf-8");//告诉浏览器使用utf-8编码格式解析我们的内容  text/plain 纯文本              text/html html文档               text/xml xml格式文档
		
		//4.把注册结果反馈给用户（反馈到浏览器界面）
		
		if(result){
			//请求重定向：跳转到【普通用户】的主页面
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			//return;
		}else{
			//告诉其登陆失败的原因-----------------------request：一次请求有效，当前登录用户请求中有效
			request.setAttribute("errorMsg", "用户名已存在");
			//请求转发：跳转回登陆界面
			request.getRequestDispatcher("/html/regist.jsp").forward(request, response);
		}
	
	}

}
