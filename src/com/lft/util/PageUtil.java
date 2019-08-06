package com.lft.util;

import java.util.List;

/**
 * 分页工具类
 */
public class PageUtil {

	//当前的数据集合
	private List data;
	
	//总行数
	private int rowCount;
	
	//每页显示条数
	private int pageSize = 5;
	
	//总页数
	private int pageCount;
	
	//当前页码
	private int pageNum;
	
	//开始索引
	private int beginIndex;
	
	//结束索引
	private int endIndex;
	
	//数据库分页
	public PageUtil(int rowCount)
	{
		//List -> 总行数
		this.rowCount = rowCount;
		
		//总行数，每页显示条数 -> 总页数   15/5=3   16/5=3+1
		if(this.rowCount % this.pageSize  == 0)
		{
			this.pageCount = this.rowCount / this.pageSize;
		}
		else
		{
			this.pageCount = this.rowCount / this.pageSize + 1;
		}
		
		//默认页码：第一页
		this.pageNum = 1;
		
		//计算开始索引与结束索引
		this.setPageNum(this.pageNum);
	}
	
	//结果集分页
	public PageUtil(List data)
	{
		this.data = data;
		
		//List -> 总行数
		this.rowCount = data.size();
		
		//总行数，每页显示条数 -> 总页数   15/5=3   16/5=3+1
		if(this.rowCount % this.pageSize  == 0)
		{
			this.pageCount = this.rowCount / this.pageSize;
		}
		else
		{
			this.pageCount = this.rowCount / this.pageSize + 1;
		}
		
		//默认页码：第一页
		this.pageNum = 1;
		
		//计算开始索引与结束索引
		this.setPageNum(this.pageNum);
		
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		//开始索引
		this.beginIndex = this.pageSize * (this.pageNum - 1) + 1;  
		
		//结束索引
		this.endIndex = this.pageNum * this.pageSize;
		if(this.endIndex > this.rowCount)
		{
			this.endIndex = this.rowCount;
		}
		
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	
	
}
