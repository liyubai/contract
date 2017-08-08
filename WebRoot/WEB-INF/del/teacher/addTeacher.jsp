<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加教员</title>

<link rel="stylesheet" href="themes/cupertino/jquery.ui.all.css">
<script src="scripts/jquery.min.js"></script>
<script src="scripts/jquery-ui.min.js"></script>
<script src="scripts/ui/jquery.ui.position.min.js"></script>
<script src="scripts/ui/jquery.ui.core.min.js"></script>
<script src="scripts/ui/jquery.ui.widget.min.js"></script>
<script src="scripts/ui/jquery.ui.button.min.js"></script>
<script src="scripts/ui/jquery.ui.tabs.min.js"></script>
<script src="scripts/ui/jquery.ui.dialog.min.js"></script>
<script src="scripts/ui/jquery.ui.menu.min.js"></script>
<script src="scripts/function.min.js"></script>
<script src="scripts/isChinaIDCard.js"></script>
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>

<!-- 树形相关开始-->
<link rel="STYLESHEET" type="text/css" href="../codebase/dhtmlxtree.css">
<script src="../codebase/dhtmlxcommon.js"></script>
<script src="../codebase/dhtmlxtree.js"></script>

<style>

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
#Panel1, .buttonBox { width: auto; margin-left: 50px; margin-right: 50px; padding-top: 0; }
.Panel, .panelContent, .panelTable, td { background-color: transparent; box-shadow: none; filter: none; }

