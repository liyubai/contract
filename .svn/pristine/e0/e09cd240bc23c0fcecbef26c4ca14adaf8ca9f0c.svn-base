<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>训练课目</title>
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
#Panel1, .buttonBox { width: auto; margin-left: 50px; margin-right: 50px; padding-top: 0; }
.Panel, .panelContent, .panelTable, td { background-color: transparent; box-shadow: none; filter: none; }

.rightLine1{width:80px; float:left; height:35px; text-align:center;border-right:solid 1px #DBE3E8;}
.rightLine2{width:80px; float:left; text-align:center;border-right:solid 1px #DBE3E8; padding-top:4px;}
.middleclass{background: #EEEEEE; width: 100%; height: 1px; line-height: 1px; margin: 0px 0 0px 0; display: block; clear: both;}
.texta{border:solid 1px #696969; width:50px;}
</style>
<script>
$(function() {

	$("div.dropDownList").find("button").css("width","112px").end().each(function(i){
		new $.dropDownList(i,true,112);
	})

	$( "#dialogForm1" ).dialog({//站选择
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var radiov = getSelRadioValue('stationName')
				if(radiov==""){
					$("#dialogForm3Warning").html("请选择始发站。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#startposid").val(radiov.split(",")[0]);
				$("#startpos").html(radiov.split(",")[1]);
				$( this ).dialog( "close" );

			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#dialogForm2" ).dialog({//到达站选择
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var radiov = getSelRadioValue('endstationName')
				if(radiov==""){
					$("#dialogForm3Warning").html("请选择到达站。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#endposid").val(radiov.split(",")[0]);
				$("#endpos").html(radiov.split(",")[1]);
				$( this ).dialog( "close" );

			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
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
	function checkRegexp( o) {
		var re = /^\d+(\.\d+)?$/; //判断浮点数
		if ( re.test( o ) ) {
			return true;
		} else {
			return false;
		}
	}
	execsearch();//初始化
	function execsearch(){
		var id = "${id}";
		params = {"id":id};
		$.ajax({
			type:"post",
			url:"showTraininglessonSubjectRelationListById.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					return;	
				}
				$("#subjectlistid").html("");
				var ids = "";
				var vunit = "";
				var content="";
				var vtime = "";
				for(i=0;i<data.length;i++){
					content+="<div class=\"rightLine1\">"+data[i].VName+"</div>";
					vunit = data[i].VUnit;
				}
				content+="<span class=\"middleclass\"></span>";
				
				for(i=0;i<data.length;i++){
					content+="<div class=\"rightLine2\"><input id=a_"+i+" value=\""+data[i].DTime+"\" type=\"text\" class=\"text ui-widget-content ui-corner-all\" style=\"width:40px;\" onblur=\"viewTime('a_"+i+"')\" onMouseDown=\"deletebMF('a_"+i+"')\" /></div>";
					ids+="a_" + i + ",";
				}
				$("#subjects").val(ids);
				$("#csortId").val(vunit);
				$("#subjectlistid").html(content);
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
	function giveValue(){

		$("#VName").val($("#cVName").val());
		$("#VNo").val($("#cVNo").val());
		$("#VVersion").val($("#cVVersion").val());
		$("#IType").val($("#cIType").val());
		$("#IPlaneproperty").val($("#cIPlaneproperty").val());
		
		$("#ITrainType").val($("#cITrainType").val());
		$("#IDaynightproperty").val($("#cIDaynightproperty").val());
		
		$("#IFxxz").val($("#cIFxxz").val());
		$("#IKcxz").val($("#cIKcxz").val());
		$("#ITj").val($("#cITj").val());
		$("#DFjsj").val($("#cDFjsj").val());
		
		$("#VTrainpurpose").val($("#cVTrainpurpose").val());
		$("#VTiaojian").val($("#cVTiaojian").val());
		
		$("#VXiangmu").val($("#cVXiangmu").val());
		$("#VTsyq").val($("#cVTsyq").val());
		$("#VBz").val($("#cVBz").val());
		
		$("#IIsthree").val(getSelRadioValue("cIIsthree"));
		$("#IOneNum").val($("#cIOneNum").val());
		$("#ITotalNum").val($("#cITotalNum").val());
	
		if(!checkNum($("#IOneNum").val())){
			alert("单段里程数应为数字。");
			$("#cIOneNum").focus();
			return;
		}
		if(!checkNum($("#ITotalNum").val())){
			alert("总里程数应为数字。");
			$("#cITotalNum").focus();
			return;
		}
		if($("#IIsthree").val()==""){
			alert("请选择是否强制三点转场。");
			return;
		}
		
		if($("#VNo").val()==""){
			alert("课目编号不能为空。");
			$("#cVNo").focus();
			return false;
		}
		if($("#VName").val()==""){
			alert("课目名称不能为空。");
			$("#cVName").focus();
			return false;
		}

		if($("#ITrainType").val()==1 && ($("#startposid").val()=="")){
			alert("请为转场课目选择转场航线。");
			return false;
		}
		if($.trim($("#DFjsj").val())==""){
			alert("训练时间不能为空");
			$("#cDFjsj").focus();
			return false;
		}
		var timel = $.trim($("#DFjsj").val()).replace(":","");
		if(timel.length>4){
			alert("训练时间长度不能大于四位");
			$("#cDFjsj").focus();
			return false;
		}
		if(!checkNum(timel)){
			alert("训练时间请输入数字。");
			return false;
		}
		$("#DFjsj").val($("#DFjsj").val().split(":")[0]*60 + parseInt($("#DFjsj").val().split(":")[1]));//飞行时间，转化成分钟
	
		return true;

	}
	function execfuzhi(){
		var ids = $("#subjects").val().split(",");
		var idv="";
		for(i=0;i<ids.length-1;i++){
			if($("#" + ids[i]).val()==""){
				idv+="0,";
			}else{
				if(!checkRegexp($("#" + ids[i]).val().replace(":",""))){
					alert("时间应输入数字。");
					$("#" + ids[i]).focus();
					return false;
				}
				idv+=$("#" + ids[i]).val() + ",";
			}
		}
		$("#csubjects").val(idv);	
	}
	$("#saveone").click(function(){//保存数据
		if(giveValue()){
			//alert(44)
			execfuzhi();

			$( "#unitSubjectForm" ).submit();
		}
	});
	$("#savetwo").click(function(){//保存数据
		if(giveValue()){
			execfuzhi();
			$( "#unitSubjectForm" ).submit();
		}
	});
	$("#startAdd").click(function(){//打开选择站的窗口
		$( "#dialogForm1" ).dialog( "open" );
	});
	$("#endAdd").click(function(){//打开选择站的窗口
		$( "#dialogForm2" ).dialog( "open" );
	});
	var unitid = "${unitid}";
	$("#escid0").click(function(){//上面取消
		window.location.href="open_trainingLessonList.do?unitid=" +unitid;
	});
	$("#escid1").click(function(){//下面取消
		window.location.href="open_trainingLessonList.do?unitid=" +unitid;
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
	
	$("#editsubject").click(function(){// 编辑设置科目
		//execFuZhia(1);
		$( "#editDialogSubject" ).dialog( "open" );
		
	});
	function execFuZhia(type){
		//窗体赋值
		params = {"id":$("#lessonid").val()};
		$.ajax({
			async:false,//同步请求
			type:"post",
			url:"showSetTrainsubjectListById.do",
			data:params,
			dataType:"json",
			success:function(data){
				var ids = "";
				var content="";
				var score = "";
				for(i=0;i<data.length;i++){
			
					if(data[i].ISort==0){
						content+="<tr><td colspan=\"2\"><img src=\"themes/cupertino/images/plane.gif\" align=\"absmiddle\" />&nbsp;&nbsp;"+data[i].VName+"</td></tr>";
					}else{
						content+="<tr><td width=\"70%\" style=\"padding-left:25px;\">"+data[i].VName+"</td>";
						if(data[i].DScore==100){
							score = "";
						}else{
							score = data[i].DScore;
						}
						if(type==1){
							
							content+="<td width=\"30%\"><input id=\""+data[i].VId+"\" type=\"text\" value=\""+score+
						"\"  style=\"width:50px;\" class=\"text ui-widget-content ui-corner-all\" /></td></tr>";
						}else{
							content+="<td width=\"30%\">"+score+"</td></tr>";
						}
						content+="<tr><td colspan=\"2\"><span class=\"panelLine\"></span></td></tr>";
						ids+=data[i].VId + ",";
					}
				}
				$("#subjects2").val(ids);
				if(content==""){
					$("#subjectListId").html("<li><br/><br/>　　　目前该课目没有科目。</li>");
					
				}else{
					$("#subjectListId").html(content);
				}
			
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		
	}
	$( "#editDialogSubject" ).dialog({
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var ids = "";
				var v = "";
				var r1=document.getElementsByName('sortId');
				for(i=0;i<r1.length;i++){
					v = $("#v"+r1[i].value.split(",")[0]).val();
					if(r1[i].checked==true){
						if(r1[i].value.split(",")[1]==0){
							if(v==""){
								ids+=r1[i].value.split(",")[0] + ",100;";
							}else{
								ids+=r1[i].value.split(",")[0] + ","+v+";";
							}
						}else{
							if(!checkRegexp(v)){
								alert("评分标准应为数字。");
								$("#v"+r1[i].value.split(",")[0]).focus();
								return false;
							}
							ids+=r1[i].value.split(",")[0] + ","+ v + ";";
						}
						
					}
				}
				if(ids==""){
					$("#dialogForm3Warning").html("请选择科目。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#VNeirong").val(ids);
				$( this ).dialog( "close" );
			
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#lineButton").click(function(){	
		$( "#lineFormDialog" ).dialog( "open" );
	});
	$( "#lineFormDialog" ).dialog({
		autoOpen: false,
		height: 480,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//var radiov = getSelRadioValue('lineName')
				var str = "";
				var r1=document.getElementsByName('lineName');
				for(i=0;i<r1.length;i++){
					if(r1[i].checked==true){
						str+=r1[i].value + ",";
					}
				}
				if(str==""){
					$("#dialogForm3Warning").html("请选择航线。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#startposid").val(str);
				//$("#saveForm").submit();
				$( "#lineFormDialog" ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	var ed = $("#eds").val();//已选科目
	//var eds = ed.split(",");

	var sortt = $("#sorts").val();//分类
	var sorts = sortt.split(",");
	var esub=$("#esub").val();//科目
	var esubs = esub.split(",");
	var lis="";
	var score = "";
	var flag = "";
	var k = 0;
	var p = 0;
	var p0 = "";
	var kk=0;
	for(i=0;i<sorts.length-1;i++){
		lis="";
		if(sorts[i]=="fbd340614724e262014724f0f134000a"){
			 k = 0;
		}else{
			 k = 1;
		}
		for(j=0;j<esubs.length-1;j++){
			if(sorts[i]==esubs[j].split(";")[2]){
				score = "";
				flag = "";
				p=ed.indexOf(esubs[j].split(";")[0]);
				if(p!=-1){
					flag="checked";
					p0 = ed.substring(p+esubs[j].split(";")[0].length+1,p+esubs[j].split(";")[0].length+1+10);
					kk = p0.indexOf(",");
					if(kk==-1){
						score=p0;
					}else{
						score= p0.substring(0,kk);
					}
				}
				if(score==100){
					score = "";
				}
				
				lis+="<li><div style=\"float:left;\">&nbsp;&nbsp;<input name=\"sortId\"";
				lis+=" type=\"checkbox\" "+flag+" value=\""+esubs[j].split(";")[0]+","+k+"\"/>&nbsp;&nbsp;</div>";
				lis+="<div style=\"float:left;width:240px;\">"+esubs[j].split(";")[1]+"</div>&nbsp;&nbsp;";
				lis+="<input id=\"v"+esubs[j].split(";")[0]+"\" onFocus=\"selected('"+esubs[j].split(";")[0]+","+k+"')\"";
				lis+="onclick=\"selected('"+esubs[j].split(";")[0]+","+k+"')\" type=\"text\"  value=\""+score+"\" class=\"texta\"/></li>";
			}
		}
		$("#c" + sorts[i]).html(lis);
	}
	
});
function selected(id){
	var r1=document.getElementsByName('sortId');
	for(i=0;i<r1.length;i++){
		if(r1[i].value==id){
			r1[i].checked=false;
			r1[i].click();
			return;
		}
	}
}
function viewStation(type){
	if(type==0){
		$("#stationid")[0].style.display='none';;
	}else{
		$("#stationid")[0].style.display='';;
	}
	
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

<div id="topPartD"><div class="panelBox buttonBox"><%request.setAttribute("k",ActionContext.getContext().getName());%>
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
<button class="green" primary="ui-icon-button-confirm" id="saveone">修改</button></s:if>
<button class="normal" id="escid0"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div></div>

<div id="rightPartD"><div>
<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
		
			<tbody>
			  <tr class="normal">
				<td width="90" align="right">课目编号：</td>
				<td width="120"><div style="margin-top:5px;"><input id="cVNo" value="${trainingLesson.VNo}" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td width="60">课目名称：</td>
				<td width="120" ><div style="margin-top:5px;"><input id="cVName"  value="${trainingLesson.VName}" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" title="${trainingLesson.VName}" /></div></td>
				<td width="60">版 本 号：</td>
				<td width="120"><div style="margin-top:5px;"><input id="cVVersion"  value="${trainingLesson.VVersion}" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td width="60">&nbsp;</td>
				<td> </td>
			  </tr>
			  <tr class="normal">
				<td align="right" style="height:39px;">课目性质：</td>
				<td><div class="dropDownList">
						<button>训练</button>
						<ul>
							<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>训练</a></li>
							<li><a href="#N" val="1">检查</a></li>
                            <li><a href="#N" val="2">考试</a></li>
						</ul>
				  <input type="hidden" id="cIKcxz" value="${trainingLesson.IKcxz}" />
				</div></td>
				<td>设备类型：</td>
				<td><div class="dropDownList">
						<button>飞机</button>
						<ul>
                        	<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>飞机</a></li>
							<li><a href="#N" val="1">训练器</a></li>
                            <li><a href="#N" val="2">模拟机</a></li>
						</ul>
						<input type="hidden" id="cIType" value="${trainingLesson.IType}" />
				</div></td>
				<td><span style="height:39px;">飞机性质：</span></td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>单发</a></li>
							<li><a href="#N" val="1">多发</a></li>
                            <li><a href="#N" val="2">高性能</a></li>
						</ul>
				  <input type="hidden" id="cIPlaneproperty" value="${trainingLesson.IPlaneproperty}" />
				</div></td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              <tr class="normal">
				<td align="right" style="height:39px;">本转性质：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
                   
							<li><a href="#N" val="0" onClick="viewStation(0)"><span class="ui-icon ui-icon-bullet"></span>本场</a></li>
							<li><a href="#N" val="1" onClick="viewStation(1)">转场</a></li>
						</ul>
				  <input type="hidden" id="cITrainType" value="${trainingLesson.ITrainType}" />
				</div></td>
				<td>飞行性质：</td>
				<td><div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>带飞</a></li>
							<li><a href="#N" val="1">单飞</a></li>
                            <li><a href="#N" val="2">机长</a></li>
						</ul>
				  <input type="hidden" id="cIFxxz" value="${trainingLesson.IFxxz}" />
				</div></td>
				<td>昼夜性质：</td>
				<td><div class="dropDownList">
						<button>昼间</button>
						<ul>
                       		 <li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>昼间</a></li>
							<li><a href="#N" val="1">夜间</a></li>
						</ul>
				  <input type="hidden" id="cIDaynightproperty" value="${trainingLesson.IDaynightproperty}" />
				</div></td>
				<td>是否特技：</td>
				<td><div class="dropDownList">
						<button>否</button>
						<ul>
							<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>否</a></li>
							<li><a href="#N" val="1">是</a></li>
						</ul>
				  <input type="hidden" id="cITj" value="${trainingLesson.ITj}" />
				</div></td>
			  </tr>
			  <tr class="normal">
				<td align="right">训练时间：</td>
				<td>
                <div style="margin-top:5px;">
                <input id="cDFjsj" value="${trainingLesson.VNeirong}" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" onMouseDown="deletebMF('cDFjsj')" onBlur="viewTime('cDFjsj')"  />
                </div>
                </td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr class="normal" id="stationid" <s:if test='trainingLesson.ITrainType==0'>style="display:none"</s:if>>
				<td align="right">转场航线：</td>
				<td colspan="3"><button class="green" id="lineButton">建议使用的转场航线</button></td>
				<td></td>
				<td></td>
				<td></td>
				<td>&nbsp;</td>
			  </tr>
              
              <tr class="normal">
			    <td height="36" align="right">科目时间：</td>
			    <td colspan="7" id="subjectlistid"></td>
		      </tr>
			  <tr class="normal">
				<td align="right">训练目的：</td>
				<td colspan="3"><textarea  id="cVTrainpurpose"  style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all">${trainingLesson.VTrainpurpose}</textarea></td>
				<td>训练内容<br>
及标准：</td>
				<td colspan="3"><button class="green" id="editsubject">编辑已设置科目</button></td>
			  </tr>
			  <tr class="normal">
				<td align="right">非常规项目：</td>
				<td colspan="3"><textarea  id="cVXiangmu" style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all">${trainingLesson.VXiangmu}</textarea></td>
				<td>进入条件：</td>
				<td colspan="3"><textarea  id="cVTiaojian" style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all">${trainingLesson.VTiaojian}</textarea></td>
			  </tr>
			  <tr class="normal">
			    <td align="right">备注：</td>
			    <td colspan="3"><textarea  id="cVBz" style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all">${trainingLesson.VBz}</textarea></td>
			    <td>特殊要求：</td>
			    <td colspan="3">
                 强制三点转场：
                <input  type="radio"  name="cIIsthree" value="1" <s:if test='trainingLesson.IIsthree==1'>checked</s:if>/>是 <input  type="radio" name="cIIsthree" value="2"  <s:if test='trainingLesson.IIsthree==2 || trainingLesson.IIsthree==0 '>checked</s:if>/>否<br/>
                单段里程数不能少于 <input id="cIOneNum" type="text" value="${trainingLesson.IOneNum}" class="text ui-widget-content ui-corner-all" style="width:60px;">千米<br/>
                总里程数不能少于 <input id="cITotalNum" type="text" value="${trainingLesson.ITotalNum}" class="text ui-widget-content ui-corner-all" style="width:60px;">千米
                <input type="hidden"  value="${trainingLesson.VTsyq}" id="cVTsyq" ></td>
		      </tr>
		
			</tbody>
		</table>

	</div>
</div>


<div class="panelBox buttonBox"><s:if test="#r==null || #r==0">
<button class="green" primary="ui-icon-button-confirm" id="savetwo">修改</button></s:if>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>

</div>
</div>
<s:set name="eds" value="''"/><s:iterator value="trainlessonsubjectList"><s:set name="eds" value="#eds+TTrainsubject.VId+';'+DScore+','"/></s:iterator>
<s:set name="esub" value="''"/><s:iterator value="trainsubjectList"><s:set name="esub" value="#esub+VId+';'+VName+';'+TSubjectsort.VId+','"/></s:iterator>
<input id="esub" type="hidden" value="${esub}"><input id="eds" type="hidden" value="${eds}">
<div id="editDialogSubject"  title="科目列表"><s:set name="sorts" value="''"/>
<s:iterator value="subjectsortList"><s:set name="sorts" value="#sorts+VId+','"/>
<ul class="foldList">
<li class="sortName"><span class="ui-icon ui-icon-carat-1-s"></span>${VName}</li>
<ul class="itemList" id="c${VId}">
</ul>
</ul>
<span class="panelLine"></span>
</s:iterator>
</div>
<input id="sorts" type="hidden" value="${sorts}">
<div id="dialogForm3">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
		</div>
	</fieldset>	
</div>

<div id="lineFormDialog"  title="转场航线列表">
     <fieldset>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
    <td height="24">选项</td>
    <td>始发站</td>
    <td >到达站</td>
    <td>航段里程(千米)</td>
    </tr>
    <s:set name="lines" value="''"/>
    <s:iterator value="changedbaseflylineList" ><s:set name="p" value="0"/><s:set name="id" value="VId"/>
    <tr>
    <td height="24"><s:iterator value="lineList"><s:if test='#id==changedbaseflyline.VId'><s:set name="lines" value="#lines +changedbaseflyline.VId+','"/><s:set name="p" value="1"/></s:if></s:iterator><input type="checkbox" name="lineName" value="${VId}" <s:if test='#p==1'>checked</s:if>/><b></b></td>
    <td  height="24">${stationByStartStationid.VName}</td>
    <td  height="24">${stationByEndStationId.VName}</td>
    <td  height="24"><s:text name="format.number2"><s:param value="DCourse"/></s:text></td>
    </s:iterator>
    <tr>
    </table>
 </fieldset>
</div>
<s:form id="unitSubjectForm" method="post" action="updateTrainingLesson">
<input type="hidden" name="trainingLesson.VId" value="${trainingLesson.VId}" id="lessonid"/>

<input type="hidden" name="trainingLesson.VName" id="VName" value="${trainingLesson.VName}" />
<input type="hidden" name="trainingLesson.VNo" id="VNo"  value="${trainingLesson.VNo}"/>
<input type="hidden" name="trainingLesson.VVersion" id="VVersion"  value="${trainingLesson.VVersion}"/>

<input type="hidden" name="trainingLesson.IType" id="IType"  value="${trainingLesson.IType}"/>
<input type="hidden" name="trainingLesson.IPlaneproperty" id="IPlaneproperty"  value="${trainingLesson.IPlaneproperty}"/>
<input type="hidden" name="trainingLesson.ITrainType" id="ITrainType"  value="${trainingLesson.ITrainType}"/>
<input type="hidden" name="trainingLesson.IDaynightproperty" id="IDaynightproperty" value="${trainingLesson.IDaynightproperty}" />

<input type="hidden" name="trainingLesson.IFxxz" id="IFxxz"  value="${trainingLesson.IFxxz}"/>
<input type="hidden" name="trainingLesson.IKcxz" id="IKcxz"  value="${trainingLesson.IKcxz}"/>
<input type="hidden" name="trainingLesson.ITj" id="ITj" value="${trainingLesson.ITj}" />
<input type="hidden" name="trainingLesson.DFjsj" id="DFjsj"  value="${trainingLesson.DFjsj}"/>
<input type="hidden" name="trainingLesson.DYbsj" id="DYbsj" value="${trainingLesson.DYbsj}" />

<input type="hidden" name="trainingLesson.stationByVStartpos.VId" id="startposid" value="${lines}" /><!--存储转场航线id-->
<input type="hidden" name="trainingLesson.stationByVEndpos.VId" id="endposid" value="${trainingLesson.stationByVEndpos.VId}" />

<input type="hidden" name="trainingLesson.VTrainpurpose" id="VTrainpurpose"  value="${trainingLesson.VTrainpurpose}"/>
<input type="hidden" name="trainingLesson.VNeirong" id="VNeirong"  value=""/>
<input type="hidden" name="trainingLesson.VTiaojian" id="VTiaojian"  value="${trainingLesson.VTiaojian}"/>
<input type="hidden" name="trainingLesson.VShebei" id="VShebei"  value="${trainingLesson.VShebei}"/>
<input type="hidden" name="trainingLesson.VXiangmu" id="VXiangmu"  value="${trainingLesson.VXiangmu}"/>
<input type="hidden" name="trainingLesson.VTsyq" id="VTsyq"  value="${trainingLesson.VTsyq}"/>
<input type="hidden" name="trainingLesson.VBz" id="VBz"  value="${trainingLesson.VBz}"/>

<input type="hidden" name="trainingLesson.IIsthree" id="IIsthree" value="${trainingLesson.IIsthree}" />
<input type="hidden" name="trainingLesson.IOneNum" id="IOneNum"  value="${trainingLesson.IOneNum}" />
<input type="hidden" name="trainingLesson.ITotalNum" id="ITotalNum" value="${trainingLesson.ITotalNum}" />

<input type="hidden" name="unitSubjectDicIdStr" id="csubjects"/>
<input type="hidden" name="sortId" id="csortId"/>
<input type="hidden" name="unitid" value="${unitid}"/>
</s:form>
<form   method="post" id="updateForm">
<input name="viewTrainsubject.VId" type="hidden" id="updatelessonid" value="${trainingLesson.VId}" >
<input name="viewTrainsubject.typeid" type="hidden" id="updatesubjectIds">
</form>
<input type="hidden"  id="subjects"/>
<input type="hidden"  id="subjects2"/>
<%@ include file="../../result.jsp"%>
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