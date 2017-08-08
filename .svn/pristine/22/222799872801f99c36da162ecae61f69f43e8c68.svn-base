<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>政策法规量化信息管理</title>

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
	//"button").css("width","130px")：button宽度变大
	$("div.dropDownList").find("button").css("width","130px").end().each(function(i){
		new $.dropDownList(i,true,130);//下拉列表宽度变大
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

	});
	

	
	//全选复选框的单击事件
	$checkAllUsersBox.click(function(){
	    //当全选复选框处于选中或非选中状态时，循环处理每个复选框的状态，即当全选复选框当前的状态循环赋给每个复选框
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");

		});
	});
	//功能9
	var name = $( "#vname" ),
		desc = $( "#adictypeid" ),
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
	function checkNum(str){ //数字
		return str.match(/\D/)==null 
	}
  
	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 450,
		width: 550,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//确定按钮的处理代码段：
				var bValid = true;
				allFields.removeClass( "error" );
				
				//取得政策法规类型对象
				var lawstypeidObj = $("#lawstypeid");
				//取得政策法规内容对象
	            var vcontObj = $("#vcont");
				//取得内容时长类型对象
				var contenttypeidObj = $("#contenttypeid");
				//取得内容时长对象
	            var contentLengthObj = $("#contentLength");
				//取得限制时长对象
	            var limitLengthObj = $("#limitLength");
				
				
               // alert(dicInfo + ", " + dictypeid);
				bValid = bValid && checkLength(lawstypeidObj, "政策法规类型", 1, 50);
				bValid = bValid && checkLength(vcontObj, "政策法规内容", 3, 400);
				bValid = bValid && checkLength(contenttypeidObj, "内容时长类型", 1, 20);
				bValid = bValid && checkLength(contentLengthObj, "内容时长信息", 1, 20);
				bValid = bValid && checkLength(limitLengthObj, "限制时长信息", 1, 20);
				
				
				
                //alert(bValid);
				if ( bValid ) {

				    $("#clawstype").val($("#lawstypeid").val());
					$("#cvcontent").val($("#vcont").val());
					$("#ccontenttype").val($("#contenttypeid").val());
					$("#cvcontentlength").val($("#contentLength").val());
					$("#climitlength").val($("#limitLength").val());
					
					if(!checkNum($("#cvcontentlength").val())){
						alert("内容时长应为数字。");
						$("#contentLength").focus();
						return false;
					}
					if(!checkNum($("#climitlength").val())){
						alert("限制时长应为数字。");
						$("#limitLength").focus();
						return false;
					}

					$("#lawsInfoForm").submit();
					
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

     //新建政策法规量化信息
	$("#modalDialogButton1").click(function(){
	
        $("#VId").val("");
		$("#lawstypeid").val(0);
		$("#vcont").val("");
		$("#contenttypeid").val(0);
		$("#contentLength").val("");
		$("#limitLength").val("");
		
		$("#lawstypeid").change(); 
		$("#contenttypeid").change(); 
		
		
		$("#dialogForm1").dialog('option', 'title', '新建政策法规信息');
		$("#lawsInfoForm").attr("action","savePolicyLawsInfo.do");
	
	
	
	    $("#lawstypeid").change(); 
		$("#contenttypeid").change(); 

		$( "#dialogForm1" ).dialog( "open" );
	});

    //删除政策法规量化信息
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
			$("#dialogForm3Warning").html("<br/>请选择要删除的政策法规量化信息！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的删除操作
		$("#lawsInfoidsStr").val(ids);
		$( "#dialogForm2" ).dialog( "open" );  //dialogForm2：专门用于进行删除的提示警告信息
		 
		 
		   
		
	});
	
	$("#modalDialogButton3").click(function(){//刷新
		$("#searchKey").val("");
		$("#searchlawstypeid").val("");
		$("#searchcontenttypeid").val("");
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton4").click(function(){//查询
	
	    var keyvalue = $("#lawsInfo").val();
		if(keyvalue == '政策法规内容'){
		   keyvalue = "";		
		}
	
		$("#searchKey").val(keyvalue);
		$("#searchlawstypeid").val($("#searchlawstypeidForFront").val());
		$("#searchcontenttypeid").val($("#searchcontenttypeidForFront").val());
		
		
		
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

     //查看政策法规内容窗口
	$( "#dialogContent" ).dialog({
		autoOpen: false,
		height: 450,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});

});

	//编辑政策法规量化信息
    function execEdit(rid){
		//通过json读取字典对象
		params = {"id":rid};

		$.ajax({
			type:"post",
			url:"searchPolicyLawsInfoByIdForEditAndView.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值

				$("#VId").val(data.VId);
				$("#lawstypeid").val(data.IType);
				$("#vcont").val(data.VContent);
				$("#contenttypeid").val(data.IContentType);
				$("#contentLength").val(data.IContentTime);
				$("#limitLength").val(data.ILimitTime);
				
				$("#lawstypeid").change(); 
				$("#contenttypeid").change(); 
                
				
				$("#dialogForm1").dialog('option', 'title', '编辑政策法规信息');
				$("#lawsInfoForm").attr("action","updatePolicyLawsInfo.do");
				
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
	
	//查看政策法规量化信息
	function viewLaws(pid){
	   //通过json读取字典对象
		params = {"id":pid};

		$.ajax({
			type:"post",
			url:"searchPolicyLawsInfoByIdForEditAndView.do",
			data:params,
			dataType:"json",
			success:function(data){
			
				if(data==null){
					$("#dialogForm3Warning").html("获取信息失败，信息不存在!");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}else{
				
				    var lawsType = "";
					
					var contentType = "";
					//法规类型
					if(data.IType == 0){
					    lawsType = "教员飞行时间限制";
					}else if(data.IType == 1){
					    lawsType = "教员教学时间限制";
					}else if(data.IType == 2){
					    lawsType = "飞行学员时间限制";
					}else{
					    lawsType = "未知";
					}

					//内容时长类型
					if(data.IContentType == 0){
					    contentType = "小时";
					}else if(data.IContentType == 1){
					    contentType = "天";
					}else if(data.IContentType == 2){
					    contentType = "周";
					}else if(data.IContentType == 3){
					    contentType = "月";
					}else if(data.IContentType == 4){
					    contentType = "年";
					}else{
					    contentType = "未知";
					}					
					
					//将内容中的\n替换成<br>，以便正常显示
					 var cont = data.VContent.replace(/\n/g,"<br/>")

					
                    var content = "";
				    content += "<tr>";
				    content += "<td height=\"24\" width=\"15%\">法规类型：</td><td width=\"45%\">" + lawsType + "</td>";
				    content += "<td width=\"15%\">时长类型：</td><td width=\"25%\">" + contentType + "</td>";
				    content += "</tr>";
					content+="<tr>";
					content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
					content+="</tr>"
					
				    content += "<tr>";
				    content += "<td height=\"24\">内容时长：</td><td>" + data.IContentTime + "</td>";
				    content += "<td>限制时长：</td><td>" + data.ILimitTime + "</td>";
				    content += "</tr>";
					content+="<tr>";
					content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
					content+="</tr>"
					
					content+="<tr>";
					content+="<td>法规内容：</td>";
					content+="<td  height=\"24\" colspan=\"3\">"+cont+"</td>";
					content+="</tr>"
					
					$("#contentid").html(content);
					$( "#dialogContent" ).dialog( "open" );
				}

			},
			error:function(){
				//alert("数据库连接错误，获取对象失败，请重试。");
				$("#dialogForm3Warning").html("<br/>数据库连接错误，获取对象失败，请重试。");
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
	<button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建政策法规</button>
	
	<button class="normal barLeft" id="modalDialogButton2">删除政策法规信息</button>
</s:if>	
	<button class="normal <s:if test="#r==null || #r==0">barMiddle</s:if><s:else>barLeft</s:else>" id="modalDialogButton3">刷新</button>
<!--<label for="searchlawstypeidForFront">政策法规类型：</label>-->
	<div class="dropDownList barMiddle">
	<button></button><span class="bar"></span>
	<ul>
	  <li><a href="#N" val="10"><span id="10" class="ui-icon ui-icon-bullet"></span>全部法规类型</a></li>
	  <li><a href="#N" val="0"><span id="0"></span>教员飞行时间限制</a></li>
	  <li><a href="#N" val="1"><span id="1"></span>教员教学时间限制</a></li>
	  <li><a href="#N" val="2"><span id="2"></span>飞行学员时间限制</a></li>
	  <input type="hidden"  id="searchlawstypeidForFront" value="${searchlawstypeid}" />
	</ul>
	
	</div>

	<!--<label for="searchcontenttypeidForFront">内容时长类型：</label>-->
	<div class="dropDownList barRight">
	<button></button><span class="bar"></span>
	<ul>
	  <li><a href="#N" val="10"><span id="10" class="ui-icon ui-icon-bullet"></span>全部内容时长类型</a></li>
	  <li><a href="#N" val="0"><span id="0"></span>小时</a></li>
	  <li><a href="#N" val="1"><span id="1"></span>天</a></li>
	  <li><a href="#N" val="2"><span id="2"></span>周</a></li>
	  <li><a href="#N" val="3"><span id="3"></span>月</a></li>
	  <li><a href="#N" val="4"><span id="4"></span>年</a></li>
	  <input type="hidden"  id="searchcontenttypeidForFront" value="${searchcontenttypeid}" />
	</ul>
	
	</div>

    <div class="buttonInput relative left" width="180" height="28">

	 
	  <s:if test="key==null || key == ''">
       <input id="lawsInfo" name="lawsInfo"  type="text" maxlength="50" value="政策法规内容" title="政策法规内容"/>  
	  </s:if>
	  <s:else>
	     <input id="lawsInfo" name="lawsInfo"  type="text" maxlength="50" value="${key}"   title="政策法规内容"/>  
	  </s:else>
	  
	 <button id="modalDialogButton4" title="输入政策法规信息">查询</button>
    </div>

</div>






<div class="Panel ui-corner-all-0" id="Panel2">


	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="60"></th>
				<th width="130"></th>
				<th width="150"></th>
				<th width="100"></th>
                <th width="70"></th>
				<th width="70"></th>
                <th width="140"></th>
				<th ></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">序&nbsp;&nbsp;号</th>
				<th class="thSortableGray">法规类型</th>
				<th class="thSortableGray">内容简介</th>
				<th class="thSortableGray">内容时长类型</th>
				<th class="thSortableGray">内容时长</th>
				<th class="thSortableGray">限制时长</th>
				<th class="thSortableGray">创建时间</th>
				<th class="thSortableGray">操&nbsp;&nbsp;作</th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="page.data">
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td class="searchRange">${INo}</td>
				<td class="searchRange">
				  <s:if test="IType == 0">
				      教员飞行时间限制
				  </s:if>
				  <s:elseif test="IType == 1">
				      教员教学时间限制
				  </s:elseif>
				  <s:elseif test="IType == 2">
				      飞行学员时间限制
				  </s:elseif>
				  <s:else>
				      未知
				  </s:else>
				
				</td>
				<td class="searchRange" title="${VContent}">
					<s:if test="VContent.length()>15"> 
					   <s:property value='VContent.substring(0,15)'/>... 
					</s:if>     
					<s:else>           
					   <s:property value='VContent'/>
				    </s:else>  
				</td>
				<td class="searchRange">
                  <s:if test="IContentType == 0">
				     小时
				  </s:if>
				  <s:elseif test="IContentType == 1">
				     天
				  </s:elseif>
				  <s:elseif test="IContentType == 2">
				     周
				  </s:elseif>
				  <s:elseif test="IContentType == 3">
				     月
				  </s:elseif>
				  <s:elseif test="IContentType == 4">
				     年
				  </s:elseif>
				  <s:else>
				     未知
				  </s:else>
				</td>
				<td class="searchRange">${IContentTime}</td>
				<td class="searchRange">${ILimitTime}</td>
				<td class="searchRange">
				   <s:date name="DCreatedate" format="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td class="searchRange">
				    <s:if test="#r==null || #r==0"><a href="javascript:execEdit('${VId}')" class="blue">修改</a>&nbsp;&nbsp;</s:if>
				    <a href="javascript:viewLaws('${VId}')" class="blue">查看</a>
				</td>
				
				
			  </tr>
			</s:iterator> 
            <s:iterator value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
              </s:iterator>
			</tbody>
		</table>
<!-- 分页导航 --><s:include value="../common/pagination_system.jsp" /><!-- 分页导航 end -->


	</div>

</div>

</div>

</div></div>


<div id="dialogForm1"  title="新建政策法规信息">
	<p class="validateTips" >请填写所有信息</p>

    <span class="panelLine"></span>
		类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：
        <div class="dropDownList">
		  <button></button>
			<ul>
	
				  <li><a href="#N" val="0"><span id="0" class="ui-icon ui-icon-bullet"></span>教员飞行时间限制</a></li>
				  <li><a href="#N" val="1"><span id="1"></span>教员教学时间限制</a></li>
				  <li><a href="#N" val="2"><span id="2"></span>飞行学员时间限制</a></li>
				  <input type="hidden"  id="lawstypeid" value="0" />
			</ul>
		
    	</div>
		<span class="panelLine"></span>
    	内容信息：
		<textarea id="vcont" style="width:350px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea>
        <span class="panelLine"></span>
        时长类型：
        <div class="dropDownList">
			<button></button>
			<ul>
	
				  <li><a href="#N" val="0"><span id="0" class="ui-icon ui-icon-bullet"></span>小时</a></li>
				  <li><a href="#N" val="1"><span id="1"></span>天</a></li>
				  <li><a href="#N" val="2"><span id="2"></span>周</a></li>
				  <li><a href="#N" val="3"><span id="3"></span>月</a></li>
				  <li><a href="#N" val="4"><span id="4"></span>年</a></li>
				  <input type="hidden"  id="contenttypeid" value="0" />
			</ul>
		</div>
		<span class="panelLine"></span>
        内容时长：
		<input type="text" name="contentLength" id="contentLength" class="text ui-widget-content ui-corner-all" style="width:350px;" />
		<span class="panelLine"></span>
		限制时长：
		<input type="text" name="limitLength" id="limitLength" class="text ui-widget-content ui-corner-all"  style="width:350px;"/>
    	
	
</div>

<!--
<div id="dialogFormForEdit"  title="编辑政策法规信息">
	<p class="validateTips" >请填写所有信息</p>
    
	<fieldset>
    <span class="panelLine"></span>
		<label for="lawstypeidForEdit">政策法规类型：</label>
        <div class="dropDownList">
			<button></button>
			<ul>
	
				  <li><a href="#N" val="0"><span id="0" class="ui-icon ui-icon-bullet"></span>教员飞行时间限制</a></li>
				  <li><a href="#N" val="1"><span id="1"></span>教员教学时间限制</a></li>
				  <li><a href="#N" val="2"><span id="2"></span>飞行学员时间限制</a></li>
				  <input type="hidden"  id="lawstypeidForEdit" value="0" />
			</ul>
		
    	</div><br/>
		<span class="panelLine"></span>
    	<label for="vname">内容信息：</label>
		<textarea id="vcontForEdit" style="width:470px;height:220px;" class="text ui-widget-content ui-corner-all"></textarea><br/>
        <label for="contenttypeidForEdit">内容时长类型：</label>
        <div class="dropDownList">
			<button></button>
			<ul>
	
				  <li><a href="#N" val="0"><span id="0" class="ui-icon ui-icon-bullet"></span>小时</a></li>
				  <li><a href="#N" val="1"><span id="1"></span>天</a></li>
				  <li><a href="#N" val="2"><span id="2"></span>周</a></li>
				  <li><a href="#N" val="3"><span id="3"></span>月</a></li>
				  <li><a href="#N" val="4"><span id="4"></span>年</a></li>
				  <input type="hidden"  id="contenttypeidForEdit" value="0" />
			</ul>
		</div>
		<span class="panelLine"></span>
        <label for="vname">内容时长</label>
		<input type="text" name="contentLengthForEdit" id="contentLengthForEdit" class="text ui-widget-content ui-corner-all" />
		<span class="panelLine"></span>
		<label for="vpass">限制时长</label>
		<input type="text" name="limitLengthForEdit" id="limitLengthForEdit" class="text ui-widget-content ui-corner-all" />
    	
	</fieldset>
	
</div>
-->



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

<div id="dialogContent"  title="政策法规内容详单">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>
<form id="lawsInfoForm" method="post" action="savePolicyLawsInfo.do">
	
	<input type="hidden" name="laws.IType" id="clawstype" />
	<input type="hidden" name="laws.VContent" id="cvcontent" />
	<input type="hidden" name="laws.IContentType" id="ccontenttype" />
	<input type="hidden" name="laws.IContentTime" id="cvcontentlength" />
	<input type="hidden" name="laws.ILimitTime" id="climitlength" />
	
	<input type="hidden" name="laws.VId" id="VId"/>
	<input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="searchlawstypeid" value="${searchlawstypeid}"/>
	<input type="hidden" name="searchcontenttypeid" value="${searchcontenttypeid}"/>
	<input type="hidden" name="pageIndex" value="${pageIndex}"/>
	
</form>


<form  action="searchPolicyLawsInfos.do" method="post" id="searchForm">
  	<input type="hidden" name="key" value="${key}"  id="searchKey"/>
	<input type="hidden" name="searchlawstypeid" id="searchlawstypeid" value="${searchlawstypeid}"/>
	<input type="hidden" name="searchcontenttypeid" id="searchcontenttypeid" value="${searchcontenttypeid}"/>
</form>
<form  action="deletePolicyLawsInfo.do" method="post" id="deleteForm">
    <input name="lawsids" type="hidden" id="lawsInfoidsStr">
	<!-- 查询关键字 -->
    <input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="searchlawstypeid" value="${searchlawstypeid}"/>
	<input type="hidden" name="searchcontenttypeid" value="${searchcontenttypeid}"/>
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
