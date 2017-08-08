	$(function() {
		$('#queryContract').click(function() {
			checkForm();       
			$("#contractQueryList").submit();
		});
	});
    $(document).ready(function(){
    	var myDate= new Date(); 
    	var startYear=myDate.getFullYear()-9;//起始年份 
    	var endYear=myDate.getFullYear()+10;//结束年份 
    	/* 年份 */
       	var htmlyear="<li><a href='#N' val='年份' class='inline'><span class='ui-icon ui-icon-bullet' style='margin-left: -1.3em;'></span>年份</a></li>";
    	for (var i=startYear;i<=startYear+9;i++) 
    	{ 
    		var j=i-startYear;
    			if(j==0)
    				{
    				htmlyear+="<li><a href='#' class='inline' val='"+i+"'>"+i+"</a><a href='#' class='inline' val='"+i+10+"'>"+(i+10)+"</a></li>";
    				}
    			else
    				{
    				htmlyear+="<li><a href='#' class='inline' val='"+i+"'>"+i+"</a><a href='#' class='inline' val='"+i+10+"'>"+(i+10)+"</a></li>";
    				}

    	} 
        $("#yearSelect").html(htmlyear);
        
        /* 班级 */
    	var html="<li><a href='#N' val='学生年级' class='inline'><span class='ui-icon ui-icon-bullet' style='margin-left: -1.3em;'></span>学生年级</a></li>";
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
    	
    	/* 合同类型 */
        var  data1 =getDics(322);
        var resultHtml="";
        for(var j=1;j<data1.dics.length;j++){
        	
        	if(data1.dics[j].level==1){
        		 resultHtml+="<li><a href='javascript:gettype("+data1.dics[j].id+")' val='"+data1.dics[j].name+"' class='inline'>"+data1.dics[j].name+"</a></li>";
        	}
        }
        for(var i=1;i<data1.dics.length;i++){
        	if(data1.dics[i].level==""||data1.dics[i].level!=1){
        		resultHtml+="<li><a href='javascript:gettype("+data1.dics[i].id+")' id = '"+data1.dics[i].id+"' val='"+data1.dics[i].name+"'><span class='ui-icon ui-icon-bullet'></span>"+data1.dics[i].name+"</span></li>"
        	}
        }
        $("#status").html(resultHtml);
        /* 签约单位 */
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
        
        /* 学生类型 */
        var  data3 =getDics(3);
        var stuHtml="";
        for(var j=1;j<data3.dics.length;j++){
        	
        	if(data3.dics[j].level==1){
        		stuHtml+="<li><a href='javascript:getstutype("+data3.dics[j].id+")' val='"+data3.dics[j].name+"' class='inline'>"+data3.dics[j].name+"</a></li>";
        	}
        }
        for(var i=1;i<data3.dics.length;i++){
        	if(data3.dics[i].level==""||data3.dics[i].level!=1){
        		stuHtml+="<li><a href='javascript:getstutype("+data3.dics[i].id+")' id = '"+data3.dics[i].id+"' val='"+data3.dics[i].name+"'><span class='ui-icon ui-icon-bullet'></span>"+data3.dics[i].name+"</span></li>"
        	}
        }
        $("#stu").html(stuHtml);
        
        
        new $.dropDownList(0, true, 150);
        new $.dropDownList(1, true, 243);
        new $.dropDownList(2, true, 243);
        new $.dropDownList(3, true, 150);
        new $.dropDownList(4, true, 150);
        new $.dropDownList(5, true, 150);
        
    	});
    
    function checkForm() {
    	
		$("#strSignTime").val(($.trim($("#timehidden").text())));
		if($("#strSignTime").val()=="年份"){
			$("#strSignTime").val("");
		}
		$("#strGradeInfo").val(($.trim($("#stugradehidden").text())));
		if($("#strGradeInfo").val()=="学生年级"){
			$("#strGradeInfo").val("");
		}	
		//合同类型
		if($("#strType").val()==""){
			$("#strType").val("0");
		}
		//签约单位
		if($("#strCompy").val()==""){
			$("#strCompy").val("0");
		}
		//学生类型
		if($("#strStuType").val()==""){
			$("#strStuType").val("0");
		}
		//合同状态		
		if($("#cstatusStr").val()==""){
			$("#cstatus").val("0");
		}
		$("#cstatus").val($.trim($("#cstatusStr").val()));
		setHiddenValue();
	}
	function setHiddenValue() {
		$("#contractId").val($.trim($("#strContractId").val()));
		$("#signTime").val($.trim($("#strSignTime").val()));
		$("#type").val($.trim($("#strType").val()));
		$("#compy").val($.trim($("#strCompy").val()));
		$("#stuType").val($.trim($("#strStuType").val()));
		$("#gradeInfo").val($.trim($("#strGradeInfo").val()));	
		
	}

	/**
	 * 查看合同
	 * 
	 * @param demandId
	 */
	function viewContract(CId) {
		$("#CID").val(CId);
		$("#viewContract").submit();
	}
	//获得合同类型的ID
    function gettype(id){
    	$("#strType").val(id);
    	$("#type").val(id);
    }
    //获得签约单位的ID
    function getcompy(id){
    	$("#strCompy").val(id);
    	$("#compy").val(id);
    }
    //获得学生类型的ID
    function getstutype(id){
    	$("#strStuType").val(id);
    	$("#stuType").val(id);
    }
    //获取合同状态
	function getContractStatus(id){
		$("#cstatusStr").val(id);
		$("#cstatus").val(id);
	}
   
