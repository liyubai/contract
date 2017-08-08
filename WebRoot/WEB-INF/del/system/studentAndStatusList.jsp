<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生学籍状态关系管理</title>

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
.testDiv { padding: 1px; }

/*功能4*/
#panelLeft { width: 200px; text-align: left; } /*可以单独为不同的左面板设定内容的宽度*/
#panelRight { margin-left: 230px; /*这个margin-left的值是左面板的宽度加上横向padding的(15*2)，所以是230*/ }
/*功能4*/
</style>
<script>
A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
$(function() {
	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,240);
	})
	
	
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
	    //当复选框去掉选中状态后，将全选按钮的选择状态去掉（即去掉全选复选框的选中状态）
		if(!this.checked){
		   $checkAllUsersBox[0].checked=false;
		}
		//如果复选框的总数与选中状态的复选框数量相同，则表明当前页面中的所有复选框均被选中，然后将全选复选框的选中状态设为选中
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) {
		  $checkAllUsersBox[0].checked=true;
		}
		//设置全选复选框触发change事件
		$checkAllUsersBox.trigger("change");

/*
		//如果处于选中状态的复选框个数大于0
		if($checkboxes.filter(":checked").size() >0){
		   values = "";
		   for(var i=0; i<$checkboxes.filter(":checked").size(); i++){
		      values = values +  $checkboxes.filter(":checked")[i].value  + ",";
		   }
		}else{
		    values = "";
		}
*/
	});
	

	
	//全选复选框的单击事件
	$checkAllUsersBox.click(function(){
	    //当全选复选框处于选中或非选中状态时，循环处理每个复选框的状态，即当全选复选框当前的状态循环赋给每个复选框
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");

		});
		/*
		//当全选复选框处于选中状态时，将所有复选框的值都拼到一起
		if($checkAllUsersBox[0].checked){
		   values = "";
		   for(var i=0; i<$checkboxes.size(); i++){
			  values = values +  $checkboxes[i].value  + ",";
		   }
		}else{
		   values = "";
		}
		//alert(values);
		*/
	});	
	
	
	
	
	//功能5
	//功能9
	var name = $( "#vname" ),
		desc = $( "#iorder" ),
		allFields = $( [] ).add( name ).add( desc ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips.html( t ).addClass( "ui-state-highlight" );
		tips.removeClass( "ui-state-highlight", 1500 );
		$("#input.error").removeClass("error");
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
		if (!(regexp.test( o.val()))) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
			return false;
		} else {
			return true;
		}
	}
	function showRegexp( n ) {
		o.addClass( "error" ).focus();
		updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
	}
	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 400,
		width: 450,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var bValid = true;
				var statusListid = $("#statusListid").val();
				allFields.removeClass( "error" );
				//将选中的角色的id使用逗号（,）拼接在一起
		        var count =0;
				var ids="";
				var r1 = document.getElementsByName('users');
				for(i=0; i<r1.length; i++){
					if(r1[i].checked == true){
						count++;
						ids += r1[i].value + ",";
					}
				}
				if(statusListid==null || statusListid==""){
					bValid = false;
					showRegexp("请选择学籍状态！");
				}
				if(count == 0){
					bValid = false;
					showRegexp("请至少选择一个学生状态！");
				}
				if(bValid){
					$("#stustatusid").val(statusListid);
					$("#studentid").val(ids);
					$( "#roleForm" ).submit();
				}
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				updateTips("");
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});

     //新建关系
	$("#modalDialogButton1").click(function(){
		$( "#dialogForm1" ).dialog( "open" );
	});
     
    //删除关系
	$("#modalDialogButton2").click(function(){
        //将选中的用户账号的id使用逗号（,）拼接在一起
        var count =0;
		var ids="";
		var r1 = document.getElementsByName('checkboxName');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				ids += r1[i].value + ",";
			}
		}
		
		if(count == 0){
			$("#dialogForm3Warning").html("<br/>请选择要删除的用户账号！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的删除操作
		$("#ids").val(ids);
		$( "#dialogForm2" ).dialog( "open" );  //dialogForm2：专门用于进行删除的提示警告信息
	});
	
	$("#modalDialogButton3").click(function(){//刷新
		$("#searchKey").val("");
		$("#searchKey1").val("");
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton4").click(function(){//查询
		$("#searchKey").val($("#searchStauid").val());
		$("#searchKey1").val($("#searchstuid").val());
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
				//var search=removeURLArgument(self.location.search,"statusMsg");
				//self.location.search=search;
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
	function removeURLArgument(str,args){
	  var argsArray=str.substring(1).split("&");
	  var result="?";
	  for(var i=0;i<argsArray.length;i++){
		  if(i==argsArray.length-1){
			  if(argsArray[i].indexOf(args)<0)
				  result+=argsArray[i];
		  }else{
			  if(argsArray[i].indexOf(args)<0)
				  result+=argsArray[i]+"&";		
		  }
	  }
	  return result;
  }
});

</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c014714a1e0b9000a</s:param>
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
	<button id="modalDialogButton1" class="green" primary="ui-icon-button-addperson">学籍状态与学生状态关系绑定</button>
	
	<button class="normal barLeft" id="modalDialogButton2">删除关系</button>
