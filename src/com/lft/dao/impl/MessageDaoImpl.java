package com.lft.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lft.dao.IMessageDao;
import com.lft.entity.Message;
import com.lft.entity.Order;
import com.lft.entity.OrderDetail;
import com.lft.entity.ScenicSpot;
import com.lft.util.DBUtil_pool;

public class MessageDaoImpl implements IMessageDao {

	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	public MessageDaoImpl(Connection conn)
	{
		this.conn = conn;
	}
	
	@Override
	public boolean insertMessage(Message message) {

		try {
			stat = conn.prepareStatement("insert into tab_message(id,context,userid,createtime,scenicid) values(TAB_MESSAGE_SEQ.Nextval,?,?,?,?)");
		
			int k = 1;
			//stat.setInt(k++, message.getId());
			stat.setString(k++, message.getContext());
			stat.setInt(k++, message.getUserId());
			stat.setDate(k++, new Date(message.getCreateTime().getTime()));
			stat.setInt(k++, message.getScenicId());
			
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
	public boolean deleteMessage(int[] ids) {

		return false;
	}

	@Override
	public List<Message> selectAllMessage(int scenicId) {
		
		try {
			stat = conn.prepareStatement("select id,context,userid,createtime,scenicid from tab_message where scenicid = ?");
			
			stat.setInt(1, scenicId);
			rs = stat.executeQuery();
			
			List<Message> messageList = new ArrayList<Message>();
			while(rs.next()){
				Message message = new Message();
				message.setId(rs.getInt("id"));
				message.setContext(rs.getString("context"));
				message.setUserId(rs.getInt("userid"));
				message.setCreateTime(rs.getDate("createtime"));
				message.setScenicId(rs.getInt("scenicid"));
				messageList.add(message);
			}
			return messageList;
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
