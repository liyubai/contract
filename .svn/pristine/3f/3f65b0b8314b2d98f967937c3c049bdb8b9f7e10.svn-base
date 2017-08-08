<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>数据字典</title>
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
    <script src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
</head>
<body>
<jsp:include page="/pages/common/topPart.jsp" />
	<jsp:include page="/pages/common/leftPart.jsp" />
<div id="rightPartA" style="overflow-x:hidden;">
<div>   
    <div><button class="green ml10 mt10" id="btnAddNewRootNode">新建一级分类</button></div>
    <div class="Panel ui-corner-all-0">
    <div class="panelContent clear">
        <table class="panelTable" border="0" cellspacing="0" cellpadding="3">
            <thead>
	          <tr class="trSpliter">
				<th width="180"></th>
				<th width="180"></th>
			  </tr>
			  <tr>
				<th class="thSortableGray">一级分类</th>
				<th class="thSortableGray" style="padding-left:10px;">操作</th>
			  </tr>
			</thead>
			<tbody>
				<s:iterator value="dictionarylist">
			  <tr>
				<td>${dictionaryName}</td>
				<td><a href="dataDictionaryManagent_showManagent.do?dictionaryId=${dictionaryId}" class="blue">编辑</a></td>
			  </tr>
				</s:iterator>
			</tbody>
        </table>
    </div>
    </div>
</div>
</div>

<div id="dialogForm1" title="新建一级分类">
	<p class="validateTips">请填写信息</p>
		<form action="<%=request.getContextPath()%>/contract/saveDataDictionary.do" method="post" id="saveDataDictionary"  onkeydown="if(event.keyCode==13)return false;">
		<div>
		    <span>一级分类名称</span>
            <input id="dictionaryName" type="text" class="tableinput2" value=""  name="dic.dictionaryName"/>
            
		</div>
	</form>
</div>

<script>
    $(function() {

    var txt1 = $("#txtSorting"),
		allFields = $([]).add(txt1),
		tips = $(".validateTips");
 
        function updateTips(t) {
            tips.html(t).addClass("ui-state-highlight");
            setTimeout(function() {
                tips.removeClass("ui-state-highlight", 1500);
            }, 2000);
        }

        $("#dialogForm1").dialog({
            autoOpen: false,
            height: 200,
            width: 300,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "确 定": function() {
                    //确定按钮的处理代码段：
                       
                    	if($.trim($("#dictionaryName").val()).length<=0)
									{
							        	alert("输入内容不能为空");
									}
                    	else { 
                    		$("#saveDataDictionary").submit();
                    $(this).dialog("close");}
                },
                "取 消": function() {
                    $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });



        $('#btnAddNewRootNode').click(function() {
            tips.removeClass("ui-state-highlight").html("新建节点信息");
            $("#modalDialogButton1 input.error").removeClass("error");
            $("#dialogForm1").dialog("open");
        });

        
    });
</script>
</body>
</html>