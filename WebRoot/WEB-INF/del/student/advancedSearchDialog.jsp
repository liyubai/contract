<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script>
$(function() {
	$("#advancedDialogButton").click(function(){//查询
		$( "#advancedSearchDialog" ).dialog( "open" );
	});
	$( "#advancedSearchDialog" ).dialog({//高级查询窗口
		autoOpen: false,
		height: 495,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"查 询": function() {
				//查询表单赋值
				$("#sname").val($("#cname").val());
				$("#sxstuTypeid").val(getSelValue('xstuTypeidCheckboxName'));
				$("#sxcompanyid").val(getSelValue('xcompanyidCheckboxName'));
				$("#sxstatusid").val(getSelValue('xstatusidCheckboxName'));
				$("#sxxjstatusid").val(getSelValue('xxjstatusidCheckboxName'));
				$("#sxformid").val(getSelValue('xformidCheckboxName'));
				$("#sxfreetypeid").val(getSelValue('xfreetypeidCheckboxName'));
				$("#sisAssignid").val(getSelValue('isAssignidCheckboxName'));
				
				$("#sisAndName").val(getSelRadioValue('isAndName'));
				$("#sisAndStuType").val(getSelRadioValue('isAndStuType'));
				$("#sisAndCompany").val(getSelRadioValue('isAndCompany'));
				$("#sisAndStatus").val(getSelRadioValue('isAndStatus'));
				$("#sisAndXjStatus").val(getSelRadioValue('isAndXjStatus'));
				$("#sisAndForm").val(getSelRadioValue('isAndForm'));
				$("#sisAndFreeType").val(getSelRadioValue('isAndFreeType'));
				$("#sisAndAssign").val(getSelRadioValue('isAndAssign'));
				var pnum = 0;
				if($("#sname").val()!=""){
					pnum+=1;
				}
				if($("#sxstuTypeid").val()!=""){
					pnum+=1;
				}
				if($("#sxcompanyid").val()!=""){
					pnum+=1;
				}
				if($("#sxstatusid").val()!=""){
					pnum+=1;
				}
				
				if($("#sxxjstatusid").val()!=""){
					pnum+=1;
				}
				if($("#sxformid").val()!=""){
					pnum+=1;
				}
				if($("#sxfreetypeid").val()!=""){
					pnum+=1;
				}
				if($("#sisAssignid").val()!=""){
					pnum+=1;
				}
				$("#sparaNum").val(pnum);
				$( "#advancedSearchForm" ).submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="学号/姓名"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchOutlineName").val()));
		}
		$( "#searchForm" ).submit();
	});
	



});	
function getSelValue(name){
	var str="";
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		if(r1[i].checked==true){
			str+=r1[i].value + ",";
		}
	}
	return str;
}
function getSelRadioValue(name){
	var str="";
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		if(r1[i].checked==true){
			str=r1[i].value;
		}
	}
	return str;
}

function checkNum(str){ //数字
	return str.match(/\D/)==null 
}

function clearSelValue(name){
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		r1[i].checked=true;
		r1[i].click();
	}
}
</script>

