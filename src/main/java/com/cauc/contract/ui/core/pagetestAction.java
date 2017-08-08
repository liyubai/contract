package com.cauc.contract.ui.core;

import java.util.ArrayList;
import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IPageService;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.ui.common.Paging;

public class pagetestAction extends BaseActionSupport {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6381143906320472913L;

	// 分页
	private Paging paging;

	// 每页显示多少条
	private int pagesize;

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	// 当前页码
	private int cur_page;

	public int getCur_page() {
		return cur_page;
	}

	public void setCur_page(int cur_page) {
		this.cur_page = cur_page;
	}

	// 分页字符串
	private String pageStr;

	public String getPageStr() {
		return pageStr;
	}

	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}

	private List<Dictionary> dicList;

	public List<Dictionary> getDicList() {
		return dicList;
	}

	public void setDicList(List<Dictionary> dicList) {
		this.dicList = dicList;
	}

	public String showPage() throws FinanceServiceException {
		int totalRowCount = 0; // 查询到的总条目
		// 获取分页的数据查询
		IPageService service = getFactory().getFinanceProviderInstance().getPageService();

		// 获取查询到的总条目数的查询语句，表名，where语句
		totalRowCount = service.getTotalRowCount("Dictionary","level=1");

		this.paging = new Paging();
		// 当前页码
		if (this.cur_page == 0) {
			this.cur_page = 1;
		}
		// 每页显示数目
		this.pagesize=5;
		// 设置当前页码
		this.paging.setCurPage(this.cur_page);
		// 把得到总共显示的数据记录设置在分页总纪录中
		this.paging.setTotalRowCount(totalRowCount);
		// 设置每页显示的数据记录 （根据页面显示条数设置 ）
		this.paging.setPageRowCount(this.pagesize);

		List<Dictionary> dicList1 = new ArrayList<Dictionary>();
		// 获取返回list，选择字段，表名，当前页，每页显示条数，主键，where语句，order 语句
		List<Object[]> tempList = service.getListByPage("DictionaryId,DictionaryName,Level,ParentId,ChildId,TopId","Dictionary", this.cur_page, pagesize,"dictionaryId"," level=1","order by DictionaryId");

		Dictionary dictEnety = null;
		for (Object[] o : tempList) {
			dictEnety = new Dictionary();
			dictEnety.setDictionaryId(Integer.parseInt(o[0].toString()));
			dictEnety.setDictionaryName(o[1].toString());
			dictEnety.setLevel(Integer.parseInt(o[2].toString()));
			dictEnety.setParentId(Integer.parseInt(o[3].toString()));
			dictEnety.setChildId("1");
			dictEnety.setTopId(Integer.parseInt(o[5].toString()));
			dicList1.add(dictEnety);
		}
		setDicList(dicList1);
		// 设置访问的.do 页面
		pageStr = this.paging.getToolBar("pageTest.do");
		return SUCCESS;
	}

}
