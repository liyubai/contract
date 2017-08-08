<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>创建学生信息</title>
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
<script src="scripts/isChinaIDCard.js"></script>

<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
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

	$("div.dropDownList").find("button").css("width","112px").end().each(function(i){
	
		if(i==3){var d=new $.dropDownList(i,true,240);}
		else if(i==7){var d=new $.dropDownList(i,true,460);}
		else if(i==6){var d=new $.dropDownList(i,true,240);}
		else if(i==9){var d=new $.dropDownList(i,true,340);}
		else if(i==10){var d=new $.dropDownList(i,true,260);}
		else if(i==12){var d=new $.dropDownList(i,true,340);}
		else{new $.dropDownList(i,true,112);}

	})
	/*
	$("#uploadimg").click(function(){
		$("#upload").val("");
		$( "#uploadDialogForm" ).dialog("open");
	});
	$( "#uploadDialogForm" ).dialog({
		autoOpen: false,
		height: 240,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				

				if($("#upload").val()==""){
					alert("请选择照片。");
					return;
				}
				var u=$("#upload").val();

				var doit = u.lastIndexOf(".");
				var g = u.substring(doit,u.length).toLowerCase();
				if(g!=".jpg" && g!=".gif"){
					alert("照片格式错误。");
					return;
				}
				//$("#tFileForm").submit();
				params=$("#tFileForm").serialize();
		
				$.ajax({
					//async:false,//同步请求
					type:"post",
					url:"uploadStudentImg.do",
					data:params,
					dataType:"json",
					success:function(data){
						if(!data.flag){
							alert(data.message);
							return;
						}
						//alert(data.message);
					},
					error:function(){
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	*/
	$("#escid0").click(function(){
		window.location.replace("open_studentBaseInfoList.do");
	});
	
	$("#cVCardid").blur(function(){
		/*
		if($.trim($("#cVCardid").val()) == "" ){
			alert("身份证号不能为空。");
			$("#cVCardid").focus();
			return false;
		}
		*/

		if($.trim($("#cVCardid").val()) == "" ){
			return false;
		}
		if(!isChinaIDCard($.trim($("#cVCardid").val()))){
			$("#cVCardid").focus();
			return false;
		}
		var birth = getBirthById($.trim($("#cVCardid").val()));
		if(birth!=""){
			$("#cDBirthday").val(birth);
		}
	});
	
	$("#saveone").click(function(){
		$("#VWhcd").val($("#cVWhcd").val());
		$("#VFreeTypeid").val($("#cVFreeTypeid").val());
		$("#VXjStatusid").val($("#cVXjStatusid").val());
		$("#VNationid").val($("#cVNationid").val());
		$("#VFormid").val($("#cVFormid").val());
		$("#VStuStatusid").val($("#cVStuStatusid").val());
		$("#VStuTypeid").val($("#cVStuTypeid").val());
		$("#VCompanyid").val($("#cVCompanyid").val());
		$("#VCode").val($.trim($("#cVCode").val()));
		$("#VName").val($.trim($("#cVName").val()));
		$("#VCardid").val($.trim($("#cVCardid").val()));
		$("#VClassNoid").val($("#cVClassNoid").val());
		$("#VGender").val($("#cVGender").val());
		$("#VSyd").val($("#cVSyd").val());
		$("#DRxsj").val($("#cDRxsj").val());
		$("#DLxsj").val($("#cDLxsj").val());
		$("#VJtzz").val($("#cVJtzz").val());
		$("#VZzmm").val($("#cVZzmm").val());
		$("#VByyx").val($("#cVByyx").val());
		$("#VEnlevel").val($("#cVEnlevel").val());
		$("#VZy").val($("#cVZy").val());
		$("#VLxfs").val($("#cVLxfs").val());
		$("#VJg").val($("#cVJg").val());
		
		if($("#VName").val() == "" ){
			alert("学生姓名不能为空。");
			//$("#cVName").css({"border":"1px solid red"});
			$("#cVName").focus();
			return false;
		}else{
			//$("#cVName").css({"border":"0px"});
		}
		if(!isChineseName($("#VName").val())){
			alert("姓名格式非法-汉字姓名,长度在[2-10]");
			$("#cVName").focus();
			return false;
		}
		if($("#VGender").val() == "" ){
			alert("请选择性别。");
			$("#cVGender").parent().css({"border":"1px solid red"});
			$("#cVGender").focus();
			return false;
		}else{
			$("#cVGender").parent().css({"border":"0px"});
		}
	
		if($.trim($("#VCardid").val()) == "" ){
			alert("身份证号不能为空。");
			$("#cVCardid").focus();
			return false;
		}

		if(!isChinaIDCard($.trim($("#VCardid").val()))){
			$("#cVCardid").focus();
			return false;
		}
		var birth = getBirthById($.trim($("#cVCardid").val()));
		if(birth!=""){
			$("#cDBirthday").val(birth);
		}
		$("#DBirthday").val($("#cDBirthday").val());
		if($("#DBirthday").val() == "" ){
			alert("请选择出生日期。");
			$("#cDBirthday").focus();
			return false;
		}
		if($("#VStuTypeid").val() == "" ){
			alert("请选择学员类型。");
			$("#cVStuTypeid").parent().css({"border":"1px solid red"});
			$("#cVStuTypeid").focus();
			return false;
		}else{
			$("#cVStuTypeid").parent().css({"border":"0px"});
		}

		if(($("#VStuTypeid").val() == "4028aa494765f33d014766018972003e" || 
		 $("#VStuTypeid").val() == "4028aa494765f33d01476601b9f8003f") && $("#VCode").val()==""){
			alert("学号不能为空。");
			$("#cVCode").focus();
			return false;
		}
		if($("#VClassNoid").val()==""){
			alert("请输入班级。");
			$("#cVClassNoid").parent().css({"border":"1px solid red"});
			$("#cVClassNoid").focus();
			return false;
		}else{
			$("#cVClassNoid").parent().css({"border":"0px solid red"});
		}
		if($("#DRxsj").val()==""){
			alert("入校年月不能为空。");
			$("#cDRxsj").focus();
			return false;
		}
		if($("#VStuStatusid").val()==""){
			alert("请选择学生状态。");
			$("#cVStuStatusid").parent().css({"border":"1px solid red"});
			$("#cVStuStatusid").focus();
			return false;
		}else{
			$("#cVStuStatusid").parent().css({"border":"0px solid red"});
		}
		if($("#VFormid").val()==""){
			alert("请选择招生形式。");
			$("#cVFormid").parent().css({"border":"1px solid red"});
			$("#cVFormid").focus();
			return false;
		}else{
			$("#cVFormid").parent().css({"border":"0px solid red"});
		}
		if($("#VFreeTypeid").val()==""){
			alert("请选择费用形式。");
			$("#cVFreeTypeid").parent().css({"border":"1px solid red"});
			$("#cVFreeTypeid").focus();
			return false;
		}else{
			$("#cVFreeTypeid").parent().css({"border":"0px solid red"});
		}
		if($("#VXjStatusid").val()==""){
			alert("请选择学籍状态。");
			$("#cVXjStatusid").parent().css({"border":"1px solid red"});
			$("#cVXjStatusid").focus();
			return false;
		}else{
			$("#cVXjStatusid").parent().css({"border":"0px solid red"});
		}
		if($("#VCompanyid").val()==""){
			alert("请选择所属公司。");
			$("#cVCompanyid").parent().css({"border":"1px solid red"});
			$("#cVCompanyid").focus();
			return false;
		}else{
			$("#cVCompanyid").parent().css({"border":"0px solid red"});
		}
		if($("#VZzmm").val()==""){
			alert("请选择政治面貌。");
			$("#cVZzmm").parent().css({"border":"1px solid red"});
			$("#cVZzmm").focus();
			return false;
		}else{
			$("#cVZzmm").parent().css({"border":"0px solid red"});
		}
		if($("#VNationid").val()==""){
			alert("请选择民族。");
			$("#cVNationid").parent().css({"border":"1px solid red"});
			$("#cVNationid").focus();
			return false;
		}else{
			$("#cVNationid").parent().css({"border":"0px solid red"});
		}
		if($("#VWhcd").val()==""){
			alert("请选择文化程度。");
			$("#cVWhcd").parent().css({"border":"1px solid red"});
			$("#cVWhcd").focus();
			return false;
		}else{
			$("#cVWhcd").parent().css({"border":"0px solid red"});
		}
		if($("#VEnlevel").val()==""){
			alert("请选择英语水平。");
			$("#cVEnlevel").parent().css({"border":"1px solid red"});
			$("#cVEnlevel").focus();
			return false;
		}else{
			$("#cVEnlevel").parent().css({"border":"0px solid red"});
		}

		params=$("#unitSubjectForm").serialize();
		
		//判断是否有冲突的记录
		var d1= 0;
		$.ajax({
			//async:false,//同步请求
			type:"post",
			url:"saveStudentBaseInfo.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(!data.flag){
					alert(data.message);
					return;
				}
				alert(data.message);
				window.location.replace("open_createStudentBaseInfoPage.do");
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		//$("#unitSubjectForm").submit();
	});
	$( "#dialogForm3" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});
