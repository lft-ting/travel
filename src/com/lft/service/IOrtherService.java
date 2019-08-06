package com.lft.service;

import java.util.List;

import com.lft.entity.Label;
import com.lft.entity.SpotType;

public interface IOrtherService {

	public List<SpotType> selectType();
	public List<Label> selectLabel();
}