.rightLine1{width:80px; float:left; height:35px; text-align:center;border-right:solid 1px #DBE3E8;}
.rightLine2{width:80px; float:left; text-align:center;border-right:solid 1px #DBE3E8; padding-top:4px;}
.middleclass{background: #EEEEEE; width: 100%; height: 1px; line-height: 1px; margin: 0px 0 0px 0; display: block; clear: both;}
</style>
<script>
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","120px").end().each(function(i){
		if(i==3){var d=new $.dropDownList(i,true,330);}
		else{new $.dropDownList(i,true,120);}
	})
	
	$("#VSfz").blur(function(){
		if($.trim($("#VSfz").val()) == "" ){
			//alert("身份证号不能为空。");
			//$("#VSfz").focus();
			return false;
		}

		if(!isChinaIDCard($.trim($("#VSfz").val()))){
			$("#VSfz").focus();
			return false;
		}
		var birth = getBirthById($.trim($("#VSfz").val()));
		if(birth!=""){
			$("#DCsrq").val(birth);
		}
	});
	
	//保存
	
	
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	 $("#modalDialogButton3").click(function(){
		 var VName = $("#VName").val();
		 if(VName == null || VName ==""){
			 
			alert("姓名不能为空。");
			$("#VName").focus();
			return false;
		}
		/*
		if($.trim($("#VSfz").val()) == "" ){
			alert("身份证号不能为空。");
			$("#VSfz").focus();
			return false;
		}
		if(!isChinaIDCard($.trim($("#VSfz").val()))){
			$("#VSfz").focus();
			return false;
		}
		var birth = getBirthById($.trim($("#VSfz").val()));
		if(birth!=""){
			$("#DCsrq").val(birth);
		}
		*/
		//var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		//var regex = /^\d{11}$/;
		var sfzh = $("#VSfz").val();
		var phone = $("#VLxfs").val();
		
		var MzVId = $("#MzVId").val();
		var WhcdVId = $("#WhcdVId").val();
		var fxjylxVId = $("#fxjylxVId").val();
		var dmjylxVId = $("#dmjylxVId").val();
		var sfjxVId = $("#sfjxVId").val();
		var spjsdjVId = $("#spjsdjVId").val();
		var iexam = document.getElementsByName("teacher.IExam");
		var peopleIExam = "";
		for(var i=0;i<iexam.length;i++){
			if(iexam[i].checked == true){
				peopleIExam = iexam[i].value;
			}
		}
		//var errors = "";
		/*
		
		if(VName == null || VName ==""){
			errors += "姓名为必填项，不能为空！\r";
		}
		if(MzVId == null || MzVId == ""){
			errors += "民族为必填项，请选择！\r";
		}
		if(WhcdVId == null || WhcdVId==""){
			errors += "文化程度为必填项，请选择！\r";
		}
		//if(fxjylxVId == null || fxjylxVId==""){
		//	errors += "飞行教员类型为必填项，请选择！\r";
		//}
		if(dmjylxVId == null || dmjylxVId==""){
			errors += "地面教员类型为必填项，请选择！\r";
		}
		//if(sfjxVId == null || sfjxVId == ""){
		//	errors += "所飞机型为必填项，请选择！\r";
		//}
		//if(spjsdjVId == null || spjsdjVId==""){
		//	errors += "所聘技术等级为必填项，请选择！\r";
		//}
		if(sfzh!=null && sfzh!=""){
			if(reg.test(sfzh)==false){
				errors += "身份证号填写错误，请认真核对！\r";
			}
		}else{
			errors += "身份证号为必填项，不能为空！\r";
		}
		if(phone != null && phone != ""){
			if(regex.test(phone)==false){
				errors += "电话号码格式不正确，请认真核对！\r";
			}
		}
		*/
		var VSex = $("#VXb").val();
		if(VSex==null || VSex==""){
			VSex = "男";
		}
		var VZzmm = $("#VZzmm").val();
		if(VZzmm==null || VZzmm==""){
			VZzmm = "中共党员";
		}
		
		//if(errors==""){
			//alert(1);
			$("#peoplename").val(VName);
			$("#peoplesex").val(VSex);
			$("#peoplecsrq").val($("#DCsrq").val());
			$("#peoplemz").val($("#MzVId").val());
			$("#peoplelxfs").val($("#VLxfs").val());
			$("#peoplecardid").val($("#VSfz").val());
			$("#peoplezzmm").val(VZzmm);
			$("#peoplejg").val($("#VJg").val());
			$("#peoplejtzz").val($("#VJtzz").val());
			$("#peoplewhcd").val($("#WhcdVId").val());
			$("#peoplebyyx").val($("#VByyx").val());
			$("#peoplezw").val($("#VZw").val());
			if($("#fxjylxVId").val()!=""){
				$("#peopleFxjyLx").val($("#fxjylxVId").val());
			}
			$("#peopleDmjyLx").val($("#dmjylxVId").val());
			$("#peopleIExam").val(peopleIExam);
			if($("#sfjxVId").val()!=""){
				$("#peopleSfjx").val($("#sfjxVId").val());
			}
			if($("#spjsdjVId").val()!=""){
				$("#peopleSpjsdj").val($("#spjsdjVId").val());
			}
			$("#peopleAqdj").val($("#VSafedengji").val());
			$("#peopleCjgzsj").val($("#DCjgzsj").val());
			$("#peopleSzdw").val($("#VSzdw").val());
			$("#peopleSzdwZw").val($("#VSzdwzw").val());
			$("#peopleRxrq").val($("#DRxrq").val());
			$("#peopleYysp").val($("#VYysp").val());
			$("#peopleMhyytgsj").val($("#DMhyytgsj").val());
			//alert(2);
			$("#peopleForm").submit();
		//}else{
		//	alert(errors);
			//return;
		//}
	});
	
	 //取消，返回列表页
	$("#modalDialogButton4").click(function(){
	    $("#searchForm").submit();
	});
	
});
</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<s:action name="open_leftList" executeResult="true">
<s:param name="parentid">4028816a4714304c0147149e89190004</s:param>
<s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
</s:action>
</div></div>

