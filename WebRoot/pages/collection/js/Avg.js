$(function(){
	/**
	 * 查询方法
	 */
	$("#searchPaylist").click(function(){//返回
		var yearStr = $("#yearStr").text();
		if(yearStr=="年份"){
			$("#cyear").val("");	
		}
		else
			$("#cyear").val(yearStr);
		$( "#searchForm" ).submit();
	});
});
$(document).ready(function(){
	/**
	 * 加载年份
	 */
	/*alert(1);*/
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
    $("#classSelect").html(html);
    new $.dropDownList(0, true, 100);
    new $.dropDownList(1, true, 160);
});  