package com.lft.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lft.entity.User;
import com.lft.service.IUserService;
import com.lft.service.impl.UserServiceImpl;
import com.lft.util.MD5Util;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
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

		HttpSession session = request.getSession();
		
		//处理请求的乱码
		request.setCharacterEncoding("utf-8");
		
		//1.接收用户输入的登陆名、密码、自动登录标识
		String userphone = request.getParameter("userphone");
		String password = request.getParameter("password");
		//String autoLogin = request.getParameter("autoLogin");
		
		System.out.println("手动点击【登录】的用户信息-------------------：" + userphone + " " + password);
		
		/*//服务器生成的验证码
		String serverCode = (String)session.getAttribute("code");
		//用户输入的验证码
		String userCode = request.getParameter("code");
		if(userCode == null || !userCode.equalsIgnoreCase(serverCode))
		{
			System.out.println("验证码不正确，请重新输入");
			
			//告诉其登陆失败的原因-----------------------request：一次请求有效，当前登录用户请求中有效
			request.setAttribute("errorMsg", "验证码不正确，请重新输入");
			//请求转发：跳转回登陆界面
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
			return;//立马返回，不再执行后续代码
		}*/
		
		//2.调用service方法判断用户名、密码是否合法
		IUserService service = UserServiceImpl.getInstance();
		User user = service.login(userphone, MD5Util.md5(password));
		
		System.out.println("登陆用户信息：" + user);

		//3.判断用户是否合法
		//合法用户
		if(user != null)
		{
			//告诉其登陆用户的所有信息-------------------session：一次会话有效，当前登录用户自己共享，只要不关浏览器
			session.setAttribute("user", user);
			
			//统计在线人数 +1----------------------------application：一次服务器中有效，所有登陆用户共享，只要不关服务器
			//online(request);
			
			/**
			 * 判断用户是否需要，下一次自动登录，即判断是否需要保存当前的用户名、密码
			 */
			/*if("autoLogin".equals(autoLogin))
			{
				//1.创建Cookie
				Cookie cookie = new Cookie("c_userphone", userphone);//用户名
				Cookie cookie2 = new Cookie("c_password", password);//密码
				
				//2.设置有效期
				cookie.setMaxAge(7*24*60*60);//以秒为单位     一周之内自动登录
				cookie2.setMaxAge(7*24*60*60);//以秒为单位  一周之内自动登录
				
				//3.设置cookie保存路径
				cookie.setPath(request.getContextPath() + "/");
				cookie2.setPath(request.getContextPath() + "/");
				
				//4.添加到response响应中
				response.addCookie(cookie);
				response.addCookie(cookie2);
				
				System.out.println("cookie保存成功");
			}*/
			
			/**
			 * 判断，如果是普通用户，跳转/User/Index.html
			 * 	          如果是管理员，跳转/Admin/Index.html
			 */
			//管理员
			if("1".equals(user.getRule()))
			{
				//请求重定向：跳转到【管理员】的主页面
				response.sendRedirect(request.getContextPath() + "/Admin/index.jsp");
			}
			//普通用户
			else
			{
				//请求重定向：跳转到【普通用户】的主页面
				response.sendRedirect(request.getContextPath() + "/html/user.jsp");
			}
			//return;
		}
		//非法用户
		else
		{
			//告诉其登陆失败的原因-----------------------request：一次请求有效，当前登录用户请求中有效
			request.setAttribute("errorMsg", "用户名或密码不正确");
			//请求转发：跳转回登陆界面
			request.getRequestDispatcher("/html/login.jsp").forward(request, response);
		}
	}

	/**
	 * 统计上线人数
	 * @param request
	 */
	public void online(HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		Object onlineCount = application.getAttribute("onlineCount");
		//第一个人进来，默认存1
		if(onlineCount == null)
		{
			application.setAttribute("onlineCount", 1);
		}
		//下一次进来，在原来的人数基础上+1
		else
		{
			application.setAttribute("onlineCount", (Integer)onlineCount + 1);
		}
	}
}
