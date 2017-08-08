<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更多查询</title>
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

	$("#escid0").click(function(){
		var str="";
		var r1=document.getElementsByName('isView');
		for(var i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value;
			}
		}
		window.location.replace("open_moreSeacrhStudentBaseInfoList.do?isView=" + str);
	});

	$("#searchid").click(function(){
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
		$("#DBirthday").val($("#cDBirthday").val());
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
		var str="";
		var r1=document.getElementsByName('isView');
		for(var i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value;
			}
		}
		$("#isview").val(str);
		$("#unitSubjectForm").attr("action","open_moreSeacrhStudentBaseInfoList.do");
		$("#unitSubjectForm").submit();
	});
	$("#importid").click(function(){
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
		$("#DBirthday").val($("#cDBirthday").val());
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
		var str="";
		var r1=document.getElementsByName('isView');
		for(var i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value+",";
			}
		}
		$("#isview").val(str);
		$("#unitSubjectForm").attr("action","downloadStudentBaseInfo.do");
		$("#unitSubjectForm").submit();		
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
<button class="green" id="searchid">查询</button>
<button class="green" id="importid">导出</button>
<button class="normal" id="escid0"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
<div style="padding-top:6px; font-weight:bold; font-size:13px; color:#069">
&nbsp;&nbsp;&nbsp;说明：复选框选中的内容将在列表信息中显示。</div>
</div>
</div></div>

<div id="rightPartD"><div>
<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
		
			<tbody>
			  <tr class="normal">
				<td width="100" align="right"><input type="hidden" name="isView" value="VName"><b></b>姓名：</td>
				<td width="140"><div style="margin-top:5px;"><input id="cVName" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td width="100" align="right"><input type="checkbox" name="isView" value="VGender" checked><b></b>性别：</td>
				<td width="140" ><div class="dropDownList">
						<button>性别</button>
						<ul>
                        		<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
                       		 <li><a href="#N" val="男"><span class="ui-icon ui-icon-bullet"></span>男</a></li>
							<li><a href="#N" val="女">女</a></li>
						</ul>
				  <input type="hidden" id="cVGender" value="" />
				</div></td>
				<td width="100" align="right"><input type="checkbox" name="isView" value="VCardid" checked><b></b>身份证号：</td>
				<td width="140"><div style="margin-top:5px;"><input id="cVCardid" type="text" class="text ui-widget-content ui-corner-all" style="width:150px;"/></div></td>
				<td></td>
			  </tr>
			  <tr class="normal">
				<td align="right" style="height:39px;"><input type="checkbox" name="isView" value="VStuTypeid" checked><b></b>学生类型：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                         <li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
                        <s:iterator value="dictionTypeList">
                        <li><a href="#N" val="${VId}">${VName}</a></li>
                        </s:iterator>
						</ul>
				  <input type="hidden" id="cVStuTypeid" value="" />
				</div></td>
				<td align="right"><input type="hidden" name="isView" value="VCode"><b></b>学号：</td>
				<td><div style="margin-top:5px;"><input id="cVCode" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td align="right"><input type="checkbox" name="isView" value="VClassNoid" checked><b></b>入校班级：</td>
				<td>
				  <input type="text" id="cVClassNoid" class="text ui-widget-content ui-corner-all" style="width:150px;"/><div class="dropDownList"></div>
				</td>
				<td></td>
			  </tr>
			  <tr class="normal">
				<td align="right"><input type="checkbox" name="isView" value="DRxsj" checked><b></b>入校年月：</td>
				<td>
                <input type="text"  id="cDRxsj" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" onKeyPress="return false" onpaste="return false" />
                </td>
				<td align="right"><input type="checkbox" name="isView" value="DLxsj" checked><b></b>离校年月：</td>
				<td><input type="text"  id="cDLxsj" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" onKeyPress="return false" onpaste="return false" /></td>
				<td align="right"><input type="checkbox" name="isView" value="VStuStatusid" checked><b></b>学生状态：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                       		 <li><a href="#N" val=""  class="inline" style="width:75px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
                            
							<s:iterator value="dictionStatusList">
                        <a href="#N" val="${VId}" class="inline" style="width:75px;">${VName}</a>
                        </s:iterator>
							</li>
						</ul>
				  <input type="hidden" id="cVStuStatusid" value="" />
				</div></td>
				<td></td>
			  </tr>
			  <tr class="normal">
				<td align="right"><input type="checkbox" name="isView" value="VFormid" checked><b></b>招生形式：</td>
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
				<td align="right"><input type="checkbox" name="isView" value="VFreeTypeid" checked><b></b>自费/公费：</td>
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
				<td align="right"><input type="checkbox" name="isView" value="VXjStatusid" checked><b></b>学籍状态：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" style="width:75px;" class="inline"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="dictionXjList">
                        <a href="#N" val="${VId}" style="width:75px;" class="inline">${VName}</a>
                        </s:iterator>
						</li></ul>
				  <input type="hidden" id="cVXjStatusid" value=""/>
				</div></td>
    
				<td>
   
                </td>
			  </tr>
               <tr class="normal">
				<td align="right"><input type="checkbox" name="isView" value="TOrg" checked><b></b>所属公司：</td>
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
				<td align="right"><input type="checkbox" name="isView" value="VZzmm" checked><b></b>政治面貌：</td>
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
				<td align="right"><input type="checkbox" name="isView" value="VNationid" checked><b></b>民族：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" class="inline" style="width:75px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="minzuList">
                            <a href="#N" val="${VId}" class="inline" style="width:75px;">${VName}</a>
							</s:iterator></li>
						</ul>
				  <input type="hidden" id="cVNationid" value="" />
				</div></td>
				<td></td>
			  </tr>
                <tr class="normal">
				<td align="right"><input type="checkbox" name="isView" value="VWhcd" checked><b></b>文化程度：</td>
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
				<td align="right"><input type="checkbox" name="isView" value="VEnlevel" checked><b></b>英语水平：</td>
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
				<td align="right"><input type="checkbox" name="isView" value="VJg" checked><b></b>籍贯：</td>
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
				<td></td>
			  </tr>
                <tr class="normal">
                  <td align="right"><input type="checkbox" name="isView" value="VSyd" checked><b></b>生源地：</td>
                  <td><div style="margin-top:5px;"><input id="cVSyd" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;"/></div></td>
                  <td align="right"><input type="checkbox" name="isView" value="VLxfs" checked><b></b>联系方式：</td>
                  <td><div style="margin-top:5px;"><input id="cVLxfs" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;"/></div></td>
                  <td align="right"><input type="checkbox" name="isView" value="VByyx" checked><b></b>毕业院校：</td>
                  <td><div style="margin-top:5px;"><input id="cVByyx" type="text" class="text ui-widget-content ui-corner-all" style="width:180px;"/></div></td>
                  <td>&nbsp;</td>
                </tr>
            <tr class="normal">
                  <td align="right"><input type="checkbox" name="isView" value="DBirthday" checked><b></b>出生年月：</td>
                  <td><input type="text"  id="cDBirthday" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" /></td>
                  <td align="right"><input type="checkbox" name="isView" value="VJtzz" checked><b></b>家庭住址：</td>
                  <td><div style="margin-top:5px;"><input id="cVJtzz" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;"/></div></td>
                  <td align="right"><input type="checkbox" name="isView" value="VZy" checked><b></b>专业：</td>
                  <td><div style="margin-top:5px;"><input id="cVZy" type="text" class="text ui-widget-content ui-corner-all" style="width:180px;"/></div></td>
                  <td>&nbsp;</td>
                </tr>
			</tbody>
		</table>

	</div>
</div>


</div>
</div>

<form id="unitSubjectForm" method="post" action="open_moreSeacrhStudentBaseInfoList.do">
<input type="hidden" name="isView" id="isview" /><!--存储显示字段-->
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
</form>
</body>
</html>