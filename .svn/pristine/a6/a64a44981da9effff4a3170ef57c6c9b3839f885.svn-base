package com.cauc.contract.cache;

import java.util.List;

import com.cauc.contract.pojos.Dictionary;

public interface IDictionaryCacheService {

	/**
	 * 保存缓存
	 */
	public void loadAll();
	/**
	 * 添加字典缓存
	 * @param dictionary
	 */
	public void addDictionary(Dictionary dictionary) ;
	
	/**
	 * 更新字典缓存
	 * @param dictionary
	 */
	public void updateDictionary(Dictionary dictionary) ;
	/**
	 * 删除字典缓存
	 * @param dictionary
	 */
	public void deleteDictionary(Dictionary dictionary) ;
	/**
	 * 删除字典缓存list
	 * @param dictionary
	 */
	public void deleteDicList(List<Dictionary> diclist) ;
	  /**
     * 获取所有数据字典
     */
	public List<Dictionary> getAllDic();

	/**
	 * 通过id获取数据字典name
	 */
	public String getDicNameById(int dictionaryId);
	/**
	 * 清空缓存
	 */
	public void cleanAll();
}
