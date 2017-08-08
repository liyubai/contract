<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>其它飞行经历记录审核</title>

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

	$("#querenbutton").click(function(){//审核通过
		var str= "";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value + ",";
			}
		}
		
		if(str==""){
			alert("请选择审核信息。");
			return;
		}
		$("#infoIds").val(str);
		$("#type").val(1);
		$("#auditForm").submit();
	});

	$("#backbutton").click(function(){//审核不通过
		var str= "";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value + ",";
			}
		}
		
		if(str==""){
			alert("请选择审核信息。");
			return;
		}
		$("#infoIds").val(str);
		$("#type").val(2);
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
    <td width="81%" height="35" style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">姓名：</font>${teacherid}&nbsp;</td>
    <td width="19%" align="right">待审核的加时加课申请&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></div>
<div class="panelContent">
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        	<thead>
			  <tr>
              <th width="40"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
                <th width="90">学号</th>
                <th width="60">姓名</th>
                <th width="140">申请时间</th>
                <th width="60">加时</th>
                <th width="180">加课</th>
                <th></th>
              </tr>   
		  </thead>
			<tbody>
            <s:iterator value="addLessonList" status="statu">
			 <tr>
             <td align="center"><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
              <td align="center">${studentVCode}</td>
              <td align="center">${studentName}</td> 
              <td align="center">${DFlydate}</td>
              <td align="center">${DTrantime}</td>
              
               <td align="center"><s:if test='VFlytype==1'>${VNo}--${lessonName}</s:if></td>
                <td align="center"></td>
              </tr>
              </s:iterator>
		    </tbody>
	</table>
<br>
<button class="green" primary="ui-icon-button-confirm" id="querenbutton">审核通过</button>
<button class="green" primary="ui-icon-button-addnew" id="backbutton">审核不通过</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
<br>
</div>
</div>

</body>
</html>

<form action="saveAddHoursAndAddLessonConfirm.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" id="infoIds">
<input type="hidden" name="toDoing.type" id="type">
</form>