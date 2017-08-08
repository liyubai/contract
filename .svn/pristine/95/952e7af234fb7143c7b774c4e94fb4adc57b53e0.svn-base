<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>角色管理</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/function.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/dropdownlist.js" type="text/javascript"></script>
    <script>
        $(function() {

            //功能11
            new $.treeView(0);
            //功能11
        });
</script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
</head>
<body>
<jsp:include page="/pages/common/topPart.jsp"></jsp:include>
<jsp:include page="/pages/common/leftPart.jsp"></jsp:include>
<div id="rightPartA" style="overflow-x:hidden;">
    <div>
    <div class="Panel">
        <div class="panelHead">
            <span>角色分配</span>
        </div>
        <div class="panelContent">
            <div>
                <span class="ml10">角色名称：</span>
                <span class="ml10" id="rn">${RoleName}</span>
                <input id="rid"  type="hidden" value=${RoleId}></input>               
            </div>
            <div class="treeView ml10" id="treeView0">
   <span class="left">权限分配：</span>

<ul class="left">
    <s:iterator id="parentTree" value = "powerList">  
    	<s:if test="parentId==0">
    		<li class="folderNode rootNode">
    		<span class="ui-icon ui-icon-circlesmall-plus">+</span>
    			<s:if test="description==1">
    		    <input type="checkbox" name="tree" value=${parentTree.powerId}  checked = "ture"></input><b></b>    		
    			</s:if>
    			<s:else>
    			<input type="checkbox" name="tree" value=${parentTree.powerId}></input><b></b>    		
    			</s:else>
			<span>${powerName}</span>
    		</li>
    		<ul>
    		<s:iterator id="childTree" value = "powerList"> 
    		<s:if test="#childTree.parentId==#parentTree.powerId">
    			<li class="folderNode ml20">
    			<s:if test="#childTree.description==1">
    		    <input type="checkbox" name="tree" value=${childTree.powerId}  checked = "ture"></input><b></b>    		
    			</s:if>
    			<s:else>
    			<input type="checkbox" name="tree" value=${childTree.powerId}></input><b></b>    		
    			</s:else>
    			<span>${childTree.powerName}</span>
    			</li>
    		</s:if>
    		</s:iterator>
    		</ul>
    	</s:if>    		    
    </s:iterator>
</ul>           

   
           
            </div>
            <div class="payWrap tCenter">
                <input id="Button2" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary mt10" value="保存" />
                <input id="Button1" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary mt10" value="返回" />
            </div>
            
        </div>
    </div>
    </div>
</div>
<script>    
    $("document").ready(function(){   
    	//alert("11!");
    	/* var PowerShow="<span class='left'>权限分配：</span>";
    	PowerShow+="<ul class='left'>";
    	PowerShow+="<s:iterator id='parentTree' value = 'powerList'>";  
    	PowerShow+="<s:if test='parentId==0'>";
    	PowerShow+="<li class='folderNode rootNode'>";
    	PowerShow+="<span class='ui-icon ui-icon-circlesmall-plus'>+</span>";    		
    	PowerShow+="<input type='checkbox' name='tree' value=${parentTree.powerId} id=${parentTree.powerId} ></input><b></b>";    		   		
    	PowerShow+="<span>${powerName}</span>";
    	PowerShow+="</li>";
    	    		 	    	
    	PowerShow+="<ul>";
    	PowerShow+="<s:iterator id='childTree' value = 'powerList'> ";
    	PowerShow+="<s:if test='#childTree.parentId==#parentTree.powerId'>";
    	PowerShow+="<li class='folderNode ml20'>";
    	PowerShow+="<input type='checkbox' name='tree' value=${childTree.powerId} id=${childTree.powerId}></input><b></b>";
    	PowerShow+="<span>${childTree.powerName}</span>";
    	PowerShow+="</li>";
    	PowerShow+="</s:if>";
    	PowerShow+="</s:iterator>";
    	PowerShow+="</ul>";
    	PowerShow+="</s:if>";    	    	    	    
    	PowerShow+="</s:iterator>";
    	PowerShow+="</ul> ";  
    	$("#treeView0").html(PowerShow); */
    });
       $(function(){
    	//取消
        $('#Button1').click(function() {
        	//返回角色列表页
            window.location.href = 'roleManagent_showManagent.do';
            //window.location.href = 'javascript:history.go(-2);';
        });
    	
        //保存
        $('#Button2').click(function(){
        	//角色名称
        	var VRole_Name = $("#rn").html();
        	//角色id
        	var VRole_Id=$("#rid").val();
        	//权限
        	var VPower_Ii="";        	
        	 $("input:checkbox[name=tree]:checked").each(function(i){  
                 if(0==i){  
                	 VPower_Ii = $(this).val();  
                 }else{  
                	 VPower_Ii += (","+$(this).val());  
                 }  
             }); 
        	 var params ='role.Role_Name='+VRole_Name+'&role.Role_Id='+VRole_Id+'&role.Power_Ids='+VPower_Ii;
        	 //保存
        	 $.ajax({
        	 	 type :"post",
        	 	 url :"<%=request.getContextPath()%>/contract/roleManagent_updateRole.do",
        	 	 data : params,
			 	 dataType : "json",
			 	 success : function(data) {
			 		alert("保存成功!");
				 },
					error : function() {
						alert("保存失败!");
					}
				});  // end ajax
        		 
        	 
        	//window.location.href ='roleManagent_updateRole.do?role.Role_Name='+VRole_Name+'&role.Role_Id='+VRole_Id+'&role.Power_Ids='+VPower_Ii;
        	
        });
    });
</script>

</body>
</html>
