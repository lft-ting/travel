package com.lft.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lft.dao.IOrtherDao;
import com.lft.entity.Label;
import com.lft.entity.Province;
import com.lft.entity.SpotType;
import com.lft.util.DBUtil_pool;

public class OrtherDaoImpl implements IOrtherDao {

	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	public OrtherDaoImpl(Connection conn)
	{
		this.conn = conn;
	}
	@Override
	public List<SpotType> selectType() {
		try {
			StringBuffer sql = new StringBuffer("select id,spottype from tab_spottype");
			stat = conn.prepareStatement(sql.toString());
			
			rs = stat.executeQuery();
			
			List<SpotType> spotTypeList = new ArrayList<SpotType>();
			while(rs.next()){				
				
				SpotType spotType = new SpotType();
				spotType.setTypeId(rs.getInt("id"));
				spotType.setTypeName(rs.getString("spottype"));
				
				spotTypeList.add(spotType);
			}
			return spotTypeList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}

	@Override
	public List<Label> selectLabel() {
		try {
			StringBuffer sql = new StringBuffer("select id,labelname from tab_label");
			stat = conn.prepareStatement(sql.toString());
			
			rs = stat.executeQuery();
			
			List<Label> labelList = new ArrayList<Label>();
			while(rs.next()){				
				
				Label label = new Label();
				label.setLabelId(rs.getInt("id"));
				label.setLabelName(rs.getString("labelname"));
				
				labelList.add(label);
			}
			return labelList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//8.关闭连接
			DBUtil_pool.close(stat, rs);
		}
		return null;
	}

}
