package com.lft.dao;

import java.util.List;

import com.lft.entity.Message;

public interface IMessageDao {

	
	public boolean insertMessage(Message message);
	public boolean deleteMessage(int[] ids);
	public List<Message> selectAllMessage(int scenicId);
}
