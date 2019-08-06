package com.lft.dao;

import java.util.List;

import com.lft.entity.Label;
import com.lft.entity.SpotType;

public interface IOrtherDao {
	public List<SpotType> selectType();
	public List<Label> selectLabel();
}