function changeValue(id){
	if(id!="4028aa494765f33d014766018972003e" && id!="4028aa494765f33d01476601b9f8003f"){
		$("#cVCode").css("background-color","#E9E9E9");
		$("#cVCode").css("color","#BABABA");
		$("#cVCode").val("系统生成");
		$("#cVCode").attr("readonly",true);
	}else{
		$("#cVCode").css("background-color","#FFFFFF");
		$("#cVCode").css("color","#362B36");
		$("#cVCode").val("");
		$("#cVCode").attr("readonly",false);
	}
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

<div id="topPartD"><div class="panelBox buttonBox">
<button class="green" primary="ui-icon-button-confirm" id="saveone">保存</button>
<button class="normal" id="escid0"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div></div>

<div id="rightPartD"><div>
<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
		
			<tbody>
			  <tr class="normal">
				<td width="60" align="right">姓名：</td>
				<td width="120"><div style="margin-top:5px;"><input id="cVName" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td width="80" align="right">性别：</td>
				<td width="120" ><div class="dropDownList">
						<button>性别</button>
						<ul>
                        		<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
                       		 <li><a href="#N" val="男"><span class="ui-icon ui-icon-bullet"></span>男</a></li>
							<li><a href="#N" val="女">女</a></li>
						</ul>
				  <input type="hidden" id="cVGender" value="" />
				</div></td>
				<td width="70" align="right">身份证号：</td>
				<td width="120"><div style="margin-top:5px;"><input id="cVCardid" type="text" class="text ui-widget-content ui-corner-all" style="width:150px;"/></div></td>
				<td width="70" align="right">出生年月：</td>
				<td><input type="text"  id="cDBirthday" class="Wdate ui-widget-content ui-corner-all text"  style="width:180px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" /></td>
			  </tr>
			  <tr class="normal">
				<td align="right" style="height:39px;">学生类型：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                         <li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
                        <s:iterator value="dictionTypeList">
                        <li><a href="#N" val="${VId}" onClick="changeValue('${VId}')">${VName}</a></li>
                        </s:iterator>
						</ul>
				  <input type="hidden" id="cVStuTypeid" value="" />
				</div></td>
				<td align="right">学号：</td>
				<td><div style="margin-top:5px;"><input id="cVCode" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td align="right">入校班级：</td>
				<td>
				  <input type="text" id="cVClassNoid" class="text ui-widget-content ui-corner-all" style="width:150px;"/><div class="dropDownList"></div>
				</td>
				<td align="right">生源地：</td>
				<td><div style="margin-top:5px;"><input id="cVSyd" type="text" class="text ui-widget-content ui-corner-all" style="width:180px;"/></div></td>
			  </tr>
			  <tr class="normal">
				<td align="right">入校年月：</td>
				<td>
                <input type="text"  id="cDRxsj" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" onKeyPress="return false" onpaste="return false" />
                </td>
				<td align="right">离校年月：</td>
				<td><input type="text"  id="cDLxsj" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" onKeyPress="return false" onpaste="return false" /></td>
				<td align="right">学生状态：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                       		 <li><a href="#N" val=""  class="inline" style="width:75px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
                            
							<s:iterator value="dictionStatusList">
                        <a href="#N" val="${VId}" class="inline" style="width:75px;">${VName}</a>
                        </s:iterator>
							</li>
						</ul>
				  <input type="hidden" id="cVStuStatusid" value="4028aa494765f33d014765f78e55000f" />
				</div></td>
				<td align="right">联系方式：</td>
				<td><div style="margin-top:5px;"><input id="cVLxfs" type="text" class="text ui-widget-content ui-corner-all" style="width:180px;"/></div></td>
			  </tr>
			  <tr class="normal">
				<td align="right">招生形式：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                       		 <li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
						<s:iterator value="dictionFormList">
                        <li><a href="#N" val="${VId}">${VName}</a></li>
                        </s:iterator>
						</ul>
				  <input type="hidden" id="cVFormid" value="" />
				</div></td>
				<td align="right">自费/公费：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                       	<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
						<s:iterator value="dictionFreeTypeList">
                        <li><a href="#N" val="${VId}">${VName}</a></li>
                        </s:iterator>
						</ul>
				  <input type="hidden" id="cVFreeTypeid" value="" />
				</div></td>
				<td align="right">学籍状态：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" style="width:75px;" class="inline"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="dictionXjList">
                        <a href="#N" val="${VId}" style="width:75px;" class="inline">${VName}</a>
                        </s:iterator>
						</li></ul>
				  <input type="hidden" id="cVXjStatusid" value="4028aa494765f33d014765f92fc00019" />
				</div></td>
				<td align="right">毕业院校：</td>
                
				<td><div style="margin-top:5px;"><input id="cVByyx" type="text" class="text ui-widget-content ui-corner-all" style="width:180px;"/></div>
                </td>
			  </tr>
               <tr class="normal">
				<td align="right">所属公司：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                       		 <li><a href="#N" val="" class="inline" style="width:75px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
                            <s:iterator value="dictionCompanyList">
                            <a href="#N" val="${VId}" class="inline" style="width:75px;">${VName}</a>
							</s:iterator>
						</li></ul>
				  <input type="hidden" id="cVCompanyid" value="" />
				</div></td>
				<td align="right">政治面貌：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                       		 <li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
							<li><a href="#N" val="中共党员">中共党员</a></li>
                            <li><a href="#N" val="中共预备党员">中共预备党员</a></li>
							<li><a href="#N" val="共青团员">共青团员</a></li>
                            <li><a href="#N" val="群众">群众</a></li>
						</ul>
				  <input type="hidden" id="cVZzmm" value="" />
				</div></td>
				<td align="right">民族：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" class="inline" style="width:75px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="minzuList">
                            <a href="#N" val="${VId}" class="inline" style="width:75px;">${VName}</a>
							</s:iterator></li>
						</ul>
				  <input type="hidden" id="cVNationid" value="4028aa494765f33d014765fee1a3002f" />
				</div></td>
				<td align="right">家庭住址：</td>
				<td><div style="margin-top:5px;"><input id="cVJtzz" type="text" class="text ui-widget-content ui-corner-all" style="width:180px;"/></div></td>
			  </tr>
                <tr class="normal">
				<td align="right">文化程度：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" class="inline" style="width:50px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="whcdList">
                            <a href="#N" val="${VId}" class="inline" style="width:50px;">${VName}</a>
							</s:iterator></li>
						</ul>
				  <input type="hidden" id="cVWhcd" value="" />
				</div></td>
				<td align="right">英语水平：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                       		<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
                            <li><a href="#N" val="初中水平">初中水平</a></li>
                            <li><a href="#N" val="高中水平">高中水平</a></li>
                            <li><a href="#N" val="英语四级">英语四级</a></li>
                            <li><a href="#N" val="英语六级">英语六级</a></li>
						</ul>
				  <input type="hidden" id="cVEnlevel" value="" />
				</div></td>
				<td align="right">籍贯：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" class="inline" style="width:45px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="jiguanList">
                            <a href="#N" val="${VName}" class="inline" style="width:45px;">${VName}</a>
						  </s:iterator></li>
						</ul>
				  <input type="hidden" id="cVJg" value="" />
				</div></td>
				<td align="right">专业：</td>
				<td><div style="margin-top:5px;"><input id="cVZy" type="text" class="text ui-widget-content ui-corner-all" style="width:180px;"/></div></td>
			  </tr>
                <tr class="normal">
                  <td align="right">照片：</td>
                  <td colspan="4" style="padding-top:6px;"><iframe id="d_file" name="d_file" frameborder=0 src="open_uploadStudentImg.do"   width='390' height='36' scrolling=no></iframe></td>
                  <td><img  id="imgid" width="70" height="100"></td>
                  <td align="right">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
			</tbody>
		</table>

	</div>
</div>


</div>
</div>
<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>

<form id="unitSubjectForm" method="post" action="saveStudentBaseInfo.do">
<input type="hidden" name="student.TDictionByVWhcd.VId" id="VWhcd" />
<input type="hidden" name="student.TDictionByVFreeTypeid.VId" id="VFreeTypeid" />
<input type="hidden" name="student.TDictionByVXjStatusid.VId" id="VXjStatusid" />
<input type="hidden" name="student.TDictionByVNationid.VId" id="VNationid" />
<input type="hidden" name="student.TDictionByVFormid.VId" id="VFormid" />
<input type="hidden" name="student.TDictionByVStuStatusid.VId" id="VStuStatusid" />
<input type="hidden" name="student.TDictionByVStuTypeid.VId" id="VStuTypeid" />
<input type="hidden" name="student.TOrg.VId" id="VCompanyid" />

<input type="hidden" name="student.VName" id="VName" />
<input type="hidden" name="student.VCode" id="VCode" />
<input type="hidden" name="student.VCardid" id="VCardid" />
<input type="hidden" name="student.VClassNoid" id="VClassNoid" />
<input type="hidden" name="student.VGender" id="VGender" />
<input type="hidden" name="student.DBirthday" id="DBirthday" />
<input type="hidden" name="student.VSyd" id="VSyd" />

<input type="hidden" name="student.DRxsj" id="DRxsj" />
<input type="hidden" name="student.DLxsj" id="DLxsj" />
<input type="hidden" name="student.VJtzz" id="VJtzz" />
<input type="hidden" name="student.VZzmm" id="VZzmm" />
<input type="hidden" name="student.VByyx" id="VByyx" />
<input type="hidden" name="student.VEnlevel" id="VEnlevel" />
<input type="hidden" name="student.VZy" id="VZy" />
<input type="hidden" name="student.VLxfs" id="VLxfs" />
<input type="hidden" name="student.VJg" id="VJg" />
<input type="hidden" name="student.photo" id="photoid" />
</form>
<input type="hidden"  id="subjects"/>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
function reloadData(str){
	$("#photoid").val(str);
	//$("#imgid").attr("src","viewOkPhoto.do?srcFileName="+str);
	$("#imgid").attr("src","../attachment/"+str);
}
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>