<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学员执照信息</title>

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
	
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,160);d.button.css("width", "160px");}
		else{new $.dropDownList(i,true,100);}
	})
	var hkq = $("#VHangkongqileibie").val();
	if(hkq=="297ea69a483310cd01483326f442000e"){
		$("#xuanzhuanlevel")[0].style.display='none';
		$("#planelevel")[0].style.display='';
	}else{
		$("#xuanzhuanlevel")[0].style.display='';
		$("#planelevel")[0].style.display='none';
	}
	//保存
	$("#modalDialogButton3").click(function(){

		$("#VCardid").val($.trim($("#cVCardid").val()));
		if($("#VCardid").val()==""){
			alert("执照编号不能为空。");
			return;
		}

		$("#DEffectdate").val($.trim($("#cDEffectdate").val()));
		if($("#DEffectdate").val()==""){
			alert("有效期不能为空。");
			return;
		}
		$("#VIssuer").val($.trim($("#cVIssuer").val()));
		if($("#VIssuer").val()==""){
			alert("局长授权签发不能为空。");
			return;
		}
		$("#VCompany").val($.trim($("#cVCompany").val()));
		if($("#VCompany").val()==""){
			alert("签发单位不能为空。");
			return;
		}
		$("#DIssuetime").val($.trim($("#cDIssuetime").val()));
		if($("#DIssuetime").val()==""){
			alert("签发日期不能为空。");
			return;
		}
		$("#DUpdatedate").val($.trim($("#cDUpdatedate").val()));
		
		$("#levelid").val($.trim($("#clevelid").val()));
		$("#VBeizhu").val($.trim($("#cVBeizhu").val()));
		$("#VZhizhaoxingzhi").val($.trim($("#cVZhizhaoxingzhi").val()));
		
		$("#VHangkongqileibie").val(getSelRadioValue('hkqlb'));//必选
		if($("#VHangkongqileibie").val()==""){		
			alert("请选择航空器类别。");
			return;
		}
		$("#VFeijijibie").val(getSelValue('fjjb'));
		$("#VXuanzhuanjijibie").val(getSelValue('xyjjb'));
		if($("#VHangkongqileibie").val()=="297ea69a483310cd01483326f442000e" && $("#VFeijijibie").val()==""){		
			alert("请选择飞机级别等级。");
			return;
		}
		if($("#VHangkongqileibie").val()=="297ea69a483310cd014833271c94000f" && $("#VXuanzhuanjijibie").val()==""){		
			alert("请选择旋翼机级别等级。");
			return;
		}
		if($("#VHangkongqileibie").val()=="297ea69a483310cd01483326f442000e" ){		
			$("#VXuanzhuanjijibie").val("");
		}
		if($("#VHangkongqileibie").val()=="297ea69a483310cd014833271c94000f" ){		
			$("#VFeijijibie").val("");
		}
		$("#VZhizhaodengji").val(getSelValue('ybjb'));
		$("#VHkqdj").val(getSelValue('hkqjb'));
		
		$("#addForm").submit();
	});
	 
	 //取消，返回列表页
	$("#backButton").click(function(){
	    window.location.replace("open_sutdentLicenseList.do");
	});
	
});
function doit(id){
	if(id=="297ea69a483310cd01483326f442000e"){
		$("#xuanzhuanlevel")[0].style.display='none';
		$("#planelevel")[0].style.display='';
	}else{
		$("#xuanzhuanlevel")[0].style.display='';
		$("#planelevel")[0].style.display='none';
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

<div id="topPartD">
<div class="panelBox buttonBox">
<button id="modalDialogButton3" class="green" primary="ui-icon-button-confirm">保存</button>
<button id="backButton" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>
<input type="hidden" name="statusMsg" />
<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">

		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<tbody>
            <tr class="normal">
				<td width="90" align="right">学号：</td>
				<td width="180">${license.studentBaseInfo.VCode}</td>
				<td width="60" align="right">姓名：</td>
				<td width="180">${license.studentBaseInfo.VName}</td>
				<td width="80" align="right">性别：</td>
				<td width="180">${license.studentBaseInfo.VGender}</td>
			  </tr>
                
				<tr class="normal">
				<td width="90" align="right">执照编号：</td>
				<td width="180">
			  <div style="margin-top:5px;">
					<input style="width:150px;" id="cVCardid" class="text ui-widget-content ui-corner-all" value="${license.VCardid}"/>
				</div>
				</td>
				<td width="60" align="right">有效期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:160px;border-color:#DDDDDD;height:14px;" id="cDEffectdate" class="Wdate text ui-widget-content ui-corner-all" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  value="<s:date name="license.DEffectdate" format="yyyy-MM-dd" />"/>
				</div>
				</td>
				<td width="80" align="right">局长授权签发：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:160px;" id="cVIssuer" class="text ui-widget-content ui-corner-all"  value="${license.VIssuer}" />
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">签发单位：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:150px;" id="cVCompany"  value="${license.VCompany}"  class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="60" align="right">签发日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:160px;border-color:#DDDDDD;height:14px;" id="cDIssuetime"  class="Wdate text ui-widget-content ui-corner-all" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="<s:date name="license.DIssuetime" format="yyyy-MM-dd" />"/>
				</div>
				</td>
				<td width="80" align="right">更新日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:160px;border-color:#DDDDDD;height:14px;" id="cDUpdatedate"  class="Wdate text ui-widget-content ui-corner-all" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="<s:date name="license.DUpdatedate" format="yyyy-MM-dd" />"/>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">学员执照类型：</td>
				<td width="180"><div class="dropDownList">
						<button>请选择</button>
						<ul>
                        <s:iterator value="jyzzLxList" status="statu">
                        <s:if test='#statu.index==0'>
                        <span class="ui-icon ui-icon-bullet"></span>
                        <s:set name="ehid" value="VId"/>
                    	</s:if>
							<li><a href="#N" val="${VId}">
                            <span class="ui-icon ui-icon-bullet"></span>
                            ${VName}</a></li>
                            </s:iterator>
						</ul>
						<input type="hidden" id="clevelid"  value="${license.TDiction.VId}"/>
					</div>
					
				</td>
				<td width="60" align="right">是否监控：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="1"><span class="ui-icon ui-icon-bullet"></span>监控</a></li>
							<li><a href="#N" val="2">不监控</a></li>
						</ul>
						<input type="hidden" id="cVBeizhu" value="${license.VBeizhu}" />
					</div>
				</td>
				<td width="80" align="right">执照性质：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="正式执照"><span class="ui-icon ui-icon-bullet"></span>正式执照</a></li>
							<li><a href="#N" val="临时执照">临时执照</a></li>
						</ul>
						<input type="hidden" id="cVZhizhaoxingzhi" value="${license.VZhizhaoxingzhi}" />
					</div>
				</td>
				</tr>

		
                <tr class="normal">
				<td width="90" align="right">航空器类别：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="hkqLbList">
						<input type="radio" name="hkqlb" value="${VId}" onClick="doit('${VId}')" <s:if test='license.VHangkongqileibie==VId'>checked</s:if> /><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="90" align="right">仪表等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="ybDjList">
						<input type="checkbox" name="ybjb" value="${VId}" <s:if test='license.VZhizhaodengji!=null && license.VZhizhaodengji.indexOf(VId)!=-1'>checked</s:if> /><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal" id="planelevel" style="display:none">
				<td width="90" align="right">飞机级别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="fjJbList">
						<input type="checkbox" name="fjjb" value="${VId}" <s:if test='license.VFeijijibie!=null && license.VFeijijibie.indexOf(VId)!=-1'>checked</s:if> /><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
			
				<tr class="normal" id="xuanzhuanlevel"  style="display:none">
				<td width="90" align="right">旋翼机级别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="xyjJbList">
						<input type="checkbox" name="xyjjb" value="${VId}" <s:if test='license.VXuanzhuanjijibie!=null && license.VXuanzhuanjijibie.indexOf(VId)!=-1'>checked</s:if> /><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
                	<tr class="normal">
				<td width="90" align="right">航空器型别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="hkqXbList">
						<input type="checkbox" name="hkqjb" value="${VId}" <s:if test='license.VHkqdj!=null && license.VHkqdj.indexOf(VId)!=-1'>checked</s:if> /><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
			</tbody>
		</table>
</div>
</div>
</div>
</div>

<form id="addForm" action="updateStudentLicense.do" method="post">
<input type="hidden" name="license.VId" id="VId" value="${license.VId}">
<input type="hidden" name="license.studentBaseInfo.VId"  value="${license.studentBaseInfo.VId}">
<input type="hidden" name="license.VCardid" id="VCardid">
<input type="hidden" name="license.DEffectdate" id="DEffectdate">
<input type="hidden" name="license.VIssuer" id="VIssuer">
<input type="hidden" name="license.VCompany" id="VCompany">
<input type="hidden" name="license.DIssuetime" id="DIssuetime">
<input type="hidden" name="license.DUpdatedate" id="DUpdatedate">
<input type="hidden" name="license.TDiction.VId" id="levelid">
<input type="hidden" name="license.VBeizhu" id="VBeizhu"><!--是否监控-->
<input type="hidden" name="license.VZhizhaoxingzhi" id="VZhizhaoxingzhi"><!--执照性质-->
<input type="hidden" name="license.VZhizhaodengji" id="VZhizhaodengji"><!--仪表等级-->
<input type="hidden" name="license.VHangkongqileibie" id="VHangkongqileibie" value="${license.VHangkongqileibie}"><!--航空器类别-->
<input type="hidden" name="license.VFeijijibie" id="VFeijijibie"><!--飞机级别等级-->
<input type="hidden" name="license.VXuanzhuanjijibie" id="VXuanzhuanjijibie"><!--旋翼机级别等级-->
<input type="hidden" name="license.VHkqdj" id="VHkqdj" ><!--航空器型别等级-->
<input type="hidden" name="itype"  value="${itype}">
</form>

</body>
</html>
