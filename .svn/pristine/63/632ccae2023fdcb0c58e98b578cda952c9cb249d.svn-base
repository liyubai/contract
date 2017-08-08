package com.cauc.contract.ui.core;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IPowerManagentService;
import com.cauc.contract.business.IRoleManagentService;
import com.cauc.contract.pojos.Power;
import com.cauc.contract.pojos.TContractRole;
import com.cauc.contract.ui.common.BaseActionSupport;


public class RoleManagentAction extends BaseActionSupport{



	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6381143906320472913L;

	private TContractRole role;
	private String RoleName;
	
	
	private Power power;
	
	private List<Integer> powerIds;
	
	
	

	
	public List<Integer> getPowerIds() {
		return powerIds;
	}

	public void setPowerIds(List<Integer> powerIds) {
		this.powerIds = powerIds;
	}

	public Power getPower() {
		return power;
	}

	public void setPower(Power power) {
		this.power = power;
	}

	public String getRoleName() {
		return RoleName;
	}

	public void setRoleName(String RoleName) {
		this.RoleName = RoleName;
	}

	public TContractRole getRole() {
			return role;
		}
	
	public void setRole(TContractRole role) {
	 		this.role = role;
	 	}
	private List<TContractRole> roleList;
	public List<TContractRole> getRoleList() {
		return roleList;
	}
		
	 
		public void setRoleList(List<TContractRole> roleList) {
			this.roleList = roleList;
		}
	private List<Power> powerList;
	public List<Power> getPowerList() {
		return powerList;
	}

	public void setPowerList(List<Power> powerList) {
		this.powerList = powerList;
	}
	private int RoleId;
	public void setRoleId(int RoleId)
	{
		this.RoleId = RoleId;
	}
	public int  getRoleId()
	{
		return this.RoleId;
	}
		
		
	
	/*
	 * 查询显示角色管理页面用的数据
	 */
	
	
	public String showManagent(){
		IRoleManagentService service = getFactory().getFinanceProviderInstance().getRoleManagentService();
		roleList = service.readAllRole();
		return SUCCESS;
		
		
}
	/**
	 * 增加角色信息
	 * 
	 * @return
	 */
	
	public String addRole(){
		try{
		IRoleManagentService service = getFactory().getFinanceProviderInstance().getRoleManagentService();
		service.saveRole(role);
		return showManagent();
		}catch (FinanceServiceException e) {
			return ERROR;
		}
	}
	/**
	 * 修改角色信息
	 * 
	 * @return
	 *
	 */
	
	public String updateRole(){
		try{
			IRoleManagentService service = getFactory().getFinanceProviderInstance().getRoleManagentService();
			String sPowerIds = role.getPower_Ids();
			if(sPowerIds!=null && sPowerIds.length()>0){
				if(sPowerIds.substring(sPowerIds.length()-1,sPowerIds.length()).equals(",")){
					sPowerIds=sPowerIds.substring(0,sPowerIds.length()-1);
					role.setPower_Ids(sPowerIds);
					}
				}
			service.saveRole(role);
			return SUCCESS;
		}catch(FinanceServiceException e){
			return ERROR;
			
		}
	}
	
	public String updatRedirect() throws UnsupportedEncodingException{
		//所有权限
		IPowerManagentService service = getFactory().getFinanceProviderInstance().getPowerManagentService();
		powerList = service.readAllPower();
		//角色名		
		String temp =role.getRole_Name();
		temp   = URLDecoder.decode(temp,"UTF-8");
		for(int j=0;j<powerList.size();j++){
			powerList.get(j).setDescription("0");
		}
				
		setRoleName(temp);
		setRoleId(role.getRole_Id());
		if(role.getPower_Ids()!=null && role.getPower_Ids().length()>0){
			String[] power_ids = role.getPower_Ids().split(",");
			List<Integer> list_tmp = new ArrayList<Integer>();
			Integer tmp;
			for(int i=0;i<power_ids.length;i++)
			{
				tmp =Integer.parseInt(power_ids[i]);
				
				for(int j=0;j<powerList.size();j++){					
					if(tmp == powerList.get(j).getPowerId())
						powerList.get(j).setDescription("1");
				}
				list_tmp.add(tmp);																
			}
			setPowerIds(list_tmp);	
		}
		else{setPowerIds(null);}



		return SUCCESS;
		
	}
	
	
	
	
	
	

}


