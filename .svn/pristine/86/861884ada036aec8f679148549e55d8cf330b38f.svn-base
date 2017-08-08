<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>训练科目管理</title>
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
</style>
<script>
$(function() {

	$("div.dropDownList").each(function(i){
		new $.dropDownList(i,true,420);
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

	var name = $( "#cname" ),
		csubname = $("#csubname");
		allFields = $( [] ).add( name ).add( csubname ),
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
	
	function checkEquals( o,p, n ) {

		if ( o.val()==p.val() ) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
			return false;
		} else {
			return true;
		}
	}

	$( "#dialogForm1" ).dialog({//添加、编辑窗口
		autoOpen: false,
		height: 410,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//确定按钮的处理代码段：
				var bValid = true;
				allFields.removeClass( "error" );
				bValid = bValid && checkLength( name, "请输入训练科目名称", 1, 100);
				
				if ( bValid ) {
					$("#nameid").val(name.val());
					$("#subnameid").val(csubname.val());
					$("#sortid").val(getSelValue('sortn'));
					$("#typeid").val($("#ctypeid").val());
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
		
		$("#dialogForm1").dialog('option', 'title', '新建训练科目');
		tips.removeClass("ui-state-highlight").html("请填写所有信息");
		$("#input.error").removeClass("error");
		$("#dialogForm1").dialog( "open" );
	});
	
	function getSelValue(name){
		var str="";
		var r1=document.getElementsByName(name);
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str=r1[i].value;
			}
		}
		return str;
	}
	
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
			$("#dialogForm3Warning").html("请选择要编辑的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		if(k>1){
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
			url:"showTrainsubjectById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值
				$("#VId").val(data.VId);
				$("#ctypeid").val(data.typeid);
				$("#ctypeid").change();
				$("#cname").val(data.VName);
				$("#csubname").val(data.VSubname);
				//处理单选按钮默认值
				var r1=document.getElementsByName("sortn");
				for(i=0;i<r1.length;i++){
					if(r1[i].value==data.ISort){
						r1[i].checked=true;
					}
				}
				$("#dialogForm1").dialog('option', 'title', '编辑训练科目');
				$("#unitSubjectForm").attr("action","updateTrainsubject.do");
				$("#dialogForm1").dialog( "open" );
			},
			error:function(){
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
			$("#dialogForm3Warning").html("请选择要删除的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#unitSubjectDicIdListId").val(str);
		$( "#dialogForm2" ).dialog( "open" );
		
	});

	$("#modalDialogButton4").click(function(){//查询
		$("#searchKey").val($.trim($("#searchUser").val()));
		if($("#searchTypeid").val()==1){
			$("#searchId").val("");
		}else{
			$("#searchId").val($("#searchTypeid").val());
		}
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchKey").val("");
		$("#searchTypeid").val("");
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
	$( "#setDialogForm" ).dialog({
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var order = $.trim($("#iorder").val());
				if(order==""){
					alert("请输入顺序号");
					return;
				}
				var sid = $("#sid").val();
				if(sid==""){
					return;
				}
				window.location.href="saveOrderByNum.do?order="+order + "&sortId="+sid + "&sortName=subject&id="+$("#sortId").val();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});
function openSetWindow(d,id,sortid){
	$("#iorder").val(d);
	$("#sid").val(id);
	$("#sortId").val(sortid);
	$( "#setDialogForm" ).dialog( "open" );
}
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
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建训练科目</button>
    <button class="normal barLeft" id="modalDialogButton2">编辑</button>
    <button class="normal barMiddle" id="modalDialogButton3">删除</button>
    <button class="normal barMiddle" id="modalDialogButton5">刷新</button>
</s:if>   
     <div class="dropDownList <s:if test="#r==null || #r==0">barRight</s:if>">
     <s:set name="selId" value="id"/>
     <s:if test="id==null || id==''"><s:set name="selId" value="1"></s:set></s:if>
     
        <button>请选择分类</button><span class="bar"></span>
        <ul>
        	<li><a href="open_trainsubjectList.do" val="1" class="inline"  style="width: 170px;"><span class="ui-icon ui-icon-bullet"></span>请选择分类</a>
        	<s:iterator value="subjectsortList">
            <a href="open_trainsubjectList.do?id=${VId}" val="${VId}" class="inline"  style="width:170px;">${VName}</a></s:iterator>
            </li>
        </ul><input type="hidden"  id="searchTypeid" value="${selId}"/>
    	</div>   
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" name="searchUser"  type="text" maxlength="50"/><button id="modalDialogButton4">查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="190"></th>
                <th width="100"></th>
				<th width="170"></th>
				<th width="140"></th>
				<th width="140"></th>
                <th width="140"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">名称</th>
                <th class="thSortableGray">人工排序</th>
				<th class="thSortableGray">分类</th>
				<th class="thSortableGray">二级标题</th>
				<th class="thSortableGray">类型</th>
                <th class="thSortableGray">创建时间</th>
				<th class="thSortableGray">&nbsp;</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td title="${VName}" ><s:set name="str" value="VName"></s:set>
      <s:if test="#str.length()>15">
         <s:property value="#str.substring(0,14)+'...'" />
        </s:if>
        <s:else>
         <s:property value="#str" />
        </s:else></td>
        <td style="line-height:16px; padding-left:10px;"><s:if test="#r==null || #r==0"><a href="subjectOrder.do?id=${id}&sortId=${VId}&order=-1" class="blue">↑</a> ${IOrder}<br>
        	<a href="subjectOrder.do?id=${id}&sortId=${VId}&order=1" class="blue">↓</a><br><a href="javascript:void(0)" onClick="openSetWindow('${IOrder}','${VId}','${id}')" class="blue">设置</a></s:if>
            <s:else>${IOrder}
            </s:else>
        </td>
				<td>${TSubjectsort.VName}</td>
                
				<td>${VSubname}</td>
                <td><s:if test='ISort==null || ISort==0'>偏重于技术技能</s:if><s:else>偏重于非技术技能</s:else></td>
				<td><s:date name="DCreatedate" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td><s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button><button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button></span></s:if></td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
				<td></td>
				<td></td>
                <td></td>
				<td></td>
				<td></td>
				<td></td>
                <td></td>
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system.jsp" />
        </div>

</div>

</div>


</div>

<div id="dialogForm1"  title="新建训练科目">
	<p class="validateTips" >请填写所有信息</p>
     <span class="panelLine"></span>
		科目分类：&nbsp;
        <div class="dropDownList">
        <button></button>
        <ul>
        	<li>
            <s:iterator value="subjectsortList" status="statu"><a href="#N" val="${VId}" class="inline" style="width: 140px;" title="${VName}"><s:if test="#statu.index==0"><span class="ui-icon ui-icon-bullet"></span></s:if>
             <s:set name="str" value="VName"></s:set>

      <s:if test="#str.length()>18">
         <s:property value="#str.substring(0,18)+'...'" />
        </s:if>
        <s:else>
         <s:property value="#str" />
        </s:else></a></s:iterator>
            </li>
        </ul>
        <input type="hidden"  id="ctypeid" value="${selId}"/>
    	</div>

        <span class="panelLine"></span>
    	科目名称： &nbsp;<input type="text"  id="cname" class="text ui-widget-content ui-corner-all" style="width:200px;" />
         <span class="panelLine"></span>
    	二级标题： &nbsp;<input type="text"  id="csubname" class="text ui-widget-content ui-corner-all" style="width:200px;" />
        <span class="panelLine"></span>
    	科目类型：&nbsp;<input type="radio" name="sortn" value="0" checked="checked"/>偏重于技术技能&nbsp;&nbsp;&nbsp;<input type="radio" name="sortn" value="1" />偏重于非技术技能
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

<div id="setDialogForm"  title="设置排序">
<br>
<fieldset>
排序号：<input type="text"  id="iorder" class="text ui-widget-content ui-corner-all" style="width:200px;"/>
</fieldset>
</div>

<form id="unitSubjectForm" method="post" action="createTrainsubject.do">
<input type="hidden" name="trainsubject.VId" id="VId"/>
<input type="hidden" name="trainsubject.VName" id="nameid" />
<input type="hidden" name="trainsubject.TSubjectsort.VId" id="typeid" />
<input type="hidden" name="trainsubject.VSubname" id="subnameid" />
<input type="hidden" name="trainsubject.ISort" id="sortid" />
<input type="hidden" name="id"  value="${id}"/>
</form>

<form  action="open_trainsubjectList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
<input name="id" type="hidden" id="searchId">
</form>
<form  action="deleteTrainsubject.do" method="post" id="deleteForm">
<input name="unitSubjectDicIdStr" type="hidden" id="unitSubjectDicIdListId">
<input type="hidden" name="id"  value="${id}"/>
</form>
<%@ include file="../../result.jsp"%>
<input type="hidden"  id="sid" />
<input type="hidden"  id="sortId" />
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