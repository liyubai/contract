<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>时间科目管理</title>
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
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
</style>
<script>
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","120px").end().each(function(i){
		if(i==1){
			new $.dropDownList(i,true,240);
		}else{
			new $.dropDownList(i,true,140);
		}
	})
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
	//功能9
	var name = $( "#vname" ),
		email = $( "#vgroup" ),
		allFields = $( [] ).add( name ).add( email ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips.html( t ).addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		}, 2000 );
	}

	function checkLength( o, n, min, max ) {
		if ( o.val().length > max || o.val().length < min ) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n + "的长度必须在" +
				min + "和" + max + "之间" );
			return false;
		} else {
			return true;
		}
	}

	function checkRegexp( o, regexp, n ) {
		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
			return false;
		} else {
			return true;
		}
	}

	$( "#dialogForm1" ).dialog({//添加、编辑窗口
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//确定按钮的处理代码段：
				var bValid = true;
				allFields.removeClass( "error" );

				bValid = bValid && checkLength( name, "科目名称", 1, 100);
				bValid = bValid && checkLength( email, "所在分组", 1, 100);

				if ( bValid ) {

					$("#cvname").val($("#vname").val());
					$("#cvgroup").val($("#vgroup").val());
					$("#cvunit").val($("#vunit").val());
					$("#unitSubjectForm").submit();
					$( this ).dialog( "close" );
				}


			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
	$("#modalDialogButton1").click(function(){// 添加
		$("#dialogForm1").dialog('option', 'title', '新建科目');
		//$("#vgroup").val("1");
	//	$("#vgroup").change();
		$("#VId").val("");
		$("#unitSubjectForm").attr("action","createUnitSubjectDictionary.do");
		$( "#dialogForm1" ).dialog( "open" );
	});

	$("#modalDialogButton2").click(function(){//编辑
		var k =0;
		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str=r1[i].value;
			}
		}
		if(k==0){
			//alert("请选择要编辑的内容！");
			$("#dialogForm3Warning").html("请选择要编辑的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		if(k>1){
			//alert("请选择一条信息编辑！");
			$("#dialogForm3Warning").html("请选择一条信息编辑。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		execEdit(str);
	});

	function execEdit(str){
		//通过json读取字典对象
		params = {"id":str};
		$.ajax({
			type:"post",
			url:"showUnitSubjectDictionaryById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值
				$("#VId").val(data.VId);
				$("#vname").val(data.VName);
				$("#vgroup").val(data.VGroup);
				$("#vgroup").change();
				
				$("#vunit").val(data.VUnit);
				$("#vunit").change();
				$("#dialogForm1").dialog('option', 'title', '编辑科目');
				$("#unitSubjectForm").attr("action","updateUnitSubjectDictionary.do");
				$("#dialogForm1").dialog( "open" );
			},
			error:function(){
				//alert("数据库连接错误，获取对象失败，请重试。");
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
	}
	$("button.icon").click(function(){
		var str = this.id;
		var opt = str.split(",")[0];
		var id = str.split(",")[1];
		if(opt==0){
			execEdit(id);
		}else{
			$("#unitSubjectDicIdListId").val(id);
			$( "#dialogForm2" ).dialog( "open" );
		}
	});
	$("#modalDialogButton3").click(function(){//删除
		var k =0;
		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str+=r1[i].value+",";
			}
		}
		
		if(k==0){
			$("#dialogForm3Warning").html("<br/>请选择要删除的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#unitSubjectDicIdListId").val(str);
		$( "#dialogForm2" ).dialog( "open" );
		
	});

	
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()!="科目名称")								
			$("#searchKey").val($("#searchUser").val());
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
	$( "#dialogForm2" ).dialog({//删除内容窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#deleteForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
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
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
	$( "#dialogForm4" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149eb4aa0005</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="panelBox buttonBox">
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
<s:if test="#r==null || #r==0">
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建科目</button>
    <button class="normal barLeft" id="modalDialogButton2">编辑</button>
    <button class="normal barMiddle" id="modalDialogButton3">删除</button>
</s:if>
    <button class="normal <s:if test="#r==null || #r==0">barMiddle</s:if><s:else>barLeft</s:else>" id="modalDialogButton5">刷新</button>
    <div class="dropDownList barRight">
     <s:set name="selId" value="id"/>
     <s:if test="id==null || id==''"><s:set name="selId" value="1"></s:set></s:if>
        <button></button>
        <ul>
        <li><a href="open_unitSubjectDictionaryList.do" val="1"><span class="ui-icon ui-icon-bullet"></span>请选择课目类型</a></li>
        	<s:iterator value="lessonSortList" status="statu">
            <li><a href="open_unitSubjectDictionaryList.do?id=${VId}"  val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="svunit" value='<s:property value="#selId" />'/>
    	</div>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" value="科目名称" name="searchUser"  type="text" maxlength="50" title="科目名称"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="160"></th>
				<th width="160"></th>
				<th width="160"></th>
				<th width="140"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">科目名称</th>
				<th class="thSortableGray">所在分组</th>
				<th class="thSortableGray">所属课目类型</th>
				<th class="thSortableGray">创建时间</th>
				<th class="thSortableGray">&nbsp;</th>
				<th class="thSortableGray">&nbsp;</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="timesubjectsList" >
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td class="searchRange" >${VName}</td>
				<td class="searchRange" >${TDiction.VName}</td>
				<td class="searchRange" >${VUnitid}</td>
				<td class="searchRange" ><s:date name="DCreatedate" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td><s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button><button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button></span></s:if></td>
				<td></td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(20-timesubjectsList.size).{ #this }">
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td></td>
				<td></td>
			  </tr>
              </s:iterator>
			</tbody>
		</table>

	</div>

</div>

</div>


</div>


<div id="dialogForm1"  title="新建科目">
	<p class="validateTips" >请填写所有信息</p>
    <span class="panelLine"></span>
		所&nbsp;属&nbsp;组：&nbsp;&nbsp;
        <div class="dropDownList">
        <button></button>
        <ul>
       
            <li><s:iterator value="timeSubjectGroupList" status="statu"><a href="#N" val="${VId}" class="inline" style="width: 80px;"><s:if test='#statu.index==0'><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a></s:iterator></li>
          
        </ul><s:iterator value="timeSubjectGroupList" begin="0" end="0">
        <input type="hidden"  id="vgroup" value="${VId}" /></s:iterator>
    	</div><span class="panelLine"></span>
        课目类型：&nbsp;
        <div class="dropDownList">
        <button></button>
        <ul>
        	<s:iterator value="lessonSortList" status="statu">
            <li><a href="#N"  val="${VId}"><s:if test='#statu.index==0'><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a></li>
            </s:iterator>
        </ul>
        <s:iterator value="lessonSortList" begin="0" end="0"><input type="hidden"  id="vunit" value="${VId}"/></s:iterator>
    	</div>
        <span class="panelLine"></span>
    	科目名称： <input type="text"  id="vname" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
	</fieldset>
	
</div>

<div id="dialogForm2">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要删除选中的信息吗？<br/>信息删除后不可恢复。</span>
		</div>
	</fieldset>	
</div>

<div id="dialogForm3">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
		</div>
	</fieldset>	
</div>

<div id="dialogForm4">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; " id="dialogForm4Span"></span>
		</div>
	</fieldset>	
</div>

<form id="unitSubjectForm" method="post" action="createUnitSubjectDictionary.do">
<input type="hidden" name="timeSubject.VId" id="VId"/>
<input type="hidden" name="timeSubject.VName" id="cvname" />
<input type="hidden" name="timeSubject.TDiction.VId" id="cvgroup" />
<input type="hidden" name="timeSubject.VUnitid" id="cvunit" />
</form>

<form  action="open_unitSubjectDictionaryList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
</form>
<form  action="deleteUnitSubjectDictionary.do" method="post" id="deleteForm">
<input name="unitSubjectDicIdStr" type="hidden" id="unitSubjectDicIdListId">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#dialogForm4" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>
