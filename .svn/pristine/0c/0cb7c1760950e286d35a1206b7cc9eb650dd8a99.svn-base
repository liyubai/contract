<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生执照预览</title>

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
<script src="scripts/ui/jquery.ui.progressbar.min.js"></script>
<script src="scripts/function.min.js"></script>

<script>
A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
$(function() {
	$("#modalDialogButton7").click(function(){//返回
		$( "#searchForm" ).submit();
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
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 490,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	
});

function viewContent(id,used){

	if(id==""){
		return;	
	}

	params = {"id":id,"itype":used};
	$.ajax({
		type:"post",
		url:"showStudentLicenseDetail.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			$("#contentid").html(getContent(data));
			$("#dialogContent").dialog('option', 'title',  "所选学员："+data.VName);
			$( "#dialogContent" ).dialog( "open" );
			
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

function getContent(data){

	var content = "";

	content+="<tr>";
	content+="<td width='80'>姓名：</td>";
	content+="<td width='140' height=\"24\">"+data.VName+"</td>";
	content+="<td width='80'>学号：</td>";
	content+="<td width='140' height=\"24\">"+data.VCode+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	
	content+="<tr>";
	content+="<td>签发单位：</td>";
	content+="<td height=\"24\">"+data.VCompany+"</td>";
	content+="<td>执照编号：</td>";
	content+="<td height=\"24\">"+data.VCardid+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>签发日期：</td>";
	content+="<td height=\"24\">"+data.DIssuetime+"</td>";
	content+="<td>有效期：</td>";
	content+="<td height=\"24\">"+data.DEffectdate+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>局长授权签发：</td>";
	content+="<td height=\"24\">"+data.VIssuer+"</td>";
	content+="<td>更新日期：</td>";
	content+="<td height=\"24\">"+data.DUpdatedate+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>学员执照类型：</td>";
	content+="<td height=\"24\">"+data.ILevel+"</td>";
	content+="<td>是否监控：</td>";
	content+="<td height=\"24\">"+data.VBeizhu+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>执照性质：</td>";
	content+="<td height=\"24\">"+data.VZhizhaoxingzhi+"</td>";
	content+="<td>航空器类别：</td>";
	content+="<td height=\"24\">"+data.VHangkongqileibie+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>仪表等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VZhizhaodengji+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>飞机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VFeijijibie+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	content+="<tr>";
	content+="<td>旋翼机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VXuanzhuanjijibie+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>航空器型别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VHkqdj+"</td>";
	content+="</tr>"

	return content;
}

</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149d9a760002</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="topPartD">
<div class="panelBox buttonBox">
<button id="modalDialogButton7" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>

<div id="rightPartD"><div>

<div class="Panel ui-corner-all-0" id="Panel2">
<div class="panelContent">
<span style="line-height:40px;">&nbsp; 姓名：${student.VName}&nbsp; &nbsp; &nbsp; &nbsp; 学号：${student.VCode} &nbsp; &nbsp; &nbsp; &nbsp; 性别：${student.VGender} </span>
<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
    <thead>
      <tr class="trSpliter">
        <th width="150"></th>
        <th width="150"></th>
        <th width="100"></th>
        <th width="100"></th>
        <th width="100"></th>
        <th width="100"></th>
        <th width="100"></th>
        <th width="100"></th>
        <th></th>
      </tr>
      <tr>
        <th class="thSortableGray">执照类型</th>
        <th class="thSortableGray">执照编号</th>
        <th class="thSortableGray">签发日期</th>
        <th class="thSortableGray">到期日期</th>
        <th class="thSortableGray">剩余有效期(天)</th>
        <th class="thSortableGray">上一次熟练检查日期</th>
        <th class="thSortableGray">下一次熟练检查日期</th>
        <th class="thSortableGray">状态</th>
        <th class="thSortableGray">&nbsp;详细</th>
      </tr>
    </thead>
    <tbody >
    <s:iterator value="licenseList">
      <tr>
        <td>${TuserId}</td>
        <td>${VCardid}</td>
        <td>${DIssueTime}</td>
        <td>${DUsedTime}</td>
        <td><s:if test='iday<=31'>
                <s:set name="col" value="'#FF0000'"/>
                <s:set name="img" value="'top1.gif'"/>
            </s:if>
			<s:elseif test="31<iday and iday<=61">
                <s:set name="col" value="'#EBA600'"/>
                <s:set name="img" value="'top2.gif'"/>
            </s:elseif>
			<s:elseif test='61<iday and iday<=90'>
                <s:set name="col" value="'#00A2BE'"/>
                <s:set name="img" value="'top3.gif'"/>
            </s:elseif>
			<s:else>
                <s:set name="img" value="''"/>
                <s:set name="col" value="'#000000'"/>
            </s:else>            
         &nbsp;&nbsp;&nbsp;&nbsp;<font color="${col}">${iday} <s:if test="#img!=''"><img src="themes/cupertino/images/${img}"  align="absmiddle"/></s:if></font>               
         </td>
        <td>${DResultdate}</td>
        <td>${VDoctor}</td>
        <td><s:if test='used==0'>在用执照</s:if><s:else>历史执照</s:else></td>
        <td><a href="javascript:void(0)" onclick="viewContent('${VId}','${used}');" class="blue">查看</a></td>
      </tr>
      <s:if test='checkList.size()>0'>
      <tr>
        <th></th>
        <th></th>
        <th class="thSortableGray">检查日期</th>
        <th class="thSortableGray">检查类型</th>
        <th class="thSortableGray">航空器编号</th>
        <th class="thSortableGray">检查教员</th>
        <th class="thSortableGray">到期日期</th>
        <th class="thSortableGray">剩余有效期(天)</th>
        <th></th>
      </tr>
      </s:if>
      <s:iterator value="checkList">
      <tr>
        <td></td>
        <td></td>
        <td>${viewDCheckdate}</td>
        <td>${typeName}</td>
        <td>${VFlyform}</td>
        <td>${VCheckteacher}</td>
        <td>${viewDEffectdate}</td>
        <td>${iday}</td>
        <td></td>
      </tr>
      </s:iterator> 
    </s:iterator> 
    </tbody>
</table>

</div>
</div>
</div>
</div>
<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>

<div id="dialogContent"  title="查看学员执照信息">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>
<form id="searchForm" action="open_sutdentLicenseList.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
</form>
</body>
</html><script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>