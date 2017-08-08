<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>中国民航大学飞行训练电子记录系统</title>
<link rel="stylesheet" href="themes/cupertino/jquery.ui.all.css">
<script src="scripts/jquery.min.js"></script>
<script src="scripts/jquery.cookie.min.js"></script>
<script src="scripts/jquery-ui.min.js"></script>
<script src="scripts/ui/jquery.ui.position.min.js"></script>
<script src="scripts/ui/jquery.ui.core.min.js"></script>
<script src="scripts/ui/jquery.ui.widget.min.js"></script>
<script src="scripts/ui/jquery.ui.button.min.js"></script>
<script src="scripts/ui/jquery.ui.tabs.min.js"></script>
<script src="scripts/ui/jquery.ui.dialog.min.js"></script>
<script src="scripts/ui/jquery.ui.menu.min.js"></script>
<script src="scripts/function.min.js"></script>
<style>
#indexHead div,li,span,a { font-size:14px; line-height: 18px; }
#indexHead { height:90px; background-image:url(themes/cupertino/images/top0.gif); min-width: 1275px; }
#indexFrame { border: 0; position: fixed; bottom: 0; z-index: 2; }

.ui-widget-header { filter: progid: DXImageTransform.Microsoft.Gradient(false); }
.ui-tabs, .ui-tabs .ui-tabs-panel, .ui-tabs .ui-tabs-nav { border: 0; padding: 0; background-color: transparent; background-image: none;  }

