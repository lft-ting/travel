package com.lft.dao.impl;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lft.dao.IOrderDao;
import com.lft.entity.Order;
import com.lft.entity.OrderDetail;
import com.lft.entity.ScenicSpot;
import com.lft.util.DBUtil_pool;

public class OrderDaoImpl implements IOrderDao {

	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	public OrderDaoImpl(Connection conn)
	{
		this.conn = conn;
	}
	@Override
	public boolean insertOrder(Order order) {

		try {
			stat = conn.prepareStatement("insert into tab_order(id,userid,orderid,createtime,note) values(TAB_ORDER_SEQ.Nextval,?,?,?,?)");
			
			//绑定变量
			int k = 1;
			stat.setInt(k++, order.getUserId());
			stat.setInt(k++, order.getOrderId());
			stat.setDate(k++, new Date(order.getCreateTime().getTime()));
			stat.setString(k++, order.getNote());
			
			int result = stat.executeUpdate();
			/*
			 * 获取当前新增生成的序列值
			 */
			stat = conn.prepareStatement("select tab_order_seq.currval curOrderId from dual");
			rs = stat.executeQuery();
			if(rs.next()){
				order.setId(rs.getInt("curOrderId"));
			}
			
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
	public boolean insertOrderDetail(OrderDetail orderDetail) {

		try {
			stat = conn.prepareStatement("insert into tab_orderdetail(id,orderid,scenicid,username,tellphone,num,godate,total) values(TAB_ORDERDETAIL_SEQ.Nextval,?,?,?,?,?,?,?)");
		
			//绑定变量
			int k = 1;
			stat.setInt(k++, orderDetail.getOrderid());
			stat.setInt(k++, orderDetail.getScenicId());
			stat.setString(k++, orderDetail.getName());
			stat.setString(k++, orderDetail.getPhone());
			stat.setInt(k++, orderDetail.getNum());
			stat.setDate(k++, new Date(orderDetail.getGoDate().getTime()));
			stat.setInt(k++, orderDetail.getTotal());
			
			int result = stat.executeUpdate();
			
			/*
			 * 获取当前新增生成的序列值
			 */
			/*stat = conn.prepareStatement("select tab_orderdetail_seq.currval curOrderDetailId from dual");
			rs = stat.executeQuery();
			if(rs.next()){
				orderDetail.setId(rs.getInt("curOrderDetailId"));
			}
			*/
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
	public boolean deleteOrder(int[] ids) {
		
		
		try {
			StringBuffer sql = new StringBuffer("delete from tab_order where id =?");

			stat = conn.prepareStatement(sql.toString());
			//绑定变量
			for(int id : ids){
				stat.setInt(1, id);
				//添加到批处理sql语句中
				stat.addBatch();
			}
			
			int[] results = stat.executeBatch();
			//7.判断结果： 1.执行成功结果：  大于等于 0 的数；SUCCESS_NO_INFO(-2)  2.执行失败结果： EXECUTE_FAILED(-3)
			for (int result : results) {
				if(result == Statement.EXECUTE_FAILED){
					return false;
				}
			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return false;
	}
	@Override
	public List<Order> selectOrder(int userId) {
		/*
		 * select o.id,userid,o.orderid onumber,o.createtime ordertime,note,
			       od.id odid,od.orderid,scenicid,username,tellphone,od.num,godate,total,
			       s.id sid,s.typeid,labelid,cityid,sc_image,title,s.details,s.price,s.createTime
			from tab_order o,tab_orderdetail od,tab_scenicspot s
			where o.id = od.orderid and od.scenicid = s.id
		 */
		try {
			stat = conn.prepareStatement("select * from view_allorder where userid = ?");
			stat.setInt(1, userId);
			rs = stat.executeQuery();
			
			List<Order> orderList = new ArrayList<Order>();
			while(rs.next()){
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setUserId(rs.getInt("userid"));
				order.setOrderId(rs.getInt("onumber"));
				order.setCreateTime(rs.getDate("ordertime"));
				order.setNote(rs.getString("note"));
				
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setId(rs.getInt("odid"));
				orderDetail.setOrderid(rs.getInt("orderid"));
				orderDetail.setScenicId(rs.getInt("scenicid"));
				orderDetail.setName(rs.getString("username"));
				orderDetail.setPhone(rs.getString("tellphone"));
				orderDetail.setNum(rs.getInt("num"));
				orderDetail.setGoDate(rs.getDate("godate"));
				orderDetail.setTotal(rs.getInt("total"));
				
				ScenicSpot scenic = new ScenicSpot();
				scenic.setScenicId(rs.getInt("sid"));
				scenic.setImage(rs.getString("sc_image"));
				scenic.setTitle(rs.getString("title"));
				scenic.setDetails(rs.getString("details"));
				scenic.setPrice(rs.getInt("price"));
				orderDetail.setScenic(scenic);
				order.setOrderDetail(orderDetail);
				orderList.add(order);
			}
			return orderList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}
	@Override
	public List<Order> selectOrderBy(String orderBy) {
		try {
			StringBuffer sql = new StringBuffer("select * from view_allorder where 1=1");
			if(orderBy != null && !"".equals(orderBy)){
				sql.append(" and order by " +orderBy);
			}
			System.out.println("查询语句：" + sql);
			stat = conn.prepareStatement(sql.toString());
			//stat.setString(1, orderBy);
			rs = stat.executeQuery();
			
			List<Order> orderByList = new ArrayList<Order>();
			while(rs.next()){
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setUserId(rs.getInt("userid"));
				order.setOrderId(rs.getInt("onumber"));
				order.setCreateTime(rs.getDate("ordertime"));
				order.setNote(rs.getString("note"));
				
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setId(rs.getInt("odid"));
				orderDetail.setOrderid(rs.getInt("orderid"));
				orderDetail.setScenicId(rs.getInt("scenicid"));
				orderDetail.setName(rs.getString("username"));
				orderDetail.setPhone(rs.getString("tellphone"));
				orderDetail.setNum(rs.getInt("num"));
				orderDetail.setGoDate(rs.getDate("godate"));
				orderDetail.setTotal(rs.getInt("total"));
				
				ScenicSpot scenic = new ScenicSpot();
				scenic.setScenicId(rs.getInt("sid"));
				scenic.setImage(rs.getString("sc_image"));
				scenic.setTitle(rs.getString("title"));
				scenic.setDetails(rs.getString("details"));
				scenic.setPrice(rs.getInt("price"));
				orderDetail.setScenic(scenic);
				order.setOrderDetail(orderDetail);
				orderByList.add(order);
			}
			return orderByList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}

}
