package com.lft.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lft.dao.IScenicDao;
import com.lft.entity.City;
import com.lft.entity.Hotel;
import com.lft.entity.Label;
import com.lft.entity.Province;
import com.lft.entity.ScenicSpot;
import com.lft.entity.Schedule;
import com.lft.entity.SpotType;
import com.lft.util.DBUtil_pool;


public class ScenicDaoImpl implements IScenicDao {
	
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	public ScenicDaoImpl(Connection conn)
	{
		this.conn = conn;
	}
	@Override
	public List<ScenicSpot> selectScenics() {
		
		try {
			StringBuffer sql = new StringBuffer("select s.id,typeid,labelid,cityid,sc_image,title,details,price,createTime,t.id tid,spottype typeName  from tab_scenicspot s,tab_spottype t where s.typeid = t.id");
			//StringBuffer sql = new StringBuffer("select s.id,typeid,s.cityid sid,labelid,sc_image,title,details,price,createtime,c.id ccid,c.cityid cid,city,father,t.id tid,t.spottype typeName,l.id lid,l.labelname from tab_scenicspot s,tab_city c,tab_spottype t,tab_label l where s.cityid = c.cityid and s.typeid = t.id and s.labelid = l.id");
			/*select s.id,typeid,s.cityid sid,labelid,sc_image,title,details,price,createtime,
		       c.cityid cid,city,father,
		       t.id tid,t.spottype,
		       l.id lid,l.labelname
		 from tab_scenicspot s,tab_city c,tab_spottype t,tab_label l
		where s.cityid = c.cityid and s.typeid = t.id and s.labelid = l.id*/
			//String father = scenicSpot.getCity().getFather();
			/*if(father != null && !"".equals(father)){
				sql.append(" and father = " + father);
			}*/
			stat = conn.prepareStatement(sql.toString());
		
			rs = stat.executeQuery();
			
			List<ScenicSpot> scenicList = new ArrayList<ScenicSpot>();
			while(rs.next()){
				ScenicSpot scenic = new ScenicSpot();
				scenic.setScenicId(rs.getInt("id"));
				scenic.setTypeId(rs.getInt("typeid"));
				scenic.setLabelId(rs.getInt("labelid"));
				scenic.setCityId(rs.getString("cityid"));
				scenic.setImage(rs.getString("sc_image"));
				scenic.setTitle(rs.getString("title"));
				scenic.setDetails(rs.getString("details"));
				scenic.setPrice(rs.getInt("price"));
				scenic.setCreateTime(rs.getDate("createTime"));
				
				SpotType spotType = new SpotType();
				spotType.setTypeId(rs.getInt("tid"));
				spotType.setTypeName(rs.getString("typeName"));
				
				/*City city = new City();
				city.setId(rs.getInt("ccid"));
				city.setCityId(rs.getString("cid"));
				city.setCityName(rs.getString("city"));
				city.setFather(rs.getString("father"));
				
				Label label = new Label();
				label.setLabelId(rs.getInt("lid"));
				label.setLabelName(rs.getString("labelname"));
				
				scenic.setLabel(label);
				scenic.setCity(city);*/
				scenic.setSpotType(spotType);
				
				scenicList.add(scenic);
				
			}
			return scenicList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}
	@Override
	public List<ScenicSpot> selectCityScenics(String father) {
		
		try {
			StringBuffer sql = new StringBuffer("select s.id,typeid,s.cityid,labelid,sc_image,title,details,price,createtime,c.id ccid,c.cityid cid,city,father from tab_scenicspot s,tab_city c where s.cityid = c.cityid and father = ?");
			stat = conn.prepareStatement(sql.toString());
			stat.setString(1, father);
			rs = stat.executeQuery();
			
			List<ScenicSpot> cityScenicsList = new ArrayList<ScenicSpot>();
			while(rs.next()){
				ScenicSpot scenicsSpot = new ScenicSpot();
				scenicsSpot.setScenicId(rs.getInt("id"));
				scenicsSpot.setTypeId(rs.getInt("typeid"));
				scenicsSpot.setLabelId(rs.getInt("labelid"));
				scenicsSpot.setCityId(rs.getString("cityid"));
				scenicsSpot.setImage(rs.getString("sc_image"));
				scenicsSpot.setTitle(rs.getString("title"));
				scenicsSpot.setDetails(rs.getString("details"));
				scenicsSpot.setPrice(rs.getInt("price"));
				scenicsSpot.setCreateTime(rs.getDate("createTime"));
				
				City city = new City();
				city.setId(rs.getInt("ccid"));
				city.setCityId(rs.getString("cid"));
				city.setCityName(rs.getString("city"));
				city.setFather(rs.getString("father"));
				
				/*Province province = new Province();
				province.setProvinceId(rs.getString("provinceid"));
				province.setProvinceName(rs.getString("province"));
				province.setImagePath(rs.getString("imagepath"));
				
				city.setProvince(province);*/
				scenicsSpot.setCity(city);
				cityScenicsList.add(scenicsSpot);
				
			}
			return cityScenicsList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}
	@Override
	public List<Province> selectProvince() {
		try {
			StringBuffer sql = new StringBuffer("select provinceid,province,imagepath from tab_province");
			stat = conn.prepareStatement(sql.toString());
			
			rs = stat.executeQuery();
			
			List<Province> provinceList = new ArrayList<Province>();
			while(rs.next()){				
				
				Province province = new Province();
				province.setProvinceId(rs.getString("provinceid"));
				province.setProvinceName(rs.getString("province"));
				province.setImagePath(rs.getString("imagepath"));
				
				provinceList.add(province);
			}
			return provinceList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}
	@Override
	public List<City> getCityByProvinceId(String provinceId) {
		try {
			StringBuffer sql = new StringBuffer("select id,cityid,city,father from tab_city where father = ?");
			stat = conn.prepareStatement(sql.toString());
			stat.setString(1, provinceId);
			rs = stat.executeQuery();
			
			List<City> cityList = new ArrayList<City>();
			while(rs.next()){				
				
				City city = new City();
				city.setId(rs.getInt("id"));
				city.setCityId(rs.getString("cityid"));
				city.setCityName(rs.getString("city"));
				city.setFather(rs.getString("father"));
				
				cityList.add(city);
			}
			return cityList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}
	@Override
	public List<ScenicSpot> selectAllScenics(ScenicSpot scenicSpot) {
		try {
			StringBuffer sql = new StringBuffer("select * from view_scenicspot where 1=1");
			//StringBuffer sql = new StringBuffer("select s.id,typeid,s.cityid sid,labelid,sc_image,title,details,price,createtime,c.id ccid,c.cityid cid,city,father,t.id tid,t.spottype typeName,l.id lid,l.labelname from tab_scenicspot s,tab_city c,tab_spottype t,tab_label l where s.cityid = c.cityid and s.typeid = t.id and s.labelid = l.id");
			/*select s.id,typeid,s.cityid,labelid,sc_image,title,details,price,createtime,
		       c.cityid cid,city,father,
		       t.id tid,t.spottype,
		       l.id lid,l.labelname
		 from tab_scenicspot s,tab_city c,tab_spottype t,tab_label l
		where s.cityid = c.cityid and s.typeid = t.id and s.labelid = l.id*/
			String cityName = scenicSpot.getCity().getCityName();
			if(cityName != null && !"".equals(cityName)){
				sql.append(" and city like '%" +cityName+ "%' ");
			}
			String spottype = scenicSpot.getSpotType().getTypeName();
			if(spottype != null && !"".equals(spottype)){
				sql.append(" and spottype = " + "'" + spottype +"'");
			}
			String labelname = scenicSpot.getLabel().getLabelName();
			if(labelname != null && !"".equals(labelname)){
				sql.append(" and labelname = " + "'" + labelname + "'");
			}
			int scenicId = scenicSpot.getScenicId();
			if(scenicId > 0){
				sql.append(" and id = " + scenicId);
			}
			//sql.append("and rownum <= " + page.getEndIndex() + ") where rn >=" + page.getBeginIndex());
			System.out.println("查询语句：" + sql);
			stat = conn.prepareStatement(sql.toString());
		
			rs = stat.executeQuery();
			
			List<ScenicSpot> allscenicList = new ArrayList<ScenicSpot>();
			while(rs.next()){
				ScenicSpot allscenic = new ScenicSpot();
				allscenic.setScenicId(rs.getInt("id"));
				allscenic.setTypeId(rs.getInt("typeid"));
				allscenic.setLabelId(rs.getInt("labelid"));
				allscenic.setCityId(rs.getString("cityid"));
				allscenic.setImage(rs.getString("sc_image"));
				allscenic.setTitle(rs.getString("title"));
				allscenic.setDetails(rs.getString("details"));
				allscenic.setPrice(rs.getInt("price"));
				allscenic.setCreateTime(rs.getDate("createTime"));
				
				SpotType spotType = new SpotType();
				spotType.setTypeId(rs.getInt("tid"));
				spotType.setTypeName(rs.getString("spottype"));
				
				City city = new City();
				//city.setId(rs.getInt("ccid"));
				city.setCityId(rs.getString("cid"));
				city.setCityName(rs.getString("city"));
				city.setFather(rs.getString("father"));
				
				Label label = new Label();
				label.setLabelId(rs.getInt("lid"));
				label.setLabelName(rs.getString("labelname"));
				
				allscenic.setLabel(label);
				allscenic.setCity(city);
				allscenic.setSpotType(spotType);
				
				allscenicList.add(allscenic);
				
			}
			return allscenicList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}
	@Override
	public boolean insertScenic(ScenicSpot scenicSpot) {
		
		try {
			stat = conn.prepareStatement("insert into tab_scenicspot(id,typeid,cityid,labelid,sc_image,title,details,price,createtime) values(tab_scenicspot_seq.nextval,?,?,?,?,?,?,?,?)");
			
			int k = 1;
			stat.setInt(k++, scenicSpot.getTypeId());
			stat.setString(k++, scenicSpot.getCityId());
			stat.setInt(k++, scenicSpot.getLabelId());
			stat.setString(k++, scenicSpot.getImage());
			stat.setString(k++, scenicSpot.getTitle());
			stat.setString(k++, scenicSpot.getDetails());
			stat.setInt(k++, scenicSpot.getPrice());
			stat.setDate(k++, new Date(scenicSpot.getCreateTime().getTime()));
			
			int result = stat.executeUpdate();
			
			if(result > 0){
				return true;
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			DBUtil_pool.close(stat, rs);
		}
		return false;
	}
	@Override
	public boolean updateScenic(ScenicSpot scenicSpot) {

		try {
			//1~3.获取数据库连接
			//conn = DBUtil.getConnection();
			
			//4.获取PreparedStatement对象
			stat = conn.prepareStatement("update tab_scenicspot set sc_image = ?,title = ?,details = ?,price = ?,createtime =? where id = ?");
			
			//5.绑定变量值（绑定?的值）
			int k = 1;
			
			stat.setString(k++, scenicSpot.getImage());
			stat.setString(k++, scenicSpot.getTitle());
			stat.setString(k++, scenicSpot.getDetails());
			stat.setInt(k++, scenicSpot.getPrice());
			stat.setDate(k++, new Date(scenicSpot.getCreateTime().getTime()));
			stat.setInt(k++, scenicSpot.getScenicId());
			
			//6.执行新增
			int result = stat.executeUpdate();

			//7.判断结果
			if(result > 0)
			{
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return false;
	}
	@Override
	public boolean deleteScenicBatch(int[] ids) {
		
		try {
			//1~3.获取数据库连接
			//conn = DBUtil.getConnection();
			
			//定义sql语句
			StringBuffer sql = new StringBuffer("delete from tab_scenicspot where id =?");//[21, 61, 4, 5, 7]
			
			//4.获取PreparedStatement对象
			stat = conn.prepareStatement(sql.toString());
			
			//5.绑定变量值
			for (int id : ids) {
				stat.setInt(1, id);
				
				//添加到批处理sql语句中------------------------------------注意一
				stat.addBatch();//delete from tab_user where id =21
								//delete from tab_user where id =61
								//delete from tab_user where id =4
								//delete from tab_user where id =5
								//delete from tab_user where id =7
			}
			
			//6.执行新增--------------------------调用executeBatch()方法-------注意二
			int[] results = stat.executeBatch();
			
			//7.判断结果： 1.执行成功结果：  大于等于 0 的数；SUCCESS_NO_INFO(-2)  2.执行失败结果： EXECUTE_FAILED(-3)
			for (int result : results) {
				if(result == Statement.EXECUTE_FAILED)
				{
					return false;
				}
			}
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return false;
	}
	@Override
	public ScenicSpot selectDetails(int scenicId) {
		
		/*
		 * create view view_details
			as
			select d.id did,d.scenicid,d.schedule,d.hotelid,
			       p.id pid,p.sc_image,p.title,p.price,
			       h.id hid,h.name,h.roomtype,h.address,h.telephone
			from tab_schedule d,tab_scenicspot p,tab_hotel h
		 */
		try {
			StringBuffer sql = new StringBuffer("select * from view_details where pid = ?");
			stat = conn.prepareStatement(sql.toString());
			stat.setInt(1, scenicId);
			rs = stat.executeQuery();
			
			
			if(rs.next()){
				ScenicSpot scenicsSpot = new ScenicSpot();
				scenicsSpot.setScenicId(rs.getInt("pid"));
				scenicsSpot.setImage(rs.getString("sc_image"));
				scenicsSpot.setTitle(rs.getString("title"));
				scenicsSpot.setPrice(rs.getInt("price"));
				
				Schedule schedules = new Schedule();
				schedules.setId(rs.getInt("did"));
				schedules.setScenicId(rs.getInt("scenicid"));
				schedules.setSchedule(rs.getString("schedule"));
				schedules.setHotelId(rs.getInt("hotelid"));
				scenicsSpot.setSchedule(schedules);
				
				Hotel hotel = new Hotel();
				hotel.setId(rs.getInt("hid"));
				hotel.setName(rs.getString("name"));
				hotel.setRoomType(rs.getString("roomtype"));
				hotel.setAddress(rs.getString("address"));
				hotel.setTelephone(rs.getString("telephone"));
				scenicsSpot.setHotel(hotel);
				return scenicsSpot;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}
	

}
