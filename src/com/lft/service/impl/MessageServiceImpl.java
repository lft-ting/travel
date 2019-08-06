package com.lft.service.impl;

import java.sql.Connection;
import java.util.List;

import com.lft.dao.IMessageDao;
import com.lft.dao.IOrderDao;
import com.lft.dao.impl.MessageDaoImpl;
import com.lft.dao.impl.OrderDaoImpl;
import com.lft.entity.Message;
import com.lft.entity.Order;
import com.lft.service.IMessageService;
import com.lft.util.DBUtil_pool;

public class MessageServiceImpl implements IMessageService {

	Connection conn = null;
	private final static IMessageService instance = new MessageServiceImpl();
	
	private MessageServiceImpl() {

	}
	
	public static IMessageService getInstance(){
		return instance;
	}
	@Override
	public boolean insertMessage(Message message) {

		try {
			conn = DBUtil_pool.getConnection();
			
			DBUtil_pool.openTransaction(conn);
			
			IMessageDao messageDao = new MessageDaoImpl(conn);
			boolean result = messageDao.insertMessage(message);
			System.out.println("用户留言" + message.getId() + "保存成功");
			
			if(result)
			{
				DBUtil_pool.commitTransaction(conn);
			}else{
				DBUtil_pool.rollbackTransaction(conn);
			}
			return result;
		} catch (Exception ex) {
			DBUtil_pool.rollbackTransaction(conn);
		}finally{
			DBUtil_pool.close(conn);
		}
		return false;
	}

	@Override
	public List<Message> selectAllMessage(int scenicId) {

		Connection conn = null;
		try {
			conn = DBUtil_pool.getConnection();
			IMessageDao messageDao = new MessageDaoImpl(conn);
			List<Message> messageList = messageDao.selectAllMessage(scenicId);
			
			return messageList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			//5. 关闭连接
			DBUtil_pool.close(conn);
		}
		return null;
	}

}