<div id="topPartD"><div class="panelBox buttonBox">
<s:if test="showPeople==''">
<button id="modalDialogButton3" class="green" primary="ui-icon-button-confirm">保存</button>
</s:if>
<button id="modalDialogButton4" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>
<input type="hidden" name="statusMsg" />

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    

		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="normal">
				<td width="90" align="right">教员姓名：</td>
				<td width="120"><div style="margin-top:5px;"><input id="VName" value="${teacher.VName}" maxlength="50" class="text ui-widget-content ui-corner-all" style="width:107px;"/></div></td>
				<td width="80" align="right">性别：</td>
				<td width="180">
					<div class="dropDownList">
						<button>男</button>
						<ul>
							<li><a href="#N" val="男"><span class="ui-icon ui-icon-bullet"></span>男</a></li>
							<li><a href="#N" val="女">女</a></li>
						</ul>
						<input type="hidden" id="VXb" name="teacher.VXb" value="<s:if test="teacher.VXb != null && teacher.VXb!=''">${teacher.VXb}</s:if><s:else>男</s:else>" />
					</div>
				</td>
				<td width="104" align="right">身份证号：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VSfz" name="teacher.VSfz" value="${teacher.VSfz}" maxlength="50" class="text ui-widget-content ui-corner-all"/></div></td>
				</tr>
				<tr class="normal">
				<td width="74" align="right">民族：</td>
				<td width="180">
				<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<s:iterator value="mzList">
							<li><a href="#N" val="${VId}"><span class="ui-icon ui-icon-bullet"></span>${VName}</a></li>
							</s:iterator> 
						</ul>
						<input type="hidden" id="MzVId" name="teacher.TDictionByVMz.VId" value="${teacher.TDictionByVMz.VId}" />
					</div>
				</td>
				<td width="80" align="right">联系方式：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VLxfs" name="teacher.VLxfs" value="${teacher.VLxfs}" maxlength="100" class="text ui-widget-content ui-corner-all"/></div></td>
				<td width="104" align="right">出生日期：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;border-color:#DDDDDD;" id="DCsrq" name="teacher.DCsrq" value='<s:date name="teacher.DCsrq" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" /></div></td>
				</tr>
				<tr class="normal">
				<td width="74" align="right">政治面貌：</td>
				<td width="180">
				<div class="dropDownList">
						<button>中共党员</button>
						<ul>
							<li><a href="#N" val="中共党员"><span class="ui-icon ui-icon-bullet"></span>中共党员</a></li>
                            <li><a href="#N" val="中共预备党员">中共预备党员</a></li>
							<li><a href="#N" val="共青团员">共青团员</a></li>
							<li><a href="#N" val="群众">群众</a></li>
						</ul>
						<input type="hidden" id="VZzmm" name="teacher.VZzmm" value='<s:if test="teacher.VZzmm != null && teacher.VZzmm != ''">${teacher.VZzmm}</s:if><s:else>中共党员</s:else>' />
				  </div>
				</td>
				<td width="80" align="right">籍贯：</td>
				<td width="180">
                 <div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" class="inline" style="width:45px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="jiguanList">
                            <a href="#N" val="${VName}" class="inline" style="width:45px;">${VName}</a>
						  </s:iterator></li>
						</ul>
				  <input type="hidden" id="VJg"  name="teacher.VJg"  value="${teacher.VJg}" />
				</div></td>
				<td width="104" align="right">家庭住址：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VJtzz" name="teacher.VJtzz" value="${teacher.VJtzz}" maxlength="200" class="text ui-widget-content ui-corner-all"/></div></td>
				</tr>
				<tr class="normal">
				<td width="74" align="right">文化程度：</td>
				<td width="180">
				<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<s:iterator value="whcdList">
							<li><a href="#N" val="${VId}"><span class="ui-icon ui-icon-bullet"></span>${VName}</a></li>
							</s:iterator> 
						</ul>
						<input type="hidden" id="WhcdVId" name="teacher.TDictionByVWhcd.VId" value="${teacher.TDictionByVWhcd.VId}" />
					</div>
				</td>
				<td width="80" align="right">毕业院校：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VByyx" name="teacher.VByyx" value="${teacher.VByyx}" maxlength="200" class="text ui-widget-content ui-corner-all"/></div></td>
				<td width="104" align="right">职位：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VZw" name="teacher.VZw" value="${teacher.VZw}" maxlength="100" class="text ui-widget-content ui-corner-all"/></div></td>
				</tr>
				<tr class="normal">
				<td width="74" align="right">飞行教员类型：</td>
				<td width="180">
				<div class="dropDownList">
						<button>请选择</button>
						<ul>
                        	<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
							<s:iterator value="fxjyTypeList">
							<li><a href="#N" val="${VId}">${VName}</a></li>
							</s:iterator> 
						</ul>
						<input type="hidden" id="fxjylxVId" name="teacher.TDictionByVFlytype.VId" value="${teacher.TDictionByVFlytype.VId}" />
					</div>
				</td>
				<td width="80" align="right">地面教员类型：</td>
				<td width="180">
				<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<s:iterator value="dmjyTypeList">
							<li><a href="#N" val="${VId}"><span class="ui-icon ui-icon-bullet"></span>${VName}</a></li>
							</s:iterator> 
						</ul>
						<input type="hidden" id="dmjylxVId" name="teacher.TDictionByVGeneraltype.VId" value="${teacher.TDictionByVGeneraltype.VId}" />
					</div>
				</td>
				<td width="104" align="right">是否考试员：</td>
				<td width="180">
				<s:if test="teacher.IExam==0">
					<input name="teacher.IExam" type="radio" value="1" /><b></b>是
					<input name="teacher.IExam" type="radio" value="0" checked="checked" /><b></b>否
				</s:if>
				<s:elseif test="teacher.IExam==1">
					<input name="teacher.IExam" type="radio" value="1" checked="checked" /><b></b>是
					<input name="teacher.IExam" type="radio" value="0" /><b></b>否
				</s:elseif>
                <s:else>
                	<input name="teacher.IExam" type="radio" value="1"/><b></b>是
					<input name="teacher.IExam" type="radio" value="0" checked="checked" /><b></b>否
                </s:else>
				</td>
				</tr>
				<tr class="normal">
				<td width="74" align="right">所飞机型：</td>
				<td width="180">
				<div class="dropDownList">
						<button>请选择</button>
						<ul>
                        	<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
							<s:iterator value="sfjxList">
							<li><a href="#N" val="${VId}">${VName}</a></li>
							</s:iterator> 
						</ul>
						<input type="hidden" id="sfjxVId" name="teacher.TDictionByVFlyform.VId" value="${teacher.TDictionByVFlyform.VId}" />
					</div>
				</td>
				<td width="80" align="right">所聘技术等级：</td>
				<td width="180">
				<div class="dropDownList">
						<button>请选择</button>
						<ul>
                        	<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
							<s:iterator value="spjsdjList">
							<li><a href="#N" val="${VId}">${VName}</a></li>
							</s:iterator> 
						</ul>
						<input type="hidden" id="spjsdjVId" name="teacher.TDictionByVTecdengji.VId" value="${teacher.TDictionByVTecdengji.VId}" />
					</div>
				</td>
				<td width="104" align="right">安全等级：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VSafedengji" name="teacher.VSafedengji" value="${teacher.VSafedengji}" maxlength="50" class="text ui-widget-content ui-corner-all"/></div></td>
				</tr>
				<tr class="normal">
				<td width="74" align="right">参加工作日期：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:107px;border-color:#DDDDDD;" id="DCjgzsj" name="teacher.DCjgzsj" value='<s:date name="teacher.DCjgzsj" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" /></div></td>
				<td width="80" align="right">所在单位：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VSzdw" name="teacher.VSzdw" value="${teacher.VSzdw}" maxlength="100" class="text ui-widget-content ui-corner-all"/></div></td>
				<td width="104" align="right">所在单位职务：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VSzdwzw" name="teacher.VSzdwzw" value="${teacher.VSzdwzw}" maxlength="100" class="text ui-widget-content ui-corner-all"/></div></td>
				</tr>
				<tr class="normal">
				<td width="74" align="right">入校日期：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:107px;border-color:#DDDDDD;" id="DRxrq" name="teacher.DRxrq" value='<s:date name="teacher.DRxrq" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" /></div></td>
				<td width="80" align="right">英语水平：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;" id="VYysp" name="teacher.VYysp" value="${teacher.VYysp}" maxlength="50" class="text ui-widget-content ui-corner-all"/></div></td>
				<td width="104" align="right">民航英语通过日期：</td>
				<td width="180"><div style="margin-top:5px;"><input style="width:180px;border-color:#DDDDDD;" id="DMhyytgsj" name="teacher.DMhyytgsj" value='<s:date name="teacher.DMhyytgsj" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" /></div></td>
				</tr>
                <tr class="normal">
				<td width="74" align="right">所属部门：<s:if test="deptId==null || deptId==''">
