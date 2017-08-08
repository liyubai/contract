/**
 * 初始化页面加载
 */
$(function(){
	$('#queryPayStatistics').click(function() {
		//获取年份
		var yearStr = $("#yearStr").text();
		if(yearStr=="年份"){
			$("#rtime").val("");	
		}
		else
			$("#rtime").val(yearStr);
		checkForm();
		//获取合同号
		getContractId();
		getBeginTime();
		getEndTime();
		$("#payStatisticsForm").submit();
		
	});
	
});
//获取系统当前时间-年
//function CurentTime() {
//	var now = new Date();
//	var year = now.getFullYear(); // 年
//	return (year);
//};

$(document).ready(function(){
	/**
	 * 加载年份
	 */
	var myDate= new Date(); 
	var startYear=myDate.getFullYear()-9;//起始年份 
	var endYear=myDate.getFullYear()+10;//结束年份 
	var html="<li><a href='#N' val='年份' class='inline'><span class='ui-icon ui-icon-bullet' style='margin-left: -1.3em;'></span>年份</a></li>";
	for (var i=startYear;i<=startYear+9;i++) 
	{ 
		var j=i-startYear;
			if(j==0)
				{
				html+="<li><a href='#' class='inline' val='"+i+"'>"+i+"</a><a href='#' class='inline' val='"+i+10+"'>"+(i+10)+"</a></li>";
				}
			else
				{
				html+="<li><a href='#' class='inline' val='"+i+"'>"+i+"</a><a href='#' class='inline' val='"+i+10+"'>"+(i+10)+"</a></li>";
				}

	} 
    $("#yearSelect").html(html);
    
	/**
	 * 加载合同类型
	 */
    var  data1 =getDics(322);
    var resultHtml="";
    for(var j=1;j<data1.dics.length;j++){
    	
    	if(data1.dics[j].level==1){
    		 resultHtml+="<li><a href='javascript:getContractType("+data1.dics[j].id+")' val='"+data1.dics[j].name+"' class='inline'>"+data1.dics[j].name+"</a></li>";
    	}
    }
    for(var i=1;i<data1.dics.length;i++){
    	if(data1.dics[i].level==""||data1.dics[i].level!=1){
    		resultHtml+="<li><a href='javascript:getContractType("+data1.dics[i].id+")' id = '"+data1.dics[i].id+"' val='"+data1.dics[i].name+"'><span class='ui-icon ui-icon-bullet'></span>"+data1.dics[i].name+"</span></li>"
    	}
    }
    $("#contractType").html(resultHtml);
    
    /**
     * 加载签约单位
     */
    var  data2 =getDics(2);
    var compyHtml="";
    for(var j=1;j<data2.dics.length;j++){
    	
    	if(data2.dics[j].level==1){
    		compyHtml+="<li><a href='javascript:getcompy("+data2.dics[j].id+")' val='"+data2.dics[j].name+"' class='inline'>"+data2.dics[j].name+"</a></li>";
    	}
    }
    for(var i=1;i<data2.dics.length;i++){
    	if(data2.dics[i].level==""||data2.dics[i].level!=1){
    		compyHtml+="<li><a href='javascript:getcompy("+data2.dics[i].id+")' id = '"+data2.dics[i].id+"' val='"+data2.dics[i].name+"'><span class='ui-icon ui-icon-bullet'></span>"+data2.dics[i].name+"</span></li>"
    	}
    }
    $("#compys").html(compyHtml);
    new $.dropDownList(0, true, 160);
    new $.dropDownList(1, true, 200);
    new $.dropDownList(2, true, 100);
    new $.dropDownList(3, true, 150);
    new $.dropDownList(4, true, 150);
    new $.dropDownList(5, true, 150);
    
	});
//获取合同类型
function getContractType(id){
	$("#rcontractType").val(id);
	$("#rcontractTypeStr").val(id);
}
//获取合同状态
function getContractStatus(id){
	$("#rcontractStatus").val(id);
	$("#rcontractStatusStr").val(id);
}
//获取签约单位
function getcompy(id){
	$("#rcompany").val(id);
	$("#rcompanyStr").val(id);
}
//获取付款状态
function getPayStatus(id){
	$("#rpayStatus").val(id);
	$("#rpayStatusStr").val(id);
}
//获取开始时间
function getBeginTime(){
	var beginTime = $("#beginTime").val();
	if(beginTime=="开始时间"){
		beginTime ="";
	}
	$("#rbeginTime").val(beginTime);
}
//获取结束时间
function getEndTime(){
	var endTime = $("#endTime").val();
	if(endTime=="结束时间"){
		endTime ="";
	}
	$("#rendTime").val(endTime);
}
//获取合同号
function getContractId(){
	$("#rcontractId").val($("#contractId").val().trim());
}

function checkForm(){
    var rcontractTypeStr = $("#rcontractTypeStr").val();
	var rcontractStatusStr = $("#rcontractStatusStr").val();
	var rcompanyStr = $("#rcompanyStr").val();
	var rpayStatusStr = $("#rpayStatusStr").val();
	if(rcontractTypeStr==""){
		$("#rcontractType").val("0");
	}
	if(rcontractStatusStr==""){
		$("#rcontractStatus").val("0");
	}
	if(rcompanyStr==""){
		$("#rcompany").val("0");
	}
	if(rpayStatusStr==""){
		$("#rpayStatus").val("0");
	}
	$("#rcontractType").val(rcontractTypeStr);	
	$("#rcontractStatus").val(rcontractStatusStr);	
	$("#rcompany").val(rcompanyStr);
	$("#rpayStatus").val(rpayStatusStr);
}
//function getPayStatus(id){
//var dics = $("#rpayStatus").val(id);
//var params = {};
//$.ajax({
//	type:"post",
//	url:"<%=request.getContextPath()%>/payStatistics/showPayStatisticsList.do?id="+id,
//	data:params,
//	dataType:"json",
//	async:false,
//	success:function(data){			
//		dics = data.html();
//	}
//});
//var myJson=eval('(' + JSON.stringify(dics) + ')');
//var obj=myJson.dics;
//return obj;
//}

	
