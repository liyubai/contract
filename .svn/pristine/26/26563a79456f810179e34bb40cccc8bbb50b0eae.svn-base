<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文件管理</title>

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
/*功能9*/

</style>

<script>
//用于存储选中的复选框的value值
//var values = "";
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
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
	//功能9
	var name = $( "#vname" ),
		desc = $( "#vdescription" ),
		allFields = $( [] ).add( name ).add( desc ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips.html( t ).addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		},0 );
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

	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//确定按钮的处理代码段：
				var bValid = true;
				allFields.removeClass( "error" );

				bValid = bValid && checkLength( name, "文件标题", 1, 100);
				bValid = bValid && checkLength( desc, "文件简介", 1, 100);
      
				if ( bValid ) {

				   // $("#cvname").val($("#vname").val());
					//$("#cvdescription").val($("#vdescription").val());
					alert($("#vname").val() + "," + $("#vdescription").val());
					$("#tFileForm").submit();
					
					$( this ).dialog( "close" );
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

     //新建文件
	$("#modalDialogButton1").click(function(){
	    
		//$( "#dialogForm1" ).dialog( "open" );
		$("#tFileForm").submit();
	});

    //删除文件
	$("#modalDialogButton2").click(function(){
        //将选中的角色的id使用逗号（,）拼接在一起
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
			$("#dialogForm3Warning").html("<br/>请选择要删除的文件！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的删除操作
		$("#filesidsStr").val(ids);
		$( "#dialogForm2" ).dialog( "open" );  //dialogForm2：专门用于进行删除的提示警告信息

	});
	
	$("#modalDialogButton3").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton4").click(function(){//查询
		$("#searchKey").val($("#fName").val());
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

	//编辑文件
    function execEdit(rid){
		//通过json读取字典对象
		params = {"id":rid};

		$.ajax({
			type:"post",
			url:"searchRoleById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值

				$("#VId").val(data.VId);
				$("#vname").val(data.VName);
				$("#vdescription").val(data.VDescription);

                
				$("#dialogForm1").dialog('option', 'title', '编辑文件');
				$("#tFileForm").attr("action","updateTFile.do");
				$("#dialogForm1").dialog( "open" );

			},
			error:function(){
				//alert("数据库连接错误，获取对象失败，请重试。");
				$("#dialogForm3Warning").html("<br/>数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
	}
	
	//查看文件
    function viewFileInfo(fid){
	   $("#viewVId").val(fid);
	
		$("#viewFileForm").submit();
	}
	//编辑文件
    function editFileInfo(fid){
	   $("#editVId").val(fid);
	
		$("#editTFileForm").submit();
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
	<button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建文件</button>
	
	<button class="normal barLeft" id="modalDialogButton2">删除文件</button></s:if>
	
	<button class="normal <s:if test="#r==null || #r==0">barRight</s:if>" id="modalDialogButton3">刷新</button>
		
    <div class="buttonInput relative left" width="180" height="28">
     <input id="fName" name="fName"  type="text" maxlength="50" value="${key}"/><button id="modalDialogButton4" title="输入文件标题">查询</button>
    </div>

</div>






<div class="Panel ui-corner-all-0" id="Panel2">


	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="500"></th>
				<th width="140"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">文件标题</th>
				<th class="thSortableGray">创建时间</th>
				<th class="thSortableGray">操作</th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="page.data">
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td><a href="javascript:viewFileInfo('${VId}')" class="blue">${VTitle}</a></td>
				<td><s:date name="DCreateDate" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td>
				<s:if test="#r==null || #r==0"><a href="javascript:editFileInfo('${VId}')" class="blue">修改</a>&nbsp;&nbsp;</s:if><a href="javascript:viewFileInfo('${VId}')" class="blue">查看</a>
				 </td>
			  </tr>
			</s:iterator> 
			
            <s:iterator value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
				<td></td>
				<td></td>
				<td></td>
			  </tr>
              </s:iterator>
			  
			</tbody>
		</table>
<!-- 分页导航 --><s:include value="../common/pagination_system.jsp" /><!-- 分页导航 end -->


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

<form id="tFileForm" action="open_addfileInfo.do"></form>

<form id="editTFileForm" method="post" action="searchTFileById.do">
	<input type="hidden" name="id" id="editVId"/>
	<input type="hidden" name="ediOrViewFlag" value="edit" />
	<input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="pageIndex" value="${pageIndex}"/>
	
</form>

<form id="viewFileForm" method="post" action="searchTFileById.do">
	<input type="hidden" name="id" id="viewVId"/>
	<input type="hidden" name="ediOrViewFlag" value="view" />
	<input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="pageIndex" value="${pageIndex}"/>
	
</form>

<form  action="searchTFiles.do" method="post" id="searchForm">
  <input name="key" type="hidden" id="searchKey">
</form>
<form  action="deleteTFile.do" method="post" id="deleteForm">
    <input name="fileids" type="hidden" id="filesidsStr">
    <input type="hidden" name="key" value="${key}"/>
    <input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>

<%@ include file="../../result.jsp"%>

<script>
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
