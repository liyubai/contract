<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>处理待办事项</title>

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
<style>
.cscore{font-weight: bold; color:#FF0000;}
</style>
<script>
$(function() {

	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});

	$("#querenone").click(function(){//确认评语
		$("#auditForm").submit();
	});

	$("#shensuone").click(function(){//申诉
		$("#VReason").val("");
		$( "#shensuForm" ).dialog( "open" );
	});

	$( "#shensuForm" ).dialog({
		autoOpen: false,
		height: 260,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				if($.trim($("#VReason").val())==""){
					alert("申诉理由不能为空。");
					$("#VReason").focus();
					return false;
				}
				$("#dialogForm3Warning").html("确认申诉吗？");
				$( "#deleteDialogForm" ).dialog( "open" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#deleteDialogForm" ).dialog({//提交提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#checkForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#backResultDialogForm" ).dialog({//操作数据库返回提示窗口
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
	vpingyu();
});
function vpingyu(){
		var id = $("#recordid").val();
		if(id==""){
			return;
		}
		params = {"id":id};
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
					content+="<td width=\"240\">学员飞行前准备情况：</td>";
					content+="<td>"+data.message.replace(/\n/g,"<br/>")+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td>技术和程序：</td>";
					content+="<td>"+data.VJishu.replace(/\n/g,"<br/>")+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"2\" bgcolor=\"#E5E5E5\" height=\"1\"></td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td>训练情况总结：</td>";
					content+="<td>"+data.VZongjie.replace(/\n/g,"<br/>")+"</td>";
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
				content+="<th width=\"240\" align=\"left\" bgcolor=\"#E5E5E5\">训练项目</th>";
				content+="<th width=\"60\" align=\"left\" bgcolor=\"#E5E5E5\">成绩</th>";
				content+="<th width=\"60\" align=\"left\" bgcolor=\"#E5E5E5\">标准分</th>";
				content+="<th align=\"left\" bgcolor=\"#E5E5E5\">所属分类</th>";
				content+="</tr>";
				var bz = 0;
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
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div style="padding-top:8px; padding-left:6px; padding-right:6px;">


<div class="panelContent" style="width:1300px;">
<div class="panelHead" style="width:1300px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="81%" height="35" style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">学号：</font>${flightTrainingrecordDetail.studentVCode}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">姓名：</font>${flightTrainingrecordDetail.studentName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">飞行种类：</font>${flightTrainingrecordDetail.VFlytype}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">教员：</font>${flightTrainingrecordDetail.teacherName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">监视教员：</font>${flightTrainingrecordDetail.monitorteacherName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">压座学员：</font>${flightTrainingrecordDetail.VSecondstudent}</td>
    <td width="19%" align="right">待确认的飞行训练记录&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></div>

<table id="usersTable" class="fcolorTable" style="width:1300px;" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2" >
        	<thead>
			  <tr>
                <th width="95" rowspan="2">日期</th>
                <th width="50" rowspan="2">航空器型别</th>
                <th width="50" rowspan="2">航空器登记号</th>
                <th colspan="4">起飞\降落站</th>
                <th width="50" rowspan="2">飞行<br>
科目</th>
                <th colspan="2">着陆次数</th>
                <th rowspan="2" width="60">驾驶员<br>
                  飞行时间</th>
                <th colspan="4">机长或单飞时间</th>
                <th colspan="4">副驾驶或带飞时间</th>
                <th colspan="2">仪表飞行时间</th>
                <th colspan="3">模拟机\训练器</th>
                <th rowspan="2">备注</th>
              </tr>
			  <tr>
			    <th width="40" height="14">起飞站</th>
			    <th width="40">到达站</th>
			    <th width="40">出发<br>
		        时刻</th>
			    <th width="40">到达<br>
		        时刻</th>
			    <th width="40" height="14">昼间</th>
			    <th width="40">夜间</th>
			    <th width="40">机长</th>
			    <th width="40">单飞</th>
			    <th width="40">转场</th>
			    <th width="40">夜间</th>
			    <th width="40">副驾驶</th>
			    <th width="40">带飞</th>
			    <th width="40">转场</th>
			    <th width="40">夜间</th>
			    <th width="40">模拟仪表</th>
			    <th width="40">真实仪表</th>
			    <th width="40">训练地点</th>
			    <th width="40">模拟机<br>
		        时间</th>
			    <th width="40">训练器<br>
		        时间</th>
		      </tr>   
		  </thead>
			<tbody>
			 <tr>
              <td align="center">${flightTrainingrecordDetail.DFlydate}</td>
              <td align="center">${flightTrainingrecordDetail.planeForm}</td>
              <td align="center">${flightTrainingrecordDetail.planeCode}</td>
              <td align="center">${flightTrainingrecordDetail.VFpos}</td>
              <td align="center">${flightTrainingrecordDetail.VLpos}</td>
              <td align="center">${flightTrainingrecordDetail.DFlymoment}</td>
              <td align="center">${flightTrainingrecordDetail.DEndmoment}</td>
              <td align="center">${flightTrainingrecordDetail.VNo}</td>
              <td align="center">${flightTrainingrecordDetail.ILanddaytimes}</td>
              <td align="center">${flightTrainingrecordDetail.ILangnighttimes}</td>
				<td align="center">${flightTrainingrecordDetail.DTrantime}</td>
				<td align="center">${flightTrainingrecordDetail.DJizhangtime}</td>
				<td align="center">${flightTrainingrecordDetail.DDanfeitime}</td>
				<td align="center">${flightTrainingrecordDetail.DZhuanchangtime}</td>
				<td align="center">${flightTrainingrecordDetail.DYejiantime}</td>
				<td align="center">${flightTrainingrecordDetail.DFujiashitime}</td>
				<td align="center">${flightTrainingrecordDetail.DDaifeitime}</td>
				<td align="center">${flightTrainingrecordDetail.DFjszhuanchangtime}</td>
				<td align="center">${flightTrainingrecordDetail.DFjszcyjtime}</td>
				<td align="center">${flightTrainingrecordDetail.DMoniyibiaotime}</td>
				<td align="center">${flightTrainingrecordDetail.DZhenshiyibiao}</td>
				<td align="center">${flightTrainingrecordDetail.VTranpos}</td>
				<td align="center">${flightTrainingrecordDetail.DMnjsj}</td>
				<td align="center">${flightTrainingrecordDetail.DXlqsj}</td>
				<td align="center"><img src="themes/cupertino/images/detail.png" title="${flightTrainingrecordDetail.VBz}"  border="0"/></td>
			  </tr>
		    </tbody>
	</table>
<br>
<table id="usersTable" class="colorTable" border="0" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        	<thead>
			  <tr>
                <th width="600" align="left" style="padding-left:12px;">飞行教员评语</th>
                <th width="140"  align="left">评语时间</th>
                <th width="80"  align="left">评语人</th>
                <th>&nbsp;</th>
              </tr> 
		  </thead>
			<tbody>
			  <tr>
              <td style="padding-left:12px;"><span id="pingyu"></span>
<span id="subjectScore"></span></td>
              <td rowspan="2" valign="top" >${toDoing.submitTime}</td>
              <td rowspan="2" valign="top">${toDoing.submitUserName}</td>
              <td rowspan="2" valign="top"><button class="green" primary="ui-icon-button-confirm" id="querenone">确认评语</button>
   
    <button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button> <button class="green" primary="ui-icon-button-addnew" id="shensuone">申诉</button>
    </td>
              </tr>
			  <tr>
			    <td style="padding-left:12px;">&nbsp;</td>
		      </tr>
		    </tbody>
	</table>
</div>
</div>
<div id="shensuForm" title="评语申诉">
<form id="checkForm" method="post" action="saveStudentShenSu.do">
<input name="appeal.TComment.VId" type="hidden" id="VId" value="${toDoing.infoId}">
<table width="98%" border="0">
    <tr>
    <td width="18%" align="right">申诉理由：</td>
    <td width="82%">
    <textarea   name="appeal.VReason" id="VReason" style="width:325px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
    </tr>
</table>
</form>
</div>

<div id="deleteDialogForm">   
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>

<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span">确认评语成功。</span></td>
</tr>
</table>
</div>
</body>
</html>
<form action="saveStudentConfirmRecord.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" value="${id}" id="recordid">
<input type="hidden" name="toDoing.type" value="${toDoing.infoId}">
</form>

<%@ include file="../../result.jsp"%>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});
</script>