<s:set name="oid" value="teacher.TOrg.VId"/>
<s:set name="oidname" value="teacher.TOrg.VName"/>
</s:if>
<s:else>
<s:set name="oidname" value="deptName"/>
<s:set name="oid" value="deptId"/>
</s:else></td>
				<td colspan="5" id="orgname" >${oidname}</td>
				</tr>
			</tbody>
		</table><s:if test="teacher.TOrg.VId!=null || teacher.TOrg.VId!=''"><div id="treeboxbox_tree" style="padding-left:100px;"></div></s:if>
	</div>
</div>

</div></div>



<form id="searchForm" action="searchListTeacherAction.do" method="post">

<input type="hidden" name="deptId" value="${oid}" id="bid" />
<input type="hidden" name="key" value="${key}" />
</form>

<form id="peopleForm" action="addOrUpTeacherAction.do" method="post">
<input type="hidden" name="teacher.TOrg.VId" value="${oid}"  id="orgid"/>
<input type="hidden" name="teacher.VId" value="${teacher.VId}" />
<input type="hidden" id="peoplename" name="teacher.VName" />
<input type="hidden" id="peoplesex" name="teacher.VXb" />
<input type="hidden" id="peoplecsrq" name="teacher.DCsrq"/>
<input type="hidden" id="peoplemz" name="teacher.TDictionByVMz.VId" />
<input type="hidden" id="peoplelxfs" name="teacher.VLxfs" />
<input type="hidden" id="peoplecardid" name="teacher.VSfz" />
<input type="hidden" id="peoplezzmm" name="teacher.VZzmm" />
<input type="hidden" id="peoplejg" name="teacher.VJg" />
<input type="hidden" id="peoplejtzz" name="teacher.VJtzz" />
<input type="hidden" id="peoplewhcd" name="teacher.TDictionByVWhcd.VId" />
<input type="hidden" id="peoplebyyx" name="teacher.VByyx" />
<input type="hidden" id="peoplezw" name="teacher.VZw" />
<input type="hidden" id="peopleFxjyLx" name="teacher.TDictionByVFlytype.VId" />
<input type="hidden" id="peopleDmjyLx" name="teacher.TDictionByVGeneraltype.VId" />
<input type="hidden" id="peopleIExam" name="teacher.IExam" />
<input type="hidden" id="peopleSfjx" name="teacher.TDictionByVFlyform.VId" />
<input type="hidden" id="peopleSpjsdj" name="teacher.TDictionByVTecdengji.VId" />
<input type="hidden" id="peopleAqdj" name="teacher.VSafedengji" />
<input type="hidden" id="peopleCjgzsj" name="teacher.DCjgzsj" />
<input type="hidden" id="peopleSzdw" name="teacher.VSzdw" />
<input type="hidden" id="peopleSzdwZw" name="teacher.VSzdwzw" />
<input type="hidden" id="peopleRxrq" name="teacher.DRxrq" />
<input type="hidden" id="peopleYysp" name="teacher.VYysp" />
<input type="hidden" id="peopleMhyytgsj" name="teacher.DMhyytgsj" />
</form>
</body>
</html>
<script>

