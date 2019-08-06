package com.lft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.lft.entity.City;
import com.lft.entity.Province;
import com.lft.entity.ScenicSpot;
import com.lft.service.IScenicService;
import com.lft.service.impl.ScenicServiceImpl;

/**
 * Servlet implementation class CityServlet
 */
@WebServlet("/CityServlet")
public class CityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IScenicService service = ScenicServiceImpl.getInstance();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Province> provinceList = service.selectProvince();
		System.out.println("查询成功！");
		session.setAttribute("provinceList", provinceList);
		response.sendRedirect(request.getContextPath() + "/Admin/scenicQuery_Add.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1.获取省份ID
				String provinceId = request.getParameter("provinceId");
				
				//2.调用service，获取城市列表
				List<City> cityList = service.getCityByProvinceId(provinceId);	
				System.out.println(cityList);
				//3.响应回浏览器
				/*
				 * json格式的字符串：
					[
						{"cityId":"1001","cityName":"广州市"},
						{"cityId":"1002","cityName":"深圳市"},
						{"cityId":"1003","cityName":"清远市"}
					]
					
					[]表示数组或集合，{}表示一个对象
				
				*/
				
				//将List转换为json格式的字符串
				JSONArray json = JSONArray.fromObject(cityList);
				
				//处理乱码
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json;charset=utf-8");
				
				PrintWriter writer = response.getWriter();
				writer.write(json.toString());
				writer.flush();
				writer.close();
	}

}
