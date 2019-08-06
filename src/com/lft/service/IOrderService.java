package com.lft.service;

import java.util.List;

import com.lft.entity.Order;
import com.lft.entity.OrderDetail;

public interface IOrderService {
	
	public boolean insertOrder(Order order,OrderDetail orderDetail);
	public boolean deleteOrder(int[] ids);
	public List<Order> selectOrder(int userId);
	public List<Order> selectOrderBy(String orderBy);
}
