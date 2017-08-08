<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>实践考试分配考试员</title>

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
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<script>
$(function() {
	
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
		if(!this.checked) $checkAllUsersBox[0].checked=false;
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) $checkAllUsersBox[0].checked=true;
		$checkAllUsersBox.trigger("change");
	});
	$checkAllUsersBox.click(function(){
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");
		});
	});
	
	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});

	$("#querenbutton").click(function(){//fenpei
		var str= "";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value + ",";
			}
		}
		
		if(str==""){
			alert("请选择学生。");
			return;
		}
		var tea = "";
		var teas=document.getElementsByName('teacherName');
		for(i=0;i<teas.length;i++){
			if(teas[i].checked==true){
				tea=teas[i].value;
			}
		}
		
		if(tea==""){
			alert("请选择考试员。");
			return;
		}
		$("#teacherid").val(tea);
		$("#type").val(str);
		$("#auditForm").submit();
	});
});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div style="padding-top:8px; padding-left:6px; padding-right:6px;">

<div class="panelHead">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="57%" height="35" style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">审核人：</font>${teacherid}</td>
    <td width="43%" align="right">待分配考试员，推荐参加考试的学生名单如下：&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></div>
<div class="panelContent">
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        	<thead>
			  <tr><th width="50"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
              	<th width="100">学号</th>
                <th width="50">姓名</th>
                <th width="40">性别</th>
                <th width="60">学员类型</th>
                <th width="90">所属公司</th>
                <th width="90">学籍状态</th>
                <th width="60">招生形式</th>
                <th width="60">自费/公费</th>
                <th></th>
              </tr>   
		  </thead>
			<tbody>
            <s:iterator value="practiceAskList" status="statu">
			 <tr><td align="center"><input name="checkboxName" type="checkbox" value="${studentBaseInfo.VId}" ><b></b></td>
             	<td align="center">${studentBaseInfo.VCode}</td>
				<td align="center">${studentBaseInfo.VName}</td>
				<td align="center">${studentBaseInfo.VGender}</td>
                <td align="center">${studentBaseInfo.TDictionByVStuTypeid.VName}</td>
                <td align="center">${studentBaseInfo.TOrg.VName}</td>
                <td align="center">${studentBaseInfo.TDictionByVXjStatusid.VName}</td>
                <td align="center">${studentBaseInfo.TDictionByVFormid.VName}</td>
                <td align="center">${studentBaseInfo.TDictionByVFreeTypeid.VName}&nbsp;</td>
                <td align="center"></td>
              </tr>
              </s:iterator>
		    </tbody>
	</table>
<br>
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
<thead>

<tr>
<th align="left" colspan="12">&nbsp;&nbsp;局方考试员列表</th>
</tr> 

</thead><s:set name="p" value="0"/>
<tbody><s:iterator value="otheruserList" status="statu">
<s:if test='#p==0'><tr></s:if>
<s:set name="p" value="#p+1"/>
<td width="80">&nbsp;&nbsp;<input name="teacherName" type="radio" value="${VId};0"><b></b>${VName}</td>
<s:if test='#p>=12'><s:set name="p" value="0"/></tr></s:if>
</s:iterator>
<s:if test='#p<12 && #p>0'>
<s:iterator begin="0" end="11-#p">
<td width="80"></td>
</s:iterator>
</tr>
</s:if>			
</tbody>
</table>

<br>
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
<thead>
<tr>
<th align="left" colspan="12">&nbsp;&nbsp;民航大学委任代表</th>
</tr> 
</thead>
<tbody><s:set name="p" value="0"/>
<s:iterator value="teacherBaseInfoList" status="statu">
<s:if test='#p==0'><tr></s:if>
<s:set name="p" value="#p+1"/>
<td width="80">&nbsp;&nbsp;<input name="teacherName" type="radio" value="${VId};1"><b></b>${VName}</td>
<s:if test='#p>=12'><s:set name="p" value="0"/></tr></s:if>
</s:iterator>
<s:if test='#p<12 && #p>0'>
<s:iterator begin="0" end="11-#p">
<td width="80"></td>
</s:iterator>
</tr>
</s:if>
</tbody>
</table>
<br>
&nbsp;&nbsp;<button class="green" primary="ui-icon-button-confirm" id="querenbutton">确认分配</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
<br>
</div>
</div>

</body>
</html>
<form action="savePracticeExamAskStudentAssignTeacher.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" id="infoId" value="${id}">
<input type="hidden" name="toDoing.type" id="type">
<input type="hidden" name="toDoing.title" id="teacherid">
</form>