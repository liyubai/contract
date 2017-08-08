<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大纲管理</title>
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
<!-- 树形相关开始-->
<link rel="STYLESHEET" type="text/css" href="../codebase/dhtmlxtree.css">
<script src="../codebase/dhtmlxcommon.js"></script>
<script src="../codebase/dhtmlxtree.js"></script>
<script type="text/javascript" src="../codebase/dhtmlxmenu.js"></script>
<link rel="stylesheet" type="text/css" href="../MenuSkins/dhtmlxmenu_dhx_blue.css"/>
<!-- 树形相关结束-->
<style>
fieldset {
	padding: 0 1em 0 1em;
	border:0;
	width: 85%;
}
.validateTips {
	border: 1px solid transparent;
	padding: 0 0.5em 0 0.5em;
	margin: 0;
	line-height: 30px;
}
.Panel { margin: auto; margin: 10px 10px 0 10px; clear: both; border-top-left-radius: 4px; border-top-right-radius: 4px; outline: none; -o-box-shadow: 1px 1px 3px #888; -icab-box-shadow: 1px 1px 3px #888; -khtml-box-shadow: 1px 1px 3px #888; -moz-box-shadow: 1px 1px 3px #888; -webkit-box-shadow: 1px 1px 3px #888; box-shadow: 1px 1px 3px #888; filter:progid:DXImageTransform.Microsoft.Shadow(color=#BFBFBF,direction=120,strength=2); }
.yanzheng { border: solid 1px #CCCCCC;width:35px;}
.yanzheng2 { border: solid 1px #CCCCCC;width:220px;}
#rightPartC > div {
	min-width: 710px;
}
</style>
<script>


A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
C_WIDTH=350; //注意，不要写成var C_WIDTH，这个值已经在function.js中定义好了，只需要重新赋
$(function() {
	
	$("div.dropDownList").find("button").css("width","120px").end().each(function(i){
	new $.dropDownList(i,true,140);
	})

	$("#searchAction").click(function(){//查询
		if($("#searchOutlineName").val()=="大纲名称"){
			$("#searchKey").val("");
			$("#statusid").val("");
		}else{
			$("#searchKey").val($("#searchOutlineName").val());
		}
		reloadPlan(0);
	});
	$("#searchLesson").click(function(){
		gotoPage(1);
	});
	$("#modalDialogButton5").click(function(){//全部
		$("#searchKey").val("");
		$("#statusid").val("");
		reloadPlan(0);
	});
	$("#modalDialogButton7").click(function(){//未提交
		$("#statusid").val(4);
		reloadPlan(0);
	});
	$("#modalDialogButton8").click(function(){//已生效
		$("#statusid").val(0);
		reloadPlan(0);
	});
	$("#modalDialogButton9").click(function(){//未审批
		$("#statusid").val(3);
		reloadPlan(0);
	});
	$("#modalDialogButton10").click(function(){//未通过
		$("#statusid").val(2);
		reloadPlan(0);
	});
	$("#modalDialogButton6").click(function(){//已取消
		$("#statusid").val(1);
		reloadPlan(0);
	});
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 480,
		width: 800,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#dialogLessonContent" ).dialog({//课目内容窗口
		autoOpen: false,
		height: 480,
		width: 800,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#copyOutlineForm" ).dialog({//大纲复制确认
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#copyOutlineWarning").html("<img src=\"themes/cupertino/images/loading.gif\"/>");
				execOutlineCopy();
				//$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#dialogForm2" ).dialog({//删除内容窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				execDel();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#auditConfirmForm" ).dialog({//审批大纲确认窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				submitAuditbyID();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
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
		}
	});
	
	function checkRegexp( o) {
		var re = /^\d+(\.\d+)?$/; //判断浮点数
		if ( re.test( o ) ) {
			return true;
		} else {
			return false;
		}
	}
	$( "#lessonListDialog" ).dialog({//选择课目 
		autoOpen: false,
		height: 495,
		width: 800,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var lessonstr = getSelValue('checkboxName');
				var lessons = lessonstr.split(",");
				var ids = "";
				for(i=0;i<lessons.length-1;i++){
					ids+=lessons[i].split(";")[0] + ";" + $("#v" + lessons[i].split(";")[0]).val();
					ids+=";" + $("#n" + lessons[i].split(";")[0]).val() +",";
				}
				$("#lessonids").val(ids);
				$("#phaseid").val($("#parentid").val());
				if($("#phaseid").val()==""){
					alert("请选择大纲树节点添加课目。");
					return;
				}

				if($("#lessonids").val()==""){
					alert("请选择课目。");
					return;
				}
				//alert(tree.getSubItems(tree.getSelectedItemId()));// 所有子节点
				//return;
				params=$("#saveRelationForm").serialize();
				$.ajax({
					type:"post",
					url:"saveOutlinePhaseAndLessonRelation.do",
					data:params,
					dataType:"json",
					success:function(data){
						if(data.flag==false){
							alert(data.message);
							return;
						}
						
						//for(i=0;i<data.length;i++){
						//	tree.insertNewItem(tree.getSelectedItemId(),data[i].VId,data[i].VName,0,0,0,0);//add
						//}
						tree.selectItem(tree.getSelectedItemId());
						tonclick(tree.getSelectedItemId());//调用选中的节点单击方法
						readDataList(tree.getSelectedItemId(),"showOutlineUnitList.do");
						gotoPage(1);
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
						if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
							return;
						}
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});	
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#newUnitDialog" ).dialog({//添加、编辑 单元 
		autoOpen: false,
		height: 480,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#VName").val($("#cVName").val());
				$("#VNo").val($("#cVNo").val());
				$("#VLicenseform").val(getSelValue('zhizhao'));
				$("#VConditions").val($("#cVConditions").val());
				$("#VPassstandard").val($("#cVPassstandard").val());
				
				var name = $("#VName").val();	
				if($.trim(name)==""){
					alert("单元名称不能为空。");
					return;
				}
				
				var url= "";
				var type = $("#opttype").val();
				if(type==3){
					$("#outlineid").val($("#parentid").val());
					if($.trim($("#outlineid").val())==""){
						alert("请选择大纲。");
						return;
					}
					url = "saveOutlineUnit.do";
				}else if(type==4){
					url = "updateOutlineUnit.do";
				}
				
				$("#outlineid").val($("#parentid").val());
				if($.trim($("#outlineid").val())==""){
						alert("请选择大纲。");
						return;
				}
				params=$("#unitForm").serialize();
				$.ajax({
					type:"post",
					url:url,
					data:params,
					dataType:"json",
					success:function(data){
						
						if(data.flag==false){
							alert(data.message);
							return;
						}
						
						if(type==3){
							tree.insertNewItem(tree.getSelectedItemId(),data.message,name,0,0,0,0);//add
						}else if(type==4){
							tree.setItemText(tree.getSelectedItemId(),name);//edit
							showUnitContent(tree.getSelectedItemId());
						}
						//tree.selectItem(tree.getSelectedItemId());
						//readDataList(tree.getParentId(tree.getSelectedItemId()),"showOutlineUnitList.do");
						$( "#newUnitDialog" ).dialog( "close" );
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
						if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
							return;
						}
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});	

			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	$( "#newPhaseDialog" ).dialog({//添加阶段
		autoOpen: false,
		height: 380,
		width: 430,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#VNamep").val($("#cVNamep").val());
				$("#VNop").val($("#cVNop").val());
				$("#VConditionsp").val($("#cVConditionsp").val());
				$("#VPassstandardp").val($("#cVPassstandardp").val());
				
				var name = $("#VNamep").val();
				
				
				if($.trim(name)==""){
					alert("阶段名称不能为空。");
					return;
				}
				var url= "";
				var type = $("#opttype").val();
				if(type==5 || type==10){//5--addphase
					$("#trainlessonunitid").val($("#parentid").val());
					if($.trim($("#trainlessonunitid").val())==""){
						alert("请选择单元。");
						return;
					}
					url = "saveOutlinePhase.do";
				}else if(type==6 || type==11){//----editphase
					url = "updateOutlinePhase.do";
				}

				$("#sortid").val(type);
				params=$("#phaseForm").serialize();
				$.ajax({
					type:"post",
					url:url,
					data:params,
					dataType:"json",
					success:function(data){
						if(data.flag==false){
							alert(data.message);
							return;
						}
						if(type==5 || type==10){
							tree.insertNewItem(tree.getSelectedItemId(),data.message,name,0,0,0,0);//add
						}else if(type==6 || type==11){
							tree.setItemText(tree.getSelectedItemId(),name);//edit
							showPhaseContent($("#parentid").val());
						}
						//readDataList(tree.getParentId(tree.getSelectedItemId()),"showOutlineUnitList.do");
						//tree.selectItem(tree.getParentId(tree.getSelectedItemId()));
						//tonclick(tree.getSelectedItemId());
						$( "#newPhaseDialog" ).dialog( "close" );
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
					if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
						return;
					}
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});	
				
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
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
				var content = "";
				var order = $.trim($("#iorder").val());
				if(order==""){
					alert("请输入顺序号");
					return;
				}
				
				var sid = $("#sid").val();
				if(sid==""){
					return;
				}
				
				var pid = $("#parentid").val();
				if(pid==""){
					return;
				}

				params = {"id":sid,"parentid":pid,"order":order};
				$.ajax({
					type:"post",
					url:"saveTrainingLessonOrderByNum.do",
					data:params,
					dataType:"json",
					success:function(data){
						if(data){
							content = gotoPage2($("#curpageid").val());
							if(content!=""){
								$("#PanelLesson").html(content+"</tbody></table>");
							}else{
								$("#PanelLesson").html("");
							}
							$( "#setDialogForm" ).dialog("close");
						}
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
						if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
							return;
						}
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});	
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

function execEdit(){//执行查询为编辑赋值
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择编辑的内容。");
		return;
	}
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showOutlineUnitById.do",
		data:params,
		dataType:"json",
		success:function(data){
			clearValue();
			//编辑为窗口赋值
			$("#VId").val(data.VId);
			$("#cVName").val(data.VName);
			$("#cVNo").val(data.VNo);
			var r1=document.getElementsByName('zhizhao');
			for(i=0;i<r1.length;i++){
				if(data.VLicenseform.indexOf(r1[i].value)!=-1){
					r1[i].checked=false;
					r1[i].click();
				}
			}
			$("#cVConditions").val(data.VConditions);
			$("#cVPassstandard").val(data.VPassstandard);
			$("#outlineid").val(data.outlineid);
			
			$("#newUnitDialog").dialog('option', 'title', '编辑单元');
			$("#newUnitDialog").dialog( "open" );
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}

function execPhaseEdit(){//执行查询为阶段编辑赋值
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择编辑的内容。");
		return;
	}
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showOutlinePhaseById.do",
		data:params,
		dataType:"json",
		success:function(data){
			//编辑为窗口赋值
			$("#VIdp").val(data.VId);
			$("#cVNamep").val(data.VName);
			$("#cVNop").val(data.VNo);
			$("#cVConditionsp").val(data.VConditions);
			$("#cVPassstandardp").val(data.VPassstandard);
			$("#trainlessonunitid").val(data.outlineid);//单元id
			$("#newPhaseDialog").dialog('option', 'title', '编辑阶段');
			$("#newPhaseDialog").dialog( "open" );
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
	
	
}
function viewContent(id){//查看大纲内容

	if(id==""){
		return;	
	}
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showTrainingOutlineContentById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			$("#contentid").html(getContent(data));
			$("#dialogContent").dialog('option', 'title',  "所选大纲《"+data.VName+"》");
			$( "#dialogContent" ).dialog( "open" );
		}, 
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
	
}

function getContent(data){
	content="";
	content+="<tr>";
	content+="<td>大纲名称：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VName+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td height=\"24\" width=\"15%\">大纲编号：</td><td width=\"35%\">"+data.VCode+"</td>";
	content+="<td width=\"15%\">版本号：</td><td d width=\"35%\">"+data.VBc+"</td>";
	content+="</tr>";
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\" >单元数量：</td><td>"+data.IUnits+"</td>";
	content+="<td>阶段数量：</td><td>"+data.IStages+"</td>";
	content+="</tr>";
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">课目数量：</td><td>"+data.ILessons+"</td>";
	content+="<td>训练时间：</td><td>"+getFormatTime(data.DTraintime)+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">飞机时间：</td><td>"+getFormatTime(data.DPlanetime)+"</td>";
	content+="<td>训练器时间：</td><td>"+getFormatTime(data.DTrainningdevicetime)+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	content+="<tr>";
	content+="<td  height=\"24\">当前状态：</td><td>"+getStatusName(data.IStatus)+"</td>";
	content+="<td>创建日期：</td><td>"+data.viewCreatedate+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	for(i=0;i<data.viewOutLineAuditList.length;i++){
		content+="<tr bgcolor=\"#F3F8FC\">";
		content+="<td  height=\"24\">审批状态：</td><td>"+getStatusName(data.viewOutLineAuditList[i].IStatus)+"</td>";
		content+="<td>审批日期：</td><td>"+data.viewOutLineAuditList[i].viewAudittime+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		content+="<tr  bgcolor=\"#F3F8FC\">";
		content+="<td  height=\"24\">审批人：</td><td>"+data.viewOutLineAuditList[i].userName+"</td>";
		content+="<td>审批结果：</td><td>"+data.viewOutLineAuditList[i].VReason.replace(/\n/g,"<br/>")+"</td>";
		content+="</tr>"
		
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
	
	}
	
	content+="<tr>";
	content+="<td  height=\"24\">仪表等级：</td><td>"+data.VMeterclass+"</td>";
	content+="<td>训练设备：</td><td>"+data.VTrainequipment+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">多发等级：</td><td>"+data.VMultipleclass+"</td>";
	content+="<td>训练机型：</td><td>"+data.VTrainform+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>使用范围：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VRange.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>课目目标：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VTarget.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>进入条件：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VConditions.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练周期：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTraincycle.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>转学规定：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VChangeschool.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练终止：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VStoptrain.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>成绩评定：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VScorejudge.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>培训方法：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTrainmethod.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练记录：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTrainrecord.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"	
	return content;
}

function showViewContent(id){//显示大纲内容
	
	var c = "<table width=\"98%\" border=\"0\" cellpadding=\"0\" cellspacing=\"3\" style=\"line-height:20px;\">";
    c+="<tbody>";
	if(id==""){
		return;	
	}
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showTrainingOutlineContentById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			c+=getContent(data);
			c+="</tbody>";
			c+="</table>";
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});
	
	$("#nodeType").val("outline");
	
	//计算单元、阶段合计
	var ss = gotoPage2(1);
	if($("#hasLesson").val()==1){//有课目
		 ss+=tongji(id);
		 $("#PanelLesson").html(ss+"</tbody></table>");
	}else{
		$("#PanelLesson").html("");
	}
	
	$("#Panel2").html(c);
}
function tongji(id){
	var s = "";
	var sname = "";
	var xl = 0;
	var xlq = 0;
	var fj = 0;
	var mnj = 0;
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showOutlineUnitPhaseListByOutlineId.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null || data==""){
				return;	
			}
			for(var i=0;i<data.length;i++){
				sname = data[i].VName;
				if(sname=="单元"){
					sname="整体合计";
				}
				s+="<tr><td colspan=\"4\" align=\"right\">"+sname+"：&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].trainingTime)+"&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].totalTime)+"&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].finishTime)+"&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].monijiTime)+"&nbsp;&nbsp;</td>";
				s+="</tr>";
				xl+=data[i].trainingTime;			
				xlq+=data[i].totalTime;
				fj+=data[i].finishTime;
				mnj+=data[i].monijiTime;
			}
			s+="<tr><td colspan=\"4\" align=\"right\">大纲合计：&nbsp;&nbsp;</td>";
			s+="<td align=\"right\">"+getFormatTime(xl)+"&nbsp;&nbsp;</td>";
			s+="<td align=\"right\">"+getFormatTime(xlq)+"&nbsp;&nbsp;</td>";
			s+="<td align=\"right\">"+getFormatTime(fj)+"&nbsp;&nbsp;</td>";
			s+="<td align=\"right\">"+getFormatTime(mnj)+"&nbsp;&nbsp;</td>";
			s+="</tr>";
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});
	return s;
}
function tongjiByPhase(id){
	var s = "";
	var sname = "";
	var xl = 0;
	var xlq = 0;
	var fj = 0;
	var mnj = 0;
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showUnitPhaseListByOutlineId.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null || data==""){
				return;	
			}
			for(var i=0;i<data.length;i++){
				sname = data[i].VName;
				if(sname=="阶段"){
					sname="整体合计";
				}
				s+="<tr><td colspan=\"4\" align=\"right\">"+sname+"：&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].trainingTime)+"&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].totalTime)+"&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].finishTime)+"&nbsp;&nbsp;</td>";
				s+="<td align=\"right\">"+getFormatTime(data[i].monijiTime)+"&nbsp;&nbsp;</td>";
				s+="</tr>";
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});
	return s;
}
function showUnitContent(id){//显示单元内容
	var c = "<table width=\"98%\" border=\"0\" cellpadding=\"0\" cellspacing=\"3\" style=\"line-height:20px;\">";
    c+="<tbody>";
	if(id==""){
		return;	
	}
	if(id==""){
		return;
	}
	var content="";
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showTraininglessonunitdictionByNoId.do",
		data:params,
		dataType:"json",
		success:function(data){
			
			content+="<tr>";
			content+="<td  align=\"center\" width=\"15%\">单元名称：</td>";
			content+="<td  height=\"24\" colspan=\"3\" width=\"85%\">"+data.VName+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  align=\"center\">单元编号：</td>";
			content+="<td  height=\"24\" colspan=\"3\">"+data.VNo+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<td  align=\"center\" width=\"15%\">执照类型：</td>";
			content+="<td  height=\"24\" colspan=\"3\" width=\"85%\">"+data.VLicenseform+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  align=\"center\">进入条件：</td>";
			content+="<td  height=\"120\" colspan=\"3\" >"+data.VConditions.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  align=\"center\">合格标准：</td>";
			content+="<td  height=\"120\" colspan=\"3\" >"+data.VPassstandard.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			c+=content;
			
			c+="</tbody>";
			c+="</table>";
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
	$("#nodeType").val("unit");
	//显示阶段合计
	var cc = gotoPage2(1);
	if($("#hasLesson").val()==1){
		$("#PanelLesson").html(cc+ tongjiByPhase(id)+"</tbody></table>");
	}else{
		$("#PanelLesson").html("");
	}
	$("#Panel2").html(c);
}
function showPhaseContent(id){//显示阶段内容
	var c = "<table width=\"98%\" border=\"0\" cellpadding=\"0\" cellspacing=\"3\" style=\"line-height:20px;\">";
    c+="<tbody>";
	if(id==""){
		return;	
	}
	if(id==""){
		return;
	}
	var content="";
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showOutlinePhaseById.do",
		data:params,
		dataType:"json",
		success:function(data){
			
			content+="<tr>";
			content+="<td  align=\"center\" width=\"15%\">阶段名称：</td>";
			content+="<td  height=\"24\" colspan=\"3\" width=\"85%\">"+data.VName+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  align=\"center\">阶段编号：</td>";
			content+="<td  height=\"24\" colspan=\"3\">"+data.VNo+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  align=\"center\">进入条件：</td>";
			content+="<td  height=\"120\" colspan=\"3\" >"+data.VConditions.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  align=\"center\">合格标准：</td>";
			content+="<td  height=\"120\" colspan=\"3\" >"+data.VPassstandard.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			c+=content;
			c+="</tbody>";
			c+="</table>";
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
	$("#nodeType").val("phase");
	if($("#hasLesson").val()==1){
		$("#PanelLesson").html(gotoPage2(1)+"</tbody></table>");
	}else{
		$("#PanelLesson").html("");
	}
	$("#Panel2").html(c);
}
function showLessonContent(id){//显示课目
	if(id==""){
		return;	
	}
	$("#PanelLesson").html("");
	var d= "<table width=\"98%\" border=\"0\" cellpadding=\"0\" cellspacing=\"3\" style=\"line-height:20px;\"><tbody>";
	var c=getLessonContentData(id);
	$("#Panel2").html(d+c+execFuZhi(id) + "</tbody></table>");
}
function getLessonContentData(id){//显示课目

	var content= "";
	params = {"id":id};
	$.ajax({
		async:false,
		type:"post",
		url:"showTraininglessonContentById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			content+="<tr>";
			content+="<td height=\"24\" width=\"15%\" align=\"center\">课目名称：</td><td width=\"35%\">"+data.VName+"</td>";
			content+="<td width=\"15%\">课目编号：</td><td d width=\"35%\">"+data.VNo+"</td>";
			content+="</tr>";
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td height=\"24\" width=\"15%\" align=\"center\">版 本 &nbsp;号：</td><td width=\"35%\">"+data.VVersion+"</td>";
			content+="<td width=\"15%\">课目性质：</td><td d width=\"35%\">"+data.IKcxz+"</td>";
			content+="</tr>";
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  height=\"24\" align=\"center\">飞机性质：</td><td>"+data.IPlaneproperty+"</td>";
			content+="<td>昼夜性质：</td><td>"+data.IDaynightproperty+"</td>";
			content+="</tr>";
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  height=\"24\" align=\"center\" >本转性质：</td><td>"+data.ITrainType+"</td>";
			content+="<td>飞行性质：</td><td>"+data.IFxxz+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  height=\"24\" align=\"center\">设备类型：</td><td>"+data.IType+"</td>";
			content+="<td>训练时间：</td><td>"+data.VShebei+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">是否特技：</td>";
			content+="<td  height=\"24\" colspan=\"3\">"+data.ITj+"</td>";
			content+="</tr>"

			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">训练目的：</td>";
			content+="<td  height=\"24\" colspan=\"3\">"+data.VTrainpurpose.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			
			content+="<tr>";
			content+="<td align=\"center\">进入条件：</td>";
			content+="<td  height=\"24\" colspan=\"3\" >"+data.VTiaojian.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">非常规项目：</td>";
			content+="<td  height=\"24\" colspan=\"3\" >"+data.VXiangmu.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">特殊要求：</td>";
			content+="<td  height=\"24\" colspan=\"3\" >"+data.VTsyq.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>";
			content+="<td  height=\"24\" colspan=\"3\" >"+data.VBz.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			content+="<tr>";
			content+="<td colspan=\"4\" align=\"center\">训练科目</td>";
			content+="</tr>"
			content+="<tr>";
			content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return "";
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return "";
		}
	});	
	return content;
}
function execFuZhi(id){
	//训练科目列表
	var content="";
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showTrainingLessonSubjectListById.do",
		data:params,
		dataType:"json",
		success:function(data){

			var score = "";
			for(i=0;i<data.length;i++){
		
				if(data[i].ISort==0){
					content+="<tr><td></td><td><img src=\"themes/cupertino/images/plane.gif\" align=\"absmiddle\" />"+data[i].VName+"</td>";
					content+="<td colspan=\"2\"></td></tr>";
					content+="<tr><td colspan=\"4\"><span class=\"panelLine\"></span></td></tr>";
				}else{
					
					if(data[i].DScore==100){
						score = "";
					}else{
						score = data[i].DScore;
					}
					content+="<tr><td></td><td style=\"padding-left:20px;\">"+data[i].VName+"</td>";
					content+="<td colspan=\"2\" style=\"padding-left:20px;\">"+score+"</td></tr>";
					if(i!=data.length-1){
						content+="<tr><td colspan=\"4\"><span class=\"panelLine\"></span></td></tr>";
					}
				}
			}
		
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});

	return content;
}
function viewLessonCotent(id){
	$("#lessoncontentid").html(getLessonContentData(id) +execFuZhi(id));
	$( "#dialogLessonContent" ).dialog( "open" );
	
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA">
  <div>
    <s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149eb4aa0005</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
  </div>
</div>
<div id="leftPartC">
  <div>
    <div style="width:100%;height: 41px; border: 0; border-top: solid 1px #DBE3E8;border-bottom: solid 1px #DBE3E8; background: #F6F6F6;">
    	<div style=" margin-top:10px; margin-left:10px;font-size: 14px; font-weight: bold; color: #555555;">说明：点选大纲树形，右键对大纲进行管理。</div>
    </div>
    <div id="treeboxbox_tree"></div>
  </div>
</div>

<div id="rightPartC">
  <div>
  
  	<div style="height: 41px; border: 0; border-top: solid 1px #DBE3E8;border-bottom: solid 1px #DBE3E8; background: #F6F6F6;margin: auto; margin: 10px 10px 0 10px; ">
      
    <div class="buttonBox" style=" margin-left:10px; margin-top:5px;">
 	
	<button class="normal barLeft" id="modalDialogButton7">未提交</button>
 	<button class="normal barMiddle" id="modalDialogButton9">未审批</button>
    <button class="normal barMiddle" id="modalDialogButton10">未通过</button>
    <button class="normal barMiddle" id="modalDialogButton8">已生效</button>
	<button class="normal barMiddle" id="modalDialogButton6">已取消</button>
    <button class="normal barRight" id="modalDialogButton5">全 部</button>
   
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchOutlineName" title="大纲名称"  name="searchOutlineName"  type="text" maxlength="50" value="大纲名称" /><button id="searchAction">查询</button>
    </div>
    
	</div>

    </div>
    <div class="Panel ui-corner-all-0">
     <span id="PanelLesson"></span>
     <span class="panelLine"></span>
    <span id="Panel2"></span>

    </div>
<br>
  </div>
</div>

<div id="dialogForm3">
  <fieldset>
    <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
      </tr>
    </table>
  </fieldset>
</div>
<div id="dialogForm2">
  <fieldset>
    <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要删除选中的信息吗？<br/>
          信息删除后不可恢复。</span></td>
      </tr>
    </table>
  </fieldset>
</div>
<div id="copyOutlineForm">
  <fieldset>
    <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="copyOutlineWarning">确认复制选中的大纲吗？</span></td>
      </tr>
    </table>
  </fieldset>
</div>

<div id="auditConfirmForm">
  <fieldset>
    <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确认要提交选中的大纲吗？</span></td>
      </tr>
    </table>
  </fieldset>
</div>

<div id="dialogContent"  title="所选大纲内容详单">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>
<div id="dialogLessonContent"  title="所选课目容详单">
<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
<tbody id="lessoncontentid">
</tbody>
</table>
</div>
<div id="newUnitDialog"  title="课目单元列表">
单元名称：&nbsp;<input type="text"  id="cVName" class="text ui-widget-content ui-corner-all" style="width:140px;" />&nbsp;
  &nbsp;单元编号：<input type="text"  id="cVNo" class="text ui-widget-content ui-corner-all" style="width:90px;" />
  <span class="panelLine"></span>
  <s:set name="p" value="0"/>
  <div style="line-height:21pt; float: left">执照类型：</div>
  <div style="line-height:21pt; margin-left:60px;">
    <s:iterator value="teacherLicenseList">
      <input name="zhizhao" type="checkbox" value="${VId}">
      <b></b><a href="#N" class="inline" style="width: 140px;">${VName}</a>
      <s:set name="p" value="#p+1"/>
      <s:if test='#p==2'><br>
        <s:set name="p" value="0"/>
      </s:if>
    </s:iterator>
  </div>
  <span class="panelLine"></span> 进入条件：&nbsp;<textarea  id="cVConditions" style="width:325px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea>
  <span class="panelLine"></span> 合格标准：&nbsp;<textarea  id="cVPassstandard" style="width:325px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea>
 </div>

<div id="newPhaseDialog"  title="新建阶段"> 阶段名称：&nbsp;<input type="text"  id="cVNamep" class="text ui-widget-content ui-corner-all" style="width:140px;" />&nbsp;&nbsp;&nbsp;阶段编号：<input type="text"  id="cVNop" class="text ui-widget-content ui-corner-all" style="width:95px;" />
  <span class="panelLine"></span>进入条件：&nbsp;<textarea  id="cVConditionsp" style="width:325px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea>
  <span class="panelLine"></span>合格标准：&nbsp;<textarea  id="cVPassstandardp" style="width:325px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea>
</div>
<div id="lessonListDialog"  title="课目列表">

<div class="panelBox buttonBox"><input type="text" name="focusn" style="width:0px; height:0px; border:0px;"/>
<div class="dropDownList">
     <s:set name="selId" value="id"/>
     <s:if test="id==null || id==''"><s:set name="selId" value=""></s:set></s:if>
        <button></button>
        <ul>
        <li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择课目类型</a></li>
        	<s:iterator value="lessonSortList">
            <li><a href="#N"  val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="svunit" value='${selId}'/>
    	</div><div class="buttonInput relative left" width="180" height="28" style="margin-bottom:4px;">
    <input id="lessonName" title="名称/编号"  name="lessonName"  type="text" maxlength="50" value="名称/编号" /><button id="searchLesson">查询</button>
</div>
</div>
  <table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2">
    <thead>
      <tr>
        <th class="thSortableGray" width="40" height="24"><input type="checkbox" name="isCheckBoxButton" id="isCheckBoxButtonid" onClick="isSelectALL();"></th>
        <th class="thSortableGray" width="50">序号</th>
        <th class="thSortableGray" width="60">课目编号</th>
        <th class="thSortableGray" width="70">版本号</th>
        <th class="thSortableGray">课目别名</th>
        <th class="thSortableGray" width="60">训练时间</th>
        <th class="thSortableGray" width="60">训练器时间</th>
        <th class="thSortableGray" width="60">飞机时间</th>
        <th class="thSortableGray" width="60">模拟机时间</th>
      </tr>
    </thead>
    <tbody id="assignLessonList">
    </tbody>
  </table>
</div>
<div id="setDialogForm"  title="设置排序">
<br>
<fieldset>
排序号：<input type="text"  id="iorder" class="text ui-widget-content ui-corner-all" style="width:200px;"/>
</fieldset>
</div>
<form id="unitForm" method="post">
  <input type="hidden" name="unit.VId" id="VId" />
  <input type="hidden" name="unit.TOutline.VId" id="outlineid" />
  <input type="hidden" name="unit.VName" id="VName" />
  <input type="hidden" name="unit.VNo" id="VNo" />
  <input type="hidden" name="unit.VLicenseform" id="VLicenseform" />
  <input type="hidden" name="unit.VConditions" id="VConditions" />
  <input type="hidden" name="unit.VPassstandard" id="VPassstandard" />
</form>
<form id="phaseForm" method="post">
  <input type="hidden" name="phase.VId" id="VIdp" />
  <input type="hidden" name="phase.trainlessonunit.VId" id="trainlessonunitid" />
  <input type="hidden" name="phase.VName" id="VNamep" />
  <input type="hidden" name="phase.VNo" id="VNop" />
  <input type="hidden" name="phase.VConditions" id="VConditionsp" />
  <input type="hidden" name="phase.VPassstandard" id="VPassstandardp" />
  <input type="hidden" name="sortId" id="sortid" />
</form>
<form  method="post" id="saveRelationForm">
<input name="viewTrainsubject.VId" type="hidden" id="phaseid">
<input name="viewTrainsubject.typeid" type="hidden" id="lessonids">
</form>
<input type="hidden" id="parentid"/>
<input type="hidden" id="opttype"/>
<input type="hidden" id="nodeType"/>
<input type="hidden" id="statusid">
<input name="name" type="hidden" id="searchKey">
<input type="hidden"  id="sid" />
<input type="hidden"  id="hasLesson" value="0"/>
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
<input type="hidden"  id="isWrite" value='<s:property value="#r"/>'/>
</body>
</html>
<script>
function clearValue(){
	$("#cVName").val("");
	$("#cVNo").val("");
	clearSelValue('zhizhao');
	$("#cVConditions").val("");
	$("#cVPassstandard").val("");	
}
function clearPhaseValue(){
	$("#cVNamep").val("");
	$("#cVNop").val("");
	$("#cVConditionsp").val("");
	$("#cVPassstandardp").val("");	
}
function clearSelValue(name){
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		r1[i].checked=true;
		r1[i].click();
	}
}
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

