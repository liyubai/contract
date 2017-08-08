//查看基础信息
function showTeacherBaseInfo(){
	
	params = {};
	$.ajax({
		type:"post",
		url:"showTeacherBaseInfoByName.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm4Span").html("获取信息失败，信息不存在。");
				$( "#backResultDialogForm" ).dialog( "open" );
				return;
			}
			$("#basecontentid").html(getBaseContent(data));
			$("#baseDialog").dialog( "open" );
		}, 
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){
				return;
			}
			$("#dialogForm4Span").html("数据库连接错误，获取对象失败，请重试。");
			$("#backResultDialogForm").dialog( "open" );
			return;
		}
	});	
}
function getBaseContent(data){
	var content = "";
	var cdate = "";
	var ksy = "";
	var rxsj = "";
	var yysj = "";
	var cjgzsj = "";
	
	cdate = data.vcsrq;
	rxsj = data.vrxrq;
	cjgzsj = data.vcjgzsj;
	yysj = data.vmhyytgsj;
	if(data.IExam == 1){
		ksy = "是";
	}else{
		ksy = "否";
	}
	content+="<tr>";
	content+="<td width='80'>教员姓名：</td>";
	content+="<td width='80' height=\"24\">"+data.VName+"</td>";
	content+="<td width='80'>性别：</td>";
	content+="<td  width='80' height=\"24\">"+data.VXb+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>出生日期：</td>";
	content+="<td  width='80' height=\"24\">"+cdate+"</td>";
	content+="<td width='80'>民族：</td>";
	content+="<td width='80' height=\"24\">"+data.TDictionByVMz+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>联系方式：</td>";
	content+="<td  width='80' height=\"24\">"+data.VLxfs+"</td>";
	content+="<td width='80'>身份证号：</td>";
	content+="<td  width='80' height=\"24\">"+data.VSfz+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>政治面貌：</td>";
	content+="<td width='80' height=\"24\">"+data.VZzmm+"</td>";
	content+="<td width='80'>籍贯：</td>";
	content+="<td  width='80' height=\"24\">"+data.VJg+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>家庭住址：</td>";
	content+="<td  width='80' height=\"24\">"+data.VJtzz+"</td>";
	content+="<td width='80'>文化程度：</td>";
	content+="<td width='80' height=\"24\">"+data.TDictionByVWhcd+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>毕业院校：</td>";
	content+="<td  width='80' height=\"24\">"+data.VByyx+"</td>";
	content+="<td width='80'>职位：</td>";
	content+="<td  width='80' height=\"24\">"+data.VZw+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>飞行教员类型：</td>";
	content+="<td width='80' height=\"24\">"+data.TDictionByVFlytype+"</td>";
	content+="<td width='80'>地面教员类型：</td>";
	content+="<td  width='80' height=\"24\">"+data.TDictionByVGeneraltype+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>是否考试员：</td>";
	content+="<td  width='80' height=\"24\">"+ksy+"</td>";
	content+="<td width='80'>所飞机型：</td>";
	content+="<td width='80' height=\"24\">"+data.TDictionByVFlyform+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>所聘技术等级：</td>";
	content+="<td  width='80' height=\"24\">"+data.TDictionByVTecdengji+"</td>";
	content+="<td width='80'>安全等级：</td>";
	content+="<td  width='80' height=\"24\">"+data.VSafedengji+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>参加工作时间：</td>";
	content+="<td width='80' height=\"24\">"+cjgzsj+"</td>";
	content+="<td width='80'>所在单位：</td>";
	content+="<td  width='80' height=\"24\">"+data.VSzdw+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='80'>所在单位职务：</td>";
	content+="<td  width='80' height=\"24\">"+data.VSzdwzw+"</td>";
	content+="<td width='100'>入校日期：</td>";
	content+="<td width='80' height=\"24\">"+rxsj+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td width='40'>英语水平：</td>";
	content+="<td  width='180' height=\"24\">"+data.VYysp+"</td>";
	content+="<td width='60'>民航英语通过时间：</td>";
	content+="<td  width='140' height=\"24\">"+yysj+"</td>";
	content+="</tr>"
	
	return content;
}

//查看体检信息
function showTeacherTjInfo(){

	params = {};
	$.ajax({
		type:"post",
		url:"showTeacherTjByName.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm4Span").html("获取信息失败，信息不存在。");
				$( "#backResultDialogForm" ).dialog( "open" );
				return;
			}
			if(data.ILevel=="" || data.DIssueTime==""){
				alert("选中的教员没有体检信息。");
				return;
			}
			$("#tjcontentid").html(getTjContent(data));
			$("#tjdialogContent" ).dialog( "open" );
		}, 
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){
				return;
			}
			$("#dialogForm4Span").html("数据库连接错误，获取对象失败，请重试。");
			$("#backResultDialogForm" ).dialog( "open" );
			return;
		}
	});	
}