<div id="advancedSearchDialog"  title="高级查询">

	关&nbsp;&nbsp;键&nbsp;&nbsp;字： <span style="line-height:30px;"><input name="isAndName" type="radio" value="0" checked><b></b>并且 <input name="isAndName" type="radio" value="1"><b></b>或者&nbsp;&nbsp;<input type="text"  id="cname" class="text ui-widget-content ui-corner-all" style="width:102px;" /> (姓名/学号/身份证/性别)</span>  
    <span class="panelLine"></span>
    学员类型 ： <input name="isAndStuType" type="radio" value="0" checked><b></b>并且 <input name="isAndStuType" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
        <button>学员类型</button>
        <ul style="line-height:23px;">
        <s:iterator value="dictionTypeList">
        <li>&nbsp;&nbsp;&nbsp;<input name="xstuTypeidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</li>
        </s:iterator>
        </ul>
    </div>
    <span class="panelLine"></span>
    所属公司 ： <input name="isAndCompany" type="radio" value="0" checked><b></b>并且 <input name="isAndCompany" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
    <button>所属公司</button>
    <ul style="line-height:23px;">
        <li><s:iterator value="dictionCompanyList">
        <div style="width:110px; float:left">&nbsp;&nbsp;&nbsp;<input name="xcompanyidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</div>
        </s:iterator></li>
        </ul>
    </div>
    <span class="panelLine"></span>
    学生状态 ： <input name="isAndStatus" type="radio" value="0" checked><b></b>并且 <input name="isAndStatus" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
        <button>学生状态</button>
        <ul style="line-height:23px;">
        <li>
        <s:iterator value="dictionStatusList">
        <div style="width:110px; float:left">&nbsp;&nbsp;&nbsp;<input name="xstatusidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</div>
        </s:iterator></li>
        </ul>
	</div>
    <span class="panelLine"></span>
    学籍状态 ： <input name="isAndXjStatus" type="radio" value="0" checked><b></b>并且 <input name="isAndXjStatus" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
        <button>学籍状态</button>
        <ul style="line-height:23px;">
        <li>
        <s:iterator value="dictionXjList">
        <div style="width:110px; float:left">&nbsp;&nbsp;&nbsp;<input name="xxjstatusidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</div>
        </s:iterator></li>
        </ul>
    </div>
    <span class="panelLine"></span>
 	招生形式 ： <input name="isAndForm" type="radio" value="0" checked><b></b>并且 <input name="isAndForm" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
    <button>招生形式</button>
    <ul style="line-height:23px;">
        <s:iterator value="dictionFormList">
            <li>&nbsp;&nbsp;&nbsp;<input name="xformidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</li>
         </s:iterator>
        </ul>
    </div>
    <span class="panelLine"></span>
	自费/公费：<input name="isAndFreeType" type="radio" value="0" checked><b></b>并且 <input name="isAndFreeType" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
    <button>自费/公费</button>
    <ul style="line-height:23px;">
        <s:iterator value="dictionFreeTypeList">
        <li>&nbsp;&nbsp;&nbsp;<input name="xfreetypeidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</li>
        </s:iterator>
    </ul>
    </div>
    <!--
    <span class="panelLine"></span>
    是否分配 ： <input name="isAndAssign" type="radio" value="0" checked><b></b>并且 <input name="isAndAssign" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
    <button>是否分配</button>
    <ul style="line-height:23px;">
     <li>&nbsp;&nbsp;&nbsp;<input name="isAssignidCheckboxName" type="checkbox" value="2"/><b></b>未分配</li>
     <li>&nbsp;&nbsp;&nbsp;<input name="isAssignidCheckboxName" type="checkbox" value="3"/><b></b>已分配</li>
    </ul>
    </div>-->
</div>

<form  action="?" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey" value="${name}">

<input name="xstuTypeid" type="hidden" value="${xstuTypeid}">
<input name="xcompanyid" type="hidden" value="${xcompanyid}">
<input name="xstatusid" type="hidden" value="${xstatusid}">
<input name="xxjstatusid" type="hidden" value="${xxjstatusid}">
<input name="xformid" type="hidden" value="${xformid}">
<input name="xfreetypeid" type="hidden" value="${xfreetypeid}">
<input name="isAssignid" type="hidden" value="${isAssignid}">
<input name="itype" type="hidden" value="${itype}">
</form>

<form  action="?" method="post" id="advancedSearchForm">
<input name="searchBean.name" type="hidden" value="${searchBean.name}" id="sname">
<input name="searchBean.xstuTypeid" type="hidden" value="${searchBean.xstuTypeid}" id="sxstuTypeid">
<input name="searchBean.xcompanyid" type="hidden" value="${searchBean.xcompanyid}" id="sxcompanyid">
<input name="searchBean.xstatusid" type="hidden" value="${searchBean.xstatusid}" id="sxstatusid">
<input name="searchBean.xxjstatusid" type="hidden" value="${searchBean.xxjstatusid}" id="sxxjstatusid">
<input name="searchBean.xformid" type="hidden" value="${searchBean.xformid}" id="sxformid">
<input name="searchBean.xfreetypeid" type="hidden" value="${searchBean.xfreetypeid}" id="sxfreetypeid">
<input name="searchBean.isAssignid" type="hidden" value="${searchBean.isAssignid}" id="sisAssignid">

<input name="searchBean.isAndName" type="hidden" value="${searchBean.isAndName}" id="sisAndName">
<input name="searchBean.isAndStuType" type="hidden" value="${searchBean.isAndStuType}" id="sisAndStuType">
<input name="searchBean.isAndCompany" type="hidden" value="${searchBean.isAndCompany}" id="sisAndCompany">
<input name="searchBean.isAndStatus" type="hidden" value="${searchBean.isAndStatus}" id="sisAndStatus">
<input name="searchBean.isAndXjStatus" type="hidden" value="${searchBean.isAndXjStatus}" id="sisAndXjStatus">
<input name="searchBean.isAndForm" type="hidden" value="${searchBean.isAndForm}" id="sisAndForm">
<input name="searchBean.isAndFreeType" type="hidden" value="${searchBean.isAndFreeType}" id="sisAndFreeType">
<input name="searchBean.isAndAssign" type="hidden" value="${searchBean.isAndAssign}" id="sisAndAssign">
<input name="searchBean.paraNum" type="hidden" value="${searchBean.paraNum}" id="sparaNum">
<input name="itype" type="hidden" value="${itype}">
</form>