function tonclick(id) {
	$("#parentid").val(id);

	var level = tree.getLevel(id);
	if(level==1){
		// 右侧列表显信息大纲信息
		reloadPlan(2);
		
		menu.setItemText("muItem_AD1", "创建大纲");	
		menu.showItem("muItem_AD1");
		
		menu.hideItem("muItem_ASSIGN");
		menu.hideItem("muItem_EDIT1");
		menu.hideItem("muItem_COPY");
		menu.hideItem("muItem_DELETE1");
		menu.hideItem("muItem_addlesson");
		menu.hideItem("muItem_addphase");
		
		menu.hideItem("1")
		menu.hideItem("2");
		menu.hideItem("3");
		menu.hideItem("4");
		menu.hideItem("5");
		menu.hideItem("6");
		
	}else if(level==2){
		showViewContent(id);
		
		menu.setItemText("muItem_AD1", "创建单元");
		menu.setItemText("muItem_EDIT1", "修订大纲");
		menu.setItemText("muItem_COPY", "复制大纲");
		menu.setItemText("muItem_DELETE1", "删除大纲");
		menu.setItemText("muItem_ASSIGN", "提交审批");
		menu.setItemText("muItem_addlesson", "添加课目");
		menu.setItemText("muItem_addphase", "创建阶段");

		menu.showItem("muItem_AD1");
		menu.showItem("muItem_EDIT1");
		menu.showItem("muItem_COPY");
		menu.showItem("muItem_DELETE1");
		menu.hideItem("muItem_ASSIGN");
		menu.showItem("muItem_addlesson");
		menu.showItem("muItem_addphase");
		menu.showItem("1")
		menu.showItem("2");
		menu.showItem("3");
		menu.showItem("4");
		menu.hideItem("5");
		menu.showItem("6");
		
	}else if(level==3){
		
		//先判断是单元、阶段、课目
		var type= getTreeNodeType();
		if(type=="unit"){
			showUnitContent(id);
			menu.setItemText("muItem_AD1", "创建阶段");	
			menu.setItemText("muItem_EDIT1", "编辑单元");
			menu.setItemText("muItem_DELETE1", "删除单元");
			menu.setItemText("muItem_addlesson", "添加课目");
			
			menu.showItem("muItem_AD1");
			menu.showItem("muItem_EDIT1");
			menu.showItem("muItem_DELETE1");
			menu.showItem("muItem_addlesson");
			
			menu.hideItem("muItem_COPY");
			menu.hideItem("muItem_ASSIGN");
			menu.hideItem("muItem_addphase");
			
			menu.showItem("1")
			menu.hideItem("2");
			menu.showItem("3");
			menu.hideItem("4");
			menu.showItem("5");
			menu.hideItem("6");
		}
		if(type=="phase"){
			showPhaseContent(id);
			menu.setItemText("muItem_EDIT1", "编辑阶段");
			menu.setItemText("muItem_DELETE1", "删除阶段");
			menu.setItemText("muItem_ASSIGN", "添加课目");	
			
			menu.showItem("muItem_EDIT1");
			menu.showItem("muItem_DELETE1");
			menu.showItem("muItem_ASSIGN");
			
			menu.hideItem("muItem_addlesson");
			menu.hideItem("muItem_COPY");
			menu.hideItem("muItem_AD1");
			menu.hideItem("muItem_addphase");
			
			menu.hideItem("1")
			menu.showItem("2");
			menu.hideItem("3");
			menu.showItem("4");
			menu.hideItem("5");
			menu.hideItem("6");
		}
		if(type=="lesson"){
			showLessonContent(id);
			menu.setItemText("muItem_DELETE1", "删除课目");
		
			menu.hideItem("muItem_addphase");
			menu.hideItem("muItem_addlesson");
			menu.hideItem("muItem_EDIT1");
			menu.hideItem("muItem_ASSIGN");
			menu.hideItem("muItem_COPY");
			menu.hideItem("muItem_AD1");
			menu.hideItem("1")
			menu.hideItem("2");
			menu.hideItem("3");
			menu.hideItem("4");
			menu.hideItem("5");
			menu.hideItem("6");
		}
		
	}else if(level==4){
		
		//先判断是阶段、课目
		var type= getTreeNodeType();
		if(type=="phase"){
			showPhaseContent(id);
			menu.setItemText("muItem_EDIT1", "编辑阶段");
			menu.setItemText("muItem_DELETE1", "删除阶段");
			menu.setItemText("muItem_ASSIGN", "添加课目");	
		
			menu.showItem("muItem_EDIT1");
			menu.showItem("muItem_DELETE1");
			menu.showItem("muItem_ASSIGN");
			
			menu.hideItem("muItem_addlesson");
			menu.hideItem("muItem_COPY");
			menu.hideItem("muItem_AD1");
			menu.hideItem("muItem_addphase");
			
			menu.hideItem("1")
			menu.showItem("2");
			menu.hideItem("3");
			menu.showItem("4");
			menu.hideItem("5");
			menu.hideItem("6");
		}
		if(type=="lesson"){
			showLessonContent(id);
			menu.setItemText("muItem_DELETE1", "删除课目");
		
			menu.hideItem("muItem_addphase");
			menu.hideItem("muItem_addlesson");
			menu.hideItem("muItem_EDIT1");
			menu.hideItem("muItem_ASSIGN");
			menu.hideItem("muItem_COPY");
			menu.hideItem("muItem_AD1");
			menu.hideItem("1")
			menu.hideItem("2");
			menu.hideItem("3");
			menu.hideItem("4");
			menu.hideItem("5");
			menu.hideItem("6");
		}
	}else if(level==5){
		showLessonContent(id);
		
		menu.setItemText("muItem_DELETE1", "删除课目");
		
		menu.hideItem("muItem_addphase");
		menu.hideItem("muItem_addlesson");
		menu.hideItem("muItem_EDIT1");
		menu.hideItem("muItem_ASSIGN");
		menu.hideItem("muItem_COPY");
		menu.hideItem("muItem_AD1");
		menu.hideItem("1")
		menu.hideItem("2");
		menu.hideItem("3");
		menu.hideItem("4");
		menu.hideItem("5");
		menu.hideItem("6");
	}else{	
	}
	
}
var isWrite = $("#isWrite").val();
if(isWrite==0){
	menu=new dhtmlXMenuObject("treeboxbox_tree");
	menu.setImagePath("../images/DhtxMenu/");
	menu.setIconsPath("../images/MenuIcon/");
	menu.renderAsContextMenu(true);
	menu.attachEvent("onClick",HandleMClk);
	menu.loadXML("../xmlfile/dhtmlxmenu.xml"); 
}

