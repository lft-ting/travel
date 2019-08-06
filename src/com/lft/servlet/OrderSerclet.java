package com.lft.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lft.entity.Order;
import com.lft.entity.OrderDetail;
import com.lft.entity.ScenicSpot;
import com.lft.entity.User;
import com.lft.service.IOrderService;
import com.lft.service.impl.OrderServiceImpl;
import com.lft.util.DateUtil;
import com.lft.util.PageUtil;

/**
 * Servlet implementation class OrderSerclet
 */
@WebServlet("/OrderSerclet/*")
public class OrderSerclet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IOrderService service = OrderServiceImpl.getInstance();

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURI();
		
		System.out.println("请求路径：" + url);
		//新增订单
		if(url.endsWith("insertOrder"))
		{
			insertOrder(request, response);
		}else if(url.endsWith("selectOrder"))
		{
			selectOrder(request, response);
		}
		else if(url.endsWith("deleteOrder"))
		{
			deleteOrder(request, response);
		}
		else if(url.endsWith("selectOrderBy"))
		{
			selectOrderBy(request, response);
		}
	}

	private void selectOrderBy(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null || "".equals(pageNumber))
		{
			
			String orderBy = request.getParameter("orderBy");
			System.out.println("查询参数：" + orderBy);
			List<Order> orderByList = service.selectOrderBy(orderBy);			
			System.out.println(orderByList);
			//2.1 查询第一页数据
			PageUtil pu = new PageUtil(orderByList);
			List<Order> suborderByList = orderByList.subList(pu.getBeginIndex()-1, pu.getEndIndex());//不包括结束位置
			
			System.out.println("查询成功！");
			session.setAttribute("orderByList", orderByList);
			session.setAttribute("suborderByList", suborderByList);//保存当前页的数据（一页数据）
			session.setAttribute("pu", pu);
			request.setAttribute("params", orderBy);
		}else{
			List<Order> orderByList = (List<Order>)session.getAttribute("orderByList");
			
			//2.获取session保存的分页信息
			PageUtil pu = (PageUtil)session.getAttribute("pu");
			pu.setPageNum(Integer.valueOf(pageNumber));
			
			//3.获取指定pageNumber页码的数据
			List<Order> suborderByList = orderByList.subList(pu.getBeginIndex()-1, pu.getEndIndex());
			
			//4.保存新的数据
			session.setAttribute("suborderByList", suborderByList);//保存当前页的数据（一页数据）
			session.setAttribute("pu", pu);
		}
		
		response.sendRedirect(request.getContextPath() + "/Admin/orderQuery.jsp");
		
	}

	private void deleteOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		//1.获取需删除的用户的ID编号
		String[] orderIds = request.getParameterValues("orderIds");
		System.out.println("待删除的用户编号：" + Arrays.toString(orderIds));//[21, 61, 4, 5, 7]
		
		//2.将string[]转换为int[]
		int[] ids = new int[orderIds.length];
		for (int i = 0; i < orderIds.length; i++) {
			ids[i] = Integer.valueOf(orderIds[i]);
		}
		
		//3.调用service方法进行批量删除
		boolean result = service.deleteOrder(ids);
		
		//4.响应结果
		request.setAttribute("deleteResultMsg", "删除"+Arrays.toString(orderIds)+"结果为" + result);
		//selectUsers(request, response);
		if(request.getHeader("Referer").endsWith("user.jsp")){
			request.getRequestDispatcher("/OrderSerclet/selectOrder").forward(request, response);
			
		}else if(request.getHeader("Referer").endsWith("index.jsp")){
			//request.getRequestDispatcher("/OrderSerclet/selectOrderBy").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/OrderSerclet/selectOrderBy");
		}
	}

	private void selectOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int userId = user.getId();
		List<Order> orderList = service.selectOrder(userId);
		System.out.println("查询order成功");
		session.setAttribute("orderList", orderList);
		response.sendRedirect(request.getContextPath() + "/html/userBook.jsp");
		//request.getRequestDispatcher("/html/userBook.jsp").forward(request, response);

	}

	private void insertOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println(user);
		ScenicSpot scenicsSpot = (ScenicSpot)session.getAttribute("scenicsSpot");
		System.out.println(scenicsSpot);
		/*String scenicId = request.getParameter("id");
		System.out.println(scenicId);*/
		
		String userName = request.getParameter("username");
		String tellPhone = request.getParameter("tellphone");
		String num = request.getParameter("num");
		String goDate = request.getParameter("godate");
		String note = request.getParameter("note");
		 
		
		Order order = new Order(0,user.getId(),new Random().nextInt(999999)+100000,new Date(),note);
		OrderDetail orderDetail = new OrderDetail(0,order.getId(),scenicsSpot.getScenicId(),userName,tellPhone,Integer.valueOf(num),DateUtil.StringToDate(goDate),scenicsSpot.getPrice()*Integer.valueOf(num));
		
		boolean result = service.insertOrder(order, orderDetail);
		
		System.out.println("预约成功：" + result);
		//处理响应的乱码
		response.setCharacterEncoding("utf-8");//指定响应输出的内容为utf-8编码
		response.setContentType("text/plain;charset=utf-8");//告诉浏览器使用utf-8编码格式解析我们的内容
				
		//把结果返回浏览器界面
		if(result){
			//session.setAttribute("errorMsg", "预约成功");
			//response.write("<script>alert('预约成功')</script>");
			response.sendRedirect(request.getContextPath() + "/html/details.jsp");
			
		}else{
			request.setAttribute("errorMsg", "预约失败");
			request.getRequestDispatcher("/html/details.jsp").forward(request, response);
		}
	}

}
