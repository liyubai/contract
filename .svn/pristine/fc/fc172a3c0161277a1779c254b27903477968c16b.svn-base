package com.cauc.contract.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class FinanceFactory {
	
	@Autowired
	@Qualifier("hibernateFinanceProviderImpl")
	private FinanceProvider providerInstance;

	/**
	 * <p>
	 * 获取FinanceProvider实例
	 * </p>
	 * 
	 * @return FinanceProvider
	 */
	public FinanceProvider getFinanceProviderInstance() {
		return providerInstance;
	}

}