function getTjContent(data){
	var content = "";
	content+="<tr>";
	content+="<td width='60'>教员姓名：</td>";
	content+="<td width='140' height=\"24\">"+data.teacherBaseInfo+"</td>";
	content+="<td width='60'>教员编号：</td>";
	content+="<td width='140' height=\"24\">"+data.teacherCode+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>所在部门：</td>";
	content+="<td height=\"24\">"+data.deptName+"</td>";
	content+="<td>合格证等级：</td>";
	content+="<td height=\"24\">"+data.ILevel+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>国籍：</td>";
	content+="<td height=\"24\">"+data.VNation+"</td>";
	content+="<td>限制：</td>";
	content+="<td height=\"24\">"+data.VLimit+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>结论日期：</td>";
	content+="<td height=\"24\">"+data.DResultdate+"</td>";
	content+="<td>主检医生：</td>";
	content+="<td height=\"24\">"+data.VDoctor+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>签发人：</td>";
	content+="<td height=\"24\">"+data.VIssuer+"</td>";
	content+="<td>发证日期：</td>";
	content+="<td height=\"24\">"+data.DIssueTime+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>有效期：</td>";
	content+="<td height=\"24\">"+data.DUsedTime+"</td>";
	content+="<td>发证单位：</td>";
	content+="<td height=\"24\">"+data.VCompany+"</td>";
	content+="</tr>"
	return content;
}

//查看执照信息
function showTeacherZzInfo(){

	params = {};
	$.ajax({
		type:"post",
		url:"showTeacherZzByName.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm4Span").html("获取信息失败，信息不存在。");
				$( "#backResultDialogForm" ).dialog( "open" );
				return;
			}
			$("#zzcontentid").html(getZzContent(data));
			$("#zzdialogContent" ).dialog( "open" );
		}, 
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){
				return;
			}
			$("#dialogForm4Span").html("数据库连接错误，获取对象失败，请重试。");
			$("#backResultDialogForm" ).dialog( "open" );
			return;
		}
	});	
}
function getZzContent(data){
	var content = "";
	var yxq = "";
	var qfsj = "";
	var gxsj = "";
	var hgz = "";
	var sfjk = "";
	yxq = data.veffectdate;
	qfsj = data.vissuetime;
	gxsj = data.vupdatedate;
	
	if(data.IHgz == 1){
		hgz = "学员合格证";
	}else if(data.IHgz == 2){
		hgz = "教员合格证";
	}
	if(data.IJiankong == 1){
		sfjk = "监控";
	}else if(data.IJiankong == 2){
		sfjk = "不监控";
	}
	content+="<tr>";
	content+="<td width='80'>教员姓名：</td>";
	content+="<td width='140' height=\"24\">"+data.teacherBaseInfo+"</td>";
	content+="<td width='80'>教员编号：</td>";
	content+="<td width='140' height=\"24\">"+data.teacherCode+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>所在部门：</td>";
	content+="<td height=\"24\">"+data.deptName+"</td>";
	content+="<td>执照编号：</td>";
	content+="<td height=\"24\">"+data.VCardid+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>有效期：</td>";
	content+="<td height=\"24\">"+yxq+"</td>";
	content+="<td>局长授权签发：</td>";
	var jzsq = "";
	if(data.VIssuer != null && data.VIssuer != "null"){
		jzsq = data.VIssuer;
	}
	content+="<td height=\"24\">"+jzsq+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>签发单位：</td>";
	var qfdw = "";
	if(data.VCompany != null && data.VCompany != "null"){
		qfdw = data.VCompany;
	}
	content+="<td height=\"24\">"+qfdw+"</td>";
	content+="<td>签发时间：</td>";
	content+="<td height=\"24\">"+qfsj+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>更新时间：</td>";
	content+="<td height=\"24\">"+gxsj+"</td>";
	content+="<td>合格证：</td>";
	content+="<td height=\"24\">"+hgz+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>是否监控：</td>";
	content+="<td height=\"24\">"+sfjk+"</td>";
	content+="<td>执照性质：</td>";
	var zzxz = "";
	if(data.VXingzhi != null && data.VXingzhi != "null"){
		zzxz = data.VXingzhi;
	}
	content+="<td height=\"24\">"+zzxz+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>教员执照等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VDengji+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>教员执照类型：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VJyzzlx+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>执照类型：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VZzlx+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>仪表等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VYbdj+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>飞机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VFjjbdj+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>航空器类别：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VHkqlb+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>航空器型别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VHkqdj+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>旋翼机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VXyjdj+"</td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td colspan=\"2\">运输航空公司飞行教员执照等级：</td>";
	content+="<td colspan=\"2\" height=\"24\">"+data.VYszzdj+"</td>";
	content+="</tr>"

	return content;
}