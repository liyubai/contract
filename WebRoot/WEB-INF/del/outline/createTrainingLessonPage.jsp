<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>创建训练课目</title>
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
	
	function checkRegexp( o) {
		var re = /^\d+(\.\d+)?$/; //判断浮点数
		if ( re.test( o ) ) {
			return true;
		} else {
			return false;
		}
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
		$("#DYbsj").val($("#cDYbsj").val());
		
		$("#VTrainpurpose").val($("#cVTrainpurpose").val());
		$("#VTiaojian").val($("#cVTiaojian").val());
		$("#VShebei").val($("#cVShebei").val());
		
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

		if($("#ITrainType").val()==1 && ($("#startposid").val()=="")){
			alert("请为转场课目选择转场航线。");
			return false;
		}
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
		$("#csortId").val(getSelRadioValue('unitName'));
		$("#csubjects").val(idv);	
	}
	$("#saveone").click(function(){//保存数据
		if(giveValue()){
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
	$("input.inputunit").click(function(){
		var selv = getSelRadioValue('unitName');
		if(selv==this.id)
			return;
		execsearch(this.id);
	})
	execsearch(unitid);//初始化
	function execsearch(id){
		
		var r1=document.getElementsByName('unitName');
		for(i=0;i<r1.length;i++){
			
			if(unitid==r1[i].value){
				r1[i].checked=true;
			}
		}
		
		params = {"id":id};
		$.ajax({
			type:"post",
			url:"showTimesubjectByLessonUnitIdById.do",
			data:params,
			dataType:"json",
			success:function(data){
				$("#subjectlistid").html("");
				var ids = "";
				var content="";
				for(i=0;i<data.length;i++){
					content+="<div class=\"rightLine1\">"+data[i].VName+"</div>";
				}
				content+="<span class=\"middleclass\"></span>";
				
				for(i=0;i<data.length;i++){
					content+="<div class=\"rightLine2\"><input id=a_"+i+" type=\"text\" class=\"text ui-widget-content ui-corner-all\" style=\"width:40px;\" onblur=\"viewTime('a_"+i+"')\" onMouseDown=\"deletebMF('a_"+i+"')\" /></div>";
					ids+="a_" + i + ",";
				}
				$("#subjects").val(ids);
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
	$("#addsubject").click(function(){//设置科目

		$( "#dialogSubject" ).dialog( "open" );
		
	});
	$( "#dialogSubject" ).dialog({
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var ids = "";
				var r1=document.getElementsByName('sortId');
				for(i=0;i<r1.length;i++){
					if(r1[i].checked==true){
						if(r1[i].value.split(",")[1]==0){
							ids+=r1[i].value.split(",")[0] + ",100;";
						}else{
							if(!checkRegexp($("#v"+r1[i].value.split(",")[0]).val())){
								alert("评分标准应为数字。");
								$("#v"+r1[i].value.split(",")[0]).focus();
								return false;
							}
							ids+=r1[i].value.split(",")[0] + ","+ $("#v"+r1[i].value.split(",")[0]).val() + ";";
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
	$("li.sortName").click(function(){
		var subjects = $("#subjects2").val();     //点每个分类需要重新请求数据库。
		//var lessonid = $("#lessonid").val();  //使用之表明点每次课的时候，都要重新请求数据库。
		var id = this.id;
		if(subjects.indexOf(id)>=0){//控制重复查询数据库
			return;	
		}
		$("#getsubjecttype").val(id);
		
		params=$("#getsubjectForm").serialize();

		$.ajax({
			type:"post",
			url:"showVTrainsubjectListById.do",
			data:params,
			dataType:"json",
			success:function(data){
				var content="";
				var name = "";
				for(i=0;i<data.length;i++){
					name = data[i].VName;
					if(name.length>15){
						name = name.substring(0,15) + "...";
					}
					if(id=="fbd340614724e262014724f0f134000a"){//机组资源管理（CRM）
						content+="<li><div style=\"float:left;\">&nbsp;&nbsp;<input name=\"sortId\"  checked=\"checked\" type=\"checkbox\" value=\""+data[i].VId+",0\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px;\" title=\""+data[i].VName+"\">"+name;
					content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId +"\" type=\"text\"  class=\"texta\"/></li>";
					}else{
						content+="<li><div style=\"float:left;\">&nbsp;&nbsp;<input name=\"sortId\" type=\"checkbox\" value=\""+data[i].VId
						+",1\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px;\" title=\""+data[i].VName+"\">"+name;
						content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId 
						+"\" type=\"text\" value=\"4\" class=\"texta\" onFocus=\"selected('"+data[i].VId+",1')\"  onclick=\"selected('"+data[i].VId+",1')\" /></li>";
					}
				}
				if(content==""){
					content = "<li>该分类下没有科目。</li>";
				}
				$("#c" + id).html(content);
				
				//execbase();//显示checkbox与radio样式。
				
				$("#subjects2").val(subjects + id);//控制重复查询数据库
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		
	});
	getDefault();
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
function getDefault(){
	var subjects = $("#subjects2").val(); 
	var id ="fbd340614724e262014724f0f134000a";
	if(subjects.indexOf(id)>=0){//控制重复查询数据库
		return;	
	}
	$("#getsubjecttype").val(id);
	
	params=$("#getsubjectForm").serialize();

	$.ajax({
		type:"post",
		url:"showVTrainsubjectListById.do",
		data:params,
		dataType:"json",
		success:function(data){
			var content="";
			var name = "";
			for(i=0;i<data.length;i++){
				name = data[i].VName;
				if(name.length>15){
					name = name.substring(0,15) + "...";
				}
				if(id=="fbd340614724e262014724f0f134000a"){//机组资源管理（CRM）
					content+="<li><div style=\"float:left;\">&nbsp;&nbsp;<input name=\"sortId\"  checked=\"checked\" type=\"checkbox\" value=\""+data[i].VId+",0\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px;\" title=\""+data[i].VName+"\">"+name;
				content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId +"\" type=\"text\"  class=\"texta\" /></li>";
				}else{
					content+="<li><div style=\"float:left;\">&nbsp;&nbsp;<input name=\"sortId\" type=\"checkbox\" value=\""+data[i].VId
					+",1\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px;\" title=\""+data[i].VName+"\">"+name;
					content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId 
					+"\" type=\"text\" value=\"4\" class=\"texta\" onFocus=\"selected('"+data[i].VId+",1')  onclick=\"selected('"+data[i].VId+",1')\" /></li>";
				}
			}
			if(content==""){
				content = "<li>该分类下没有科目。</li>";
			}
			$("#c" + id).html(content);
			
			//execbase();//显示checkbox与radio样式。
			
			$("#subjects2").val(subjects + id);//控制重复查询数据库
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});

	
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

<div id="topPartD"><div class="panelBox buttonBox">
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
<button class="green" primary="ui-icon-button-confirm" id="saveone">保存</button></s:if>
<button class="normal" id="escid0"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div></div>

<div id="rightPartD"><div>
<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
		
			<tbody>
			  <tr class="normal">
				<td width="100" align="right">课目编号：</td>
				<td width="120"><div style="margin-top:5px;"><input id="cVNo" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td width="60">课目名称：</td>
				<td width="120" ><div style="margin-top:5px;"><input id="cVName" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td width="60">版 本 号：</td>
				<td width="120"><div style="margin-top:5px;"><input id="cVVersion" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" value="R0" /></div></td>
				<td width="60">&nbsp;</td>
				<td></td>
			  </tr>
              <tr class="normal">
				<td width="100" align="right">课目性质：</td>
				<td width="120"> <div class="dropDownList">
						<button>训练</button>
						<ul>
							<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>训练</a></li>
							<li><a href="#N" val="1">检查</a></li>
                            <li><a href="#N" val="2">考试</a></li>
						</ul>
				  <input type="hidden" id="cIKcxz" value="0" />
				</div></td>
				<td width="60">设备类型：</td>
				<td width="120" ><div class="dropDownList">
						<button>设备类型</button>
						<ul>
                        	<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>飞机</a></li>
							<li><a href="#N" val="1">训练器</a></li>
                            <li><a href="#N" val="2">模拟机</a></li>
						</ul>
						<input type="hidden" id="cIType" value="0" />
					</div></td>
				<td width="60"><span style="height:39px;">飞机性质：</span></td>
				<td width="120"><div class="dropDownList">
						<button>飞机性质</button>
						<ul>
                    
							<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>单发</a></li>
							<li><a href="#N" val="1">多发</a></li>
                            <li><a href="#N" val="2">高性能</a></li>
						</ul>
				  <input type="hidden" id="cIPlaneproperty" value="0" />
				</div></td>
				<td width="60">&nbsp;</td>
				<td> </td>
			  </tr>
			  <tr class="normal">
				<td align="right" style="height:39px;">本转性质：</td>
				<td><div class="dropDownList">
						<button>本转性质</button>
						<ul>
							<li><a href="#N" val="0" onClick="viewStation(0)"><span class="ui-icon ui-icon-bullet"></span>本场</a></li>
							<li><a href="#N" val="1"  onClick="viewStation(1)">转场</a></li>
						</ul>
				  <input type="hidden" id="cITrainType" value="0" />
				</div></td>
				<td>飞行性质：</td>
				<td><div class="dropDownList">
						<button>飞行性质</button>
						<ul>
                        	<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>带飞</a></li>
							<li><a href="#N" val="1">单飞</a></li>
                            <li><a href="#N" val="2">机长</a></li>
						</ul>
				  <input type="hidden" id="cIFxxz" value="0" />
				</div></td>
				<td>昼夜性质：</td>
				<td><div class="dropDownList">
						<button>昼间</button>
						<ul>
                       		 <li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>昼间</a></li>
							<li><a href="#N" val="1">夜间</a></li>
						</ul>
				  <input type="hidden" id="cIDaynightproperty" value="0" />
				</div></td>
				<td>是否特技：</td>
				<td><div class="dropDownList">
						<button>否</button>
						<ul>
							<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>否</a></li>
							<li><a href="#N" val="1">是</a></li>
						</ul>
				  <input type="hidden" id="cITj" value="0" />
				</div></td>
			  </tr>
			  <tr class="normal">
				<td align="right">训练时间：</td>
				<td>
                <div style="margin-top:5px;"><input id="cDFjsj" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" onMouseDown="deletebMF('cDFjsj')" onBlur="viewTime('cDFjsj')" /></div>
                </td>
				<td></td>
				<td><input id="cDYbsj" type="hidden" class="text ui-widget-content ui-corner-all" style="width:100px;" value="0" /></td>
				<td></td>
				<td></td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
			  <tr class="normal" id="stationid" style="display:none">
				<td align="right">转场航线：</td>
				<td colspan="2"><button class="green" id="lineButton">建议使用的转场航线</button></td>
				<td></td>
				<td></td>
				<td><!--<div style="float:left;margin-top:5px; margin-right:10px;background: #F9F9F9;" id="startpos"></div><div style="margin-top:8px;"><a href="javascript:void(0)"><img src="themes/cupertino/images/addfu.png" id="startAdd" title="增加"  border="0"/></a></div>--></td>
				<td><!--<div style="float:left;margin-top:5px; margin-right:10px;background: #F9F9F9;" id="endpos"></div><div style="margin-top:8px;"><a href="javascript:void(0)"><img src="themes/cupertino/images/addfu.png" id="endAdd" title="增加" border="0"/></a></div>--></td>
				<td>&nbsp;</td>
			  </tr>
			  <tr class="normal">
			    <td height="36" align="right">训练课目分类：</td>
                <td colspan="7"><s:iterator value="lessonSortList" status="statu"><input class="inputunit" type="radio" name="unitName" id="${VId}" value="${VId}" <s:if test='#statu.index==0'>checked</s:if> /><b></b>&nbsp;${VName}&nbsp;&nbsp;&nbsp;&nbsp;
                </s:iterator>
                </td>
		      </tr>
              <tr class="normal">
			    <td height="36" align="right">科目时间：</td>
			    <td colspan="7" id="subjectlistid"></td>
		      </tr>
			  <tr class="normal">
				<td align="right">训练目的：</td>
				<td colspan="3"><textarea  id="cVTrainpurpose" style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
				<td>训练内容<br>
及标准：</td>
				<td colspan="3"><button class="green" id="addsubject">添加科目</button></td>
			  </tr>
			  <tr class="normal">
				<td align="right">非常规项目：</td>
				<td colspan="3"><textarea  id="cVXiangmu" style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
				<td>进入条件：</td>
				<td colspan="3"><textarea  id="cVTiaojian" style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea><input type="hidden"  id="cVShebei" /></td>
			  </tr>
			  <tr class="normal">
			    <td align="right">备注：</td>
			    <td colspan="3"><textarea  id="cVBz" style="width:312px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
			    <td>特殊要求：</td>
			    <td colspan="3">强制三点转场：
                <input  type="radio"  name="cIIsthree" value="1"/>是 <input  type="radio" name="cIIsthree" value="2" checked/>否<br/>
                单段里程数不能少于 <input id="cIOneNum" type="text" class="text ui-widget-content ui-corner-all" value="0" style="width:60px;">千米<br/>
                总里程数不能少于 <input id="cITotalNum" type="text" class="text ui-widget-content ui-corner-all" value="0" style="width:60px;">千米
                <input  id="cVTsyq" type="hidden"></td>
		      </tr>
			</tbody>
		</table>

	</div>
</div>


<div class="panelBox buttonBox"><s:if test="#r==null || #r==0">
<button class="green" primary="ui-icon-button-confirm" id="savetwo">保存</button></s:if>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>

</div>
</div>

<div id="dialogForm1"  title="站名列表">
	<p class="validateTips" >请选择始发站</p>
     <span class="panelLine"></span>
     <fieldset>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <s:set name="p" value="0"/>
    <s:iterator value="stationList" status="statu"><s:if test='#p==0'><tr></s:if>
    <td height="24" width="33%"><input type="radio" name="stationName" value="${VId},${VName}"/><b></b>${VName}</td>
    <s:set name="p" value="#p+1"/>
    <s:if test='#p>=3'><s:set name="p" value="0"/></tr></s:if>
    </s:iterator>
    <s:if test='#p<3 && #p>=1'>
    <s:iterator begin="0" end="3-#p-1">
    <td></td>
    </s:iterator>
    </tr></s:if>
    </table>
 </fieldset>
</div>

<div id="dialogForm2"  title="站名列表">
	<p class="validateTips" >请选择到达站</p>
     <span class="panelLine"></span>
     <fieldset>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <s:set name="p" value="0"/>
    <s:iterator value="stationList" status="statu"><s:if test='#p==0'><tr></s:if>
    <td height="24" width="33%"><input type="radio" name="endstationName" value="${VId},${VName}"/><b></b>${VName}</td>
    <s:set name="p" value="#p+1"/>
    <s:if test='#p>=3'><s:set name="p" value="0"/></tr></s:if>
    </s:iterator>
    <s:if test='#p<3 && #p>=1'>
    <s:iterator begin="0" end="3-#p-1">
    <td></td>
    </s:iterator>
    </tr></s:if>
    </table>
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
    <s:iterator value="changedbaseflylineList" >
    <tr>
    <td  height="24"><input type="checkbox" name="lineName" value="${VId}"/><b></b></td>
    <td  height="24">${stationByStartStationid.VName}</td>
    <td  height="24">${stationByEndStationId.VName}</td>
    <td  height="24"><s:text name="format.number2"><s:param value="DCourse"/></s:text></td>
    </s:iterator>
    <tr>
    </table>
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

<div id="dialogSubject"  title="科目列表">
    <s:iterator value="subjectsortList" >
	<ul class="foldList">
		<li class="sortName" id="${VId}"><span class="ui-icon ui-icon-carat-1-e"></span>${VName}</li>
		<ul class="itemList hide" id="c${VId}">
		</ul>
	</ul>
	<span class="panelLine"></span>
	</s:iterator>
</div>

<form id="unitSubjectForm" method="post" action="createTrainingLesson.do">
<input type="hidden" name="trainingLesson.VName" id="VName" />
<input type="hidden" name="trainingLesson.VNo" id="VNo" />
<input type="hidden" name="trainingLesson.VVersion" id="VVersion" />

<input type="hidden" name="trainingLesson.IType" id="IType" />
<input type="hidden" name="trainingLesson.IPlaneproperty" id="IPlaneproperty" />
<input type="hidden" name="trainingLesson.ITrainType" id="ITrainType" />
<input type="hidden" name="trainingLesson.IDaynightproperty" id="IDaynightproperty" />

<input type="hidden" name="trainingLesson.IFxxz" id="IFxxz" />
<input type="hidden" name="trainingLesson.IKcxz" id="IKcxz" />
<input type="hidden" name="trainingLesson.ITj" id="ITj" />
<input type="hidden" name="trainingLesson.DFjsj" id="DFjsj" />
<input type="hidden" name="trainingLesson.DYbsj" id="DYbsj" />

<input type="hidden" name="trainingLesson.stationByVStartpos.VId" id="startposid" /><!--存储转场航线id-->
<input type="hidden" name="trainingLesson.stationByVEndpos.VId" id="endposid" />

<input type="hidden" name="trainingLesson.VTrainpurpose" id="VTrainpurpose" />
<input type="hidden" name="trainingLesson.VNeirong" id="VNeirong" />
<input type="hidden" name="trainingLesson.VTiaojian" id="VTiaojian" />
<input type="hidden" name="trainingLesson.VShebei" id="VShebei" />
<input type="hidden" name="trainingLesson.VXiangmu" id="VXiangmu" />
<input type="hidden" name="trainingLesson.VTsyq" id="VTsyq" />
<input type="hidden" name="trainingLesson.VBz" id="VBz" />

<input type="hidden" name="trainingLesson.IIsthree" id="IIsthree" />
<input type="hidden" name="trainingLesson.IOneNum" id="IOneNum" />
<input type="hidden" name="trainingLesson.ITotalNum" id="ITotalNum" />

<input type="hidden" name="unitSubjectDicIdStr" id="csubjects"/>
<input type="hidden" name="sortId" id="csortId"/>
<input type="hidden" name="unitid" value="${unitid}"/>
</form>
<form   method="post" id="getsubjectForm">
<input name="viewTrainsubject.typeid" type="hidden" id="getsubjecttype">
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