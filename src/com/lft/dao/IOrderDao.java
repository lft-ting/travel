package com.lft.dao;

import java.util.List;

import com.lft.entity.Order;
import com.lft.entity.OrderDetail;

public interface IOrderDao {
	
	public boolean insertOrder(Order order);
	public boolean insertOrderDetail(OrderDetail orderDetail);
	public boolean deleteOrder(int[] ids);
	public List<Order> selectOrder(int userId);
	public List<Order> selectOrderBy(String orderBy);
	
}
