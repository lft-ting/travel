package com.lft.service;

import java.util.List;

import com.lft.entity.Message;

public interface IMessageService {

	public boolean insertMessage(Message message);
	public List<Message> selectAllMessage(int scenicId);
}