//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","348px","100%",0);
if(isWrite==0){
	tree.enableContextMenu(menu);
}
tree.setSkin('dhx_skyblue');
tree.setImagePath("../common/images/");
tree.enableDragAndDrop(false);

tree.setOnClickHandler(tonclick);
tree.enableTreeLines(true);
tree.setImageArrays("plus","plus2.gif","plus3.gif","plus4.gif","plus.gif","plus5.gif");
tree.setImageArrays("minus","minus2.gif","minus3.gif","minus4.gif","minus.gif","minus5.gif");
tree.setStdImages("book.gif","books_open.gif","books_close.gif");		
reloadPlan(0);

tree.attachEvent("onOpenEnd", function(id,state){//展开加载子节点。


	if(state==1){
		
		if(tree.getLevel(id)==1){
			reloadPlan(1);
		}else{
			readDataList(id,"showOutlineUnitList.do");
		}
		/*
		
		if(tree.getLevel(id)==1){
			reloadPlan(1);
		}else if(tree.getLevel(id)==2){
			readDataList(id,"showOutlineUnitList.do");
		}else if(tree.getLevel(id)==3){
			
			//var type= getTreeNodeType();
			//if(type=="unit"){
				
			//}
			readDataList(id,"showOutlinePhaseList.do");
		}else if(tree.getLevel(id)==4){
			readDataList(id,"showOutlinePhaseLessonList.do");
		}
		else{
			
		}
		*/
		
	}
	
});

