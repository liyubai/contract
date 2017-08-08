 $(function() {
	 /**
	  * 该js所有注释部分暂时保留
	  */
	 
            var $checkboxes = $("input[name='checkboxName']"), $checkAllUsersBox = $("#checkAllStudent");
            $checkboxes.change(function() {
                if (!this.checked) $checkAllUsersBox[0].checked = false;
                if ($checkboxes.size() == $checkboxes.filter(":checked").size()) $checkAllUsersBox[0].checked = true;
                $checkAllUsersBox.trigger("change");
            });
            $checkAllUsersBox.click(function() {
                $checkboxes.each(function() {
                    this.checked = $checkAllUsersBox[0].checked;
                    $(this).trigger("change");
                });
            });
        	 /* 年份 */
        	var myDate= new Date(); 
        	var startYear=myDate.getFullYear()-9;//起始年份 
        	var endYear=myDate.getFullYear()+10;//结束年份 
        	var html="<li><a href='#N' val='0' class='inline'>学生年级</a></li>";
        	for (var i=startYear;i<=startYear+9;i++) 
        	{ 
        		var j=i-startYear;
        			if(j==0)
        				{
        				html+="<li><a href='#' class='inline' val='"+i+"'><span class='ui-icon ui-icon-bullet'></span>"+i+"</a><a href='#' class='inline' val='"+(i+10)+"'>"+(i+10)+"</a></li>";
        				}
        			else
        				{
        				html+="<li><a href='#' class='inline' val='"+i+"'>"+i+"</a><a href='#' class='inline' val='"+(i+10)+"'>"+(i+10)+"</a></li>";
        				}
        	} 
            $("#classSelect").html(html);                        
            /* 公司名称 */
            var params = {};
               $.ajax({
        		type:"post",
        		url:"/contract/system/studentManagent_getDictionary.do?DictionaryId=303",
        		data:params,
        		dataType:"json",
        		async:false,
        		success:function(data){
        	           var  data2 =data;
        	           
        	            var compyHtml=""
        	            if(data2!=null)
        	            	{
        	                for(var j=0;j<data2.dics.length;j++){  
        	                	if(data2.dics[j].level==1){
        	                		compyHtml+="<li><a href='#N' val='0'><span class='ui-icon ui-icon-bullet'></span>"+data2.dics[j].name+"</a></li>";
        	                		break;
        	                	}
        	                }
        	             for(var j=0;j<data2.dics.length;j++){
        	                	if(data2.dics[j].level==""||data2.dics[j].level!=1){
        	                	
        	                		compyHtml+="<li><a href='#N' val='"+data2.dics[j].id+"'>"+data2.dics[j].name+"</a></li>"
        	                	}
        	                }
        	            	}
        	           
        	            $("#compy").html(compyHtml);
        		}
        	});
               /* 学生状态 */
               var params = {};
                  $.ajax({
           		type:"post",
           		url:"/contract/system/studentManagent_getDictionary.do?DictionaryId=606",
           		data:params,
           		dataType:"json",
           		async:false,
           		success:function(data){
           	           var  data2 =data;
           	            var compyHtml=""
           	            if(data2!=null)
           	            	{
           	                for(var j=0;j<data2.dics.length;j++){
           	                	if(data2.dics[j].level==1){
           	                		compyHtml+="<li><a href='#N' val='0'><span class='ui-icon ui-icon-bullet'></span>"+data2.dics[j].name+"</a></li>";
           	                		break;
           	                	}
           	                }
           	             for(var j=0;j<data2.dics.length;j++){
           	                	if(data2.dics[j].level==""||data2.dics[j].level!=1){ 
           	                		compyHtml+="<li><a href='#N' val='"+data2.dics[j].id+"'>"+data2.dics[j].name+"</a></li>"
           	                	}
           	                }          	             	
           	            	}
           	            $("#stustate").html(compyHtml);
           		}
           	});
                  var params = {};
                  $.ajax({
           		type:"post",
           		url:"/contract/system/studentManagent_getDictionary.do?DictionaryId=606",
           		data:params,
           		dataType:"json",
           		async:false,
           		success:function(data){
           	           var  data2 =data;
           	            var compyHtml=""
           	            if(data2!=null){
           	             for(var j=0;j<data2.dics.length;j++){
           	                	if(data2.dics[j].level==""||data2.dics[j].level!=1){ 	
           	                		compyHtml+='<option value='+data2.dics[j].id+'>'+data2.dics[j].name+'</option>';
           	                	}
           	                }          	             	
           	            }
           	            $("#selectStuStatus").append(compyHtml);
           		}
           	});
           // alert($("#classSelect").html());
            new $.dropDownList(0, true, 243);
            new $.dropDownList(1, true, 243);
            new $.dropDownList(2, true, 243);
            new $.dropDownList(3, true, 243);
            
            var txt1 = $("#txtTFYY"),
    		txt2 = $("#txtTFSJ"),
    		allFields = $([]).add(txt1).add(txt2),
    		tips = $(".validateTips");

            function updateTips(t) {
                tips.html(t).addClass("ui-state-highlight");
                setTimeout(function() {
                    tips.removeClass("ui-state-highlight", 1500);
                }, 2000);
            }


            $("#dialogForm1").dialog({
                autoOpen: false,
                height: 300,
                width: 500,
                background: '#FF0000', // 背景色
                opacity: 0.27,     // 透明度
                modal: true,
                resizable: false,

                buttons: {
                    "确 定": function() {
                        //确定按钮的处理代码段：
                        //$(this).dialog("close");
                    	$("#UpdateStudent").submit();
                    },
                    "取 消": function() {
                        $(this).dialog("close");
                    }
                },
                close: function() {
                    allFields.val("").removeClass("error");
                }
            });

            $('.setStop').click(function() {
            	
            });
            $('#modifyStu').click(function() {
            	var stid="";
            	
            	$('.panelTable .check').each(function(){
            		if($(this).hasClass('boxChecked')){
            			
            			if(stid!="")
            			stid=stid+","+$(this).siblings('input').attr('dataid');
            			else
            				stid=$(this).siblings('input').attr('dataid');
            		}           		
            	})
            	//alert(stid);
            	$("#studentId").val(stid);
                tips.removeClass("ui-state-highlight").html("请填写所有信息");
                $("#modalDialogButton1 input.error").removeClass("error");
                if(stid!="")
                	{
                	
                $("#dialogForm1").dialog("open");
                	}
                else
                	{
                	alert("请选择需要批量修改的学生");
                	window.location.reload(); 
                	}               
            });
            
       //     $('#dialogForm1 .otherline').hide();
            $('#dialogForm1 .tfline').hide();
            if ($('#selectStuStatus').children('option:selected').val() == 610) {
            //    $('#selectStuStatus').parent().parent().siblings('.otherline').hide();
                $('#selectStuStatus').parent().parent().siblings('.tfline').show();
            }
            else if ($('#selectStuStatus').children('option:selected').val() == 609) {
           //     $('#selectStuStatus').parent().parent().siblings('.otherline').show();
                $('#selectStuStatus').parent().parent().siblings('.tfline').hide();
            }
            else {
            //    $('#selectStuStatus').parent().parent().siblings('.otherline').hide();
                $('#selectStuStatus').parent().parent().siblings('.tfline').hide();
            }


            $('#selectStuStatus').change(function() {
                if ($(this).children('option:selected').val() == 610) {
              //      $(this).parent().parent().siblings('.otherline').hide();
                    $(this).parent().parent().siblings('.tfline').show();
                }
                else if ($(this).children('option:selected').val() == 609) {
               //     $(this).parent().parent().siblings('.otherline').show();
                    $(this).parent().parent().siblings('.tfline').hide();
                }
                else {
               //     $(this).parent().parent().siblings('.otherline').hide();
                    $(this).parent().parent().siblings('.tfline').hide();
                }
            });

            $('#btnFill').click(function() {
            
            window.location.href = 'studentManagent_addStudent.do';
            });
            $('#inputData').click(function() {
                
                window.location.href = '/contract/pages/Student/importExcel.jsp';
            });
            $('#search').click(function() {
            	
            	setHiddenValue();
            //window.location.href = 'Student.jsp';
            });
            function setHiddenValue() {
            	//alert($("#strStudentGrade").val() + "----"+$("#strCompany").val())
        		$("#studentName").val($.trim($("#strStudentName").val()));
        		$("#state").val($.trim($("#strState").val()));
        		$("#no").val($.trim($("#strNo").val()));
        		$("#grade").val($.trim($("#strStudentGrade").val()));
        		$("#contractNo").val($.trim($("#strContractNo").val()));
        		$("#company").val($.trim($("#strCompany").val()));
        		//alert($("#company").val());
        		$("#readStudent").submit();
        	}
                  
            
});
 function test(stid){
 	//alert(stid);
 	$("#studentId").val(stid);
 	$(".validateTips").removeClass("ui-state-highlight").html("请填写所有信息");
     $("#modalDialogButton1 input.error").removeClass("error");
     
     var studdentInfo = null;
 	var params = {};

 	$.ajax({
 		type:"post",
 		url:"/contract/system/studentManagent_getStudentInfo.do?studentId="+stid,
 		data:params,
 		dataType:"json",
 		async:false,
 		success:function(data){

 			studdentInfo = data;
 			var stateId=studdentInfo.dics[0].state;
 			//var joinTime=studdentInfo.dics[0].joinTime;
 			var stopTime=studdentInfo.dics[0].stopTime;
 			var stopReason=studdentInfo.dics[0].stopReason;
			//	$("#strJoinTime").val(joinTime);
			$("#strStopTime").val(stopTime);
			$("#strStopReason").val(stopReason);

 			$("#selectStuStatus").find("option").eq(stateId-607).attr("selected","selected");
 				if(stateId==607)
				{
			//	$('#dialogForm1 .otherline').hide();
				$('#dialogForm1 .tfline').hide();

				}
			else if(stateId==608)
				{
			//	$('#dialogForm1 .otherline').hide();
				$('#dialogForm1 .tfline').hide();
				
				}
			else	if(stateId==609)
 				{
 			//	$('#dialogForm1 .otherline').show();
 				$('#dialogForm1 .tfline').hide();
 				//$("#strJoinTime").val(joinTime);
 				}
 			else if(stateId==610)
 				{
 			//	$('#dialogForm1 .otherline').hide();
 		        $('#dialogForm1 .tfline').show();
 				//$("#strStopTime").val(stopTime);
 				//$("#strStopReason").val(stopReason);
 				}
 			//alert("studentId = "+studdentInfo.dics[0].studentId+" , state = "+studdentInfo.dics[0].state);
 			
 		}
 	});
     
     $("#dialogForm1").dialog("open");
 }
	function contractListByNo(studentId,contractNo){   
		if(contractNo==''){
			alert("改学生未被初始化选择合同 ");
		}else{
			$('#'+studentId+'').submit();
		}
	}  
        
        
        
        
        
        