//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","300px","100%",0);
tree.setSkin('dhx_skyblue');
tree.setImagePath("../common/images/");
tree.enableDragAndDrop(false);

tree.setOnClickHandler(tonclick);
tree.enableTreeLines(true);
tree.setImageArrays("plus","plus2.gif","plus3.gif","plus4.gif","plus.gif","plus5.gif");
tree.setImageArrays("minus","minus2.gif","minus3.gif","minus4.gif","minus.gif","minus5.gif");
tree.setStdImages("book.gif","books_open.gif","books_close.gif");	

reloadPlan();

function tonclick(){

	$("#orgid").val(tree.getSelectedItemId());
	$("#bid").val(tree.getSelectedItemId());
	$("#orgname").html(tree.getSelectedItemText());

}
//加载树
function reloadPlan(){

	params = {};
	$.ajax({
		type:"post",
		url:"showOrgTree.do",
		data:params,
		dataType:"json",
		success:function(data){
			setTreeFromOrgList(data);
			tree.closeAllItems(1);//1节点全部打开，0节点全部关闭  组织机构内容很少，都打开了。
		},
		error:function(){
			alert("数据库连接错误，获取附件列表失败，请重试。");
			return;
		}
	});	
}
function setTreeFromOrgList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].message);
		tree.closeAllItems(data[i].VParentid);
	}
	//用于返回时选中树节点
	var VDeptId = $("#orgid").val();
	//if(VDeptId != null && VDeptId!=""){
		tree.selectItem(VDeptId);
	//	tonclick();//调用选中的节点单击方法
	//}
}
</script>