function readDataList(id,url){
	tree.deleteChildItems(id);
	params = {"parentid":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:url,
		data:params,
		dataType:"json",
		success:function(data){
			
			for(i=0;i<data.length;i++){
				tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].VName);
			}
			
			for(i=0;i<data.length;i++){
				if(data[i].IStatus==1){
					tree.closeItem(data[i].VId);
				}else{
				}
			}
			//tonclick(id);
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
function getStatusName(type){
	var sName = "";
	if(type==0){
		sName="<font color=\"#50A13B\">已生效</font>";
	}else if(type==1){
		sName="<font color=\"#CC9900\">已取消</font>";
	}else if(type==3){
		sName="<font color=\"#3399FF\">未审批</font>";
	}else if(type==2){
		sName="<font color=\"#EB7979\">未通过</font>";
	}else{
		sName="未提交";
	}		
	return sName;
}
function showOutlineDetailList(data){
	var content = "";
	content+="<table id=\"usersTable\" class=\"colorTable\" border=\"1\" bordercolor=\"#E0E0E0\" cellspacing=\"0\" cellpadding=\"2\">";
	content+="<thead>";
	content+="<tr>";
	content+="<th height=\"24\" rowspan=\"2\" width=\"370\">大纲名称</th>";
	content+="<th rowspan=\"2\" width=\"50\">版本号</th>";
	content+="<th rowspan=\"2\" align=\"center\" width=\"55\">状态</th>";
	content+="<th colspan=\"4\" align=\"center\">时间</th>";
	content+="</tr>";
	content+="<tr>";
	content+="<th align=\"center\" width=\"55\">训练</th>";
	content+="<th align=\"center\" width=\"55\">飞机</th>";
	content+="<th align=\"center\" width=\"55\">训练器</th>";
	content+="<th align=\"center\" width=\"55\">模拟机</th>";
	content+="</tr>";
	content+="</thead>";
	content+="<tbody>";

	var sName = "";
	for(i=0;i<data.length;i++){
		if(data[i].ILessons==1){
			sName = getStatusName(data[i].IStatus);
			content+="<tr><td><A href=\"javascript:void(0)\" onclick=viewContent(\""+data[i].VId+"\") class=\"blue\">"+data[i].VName+"</A></td>";
			content+="<td  align=\"center\">"+data[i].VBc+"</td>";
			content+="<td align=\"center\">"+sName+"</td>";
			content+="<td align=\"right\">"+getFormatTime(data[i].DTraintime)+"&nbsp;&nbsp;</td>";
			content+="<td align=\"right\">"+getFormatTime(data[i].DPlanetime)+"&nbsp;&nbsp;</td>";
			content+="<td align=\"right\">"+getFormatTime(data[i].DTrainningdevicetime)+"&nbsp;&nbsp;</td>";
			content+="<td align=\"right\">"+getFormatTime(data[i].DMonijitime)+"&nbsp;&nbsp;</td>";
			content+="</tr>";
		}
	}
	content+="</tbody>";
	content+="</table>";
	$("#Panel2").html(content);
}
function reloadPlan(type){
	$("#PanelLesson").html("");
	var name = $.trim($("#searchKey").val());
	params = {"name":name,"sortId":$("#statusid").val()};
	if(type!=2){
		tree.deleteChildItems(0);
		tree.insertNewChild(0,1,"所有大纲");
	}
	$.ajax({
		type:"post",
		url:"showVOutlineDetailList.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(type==0){
				setTreeFromOrgList(data);//tree
				showOutlineDetailList(data);//list
			}else if(type==1){
				setTreeFromOrgList(data);	//tree
			}else{
				showOutlineDetailList(data);//list
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			alert("数据库连接错误，获取附件列表失败，请重试。");
			return;
		}
	});	
}

