<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照信息</title>

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
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
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

	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})

	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	 
	 //保存
	$("#modalDialogButton3").click(function(){
		var errors = "";
		var VCardid = $("#VCardid").val();
		var DEffectdate = $("#DEffectdate").val();
		var VIssuer = $("#VIssuer").val();
		var VCompany = $("#VCompany").val();
		var DIssuetime = $("#DIssuetime").val();
		var DUpdatedate = $("#DUpdatedate").val();
		var VHgz = $("#IHgz").val();
		var IJiankong = $("#IJiankong").val();
		var VXingzhi = $("#VXingzhi").val();
		
		if(VCardid==null || $.trim(VCardid)==""){
			errors += "【执照编号】为必填项，不能为空！\r";
		}
		if(DEffectdate==null || $.trim(DEffectdate)==""){
			errors += "【有效期】为必填项，不能为空！\r";
		}
		if(VIssuer==null || $.trim(VIssuer)==""){
			errors += "【局长授权签发】为必填项，不能为空！\r";
		}
		if(VCompany==null || $.trim(VCompany)==""){
			errors += "【签发单位】为必填项，不能为空！\r";
		}
		if(DIssuetime==null || $.trim(DIssuetime)==""){
			errors += "【签发时间】为必填项，不能为空！\r";
		}
		if(DUpdatedate==null || $.trim(DUpdatedate)==""){
			errors += "【更新时间】为必填项，不能为空！\r";
		}
		if(VHgz==null || $.trim(VHgz)==""){
			errors += "【合格证】为必填项，不能为空！\r";
		}
		if(IJiankong==null || $.trim(IJiankong)==""){
			errors += "【是否监控】为必填项，不能为空！\r";
		}
		if(VXingzhi==null || $.trim(VXingzhi)==""){
			errors += "【执照性质】为必填项，不能为空！\r";
		}
		
		var count=0;
		/*
		var VDengji = document.getElementsByName("VDengji");
		var VDengjis = ",";
		for(i=0; i<VDengji.length; i++){
			if(VDengji[i].checked == true){
				count++;
				VDengjis += VDengji[i].value+",";
			}
		}
		if(count==0 || VDengjis==","){
			errors += "【教员执照等级】为必填项，请勾选！\r";
			count=0;
		}
		*/
		
		var VJyzzlx = document.getElementsByName("VJyzzlx");
		var VJyzzlxs = ",";
		for(i=0; i<VJyzzlx.length; i++){
			if(VJyzzlx[i].checked == true){
				count++;
				VJyzzlxs += VJyzzlx[i].value+",";
			}
		}
		if(count==0 || VJyzzlxs==","){
			errors += "【飞行执照类型】为必填项，请勾选！\r";
			count=0;
		}
		
		var VZzlx = document.getElementsByName("VZzlx");
		var VZzlxs = ",";
		for(i=0; i<VZzlx.length; i++){
			if(VZzlx[i].checked == true){
				count++;
				VZzlxs += VZzlx[i].value+",";
			}
		}
		/*
		if(count==0 || VZzlxs==","){
			errors += "【执照类型】为必填项，请勾选！\r";
			count=0;
		}
		*/
		
		var VYbdj = document.getElementsByName("VYbdj");
		var VYbdjs = ",";
		for(i=0; i<VYbdj.length; i++){
			if(VYbdj[i].checked == true){
				count++;
				VYbdjs += VYbdj[i].value+",";
			}
		}
		/*
		if(count==0 || VYbdjs==","){
			errors += "【仪表等级】为必填项，请勾选！\r";
			count=0;
		}
		*/
		
		var VFjjbdj = document.getElementsByName("VFjjbdj");
		var VFjjbdjs = ",";
		for(i=0; i<VFjjbdj.length; i++){
			if(VFjjbdj[i].checked == true){
				count++;
				VFjjbdjs += VFjjbdj[i].value+",";
			}
		}
		/*
		if(count==0 || VFjjbdjs==","){
			errors += "【飞机级别等级】为必填项，请勾选！\r";
			count=0;
		}
		*/
		
		var VHkqlb = document.getElementsByName("VHkqlb");
		var VHkqlbs = ",";
		for(i=0; i<VHkqlb.length; i++){
			if(VHkqlb[i].checked == true){
				count++;
				VHkqlbs += VHkqlb[i].value+",";
			}
		}
		/*
		if(count==0 || VHkqlbs==","){
			errors += "【航空器类别】为必填项，请勾选！\r";
			count=0;
		}
		*/
		var VHkqdj = document.getElementsByName("VHkqdj");
		var VHkqdjs = ",";
		for(i=0; i<VHkqdj.length; i++){
			if(VHkqdj[i].checked == true){
				count++;
				VHkqdjs += VHkqdj[i].value+",";
			}
		}
		if(count==0 || VHkqdjs==","){
			errors += "【航空器型别等级】为必填项，请勾选！\r";
			count=0;
		}
		
		var VXyjdj = document.getElementsByName("VXyjdj");
		var VXyjdjs = ",";
		for(i=0; i<VXyjdj.length; i++){
			if(VXyjdj[i].checked == true){
				count++;
				VXyjdjs += VXyjdj[i].value+",";
			}
		}
		/*
		if(count==0 || VXyjdjs==","){
			errors += "【旋翼机级别等级】为必填项，请勾选！\r";
			count=0;
		}
		*/
		
		var VYszzdj = document.getElementsByName("VYszzdj");
		var VYszzdjs = ",";
		for(i=0; i<VYszzdj.length; i++){
			if(VYszzdj[i].checked == true){
				count++;
				VYszzdjs += VYszzdj[i].value+",";
			}
		}
		/*
		if(count==0 || VYszzdjs==","){
			errors += "【运输航空公司飞行教员执照等级】为必填项，请勾选！\r";
			count=0;
		}
		*/
		
		if(errors==""){
			$("#VCardidf").val(VCardid);
			$("#DEffectdatef").val(DEffectdate);
			$("#VIssuerf").val(VIssuer);
			$("#VCompanyf").val(VCompany);
			$("#DIssuetimef").val(DIssuetime);
			$("#DUpdatedatef").val(DUpdatedate);
			$("#VHgzf").val(VHgz);
			$("#IJiankongf").val(IJiankong);
			$("#VXingzhif").val(VXingzhi);
			//$("#VDengjif").val(VDengjis);
			$("#VJyzzlxf").val(VJyzzlxs);
			$("#VZzlxf").val(VZzlxs);
			$("#VYbdjf").val(VYbdjs);
			$("#VFjjbdjf").val(VFjjbdjs);
			$("#VHkqlbf").val(VHkqlbs);
			$("#VHkqdjf").val(VHkqdjs);
			$("#VXyjdjf").val(VXyjdjs);
			$("#VYszzdjf").val(VYszzdjs);
			
			$("#peopleForm").submit();
		}else{
			alert(errors);
			return;
		}
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

<div id="topPartD">
<div class="panelBox buttonBox">
<s:if test="showPeople == ''">
<button id="modalDialogButton3" class="green" primary="ui-icon-button-confirm">保存</button>
</s:if>
<button id="modalDialogButton4" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>

<input type="hidden" name="statusMsg" />

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
	<!--<div class="panelHead"><span>${aoru}</span></div>-->
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="normal">
				<td width="90" align="right">执照编号：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCardid" name="teacherZz.VCardid" value="${teacherZz.VCardid}" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="80" align="right">有效期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DEffectdate" name="teacherZz.DEffectdate" value='<s:date name="teacherZz.DEffectdate" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td width="80" align="right">局长授权签发：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VIssuer" name="teacherZz.VIssuer" value="${teacherZz.VIssuer}" maxlength="20" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">签发单位：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCompany" name="teacherZz.VCompany" value="${teacherZz.VCompany}" maxlength="100" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td align="right">签发日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DIssuetime" name="teacherZz.DIssuetime" value="<s:date name="teacherZz.DIssuetime" format="yyyy-MM-dd" />" class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td align="right">更新日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DUpdatedate" name="teacherZz.DUpdatedate" value="<s:date name="teacherZz.DUpdatedate" format="yyyy-MM-dd" />" class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">合格证：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="1"><span class="ui-icon ui-icon-bullet"></span>学员合格证</a></li>
							<li><a href="#N" val="2">教员合格证</a></li>
						</ul>
						<input type="hidden" id="IHgz" name="teacherZz.IHgz" value="${teacherZz.IHgz}" />
					</div>
				</td>
				<td align="right">是否监控：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="1"><span class="ui-icon ui-icon-bullet"></span>监控</a></li>
							<li><a href="#N" val="2">不监控</a></li>
						</ul>
						<input type="hidden" id="IJiankong" name="teacherZz.IJiankong" value="${teacherZz.IJiankong}" />
					</div>
				</td>
				<td align="right">执照性质：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="正式执照"><span class="ui-icon ui-icon-bullet"></span>正式执照</a></li>
							<li><a href="#N" val="临时执照">临时执照</a></li>
						</ul>
						<input type="hidden" id="VXingzhi" name="teacherZz.VXingzhi" value="${teacherZz.VXingzhi}" />
					</div>
				</td>
				</tr>
                <!--
				<tr class="normal">
				<td width="90" align="right">教员执照等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="jyzzDjList">
						<input type="checkbox" name="VDengji"  value="${VId}" <s:if test="teacherZz.VDengji!= null && (teacherZz.VDengji).contains(VId)">checked</s:if>/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>-->
				<tr class="normal">
				<td width="90" align="right">飞行执照类型：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="jyzzLxList">
							<input type="checkbox" name="VJyzzlx" <s:if test="teacherZz.VJyzzlx != null && (teacherZz.VJyzzlx).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">教员类型：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="zzLxList">
						<input type="checkbox" name="VZzlx" <s:if test="teacherZz.VZzlx != null && (teacherZz.VZzlx).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">仪表等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="ybDjList">
						<input type="checkbox" name="VYbdj" <s:if test="teacherZz.VYbdj != null && (teacherZz.VYbdj).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">飞机级别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="fjJbList">
						<input type="checkbox" name="VFjjbdj" <s:if test="teacherZz.VFjjbdj != null && (teacherZz.VFjjbdj).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">航空器类别：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="hkqLbList">
						<input type="checkbox" name="VHkqlb" <s:if test="teacherZz.VHkqlb != null && (teacherZz.VHkqlb).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">航空器型别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="hkqXbList">
						<input type="checkbox" name="VHkqdj" <s:if test="teacherZz.VHkqdj != null && (teacherZz.VHkqdj).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">旋翼机级别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="xyjJbList">
						<input type="checkbox" name="VXyjdj" <s:if test="teacherZz.VXyjdj != null && (teacherZz.VXyjdj).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">运输航空公司飞行教员执照等级：
				  			  </td>
				<td colspan="5"><div style="margin-top:5px;">
				  <s:iterator value="ysHkgsList">
				    <input type="checkbox" name="VYszzdj" <s:if test="teacherZz.VYszzdj != null && (teacherZz.VYszzdj).contains(VId)">checked</s:if> value="${VId}"/><b></b>${VName}　
				    </s:iterator>
				  </div>	</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

</div></div>



<form id="searchForm" action="searchZzListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
</form>

<form id="peopleForm" action="addOrUpZzTeacherAction.do" method="post">
<input type="hidden" name="teacherZz.teacherBaseInfo.VId" value="${id}" />
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" id="VCardidf" name="teacherZz.VCardid" />
<input type="hidden" id="DEffectdatef" name="teacherZz.DEffectdate" />
<input type="hidden" id="VIssuerf" name="teacherZz.VIssuer"/>
<input type="hidden" id="VCompanyf" name="teacherZz.VCompany" />
<input type="hidden" id="DIssuetimef" name="teacherZz.DIssuetime" />
<input type="hidden" id="DUpdatedatef" name="teacherZz.DUpdatedate" />
<input type="hidden" id="VHgzf" name="teacherZz.IHgz" />
<input type="hidden" id="IJiankongf" name="teacherZz.IJiankong" />
<input type="hidden" id="VXingzhif" name="teacherZz.VXingzhi" />
<input type="hidden" id="VDengjif" name="teacherZz.VDengji" />
<input type="hidden" id="VJyzzlxf" name="teacherZz.VJyzzlx" />
<input type="hidden" id="VZzlxf" name="teacherZz.VZzlx" />
<input type="hidden" id="VYbdjf" name="teacherZz.VYbdj" />
<input type="hidden" id="VFjjbdjf" name="teacherZz.VFjjbdj"/>
<input type="hidden" id="VHkqlbf" name="teacherZz.VHkqlb" />
<input type="hidden" id="VHkqdjf" name="teacherZz.VHkqdj" />
<input type="hidden" id="VXyjdjf" name="teacherZz.VXyjdj" />
<input type="hidden" id="VYszzdjf" name="teacherZz.VYszzdj" />
</form>
</body>
</html>
