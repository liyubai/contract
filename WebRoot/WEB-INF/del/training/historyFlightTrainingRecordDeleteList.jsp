<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>历史记录管理</title>
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
.cscore{font-weight: bold; color:#FF0000;}
</style>
<script>
$(function() {
	$("div.dropDownList").find("button").css("width","80px").end().each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,400);d.button.css("width", "100%");}
		else {new $.dropDownList(i,true,80);}
	})
	$("#modalDialogButton4").click(function(){//未确认
		$("#statusid").val($("#cstatus").val());
		$("#name").val($.trim($("#cName").val()));
		$("#code").val($.trim($("#cVCode").val()));
		$("#flyMoment").val($.trim($("#DFlymoment").val()));
		$("#endMoment").val($.trim($("#DEndmoment").val()));
		$("#planeid").val($.trim($("#cplaneid").val()));
		$( "#searchForm" ).submit();
	});
	$("#deleteButton").click(function(){
		var id = getSelRadioValue('record');
		if(id==""){
			alert("请选择要删除的记录。");
			return;
		}
		var isOpen = $("#isOpen").val();
		var iid = id.split(",")[0];
		var status = id.split(",")[1];
		
		if(isOpen==0 && (status==1 || status==3 || status==4)){
			alert("历史记录录入已关闭，审核通过的记录不能删除。");
			return;
		}
		$("#id").val(iid);
		$("#statusid2").val($("#cstatus").val());
		$("#name2").val($.trim($("#cName").val()));
		$("#code2").val($.trim($("#cVCode").val()));
		$("#flyMoment2").val($.trim($("#DFlymoment").val()));
		$("#endMoment2").val($.trim($("#DEndmoment").val()));
		$("#dialogForm2").dialog( "open" );
	});
	$( "#dialogForm2" ).dialog({//删除内容窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$( this ).dialog( "close" );
				$( "#execDeleteForm" ).dialog("open");
				$("#deleteForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#execDeleteForm" ).dialog({//删除等待窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		
	});
	$( "#dialogForm3" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#contentDialogForm" ).dialog({
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("A.blue").click(function(){
		if(this.id==""){
			return;
		}
		params = {"id":this.id};
		$.ajax({
			async:false,//同步请求，默认异步
			type:"post",
			url:"showStudentCommentByTrainingId.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data!=null){
					var content = "";
					content+="<table width=\"100%\" style=\"line-height:24px;\" border=\"0\" bordercolor=\"#E0E0E0\" cellspacing=\"0\" cellpadding=\"0\" >";
					content+="<tr>";
					content+="<th colspan=\"2\" align=\"left\" bgcolor=\"#E5E5E5\">飞行教员评语</th>";
					content+="</tr>";
					content+="<tr>";
					content+="<td width=\"200\">学员飞行前准备情况：</td>";
					content+="<td>"+data.message+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td>技术和程序：</td>";
					content+="<td>"+data.VJishu+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td>训练情况总结：</td>";
					content+="<td>"+data.VZongjie+"</td>";
					content+="</tr>";
					if(data.IStatus!=0){
						content+="<tr>";
						content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
						content+="</tr>";
						content+="<tr>";
						content+="<td>检查结果：</td>";
						content+="<td>"+data.IPass+"</td>";
						content+="</tr>";
						
						content+="<tr>";
						content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
						content+="</tr>";
						content+="<tr>";
						content+="<td>检查评语：</td>";
						content+="<td>"+data.VCheckcomment+"</td>";
						content+="</tr>";
					}
					
					content+="<tr>";
					content+="<th align=\"left\" bgcolor=\"#E5E5E5\">总体评价</th>";
					content+="<th align=\"left\" bgcolor=\"#E5E5E5\">成绩</th>";
					content+="</tr>";
					content+="<tr>";
					content+="<td>飞行前准备情况：</td>";
					content+="<td>"+data.IZpzb+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td>技术掌握情况：</td>";
					content+="<td>"+data.IZpjs+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td>飞行总体评价：</td>";
					content+="<td>"+data.IZp+"</td>";
					content+="</tr>";
					content+="</table>";
					$("#pingyu").html(content);
				}
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		
		$.ajax({
			//async:false,//同步请求，默认异步
			type:"post",
			url:"showStudentSubjectScoreByTrainingId.do",
			data:params,
			dataType:"json",
			success:function(data){
				var content = "";
				var flag = 0;
				content+="<table width=\"100%\" style=\"line-height:24px;\" border=\"0\" bordercolor=\"#E0E0E0\" cellspacing=\"0\" cellpadding=\"0\" >";
				content+="<tr>";
				content+="<th width=\"200\" align=\"left\" bgcolor=\"#E5E5E5\">训练项目</th>";
				content+="<th width=\"100\" align=\"left\" bgcolor=\"#E5E5E5\">成绩</th>";
				content+="<th width=\"100\" align=\"left\" bgcolor=\"#E5E5E5\">标准分</th>";
				content+="<th align=\"left\" bgcolor=\"#E5E5E5\">所属分类</th>";
				content+="</tr>";
				var bz=0;
				for(i=0;i<data.length;i++){
					if(data[i].oldScore==100){
						bz=0;
					}else{
						bz=data[i].oldScore;
					}
					content+="<tr>";
					content+="<td align=\"left\">"+data[i].VName+"</td>";
					if(data[i].DScore<bz){
						content+="<td align=\"left\" class=\"cscore\">"+data[i].DScore+"</td>";
					}
					else{
						content+="<td align=\"left\">"+data[i].DScore+"</td>";
					}
					content+="<td>"+bz+"</td>";
					content+="<td>"+data[i].typeName+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"4\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
					content+="</tr>";
					flag++;
				}
				content+="</table>";
				if(flag>0){
					$("#subjectScore").html(content);
				}else{
					$("#subjectScore").html("");
				}
				$( "#contentDialogForm" ).dialog("open");
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		
	});
});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149b5bb20001</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="panelBox buttonBox" >
<table border="0" cellspacing="0" cellpadding="3" >
  <tr>
    <td style=" padding-top:8px;">
	<%request.setAttribute("k",ActionContext.getContext().getName());%>
<s:if test="#session.loginContext.urlAddress=='all'">
	<s:set name="r" value="0"/>
</s:if>
<s:else>
	<s:set name="pos" value="#session.loginContext.urlAddress.indexOf(#request.k+'.do')"/>
	<s:if test='#pos==-1'>
		<s:set name="r" value="1"/>
    </s:if>
    <s:else>
		<s:set name="r" value="#session.loginContext.urlAddress.substring(#pos+#request.k.length()+6,#pos+#request.k.length()+7)"/>
    </s:else>
</s:else>
<s:if test="#r==null || #r==0"><button class="green"  id="deleteButton">删除</button> 姓名：<input type="text"  value="${name}"  id="cName" class="text ui-widget-content ui-corner-all" style="width:60px;" /></s:if>
     学号：<input type="text"  value="${code}"  id="cVCode" class="text ui-widget-content ui-corner-all" style="width:80px;" />
    日期从：<input type="text"  id="DFlymoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DFlymoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
    到 <input type="text"  id="DEndmoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DEndmoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
    </td>
    <td><div class="dropDownList">
<button>航空器</button>
<ul>
<li><a href="#N" class="inline" style="width: 60px;" val=""><span class="ui-icon ui-icon-bullet"></span>航空器</a>
<s:iterator value="planeinfoList"><a href="#N"  val="${VId}" class="inline"  style="width: 60px;">${VPlanecode}</a>
</s:iterator>
<a href="#N" class="inline" style="width: 60px;" val="0">无</a>
</li> 
</ul><input type="hidden"  id="cplaneid" value="${planeid}"/>
</div><div class="dropDownList">
						<button>状态</button>
						<ul>
                    		<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>状态</a></li>
							<li><a href="#N" val="1">未确认</a></li>
							<li><a href="#N" val="2">打回</a></li>
                            <li><a href="#N" val="0">待审核</a></li>
                             <li><a href="#N" val="4">申诉</a></li>
                             <li><a href="#N" val="3">已确认</a></li>
						</ul>
				  <input type="hidden" id="cstatus" value="${status}" />
				</div>&nbsp;&nbsp;<button class="normal" id="modalDialogButton4">查询</button></td>
  </tr>
</table>
</div>

 <div style="margin-top:30px; margin-left:10px;">
  <table id="usersTable" class="fcolorTable" style="width:1680px;" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2" >

  <thead>
    <tr>
      <th width="30" rowspan="2"></th>
      <th width="55" rowspan="2">姓名</th>
      <th width="80" rowspan="2">学号</th>
      <th width="90" rowspan="2">日期</th>
      <th width="50" rowspan="2">航空器<br>
        登记号</th>
      <th colspan="4">起飞\降落站</th>
      <th width="50" rowspan="2">飞行<br>
        科目</th>
      <th colspan="2">起落次数</th>
      <th rowspan="2" width="50">驾驶员<br>
        飞行时间</th>
      <th colspan="4">机长或单飞时间</th>
      <th colspan="4">副驾驶或带飞时间</th>
      <th colspan="2">仪表飞行时间</th>
      <th colspan="3">模拟机\训练器</th>
      <th width="50" rowspan="2">状态</th>
      <th width="55" rowspan="2">教员<br>
        评定</th>
      <th width="65" rowspan="2">飞行种类</th>
      <th width="50" rowspan="2">教员</th>
      <th width="55" rowspan="2">监视<br>
        教员</th>
      <th width="55" rowspan="2">压座<br>
        学员</th>
    </tr>
    <tr>
      <th width="40">起飞站</th>
      <th width="40">降落站</th>
      <th width="35">出发时刻</th>
      <th width="35">到达时刻</th>
      <th width="30">昼间</th>
      <th width="30">夜间</th>
      <th width="30">机长</th>
      <th width="30">单飞</th>
      <th width="30">转场</th>
      <th width="30">夜间</th>
      <th width="40">副驾驶</th>
      <th width="30">带飞</th>
      <th width="30">转场</th>
      <th width="30">夜间</th>
      <th width="50">模拟<br>
        仪表</th>
      <th width="50">真实<br>
        仪表</th>
      <th width="50">训练地点</th>
      <th width="50">模拟机<br>
        时间</th>
      <th width="50">训练器<br>
        时间</th>
      </tr>
  </thead>
  <tbody>
   <s:iterator value="page.data" status="stat">
    <tr>
  
      <td align="center"><input name="record" type="radio" value="${VId},${IAuditstatus}"><b></b></td>
      <td align="center">${studentName}</td>
      <td align="center">
      <s:if test='IAuditstatus>0'><a href="javascript:void(0)" class="blue" id="${VId}" title="点击查看教员评定">${studentVCode}</a></s:if>
      <s:else>${studentVCode}</s:else>
      </td>
      <td align="center">${DFlydate}</td>
      <td align="center">${planeCode}</td>
      <td align="center">${VFpos}</td>
      <td align="center">${VLpos}</td>
      <td align="center">${DFlymoment}</td>
      <td align="center">${DEndmoment}</td>
      <td align="center">${VNo}</td>
      <td align="center">${ILanddaytimes}</td>
      <td align="center">${ILangnighttimes}</td>
      <td align="right">${DTrantime}</td>
      <td align="center">${DJizhangtime}</td>
      <td align="center">${DDanfeitime}</td>
      <td align="center">${DZhuanchangtime}</td>
      <td align="center">${DYejiantime}</td>
      <td align="center">${DFujiashitime}</td>
      <td align="center">${DDaifeitime}</td>
      <td align="center">${DFjszhuanchangtime}</td>
      <td align="center">${DFjszcyjtime}</td>
      <td align="center">${DMoniyibiaotime}</td>
      <td align="center">${DZhenshiyibiao}</td>
      <td align="center">${VTranpos}</td>
      <td align="center">${DMnjsj}</td>
      <td align="center">${DXlqsj}</td>
      <td align="center"><s:if test='IAuditstatus==0'>待审核</s:if>
      <s:elseif test='IAuditstatus==1'>未确认</s:elseif>
      <s:elseif test='IAuditstatus==2'>打回</s:elseif>
      <s:elseif test='IAuditstatus==3'>已确认</s:elseif>
      <s:else>申诉</s:else></td>
      <td align="center"><s:if test='IAuditstatus>0'><a href="javascript:void(0)" class="blue" id="${VId}">查看</a></s:if></td>
      <td align="center">${VFlytype}</td>
      <td align="center">${teacherName}</td>
      <td align="center">${monitorteacherName}</td>
      <td align="center">${VSecondstudent}</td>
    </tr>
    </s:iterator>
      <tr>
  
      <td colspan="10" align="right">本页总计：</td>
      <td align="center"><s:property value='page.totalNum.day'/></td>
      <td align="center"><s:property value='page.totalNum.night'/></td>
      <td align="right"><s:property value='page.totalNum.trainingTime'/></td>
      <td align="center"><s:property value='page.totalNum.jizhang'/></td>
      <td align="center"><s:property value='page.totalNum.danfei'/></td>
      <td align="center"><s:property value='page.totalNum.zhuanchang'/></td>
      <td align="center"><s:property value='page.totalNum.yejian'/></td>
      <td align="center"><s:property value='page.totalNum.fjs'/></td>
      <td align="center"><s:property value='page.totalNum.daifei'/></td>
      <td align="center"><s:property value='page.totalNum.daifeizc'/></td>
      <td align="center"><s:property value='page.totalNum.daifeiyj'/></td>
      <td align="center"><s:property value='page.totalNum.mnyb'/></td>
      <td align="center"><s:property value='page.totalNum.zsyb'/></td>
      <td align="center"></td>
      <td align="center"><s:property value='page.totalNum.mnj'/></td>
      <td align="center"><s:property value='page.totalNum.xlq'/></td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
    </tr>
    <tr>
      <td colspan="10" align="right">累计：</td>
      <td align="center">${totalSummary.day}</td>
      <td align="center">${totalSummary.night}</td>
      <td align="right">${totalSummary.trainingTime}</td>
      <td align="center">${totalSummary.jizhang}</td>
      <td align="center">${totalSummary.danfei}</td>
      <td align="center">${totalSummary.zhuanchang}</td>
      <td align="center">${totalSummary.yejian}</td>
      <td align="center">${totalSummary.fjs}</td>
      <td align="center">${totalSummary.daifei}</td>
      <td align="center">${totalSummary.daifeizc}</td>
      <td align="center">${totalSummary.daifeiyj}</td>
      <td align="center">${totalSummary.mnyb}</td>
      <td align="center">${totalSummary.zsyb}</td>
      <td align="center"></td>
      <td align="center">${totalSummary.mnj}</td>
      <td align="center">${totalSummary.xlq}</td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center"></td>
    </tr>
  </tbody>
</table>
<s:include value="../common/pagination_system_post.jsp" />
</div>
</div>

<div id="contentDialogForm" title="教员评定">
<span id="pingyu"></span>
<span id="subjectScore"></span>
</div>

<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>
<div id="dialogForm2">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle">
<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确认删除选中的飞行记录吗？</span></td>
</tr>
</table>
</div>
<div id="execDeleteForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">记录删除中请等待......</span></td>
</tr>
</table>
</div>
<form  action="open_historyFlightTrainingRecordDeleteList.do" method="post" id="searchForm">
<input type="hidden" name="flyMoment" id="flyMoment" value="${flyMoment}">
<input type="hidden" name="endMoment" id="endMoment" value="${endMoment}">
<input type="hidden" name="name" id="name" value="${name}">
<input type="hidden" name="code" id="code" value="${code}">
<input type="hidden" name="status" id="statusid" value="${status}">
<input type="hidden" name="pageIndex" id="pageIndexid">
<input type="hidden" name="planeid" id="planeid" value="${planeid}">
</form>
<form  action="deleteHistoryFlightTrainingRecord.do" method="post" id="deleteForm">
<input type="hidden" name="id" id="id">
<input type="hidden" name="flyMoment" id="flyMoment2">
<input type="hidden" name="endMoment" id="endMoment2">
<input type="hidden" name="name" id="name2">
<input type="hidden" name="code" id="code2">
<input type="hidden" name="status" id="statusid2">

</form>
<input type="hidden" id="isOpen" value="${isOpen}">
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>