function setTreeFromOrgList(data){
	
	for(i=0;i<data.length;i++){
		tree.insertNewChild(data[i].VConditions,data[i].VId,data[i].VName);
	}
	for(i=0;i<data.length;i++){
		if(data[i].ILessons==1){
			tree.closeItem(data[i].VId);
		}
	}	
	$("#searchOutlineName").val("大纲名称");
}
/*
function unitdialogfuzhi(){
	
	var id = $("#parentid").val();
	if(id==""){
		return;
	}
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showTraininglessonunitdictionListById.do",
		data:params,
		dataType:"json",
		success:function(data){
			var content = "";
			for(i=0;i<data.length;i++){
				content+="<input name=\"zhizhao\" type=\"checkbox\" value=\""+data[i].VId+"\"> "+data[i].VName+"<span class=\"panelLine\"></span><br/>";
			}
			if(content==""){
				content= "已无单元可选。";
			}
			$("#lessonunitlistid").html(content);
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			alert("数据库连接错误，获取附件列表失败，请重试。");
			return;
		}
	});	
}
*/

function HandleMClk(menuid,zoom){
	
	var id = $("#parentid").val();
	if(id==""){
		alert("请先选择节点。");
		return ;
	}
	var text = menu.getItemText(menuid); 
	if(menuid=="muItem_AD1" && text=="创建大纲"){		
		window.location.href="open_createOutlinePage.do";
	}else if(menuid=="muItem_AD1" && text=="创建单元"){
		if(existOutlineUnit(1)==1){
			alert("选中的大纲不允许再创建单元。");
			return;	
		}
		clearValue();
		$("#opttype").val(3);
		$("#newUnitDialog").dialog('option', 'title', '创建单元');
		$( "#newUnitDialog" ).dialog( "open" );
		
	}else if(menuid=="muItem_COPY" && text=="复制大纲"){
		$("#copyOutlineWarning").html("确认复制选中的大纲吗？");
		$( "#copyOutlineForm" ).dialog( "open" );
		
	}else if(menuid=="muItem_EDIT1" && text=="修订大纲"){
		if(id==""){
			return;	
		}
		window.location.replace("open_editOutlinePage.do?id="+id);	
	}else if(menuid=="muItem_AD1" && text=="创建阶段"){
		if(isHasLessonById()==1){
			alert("选中的单元下已有课目，不能再创建阶段。");
			return;	
		}
		clearPhaseValue();
		$("#opttype").val(5);
		$("#newPhaseDialog").dialog('option', 'title', '创建阶段');
		$( "#newPhaseDialog" ).dialog( "open" );
		
	}else if(menuid=="muItem_EDIT1" && text=="编辑阶段"){
		$("#opttype").val(6);
		execPhaseEdit();
		
	}else if(menuid=="muItem_ASSIGN" && text=="添加课目"){
		gotoPage(1);
		$( "#lessonListDialog" ).dialog( "open" );
	}else if(menuid=="muItem_addlesson" && text=="添加课目"){
		if(getTreeNodeType()=="unit"){
			if(ifCanAddLessonById(0)==1){//大纲下有单元，判断单元下是否有阶段
				alert("选中的单元所在的大纲已经有阶段，不能在该类型大纲的单元下添加课目。");
				return;	
			}
		}
		if(existOutlineUnit(0)==1){
			alert("选中的大纲下已有单元，不能在已有单元的大纲下添加课目。");
			return;	
		}
		if(existOutlinePhase(0)==1){//大纲有阶段，单元为虚拟
			alert("选中的大纲下已有阶段，不能在已有阶段的大纲下添加课目。");
			return;	
		}
		gotoPage(1);
		$( "#lessonListDialog" ).dialog( "open" );
	}else if(menuid=="muItem_DELETE1" && text=="删除大纲"){
		if(tree.hasChildren(id)>0){
			alert("选中的大纲下有单元，不能删除。");
			return;
		}
		$("#opttype").val(8);
		deleteUnitbyID();
	}else if(menuid=="muItem_DELETE1" && text=="删除单元"){
		if(tree.hasChildren(id)>0){
			alert("选中的单元下有阶段，不能删除。");
			return;
		}
		$("#opttype").val(1);
		deleteUnitbyID();
	}else if(menuid=="muItem_DELETE1" && text=="删除阶段"){
		if(tree.hasChildren(id)>0){
			alert("选中的阶段下已分配课目，不能删除。");
			return;
		}
		$("#opttype").val(2);
		deleteUnitbyID();
	}else if(menuid=="muItem_DELETE1" && text=="删除课目"){
		$("#opttype").val(7);
		deleteUnitbyID();
	}else if(menuid=="muItem_EDIT1" && text=="编辑单元"){
		$("#opttype").val(4);
		execEdit();
	}else if(menuid=="muItem_ASSIGN" && text=="提交审批"){

		if($("#parentid").val()==""){
			alert("请选择要提交审批的大纲。");
			return;
		}
		$( "#auditConfirmForm" ).dialog( "open" );
	}else if(menuid=="muItem_addphase" && text=="创建阶段"){//大纲下
		if(existOutlineUnit(0)==1){
			alert("选中的大纲下已有单元，不能在已有单元的大纲下创建阶段。");
			return;	
		}
		//大纲下有课不能创建阶段
		if(isHasLessonById()==1){
			alert("选中的大纲下已有课目，不能再创建阶段。");
			return;	
		}
		clearPhaseValue();
		$("#opttype").val(10);
		$("#newPhaseDialog").dialog('option', 'title', '创建阶段');
		$( "#newPhaseDialog" ).dialog( "open" );
		
	}else{
		return;
	}
}
function existOutlineUnit(type){
	
	//ajax查询是否有单元
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择大纲。");
		return;
	}
	var d = 0;
	params = {"id":id,"sortId":type};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"existOutlineUnitById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag){
				d=1;
			}
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return 0;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return 0;
		}
	});	
	return d;
}
function existOutlinePhase(type){
	
	//ajax查询是否有阶段
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择大纲树节点。");
		return;
	}
	var d = 0;
	params = {"id":id,"sortId":type};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"existOutlinePhaseById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag){
				d=1;
			}
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return 0;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return 0;
		}
	});	
	return d;
}
function ifCanAddLessonById(type){
	
	//ajax查询是否有阶段
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择大纲树节点。");
		return;
	}
	var d = 0;
	params = {"id":id,"sortId":type};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"ifCanAddLessonById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag){
				d=1;
			}
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return 0;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return 0;
		}
	});	
	return d;
}
function isHasLessonById(){
	
	//ajax查询是否有阶段
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择大纲树节点。");
		return;
	}
	var d = 0;
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"isHasLessonById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag){
				d=1;
			}
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return 0;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return 0;
		}
	});	
	return d;
}
function getTreeNodeType(){

	var id = $("#parentid").val();
	if(id==""){
		alert("请选择大纲树节点。");
		return;
	}
	var d = "";
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"readTreeNodeTypeById.do",
		data:params,
		dataType:"json",
		success:function(data){
			d = data.message;
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return d;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return d;
		}
	});	
	return d;
}
function submitAuditbyID(){//大纲提交审批
	
	params = {"id":$("#parentid").val()};
	$.ajax({
		type:"post",
		url:"execOutlineSubmitAuditById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			reloadPlan(2);
			alert("大纲提交成功，等待审批中...");
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}

function execOutlineCopy(){//执行大纲复制
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择要复制的大纲。");
		return;
	}
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"execOutlineCopyById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			tree.insertNewItem(tree.getParentId(tree.getSelectedItemId()),data.VId,data.message,0,0,0,0);//copy=add
			tree.selectItem(data.VId);
			$("#parentid").val(data.VId);
			if(data.IStatus==1){
				tree.insertNewItem(data.VId,"100001","..",0,0,0,0);//为出现+号 添加一个子节点。
				tree.closeItem(data.VId);
			}
			$("#copyOutlineWarning").html("大纲复制成功。");
			$( "#copyOutlineForm" ).dialog( "close" );
			reloadPlan(2);
			alert("大纲复制成功。");
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}

function gotoPage(pageIndex){
	
    pageIndex=pageIndex<1?1:pageIndex;
	var name = $.trim($("#lessonName").val());
	if(name=="名称/编号"){
		name = "";
	}
	params = {"name":name,"pageIndex":pageIndex,"parentid":$("#parentid").val(),"sortId":$("#svunit").val()};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showVTrainingLessonContentList.do",
		data:params,
		dataType:"json",
		success:function(data){
			$("#isCheckBoxButtonid").attr("checked",false);
			var content = "";
			var selects = "";
			var selstr = "";
			for(i=0;i<data.data.length;i++){
				content+="<tr>";
				content+="<td align=\"center\"><input onClick=\"setIsCheckBoxButtonChecked();\" name=\"checkboxName\"";
				content+="type=\"checkbox\" value=\""+data.data[i].VId +";" + data.data[i].VName+"\"></td>";
				content+="<td align=\"center\"><input id=\"v"+data.data[i].VId+"\" type=\"text\" value=\"100\" class=\"yanzheng\"></td>";
				content+="<td align=\"center\">"+data.data[i].VNo+"</td>";
				content+="<td align=\"center\">"+data.data[i].VVersion+"</td>";
				content+="<td><input id=\"n"+data.data[i].VId+"\" type=\"text\" value=\""+data.data[i].VName+"\" class=\"yanzheng2\"></td>";
				content+="<td align=\"right\">"+data.data[i].VBz+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(data.data[i].DXlqsj)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(data.data[i].DFjsj)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(data.data[i].DMnjsj)+"&nbsp;&nbsp;</td>";
				content+="</tr>";
			}
			var start = data.pageStart;
			var end = data.pageEnd;
			var totalPageCount=data.totalPageCount;
			var totalCount=data.totalCount;
			var pageCount=totalPageCount;
			var pageIndex=data.currentPageNo; //当前页号
			
			for(j=1;j<=pageCount;j++){
				if(pageIndex==j){
					selstr = " selected=\"selected\"";
				}else{
					selstr = "";
				}
				selects+="<option value="+j+selstr+">"+j+"</option>";
			}
			content+="<tr><td colspan=\"9\" align=\"right\"><a href=\"javascript:firstPage("+pageIndex+");\" class=\"blue\">首页</a>&nbsp;<a href=\"javascript:prePage("+pageIndex+");\" class=\"blue\">上一页</a>&nbsp;<a href=\"javascript:nextPage("+pageIndex+","+pageCount+");\" class=\"blue\">下一页</a>&nbsp;<a href=\"javascript:lastPage("+pageIndex+","+pageCount+");\" class=\"blue\">尾页</a>&nbsp;<select id =\"seliid\" onchange=\"jumpPage()\">"+selects+"</select>本页显示"+start+"-"+end+"条/共"+totalPageCount+"页"+totalCount+"条&nbsp;&nbsp;</td></tr>";

			$("#assignLessonList").html(content);
			//$("#lessonName").val("名称/编号");
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			alert("数据库连接错误，获取附件列表失败，请重试。");
			return;
		}
	});	
}
function jumpPage(){
	var s = $("#seliid").val();
	gotoPage(s);
}

