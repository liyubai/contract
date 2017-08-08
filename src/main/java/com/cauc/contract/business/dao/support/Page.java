/*
 * @(#)Page.java
 * Description:	Finance
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2012 
 * Create by:	fuchaohui  2012-6-26
 */
package com.cauc.contract.business.dao.support;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.cauc.contract.config.FinanceConfig;
import com.cauc.contract.vo.VTotalSummary;

/**
 * 分页对象. 包含当前页数据及分页信息如总记录数,总页数
 * 
 * @author fuchaohui
 */
public class Page implements Serializable {

	private static final long serialVersionUID = 8014502901826204168L;
	/**
	 * 默认 分页数 
	 */
	public static int DEFAULT_PAGE_SIZE = FinanceConfig.getIntProperty("default.page.size");

	private int pageSize = DEFAULT_PAGE_SIZE; // 每页的记录数

	private int start=0; // 当前页第一条数据在List中的位置,从0开始

	private List data; // 当前页中存放的记录,类型一般为List

	private int totalCount=0; // 总记录数
	
	private int totalPageCount=0;//总页数
	
	private int pageStart=0;//用于在页面上显示的 数据记录开始位置(从 1开始记录)
	
	private int pageEnd=0;//用于在页面上显示的 数据记录结束位置
	
	private int currentPageNo=1;//当前页号
	
	private VTotalSummary totalNum;
	
	
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	/**
	 * 构造方法，只构造空页.
	 */
	public Page() {
		this(0, 0, DEFAULT_PAGE_SIZE, new ArrayList());
	}
	/**
	 * 默认构造方法.
	 * @param start	 本页数据在数据库中的起始位置
	 * @param totalSize 数据库中总记录条数
	 * @param pageSize  本页容量
	 */
	public Page(int start, int totalSize, int pageSize) {
		this.pageSize = pageSize;
		this.start = start;
		this.totalCount = totalSize;
		this.data = new ArrayList();
	}
	/**
	 * 默认构造方法.
	 * @param start	 本页数据在数据库中的起始位置
	 * @param totalSize 数据库中总记录条数
	 * @param data	  本页包含的数据
	 */
	public Page(int start, int totalSize, List data) {
		this.pageSize = DEFAULT_PAGE_SIZE;
		this.start = start;
		this.totalCount = totalSize;
		this.data = data;
	}	
	/**
	 * 默认构造方法.
	 * @param start	 本页数据在数据库中的起始位置
	 * @param totalSize 数据库中总记录条数
	 * @param pageSize  本页容量
	 * @param data	  本页包含的数据
	 */
	public Page(int start, int totalSize, int pageSize, List data) {
		this.pageSize = pageSize;
		this.start = start;
		this.totalCount = totalSize;
		this.data = data;
	}

	/**
	 * 取总记录数.
	 */
	public int getTotalCount() {
		return this.totalCount;
	}

	/**
	 * 取每页数据容量.
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 取当前页中的记录.
	 */
	public List getResult() {
		return data;
	}

	/**
	 * 取该页当前页码,页码从1开始.
	 */
	public int getCurrentPageNo() {
		this.currentPageNo=start / pageSize + 1;
		return this.currentPageNo;
	}

	/**
	 * 该页是否有下一页.
	 */
	public boolean hasNextPage() {
		return this.getCurrentPageNo() < this.getTotalPageCount() - 1;
	}

	/**
	 * 该页是否有上一页.
	 */
	public boolean hasPreviousPage() {
		return this.getCurrentPageNo() > 1;
	}

	/**
	 * 获取任一页第一条数据在数据集的位置，每页条数使用默认值.
	 *
	 * @see #getStartOfPage(int,int)
	 */
	public static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	/**
	 * 获取任一页第一条数据在数据集的位置(从 0 开始).
	 *
	 * @param pageNo   从1开始的页号
	 * @param pageSize 每页记录条数
	 * @return 该页第一条数据
	 */
	public static int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}
	/**
	 * 获取总页数
	 * @return the totalPageCount
	 */
	public int getTotalPageCount() {
		if(totalCount==0)
			return 0;
		this.totalPageCount=totalCount/pageSize;
		this.totalPageCount=(totalCount > this.totalPageCount * pageSize )? this.totalPageCount + 1
				: totalPageCount;
		return totalPageCount;
	}
	/**
	 * 用于页面显示 结束条目(数据从1开始)
	 * @return the pageEnd
	 */
	public int getPageEnd() {
		if(getTotalPageCount()==0)
			return 0;
		if(getCurrentPageNo()<getTotalPageCount())
			pageEnd=getPageStart()+pageSize-1;
		else{
			if(getTotalCount()%pageSize>0)
				pageEnd=getPageStart()+getTotalCount()%pageSize-1;
			else
				pageEnd=getPageStart()+pageSize-1;
		}
		return pageEnd;
	}
	/**
	 * 用于页面显示 开始条目(数据从1开始)
	 * @return the pageStart
	 */
	public int getPageStart() {
		if(getTotalPageCount()==0)
			return 0;		
		pageStart=getStartOfPage(getCurrentPageNo(),pageSize)+1;
		return pageStart;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	public VTotalSummary getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(VTotalSummary totalNum) {
		this.totalNum = totalNum;
	}

	
}