</s:if>	
	<button class="normal <s:if test="#r==null || #r==0">barMiddle</s:if><s:else>barLeft</s:else>" id="modalDialogButton3">全部</button>
	

	<!--<label for="searchStatus">学籍状态：</label>-->
		<div class="dropDownList barMiddle">
			<button>学籍状态</button><span class="bar"></span>
			<ul><li>
				<s:iterator value="statusList">
					<a href="searchListStudentStatusAction.do?key=${VId}" val="${VId}" class="inline" style="width: 75px;"><span id="${VId}" class="ui-icon ui-icon-bullet"></span>${VName}</a>
				</s:iterator>
                </li> 
			</ul>
			<input type="hidden" id="searchStauid" name="foldConfig_id002" value="${key}" />
		</div>
	<!--<label for="searchStatus">学生状态：</label>-->
		<div class="dropDownList barRight">
			<button>学生状态</button><span class="bar"></span>
			<ul><li>
				<s:iterator value="studentstaList">
					<a href="searchListStudentStatusAction.do?key1=${VId}" val="${VId}" class="inline" style="width: 75px;"><span class="ui-icon ui-icon-bullet"></span>${VName}</a>
				</s:iterator>
                </li> 
			</ul>
			<input type="hidden" id="searchstuid" name="foldConfig_id002" value="${key1}" />
		</div>


</div>


<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="39"></th>
				<th width="100"></th>
				<th width="100"></th>
				<th width="100"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">学籍状态</th>
				<th class="thSortableGray">学生状态</th>
				<th class="thSortableGray">创建人</th>
				<th class="thSortableGray">创建时间</th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="list">
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td class="searchRange" title="${TDictionByVStuStatusid.VName}">${TDictionByVStuStatusid.VName}</td>
				<td class="searchRange" title="${TDictionByVStudentid.VName}">${TDictionByVStudentid.VName}</td>
				<td class="searchRange" title="${TUser.VUsername}">${TUser.VUsername}</td>
				<td class="searchRange" title="${DCreatetime}"><s:date name="DCreatetime" format="yyyy-MM-dd" /></td>
				</td>
			  </tr>
			</s:iterator> 
			</tbody>
		</table>


	</div>

</div>

</div>

</div></div>


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

<form  action="deleteSSStudentStatusAction.do" method="post" id="deleteForm">
    <input name="ids" type="hidden" id="ids">
    <input type="hidden" name="key" value="${key}"/>
    <input type="hidden" name="key1" value="${key1}"/>
</form>

<form  action="searchListStudentStatusAction.do" method="post" id="searchForm">
  <input name="key" type="hidden" id="searchKey">
  <input name="key1" type="hidden" id="searchKey1">
</form>

<!-- 部门管理 -->
<div id="dialogForm1" title="新建学生与学籍状态关系">
	<p class="validateTips">请填写所有信息</p>
	<span class="panelLine"></span>
		<label for="TDictionByVStuStatusid">学籍状态：</label>
		<div class="dropDownList">
			<button>请选择</button>
			<ul><li>
				<s:iterator value="statusList">
					<a href="#N" val="${VId}" class="inline" style="width: 75px;"><span class="ui-icon ui-icon-bullet"></span>${VName}</a>
				</s:iterator>
                </li> 
			</ul>
			<input type="hidden" id="statusListid" name="foldConfig_id002" value="" />
		</div>
		
		<span class="panelLine"></span>
		<label style="line-height:21pt; float: left">学生状态：</label>
		<div style="line-height:21pt; margin-left:60px;">
			<s:iterator value="studentstaList" status="i">
				<input name="users" type="checkbox" value="${VId}"><b></b><a href="#N" class="inline" style="width: 140px;">${VName}</a>
				<s:if test="#i.count%2==0"><br></s:if>
			</s:iterator> 
		</div>
</div>
<form id="roleForm" method="post" action="addSSStudentStatusAction.do">
	<input type="hidden" name="sasr.VId" id="VId"/>
	<input type="hidden" name="sasr.TDictionByVStuStatusid.VId" id="stustatusid"/>
	<input type="hidden" name="sasr.TDictionByVStudentid.VId" id="studentid" />
	<input type="hidden" id="key" name="key" value="${key}"/>
	<input type="hidden" id="key1" name="key1" value="${key1}"/>
</form>
<%@ include file="../../result.jsp"%>
<script>

function selectAll(name) { 
	var el = document.getElementsByName("contractIdList"); 
	for (var i = 0; i < el.length; i++) { 
		if(el[i].type == "checkbox" && el[i].name == name) { 
			el[i].checked = true; 
		} 
	} 
} 
function clearAll(name) { 
	var el = document.getElementsByName("contractIdList"); 
	for (var i = 0; i < el.length; i++) { 
		if(el[i].type == "checkbox" && el[i].name == name) { 
			el[i].checked=false; 
		} 
	} 
} 
function isSelectALL(){
	var checkBoxButton = document.getElementsByName("isCheckBoxButton");
	if(checkBoxButton[0].checked){
		selectAll('contractIdList');
	}else{
		clearAll('contractIdList');
	}
}
function setIsCheckBoxButtonChecked(){
	var el = document.getElementsByName("contractIdList"); 
	var checkBoxButton = document.getElementsByName("isCheckBoxButton");
	var checkedButtonNum = 0;
	for (var i = 0; i < el.length; i++) { 
		if(el[i].checked){
			checkedButtonNum++;
		}else{
			checkedButtonNum--;
		}
	}
	if(checkedButtonNum == el.length){
		checkBoxButton[0].checked = true;
	}else{
		checkBoxButton[0].checked = false;
	}

}



//用于显示添加、修改、删除等的提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		$("#dialogForm4Span").html("<br/>"+operateResult);
		$( "#dialogForm4" ).dialog( "open" );//dialogForm4：用于显示操作成功后返回提示页面
	}
});

</script>

</body>
</html>