.ui-tabs .ui-tabs-nav li { margin: 0; padding: 0; border-top: solid 0px #F8FAFC; border-right: solid 1px #CDDBE3; border-bottom: solid 2px transparent; border-left: solid 0px #F8FAFC; /*background: #D1E3F0 url(themes/cupertino/images/ui-bg_new_nav.png);*/ background-image: -moz-linear-gradient(top, #D2E4F1, #E4EFF7); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #D2E4F1), color-stop(1, #E4EFF7)); background-image: -ms-linear-gradient(top, #D2E4F1, #E4EFF7); background-image: linear-gradient(to bottom, #D2E4F1, #E4EFF7); filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#D2E4F1', endColorstr='#E4EFF7', GradientType='0'); }
.ui-tabs .ui-tabs-nav li:hover { /*background-image:none;*/ background-image: -moz-linear-gradient(top, #E8F1F8, #E7F1F9); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E8F1F8), color-stop(1, #E7F1F9)); background-image: -ms-linear-gradient(top, #E8F1F8, #E7F1F9); background-image: linear-gradient(to bottom, #E8F1F8, #E7F1F9); filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#E8F1F8', endColorstr='#E7F1F9', GradientType='0'); }
.ui-tabs .ui-tabs-nav li:active { /*background: #D1E3F0 url(themes/cupertino/images/ui-bg_new_nav.png);*/ background-image: -moz-linear-gradient(top, #D2E4F1, #E4EFF7); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #D2E4F1), color-stop(1, #E4EFF7)); background-image: -ms-linear-gradient(top, #D2E4F1, #E4EFF7); background-image: linear-gradient(to bottom, #D2E4F1, #E4EFF7); filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#D2E4F1', endColorstr='#E4EFF7', GradientType='0'); }
.ui-tabs .ui-tabs-nav li.ui-tabs-active { /*background: #1D6BA3 url(themes/cupertino/images/ui-bg_new_nav_active.png)*/;  background-image: -moz-linear-gradient(top, #216EA6, #17659C); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #216EA6), color-stop(1, #17659C)); background-image: -ms-linear-gradient(top, #216EA6, #17659C); background-image: linear-gradient(to bottom, #216EA6, #17659C); filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#216EA6', endColorstr='#17659C', GradientType='0'); }

#tabs span.ui-icon-close,span.ui-icon-circle-close { float: left; cursor: pointer; margin: 0.5em 0.2em 0 0; }
#tabs span.ui-icon-carat-1-s { float: left; margin: 0; padding: 0; }
#add_tab { cursor: pointer; }
#tabs > ul > li > a { outline: none; font-weight: normal; color: #333333; padding: 6px 10px 6px 10px; }
#tabs > ul > li.ui-tabs-active > a { font-weight: bold; color: #FFFFFF; padding: 6px 10px 6px 10px; }

#navMenu { position:relative; z-index:100; top: 2px; width: 180px; display: none; }
#navMenu a { line-height: 1.8em; }
#navMenu span.ui-icon-circle-close, #navMenu span.ui-icon-bullet { float: left; cursor: pointer; margin: .25em 0 0 .25em; }

</style>
<script>

$(function() {
	$( "#checkContent" ).dialog({
		autoOpen: false,
		height: 480,
		width: 800,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#dialogForm3" ).dialog({//警告信息窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#updatePswDiaLog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var prePsw=$("#prePsw").val();
 				if(prePsw==null||prePsw==""){
 					alert("原密码不能为空。");
					return;
				}
				
				var newPsw = $("#psw").val();
				if(newPsw.length<6||newPsw.length>16){
					alert("新密码长度应在[6-16]");	
					return false;
				}
				var repeatPsw=$("#repeatPsw").val();
				if(repeatPsw==null||repeatPsw==""){
					alert("重复密码不能为空。");
					return false; 			
				}
				if(newPsw!=repeatPsw){
					alert("两次密码输入不一致，请重新输入。");
					return false;  		
				}

				params=$("#updatePswForm").serialize();
				$.ajax({
					type:"post",
					url:"changePassword.do",
					data:params,
					dataType:"json",
					success:function(data){
						if(data.flag==false){
							alert(data.message);
							return;
						}
						alert(data.message);
						$( "#updatePswDiaLog" ).dialog( "close" );
					},
					error:function(){
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});	
				
			},
			"取 消": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
});
function viewInfo(opt,num){
	if(num==0){
		return;	
	}
	var userType = "";
	var type = "";
	if(opt==1){
		type="警告";
	}else if(opt==2){
		type="预警";
	}else{
		type="提示";
	}params = {"aoru":opt};
	$.ajax({
		type:"post",
		url:"showUserWarningInfoById.do",
		data:params,
		dataType:"json",
		success:function(data){

			if(data==null){
				return;	
			}
			var vday = "";
			var img = "";
			var col = "";
			var tjcontent = "";
			var tjflag = 0;
			var zzflag = 0;
			var jcflag = 0;
			tjcontent+="<table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
			tjcontent+="<tr>";
			tjcontent+="<td colspan=\"2\" height=\"10\"></td>";
			tjcontent+="</tr>";
			tjcontent+="<tr>";
			tjcontent+="<td width=\"18%\" align=\"center\" valign=\"top\" style=\"font-weight:bold;color:#0066CC\">体检合格证</td>";
			tjcontent+="<td width=\"82%\" height=\"50\" valign=\"top\"><table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"3\">";
			tjcontent+="<thead>";
			tjcontent+="<tr>";
			tjcontent+="<th width=\"90\" align=\"left\" bgcolor=\"#F6F6F6\">发证日期</th>";
			tjcontent+="<th width=\"90\" align=\"left\" bgcolor=\"#F6F6F6\">到期日期</th>";
			tjcontent+="<th width=\"110\" align=\"left\" bgcolor=\"#F6F6F6\">剩余有效期(天)</th>";
			tjcontent+="<th align=\"left\" bgcolor=\"#F6F6F6\">结论日期</th>";
			tjcontent+="</tr>";
			tjcontent+="</thead>";
			tjcontent+="<tbody>";
			var zzcontent = "";
			zzcontent+="<table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
			zzcontent+="<tr>";
			zzcontent+="<td colspan=\"2\" height=\"10\"></td>";
			zzcontent+="</tr>";
			zzcontent+="<tr>";
			zzcontent+="<td width=\"18%\" align=\"center\" valign=\"top\" style=\"font-weight:bold;color:#0066CC\">执照</td>";
			zzcontent+="<td width=\"82%\" height=\"50\" valign=\"top\"><table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"3\">";
			zzcontent+="<thead>";
			zzcontent+="<tr>";
			zzcontent+="<th  width=\"90\" align=\"left\" bgcolor=\"#F6F6F6\">签发日期</th>";
			zzcontent+="<th width=\"90\" align=\"left\" bgcolor=\"#F6F6F6\">到期日期</th>";
			zzcontent+="<th  width=\"110\" align=\"left\" bgcolor=\"#F6F6F6\">剩余有效期(天)</th>";
			zzcontent+="<th align=\"left\" bgcolor=\"#F6F6F6\">执照号</th>";
			zzcontent+="</tr>";
			zzcontent+="</thead>";
			zzcontent+="<tbody>";
			var jccontent = "";
			jccontent+="<table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
			jccontent+="<tr>";
			jccontent+="<td colspan=\"2\" height=\"10\"></td>";
			jccontent+="</tr>";
			jccontent+="<tr>";
			jccontent+="<td width=\"18%\" align=\"center\" valign=\"top\" style=\"font-weight:bold;color:#0066CC\">熟练检查</td>";
			jccontent+="<td width=\"82%\" height=\"50\" valign=\"top\">";
			jccontent+="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\">";
			jccontent+="<thead>";
			jccontent+="<tr>";
			jccontent+="<th width=\"90\" align=\"left\" bgcolor=\"#F6F6F6\">检查日期</th>";
			jccontent+="<th width=\"90\" align=\"left\" bgcolor=\"#F6F6F6\">到期日期</th>";
			jccontent+="<th width=\"110\" align=\"left\" bgcolor=\"#F6F6F6\">剩余有效期(天)</th>";
			jccontent+="<th width=\"110\" align=\"left\" bgcolor=\"#F6F6F6\">检查类型</th>";
			jccontent+="<th width=\"100\" align=\"left\" bgcolor=\"#F6F6F6\">航空器编号</th>";
			jccontent+="<th align=\"left\" bgcolor=\"#F6F6F6\">检查教员</th>";
			jccontent+="</tr>";
			jccontent+="</thead>";
			jccontent+="<tbody>";
			var userType="";
			var userName = "";
			var tjcontent0="";
			var zzcontent0= "";
			var jccontent0="";
			for(i=0;i<data.length;i++){
				userName = data[i].VName;
				if(data[i].userType==2){
					userType = "教员";
				}else{
					userType = "学员";
				}
				if(data[i].iday<=31){
					col = "#FF0000";
					img = " <img src=\"themes/cupertino/images/top1.gif\"  align=\"absmiddle\"/>";
				}else if(31<data[i].iday && data[i].iday<=61){
					img = " <img src=\"themes/cupertino/images/top2.gif\"  align=\"absmiddle\"/>";
					col = "#EBA600";
				}else if(61<data[i].iday && data[i].iday<=90){
					img = " <img src=\"themes/cupertino/images/top3.gif\"  align=\"absmiddle\"/>";
					col = "#00A2BE";
				}else{
					img = "";
					col = "#000000";
				}
				vday = data[i].iday + img;
				if(data[i].warningType==1){

					tjcontent0+="<tr><td>"+
					data[i].DIssueTime+"</td><td>"+
					data[i].DUsedTime+"</td><td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="+col+">"+
					vday+"</font></td><td>"+data[i].DResultdate+"</td></tr>";

					
				}
				if(data[i].warningType==2){

					zzcontent0+="<tr>"+
					"<td>"+data[i].DIssueTime+"</td>"+
					"<td>"+data[i].DUsedTime+"</td>"+
					"<td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="+col+">"+vday+"</font></td>"+
					"<td>"+data[i].checkType+"</td>"+
					"</tr>";
				
				}
				if(data[i].warningType==3){

					jccontent0+="<tr>"+
					"<td>"+data[i].DIssueTime+"</td>"+
					"<td>"+data[i].DUsedTime+"</td>"+
					"<td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="+col+">"+vday+"</font></td>"+
					"<td>"+data[i].checkType+"</td>"+
					"<td>"+data[i].planeCode+"</td>"+
					"<td>"+data[i].checkTeacher+"</td>"+
					"</tr>";
				
				}
			}
			if(tjcontent0!=""){
				tjcontent+=tjcontent0;
				tjcontent+="</tbody>";
				tjcontent+="</table></td>";
				tjcontent+="</tr>";
				tjcontent+="<tr>";
				tjcontent+="<td height=\"25\" colspan=\"2\"><span class=\"panelLine\"></span></td>";
				tjcontent+="</tr>";
				tjcontent+="</table>";
			}else{
				tjcontent = "";
			}
			
			if(zzcontent0!=""){
				zzcontent+=zzcontent0;
				zzcontent+="</tbody>";
				zzcontent+="</table></td>";
				zzcontent+="</tr>";
				zzcontent+="<tr>";
				zzcontent+="<td height=\"25\" colspan=\"2\"><span class=\"panelLine\"></span></td>";
				zzcontent+="</tr>";
				zzcontent+="</table>";
			}else{
				zzcontent = "";
			}
			if(jccontent0!=""){
				jccontent+=jccontent0;
				jccontent+="</tbody>";
				jccontent+="</table>";
				jccontent+="</td>";
				jccontent+="</tr>";
				jccontent+="<tr>";
				jccontent+="<td height=\"25\" colspan=\"2\"><span class=\"panelLine\"></span></td>";
				jccontent+="</tr>";
				jccontent+="</table>";
			}else{
				jccontent= "";
			}
			$("#tijian").html(tjcontent);
			$("#zhizhao").html(zzcontent);
			$("#jiancha").html(jccontent);
			
			$("#checkContent").dialog('option', 'title',   userType + "："+userName + " " + type + "信息如下：");
			$("#checkContent" ).dialog("open" );
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
	
}
function changePsw(){
	$("#prePsw").val("");
	$("#psw").val("");
	$("#repeatPsw").val("");
	$("#updatePswDiaLog" ).dialog("open" );
}
</script>
<script src="scripts/index.min.js"></script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="indexHead">
  <div style="height:52px; background-position:right; background-repeat:no-repeat; background-image:url(themes/cupertino/images/top2.jpg)">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" height="52" style="line-height:24px;">
      <tr>
        <td><span style="font-size:18px; font-weight:bold;padding-left:10px; color: #FFFFFF">中国民航大学飞行训练电子记录系统</span></td>
        <td width="25" valign="top" >告警</td>
        <td width="20" valign="top" ><a href="javascript:void(0)"  title="警告信息" onClick='viewInfo(1,<s:property value="%{#session.loginContext.warn.high}"/>)'><img src="themes/cupertino/images/top11.gif" border="0"/></a></td>
        <td width="15"  valign="top" ><s:property value="%{#session.loginContext.warn.high}"/></td>
        <td width="20"  valign="top" ><a href="javascript:void(0)" title="预警信息" onClick='viewInfo(2,<s:property value="%{#session.loginContext.warn.middle}"/>)'><img src="themes/cupertino/images/top22.gif" border="0" /></a></td>
        <td width="15"  valign="top" ><s:property value="%{#session.loginContext.warn.middle}"/></td>
        <td width="20"  valign="top" ><a href="javascript:void(0)" title="提示信息" onClick='viewInfo(3,<s:property value="%{#session.loginContext.warn.low}"/>)'><img src="themes/cupertino/images/top33.gif" border="0"/></a></td>
        <td width="15" valign="top" ><s:property value="%{#session.loginContext.warn.low}"/></td>
        <td width="215" valign="top"><span style="color:#1F6CA4;font-size:12px; ">用户 <s:property value="%{#session.loginContext.userName}"/> | <a href="javascript:void(0)" onClick="changePsw()" class="blue" style="font-size:12px;">修改密码</a>|<a href="../logout.do" class="blue" style="font-size:12px;">退出</a></span></td>
      </tr>
    </table>
  </div>
<div id="tabs" style="background-position:right; background-repeat:no-repeat; background-image:url(themes/cupertino/images/top_bottom.jpg)">
<ul>
<li style="border-top-left-radius: 3px; margin-left: 10px;"><a class="tabLink" href="#tabDiv0" url="open_toDoingListPage.do" target="indexFrame">首页</a></li>
<li><a class="tabLink" href="#tabDiv1" url="open_createFlightTrainingRecordPage.do" target="indexFrame">飞行训练管理</a></li>
<li><a class="tabLink" href="#tabDiv2" url="open_maintenanceRelease.do" target="indexFrame">航空器管理</a></li>
<li><a class="tabLink" href="#tabDiv3" url="open_outLineList.do" target="indexFrame">飞行训练大纲管理</a></li>
<li><a class="tabLink" href="#tabDiv4" url="open_studentBaseInfoList.do" target="indexFrame">学员管理</a></li>
<li><a class="tabLink" href="#tabDiv5" url="open_classInfoList.do" target="indexFrame">证照理论考试管理</a></li>
<li><a class="tabLink" href="#tabDiv6" url="searchListTeacherAction.do" target="indexFrame">教员管理</a></li>
<li><a class="tabLink" href="#tabDiv7" url="searchAllStatusUserInfos.do" target="indexFrame">系统管理</a></li>
<li style="border-top-right-radius: 3px;"><a class="tabLink" href="#tabDiv8" url="open_statisticalReport.do" target="indexFrame">统计报表</a></li>
<!--<li id="dropDownLi" style="border-top-right-radius: 3px;"><a href="#N"><span class="ui-icon ui-icon-carat-1-s" role="presentation">More</span></a></li>-->
    </ul>
    <div class="tabDiv" id="tabDiv0"></div>
    <div class="tabDiv" id="tabDiv1"></div>
    <div class="tabDiv" id="tabDiv2"></div>
    <div class="tabDiv" id="tabDiv3"></div>
    <div class="tabDiv" id="tabDiv4"></div>
    <div class="tabDiv" id="tabDiv5"></div>
    <div class="tabDiv" id="tabDiv6"></div>
    <div class="tabDiv" id="tabDiv7"></div>
    <div class="tabDiv" id="tabDiv8"></div>
  </div>
  <!--
  <ul id="navMenu">
    <li><a class="closeAllLink" href="#"><span class="ui-icon ui-icon-circle-close"></span>关闭全部</a></li>
    <li class="ui-menu-divider"></li>
    <li><a class="menuNavLink" href="#N" id="menuNavLink0"><span class="ui-icon ui-icon-bullet"></span>我的首页</a></li>
    <li><a class="menuNavLink" href="#N" id="menuNavLink1">人员管理</a></li>
    <li><a class="menuNavLink" href="#N" id="menuNavLink2">飞行训练管理</a></li>
    <li><a class="menuNavLink" href="#N" id="menuNavLink3">航空器管理</a></li>
    <li><a class="menuNavLink" href="#N" id="menuNavLink4">飞行训练大纲管理</a></li>
    <li><a class="menuNavLink" href="#N" id="menuNavLink5">系统管理</a></li>
    <li><a class="menuNavLink" href="#N" id="menuNavLink6">成绩管理</a></li>
    <li id="menuDevider2" class="ui-menu-divider"></li>
  </ul>-->
</div>

<iframe id="indexFrame" name="indexFrame" width="100%" height="100%" frameborder="0" src="open_toDoingListPage.do"></iframe>

<!--遮羞蒙版-->
<div id="overlayMask" style="display:none;"></div>

<div id="checkContent">
<span id="tijian"></span>
<span id="zhizhao"></span>
<span id="jiancha"></span>
</div>
<div id="updatePswDiaLog" title="修改密码">
<form id="updatePswForm">
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="26%" height="40" align="right">原密码：</td>
    <td width="74%"><input id="prePsw" name="prePsw"  type="password"  class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="40" align="right">新密码：</td>
    <td><input id="psw" name="newPsw" type="password"  class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="40" align="right">重新输入新密码：</td>
    <td><input id="repeatPsw" name="reNewPsw" type="password"  class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
</table>
</form>
</div>
<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>
</body>
</html>
