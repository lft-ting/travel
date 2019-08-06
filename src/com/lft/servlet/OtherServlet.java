package com.lft.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lft.entity.Label;
import com.lft.entity.Province;
import com.lft.entity.SpotType;
import com.lft.service.IOrtherService;
import com.lft.service.IScenicService;
import com.lft.service.impl.OtherServiceImpl;
import com.lft.service.impl.ScenicServiceImpl;

/**
 * Servlet implementation class OtherServlet
 */
@WebServlet("/OtherServlet")
public class OtherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IOrtherService service = OtherServiceImpl.getInstance();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<SpotType> spotTypeList = service.selectType();
		System.out.println("查询成功！");
		session.setAttribute("spotTypeList", spotTypeList);
		response.sendRedirect(request.getContextPath() + "/Admin/scenicQuery_Add.jsp");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Label> labelList = service.selectLabel();
		System.out.println("查询成功！");
		session.setAttribute("labelList", labelList);
		response.sendRedirect(request.getContextPath() + "/Admin/scenicQuery_Add.jsp");
		//doGet(request, response);
	}

}
