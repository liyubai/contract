<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看文件信息</title>

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

	
     //返回按钮，返回局方文件列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
		
	});
	$("#modalDialogButton3").click(function(){
	    $("#searchForm").submit();
		
	});
});
function downFilea(srcp,title){
	$("#srcFileNameid").val(srcp);
	$("#attachmentNameid").val(title);
	 $("#downForm").submit();
}

</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">f1866a954d3feec7014d41ef5af83a2d</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div>
</div>

<div id="topPartD"><div class="panelBox buttonBox">
<button class="normal" id="modalDialogButton2"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div></div>


<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
		<table class="panelTable" border="0" cellspacing="0" cellpadding="3" style="line-height:23px;">
			<thead>
			  <tr class="trSpliter">
				<th width="85"></th>
				<th></th>
			  </tr>
			</thead>
			<tbody>
              <tr class="normal">
				<td colspan="2" align="center"><span style="font-size: 16px; font-weight: bold; color: #555555; line-height:23px;">${fileInfo.VTitle}</span></td>
			  </tr>

			  <tr class="normal">
				<td colspan="2" align="center">
				创建时间：<s:date name="fileInfo.DCreateDate" format="yyyy-MM-dd HH:mm:ss" />&nbsp;&nbsp;&nbsp;&nbsp;
				点击量：${fileInfo.IDoit}</td>
			  </tr>

			  <tr class="normal">
				<td>文件简介：</td>
				<td><s:property value='fileInfo.VIntroduction.replace(\"\\n\", \"<br>\")' escape="false"/></td>
			  </tr>

			  <tr class="normal">
				<td>下载附件：</td>
				<td>
					  <s:if test="fileInfo.VFilename!=null">					
						<a href="javascript:void(0)" onClick="downFilea('${fileInfo.VFilename}','${fileInfo.VTitle}')" class="blue">${fileInfo.VTitle}</a>
					  </s:if>
	                  <s:else>
	   					无
	                  </s:else>		
				</td>
			  </tr>

			</tbody>
		</table>

	</div>
</div>

<span class="panelSpacer10"></span>


<div class="panelBox buttonBox">
<!-- panelBox计划用于布局横向的简单一行 -->

<button class="normal" id="modalDialogButton3"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>

</div></div>


<form id="downForm" action="downloadAttachment.do" method="post">
    
	<input type="hidden" name="srcFileName"  id="srcFileNameid"/>
	<input type="hidden" name="attachmentName" id="attachmentNameid"/>

</form>



<form id="searchForm" action="searchTFiles.do" method="post">
    
	<input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="pageIndex" value="${pageIndex}"/>

</form>

</body>
</html>