function firstPage(pageIndex){
	if (pageIndex!=1){
		gotoPage(1);
	}
}   
function nextPage(pageIndex,pageCount){
	if (pageIndex<pageCount){
		gotoPage(pageIndex+1);
	}     
}
function prePage(pageIndex){
	if (pageIndex>1){
		gotoPage(pageIndex-1);
	}
} 
function lastPage(pageIndex,pageCount){
	if (pageIndex!=pageCount){
		gotoPage(pageCount);
	}     
}

//删除
function deleteUnitbyID(){
	
	var id = $("#parentid").val();
	if(id==""){
		alert("请选择要删除的信息。");
		return;
	}
	$("#dialogForm2").dialog( "open" );
}
function execDel(){
	
	var type = $("#opttype").val();
	var url= "";
	var id = $("#parentid").val();
	params = {"id":id};
	if(type==1){
		url = "deleteOutlineUnit.do";
	}else if(type==2){
		url = "deleteOutlinePhase.do";
	}else if(type==7){
		url = "deleteOutlinePhaseAndLessonRelation.do";
	}else if(type==8){
		url = "deleteOutlineById.do";
	}else{
		
	}
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:url,
		data:params,
		dataType:"json",
		success:function(data){

			if(data.flag==false){
				alert(data.message);
				return;
			}
			if(data.flag==true){
				tree.selectItem(tree.getSelectedItemId());
				tree.deleteItem(tree.getSelectedItemId(),true);
				$("#parentid").val(tree.getSelectedItemId());
				if(type==8){
					reloadPlan(2);	
				}
				return;
			}
			
		},
		error: function (xmlReq,textStatus,errorThrown){
			alert("数据库连接错误，删除失败，请重试。");
			return false;
		}
	});	
}
function selectAll(name) { 
	var el = document.getElementsByName("checkboxName"); 
	for (var i = 0; i < el.length; i++) { 
		if(el[i].type == "checkbox" && el[i].name == name) { 
			el[i].checked = true; 
		} 
	} 
} 
function clearAll(name) { 
	var el = document.getElementsByName("checkboxName"); 
	for (var i = 0; i < el.length; i++) { 
		if(el[i].type == "checkbox" && el[i].name == name) { 
			el[i].checked=false; 
		} 
	} 
} 
function isSelectALL(){
	var checkBoxButton = document.getElementsByName("isCheckBoxButton");
	if(checkBoxButton[0].checked){
		selectAll('checkboxName');
	}else{
		clearAll('checkboxName');
	}
}
function setIsCheckBoxButtonChecked(){
	var el = document.getElementsByName("checkboxName"); 
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
function setOrder(d,id){
	$("#iorder").val(d);
	$("#sid").val(id);
	$( "#setDialogForm" ).dialog( "open" );
}
//以下内容显示大纲课目列表
function gotoPage2(pageIndex){
	$("#hasLesson").val(0);
	pageIndex=pageIndex<1?1:pageIndex;
	var content = "";
	var xunlian=0;
	var feiji = 0;
	var xunlianqi = 0;
	var moniji = 0;
	params = {"parentid":$("#parentid").val(),"sortId":$("#nodeType").val(),"pageIndex":pageIndex};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showVTrainingLessonListByParentId.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.data.length>0){
				$("#hasLesson").val(1);
				content+="<table id=\"usersTable\" class=\"colorTable\" border=\"1\" bordercolor=\"#E0E0E0\" cellspacing=\"0\" cellpadding=\"2\">";
				content+="<thead>";
				content+="<tr>";
				content+="<th width=\"60\" rowspan=\"2\" class=\"thSortableGray\">手工排序</th>";
				content+="<th width=\"80\" rowspan=\"2\" class=\"thSortableGray\">课目编号</th>";
				content+="<th width=\"80\" rowspan=\"2\" class=\"thSortableGray\">版本号</th>";
				content+="<th rowspan=\"2\" class=\"thSortableGray\">课目别名</th>";
				content+="<th colspan=\"4\" class=\"thSortableGray\">时间</th>";
				content+="</tr>";
				content+="<tr>";
				content+="<th class=\"thSortableGray\" width=\"60\">训练</th>";
				content+="<th width=\"60\" class=\"thSortableGray\">训练器</th>";
				content+="<th width=\"60\" class=\"thSortableGray\">飞机</th>";
				content+="<th width=\"60\" class=\"thSortableGray\">模拟机</th>";
				content+="</tr>";
				content+="</thead><tbody>";
			}
			var selects = "";
			var selstr = "";
			for(i=0;i<data.data.length;i++){
				if(isWrite==0){
					content+="<tr><td align=\"center\">"+data.data[i].IOrder+" <a href=\"javascript:void(0)\" class=\"blue\" onclick=\"setOrder('"+data.data[i].IOrder+"','"+data.data[i].VId+"')\">设</a></td>";
				}else{
					content+="<tr><td align=\"center\">"+data.data[i].IOrder+"</td>";
				}
				
				content+="<td align=\"center\">"+data.data[i].VNo+"</td>";
				content+="<td align=\"center\">"+data.data[i].VVersion+"</td>";
				content+="<td><a href=\"javascript:void(0)\" class=\"blue\" onclick=\"viewLessonCotent('"+data.data[i].VId+"')\">"+data.data[i].VName+"</a></td>";
				content+="<td align=\"right\">"+getFormatTime(data.data[i].DYbsj)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(data.data[i].DXlqsj)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(data.data[i].DFjsj)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(data.data[i].DMnjsj)+"&nbsp;&nbsp;</td></tr>";
				xunlian+= parseInt(data.data[i].DYbsj);
				xunlianqi+= parseInt(data.data[i].DXlqsj);
				feiji+= parseInt(data.data[i].DFjsj);
				moniji+= parseInt(data.data[i].DMnjsj);
			}
			var start = data.pageStart;
			var end = data.pageEnd;
			var totalPageCount=data.totalPageCount;
			var totalCount=data.totalCount;
			var pageCount=totalPageCount;
			var pageIndex=data.currentPageNo; //当前页号
			$("#curpageid").val(pageIndex);
			for(j=1;j<=pageCount;j++){
				if(pageIndex==j){
					selstr = " selected=\"selected\"";
				}else{
					selstr = "";
				}
				selects+="<option value="+j+selstr+">"+j+"</option>";
			}
			if(data.data.length>0){
				
				content+="<tr><td colspan=\"8\" align=\"right\"><a href=\"javascript:firstPage2("+pageIndex+");\" class=\"blue\">首页</a>";
				content+="&nbsp;<a href=\"javascript:prePage2("+pageIndex+");\" class=\"blue\">上一页</a>";
				content+="&nbsp;<a href=\"javascript:nextPage2("+pageIndex+","+pageCount+");\" class=\"blue\">下一页</a>";
				content+="&nbsp;<a href=\"javascript:lastPage2("+pageIndex+","+pageCount+");\" class=\"blue\">尾页</a>";
				content+="&nbsp;<select id =\"seliid2\" onchange=\"jumpPage2()\">"+selects+"</select>";
				content+="本页显示"+start+"-"+end+"条/共"+totalPageCount+"页"+totalCount+"条&nbsp;&nbsp;</td></tr>";
				
				content+="<tr><td colspan=\"4\" align=\"right\">本页合计：&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(xunlian)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(xunlianqi)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(feiji)+"&nbsp;&nbsp;</td>";
				content+="<td align=\"right\">"+getFormatTime(moniji)+"&nbsp;&nbsp;</td>";
				content+="</tr>";				
//				content+="</tbody></table>";
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return "";
			}
			alert("数据库连接错误，获取附件列表失败，请重试。");
			return "";
		}
	});	
	return content;
	//$("#PanelLesson").html(content);
}
function jumpPage2(){
	var s = $("#seliid2").val();
	var c = gotoPage2(s);
	if($("#hasLesson").val()==1){
		$("#PanelLesson").html(c+"</tbody></table>");
	}else{
		$("#PanelLesson").html("");
	}
}

function firstPage2(pageIndex){
	if (pageIndex!=1){
		var c= gotoPage2(1);
		if($("#hasLesson").val()==1){
			$("#PanelLesson").html(c+"</tbody></table>");
		}else{
			$("#PanelLesson").html("");
		}
	}
}   
function nextPage2(pageIndex,pageCount){
	if (pageIndex<pageCount){
		var c = gotoPage2(pageIndex+1);
		if($("#hasLesson").val()==1){
			$("#PanelLesson").html(c+"</tbody></table>");
		}else{
			$("#PanelLesson").html("");
		}
	}     
}
function prePage2(pageIndex){
	if (pageIndex>1){
		var c=gotoPage2(pageIndex-1);
		if($("#hasLesson").val()==1){
			$("#PanelLesson").html(c+"</tbody></table>");
		}else{
			$("#PanelLesson").html("");
		}
	}
} 
function lastPage2(pageIndex,pageCount){
	if (pageIndex!=pageCount){
		var c = gotoPage2(pageCount);
		if($("#hasLesson").val()==1){
			$("#PanelLesson").html(c+"</tbody></table>");
		}else{
			$("#PanelLesson").html("");
		}
	}     
}

</script><input type="hidden" id="curpageid" value="1">