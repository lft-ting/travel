package com.lft.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lft.entity.City;
import com.lft.entity.Label;
import com.lft.entity.Province;
import com.lft.entity.ScenicSpot;
import com.lft.entity.SpotType;
import com.lft.service.IScenicService;
import com.lft.service.impl.ScenicServiceImpl;
import com.lft.util.PageUtil;

/**
 * Servlet implementation class ScenicServlet
 */
@WebServlet("/ScenicServlet/*")
public class ScenicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private IScenicService service = ScenicServiceImpl.getInstance();

	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURI();
		
		System.out.println("请求路径：" + url);
		
		//查询景点信息
		if(url.endsWith("selectScenic"))
		{
			selectScenic(request, response);
		}
		else if(url.endsWith("selectProvince"))
		{
			selectProvince(request, response);
		}
		//
		else if(url.endsWith("selectCity"))
		{
			selectCity(request, response);
		}
		//查询所有满足条件的景点信息
		else if(url.endsWith("selectAllScenic"))
		{
			selectAllScenic(request, response);
		}
		//新增景点
		else if(url.endsWith("insertScenic"))
		{
			insertScenic(request, response);
		}
		else if(url.endsWith("updateScenic"))
		{
			updateScenic(request, response);
		}
		else if(url.endsWith("deleteScenic"))
		{
			deleteScenic(request, response);
		}
		else if(url.endsWith("selectDetails"))
		{
			
			selectDetails(request, response);
		}
		else if(url.endsWith("selectScenicInfo"))
		{
			
			selectScenicInfo(request, response);
		}
		else if(url.endsWith("selectScenicByLabel"))
		{
			
			selectScenicByLabel(request, response);
		}
	}



	private void selectScenicByLabel(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession session = request.getSession();
		String cityName = request.getParameter("city");
		String spottype = request.getParameter("spottype");
		String labelname = request.getParameter("labelname");
		
		
		City city = new City();
		city.setCityName(cityName);
		SpotType type = new SpotType();
		type.setTypeName(spottype);
		Label label = new Label();
		label.setLabelName(labelname);
		ScenicSpot scenicSpot = new ScenicSpot();
		scenicSpot.setCity(city);
		scenicSpot.setSpotType(type);
		scenicSpot.setLabel(label);
		
		System.out.println("查询参数：" + scenicSpot);
		
		List<ScenicSpot> ScenicByLabel = service.selectAllScenics(scenicSpot);
		
		System.out.println(ScenicByLabel);
		session.setAttribute("ScenicByLabel", ScenicByLabel);
		response.sendRedirect(request.getContextPath() + "/html/menus2.jsp");
	}



	public void selectDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		
		HttpSession session = request.getSession();
		String scenicId = request.getParameter("id");		 
		System.out.println(scenicId);
		ScenicSpot scenicsSpot = service.selectDetails(Integer.valueOf(scenicId));
		System.out.println(scenicsSpot);
		System.out.println("查询成功！");
		session.setAttribute("scenicsSpot", scenicsSpot);
		response.sendRedirect(request.getContextPath() + "/html/details.jsp");
	}



	private void updateScenic(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		//界面需要修改参数的信息
		String title = request.getParameter("title");
		System.out.println(title);
		String details = request.getParameter("details");
		System.out.println(details);
		String price = request.getParameter("price"); 
		List<ScenicSpot> scenicSpotList = (List<ScenicSpot>)session.getAttribute("ScenicInfo");
		for (ScenicSpot scenicSpot : scenicSpotList) {
			scenicSpot.setTitle(title);
			scenicSpot.setDetails(details);
			scenicSpot.setPrice(Integer.valueOf(price));
			boolean result = service.updateScenic(scenicSpot);
			System.out.println("修改结果：" + result);
			if(result){
				session.setAttribute("scenicSpot", scenicSpot);
				response.sendRedirect(request.getContextPath() + "/ScenicServlet/selectAllScenic");
			}else{
				//5.处理响应乱码
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/plain;charset=utf-8");
				
				//6.告诉用户操作失败
				PrintWriter writer = response.getWriter();
				writer.write("修改失败：" + result);
				writer.flush();
				writer.close();
			}
		}			
	}



	private void insertScenic(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		//处理post请求的乱码
		request.setCharacterEncoding("utf-8");
		//String id = request.getParameter("id");
		String typeId = request.getParameter("typeId");
		String cityId = request.getParameter("city");
		String labelId = request.getParameter("labelId");
		String imagePath = request.getParameter("imagePath");
		String title = request.getParameter("title");
		String details = request.getParameter("details");
		String price = request.getParameter("price");
		
		ScenicSpot scenicSpot = new ScenicSpot(0,Integer.valueOf(typeId),cityId,Integer.valueOf(labelId),imagePath,title,details,Integer.valueOf(price),new Date());

		boolean result = service.insertScenic(scenicSpot);
		
		System.out.println("新增成功：" + result);
		//处理响应的乱码
		response.setCharacterEncoding("utf-8");//指定响应输出的内容为utf-8编码
		response.setContentType("text/plain;charset=utf-8");//告诉浏览器使用utf-8编码格式解析我们的内容
		
		//把结果返回浏览器界面
		if(result){
			response.sendRedirect(request.getContextPath() + "/ScenicServlet/selectAllScenic");
			
		}else{
			request.setAttribute("errorMsg", "新增失败");
			request.getRequestDispatcher("/Admin/scenicQuery_Add.jsp").forward(request, response);
		}
		
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void selectScenic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		List<ScenicSpot> scenicList = service.selectScenics();
		System.out.println("查询成功！");
		Map<String,ScenicSpot> scenicmap = new HashMap<>();
		for (ScenicSpot scenicSpot : scenicList) {
			scenicmap.put(scenicSpot.getSpotType().getTypeName(), scenicSpot);
		}
		session.setAttribute("scenicList", scenicList);
		session.setAttribute("scenicmap", scenicmap);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		/*request.getRequestDispatcher("/index.jsp").forward(request, response);*/
		
	}
	protected void selectProvince(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		List<Province> provinceList = service.selectProvince();
		System.out.println("查询成功！");
		session.setAttribute("provinceList", provinceList);
		response.sendRedirect(request.getContextPath() + "/html/province.jsp");
		/*request.getRequestDispatcher("/html/city.jsp").forward(request, response);*/
		
	}
	protected void selectCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String father = request.getParameter("provinceid");
		 
		System.out.println(father);
		List<ScenicSpot> cityScenicsList = service.selectCityScenics(father);
		System.out.println(cityScenicsList);
		System.out.println("查询成功！");
		Map<String, ScenicSpot> maps = new HashMap<>();
		for (ScenicSpot scenicSpot : cityScenicsList) {
			maps.put(scenicSpot.getCity().getCityName(), scenicSpot);
		}
		System.out.println(maps);
		session.setAttribute("cityScenicsList", cityScenicsList);
		session.setAttribute("maps", maps);
		response.sendRedirect(request.getContextPath() + "/html/menus.jsp");
		//request.getRequestDispatcher("/html/city.jsp").forward(request, response);
		
	}
	public void selectScenicInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		String scenicId = request.getParameter("id");
		
		String cityName = request.getParameter("city");
		String spottype = request.getParameter("spottype");
		String labelname = request.getParameter("labelname");
		
		
		City city = new City();
		city.setCityName(cityName);
		SpotType type = new SpotType();
		type.setTypeName(spottype);
		Label label = new Label();
		label.setLabelName(labelname);
		ScenicSpot scenicSpot = new ScenicSpot();
		scenicSpot.setCity(city);
		scenicSpot.setSpotType(type);
		scenicSpot.setLabel(label);
		 
		System.out.println(scenicId);
		//ScenicSpot scenicSpot = new ScenicSpot();
		scenicSpot.setScenicId(Integer.valueOf(scenicId));
		List<ScenicSpot> ScenicInfo = service.selectAllScenics(scenicSpot);
		System.out.println(ScenicInfo);
		session.setAttribute("ScenicInfo", ScenicInfo);
		request.getRequestDispatcher("/Admin/scenicQuery_Edit.jsp").forward(request, response);
	}
	protected void selectAllScenic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String pageNumber = request.getParameter("pageNumber");
		
		if(pageNumber == null || "".equals(pageNumber))
		{
			
			String cityName = request.getParameter("city");
			String spottype = request.getParameter("spottype");
			String labelname = request.getParameter("labelname");
			
			
			City city = new City();
			city.setCityName(cityName);
			SpotType type = new SpotType();
			type.setTypeName(spottype);
			Label label = new Label();
			label.setLabelName(labelname);
			ScenicSpot scenicSpot = new ScenicSpot();
			scenicSpot.setCity(city);
			scenicSpot.setSpotType(type);
			scenicSpot.setLabel(label);
			
			System.out.println("查询参数：" + scenicSpot);
			
			List<ScenicSpot> allscenicList = service.selectAllScenics(scenicSpot);
			
			System.out.println(allscenicList);
			//2.1 查询第一页数据
			PageUtil pu = new PageUtil(allscenicList);
			List<ScenicSpot> subscenicList = allscenicList.subList(pu.getBeginIndex()-1, pu.getEndIndex());//不包括结束位置
			
			System.out.println("查询成功！");
			session.setAttribute("allscenicList", allscenicList);
			session.setAttribute("subscenicList", subscenicList);//保存当前页的数据（一页数据）
			session.setAttribute("pu", pu);
			request.setAttribute("params", scenicSpot);
		}else{
			List<ScenicSpot> allscenicList = (List<ScenicSpot>)session.getAttribute("allscenicList");
			
			//2.获取session保存的分页信息
			PageUtil pu = (PageUtil)session.getAttribute("pu");
			pu.setPageNum(Integer.valueOf(pageNumber));
			
			//3.获取指定pageNumber页码的数据
			List<ScenicSpot> subscenicList = allscenicList.subList(pu.getBeginIndex()-1, pu.getEndIndex());
			
			//4.保存新的数据
			session.setAttribute("subscenicList", subscenicList);//保存当前页的数据（一页数据）
			session.setAttribute("pu", pu);
		}

		//response.sendRedirect(request.getContextPath() + "/Admin/index.jsp");
		request.getRequestDispatcher("/Admin/scenicQuery.jsp").forward(request, response);
		
	}
	/**
	 * 批量删除用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteScenic(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取需删除的用户的ID编号
		String[] scenicIds = request.getParameterValues("scenicIds");
		System.out.println("待删除的用户编号：" + Arrays.toString(scenicIds));//[21, 61, 4, 5, 7]
		
		//2.将string[]转换为int[]
		int[] ids = new int[scenicIds.length];
		for (int i = 0; i < scenicIds.length; i++) {
			ids[i] = Integer.valueOf(scenicIds[i]);
		}
		
		//3.调用service方法进行批量删除
		boolean result = service.deleteScenicBatch(ids);
		
		//4.响应结果
		request.setAttribute("deleteResultMsg", "删除"+Arrays.toString(scenicIds)+"结果为" + result);
		//selectUsers(request, response);
		request.getRequestDispatcher("/ScenicServlet/selectAllScenic").forward(request, response);
	}
}
