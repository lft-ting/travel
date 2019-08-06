package com.lft.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lft.entity.Message;
import com.lft.entity.Order;
import com.lft.entity.ScenicSpot;
import com.lft.entity.User;
import com.lft.service.IMessageService;
import com.lft.service.impl.MessageServiceImpl;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet/*")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IMessageService service = MessageServiceImpl.getInstance();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURI();
		
		System.out.println("请求路径：" + url);
		//新增订单
		if(url.endsWith("insertMessage"))
		{
			insertMessage(request, response);
		}else if(url.endsWith("selectMessage"))
		{
			selectMessage(request, response);
		}
		
	}

	private void selectMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		//User user = (User)session.getAttribute("user");
		ScenicSpot scenicsSpot = (ScenicSpot)session.getAttribute("scenicsSpot");
		System.out.println(scenicsSpot);
		//int userId = user.getId();
		int scenicId = scenicsSpot.getScenicId();
		System.out.println(scenicId);
		List<Message> messageList = service.selectAllMessage(scenicId);
		System.out.println("查询成功");
		session.setAttribute("messageList", messageList);
		response.sendRedirect(request.getContextPath() + "/html/details.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void insertMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		ScenicSpot scenicSpot = (ScenicSpot)session.getAttribute("scenicsSpot");
		
		String context = request.getParameter("context");
		
		Message message = new Message(0, context, user.getId(), new Date(),scenicSpot.getScenicId());
		
		boolean result = service.insertMessage(message);
		System.out.println("留言" + result);
		session.setAttribute("message", message);
		//request.getRequestDispatcher("/details.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/MessageServlet/selectMessage");
				
	}



}
