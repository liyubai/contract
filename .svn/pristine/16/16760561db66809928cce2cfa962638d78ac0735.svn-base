var picNum = Number(0);
var addPicNum=Number(0);
 $(document).ready(function(){
    	var myDate= new Date(); 
    	var startYear=myDate.getFullYear()-9;//起始年份 
    	var endYear=myDate.getFullYear()+10;//结束年份 
    	var html="<li><a href='#N' val='0' class='inline'>学生年级</a></li>";
    	for (var i=startYear;i<=startYear+9;i++) 
    	{ 
    		var j=i-startYear;
    			if(j==0)
    				{
    				html+="<li><a href='#' class='inline' val='"+i+"'><span class='ui-icon ui-icon-bullet'></span>"+i+"</a><a href='#' class='inline' val='"+i+10+"'>"+(i+10)+"</a></li>";
    				}
    			else
    				{
    				html+="<li><a href='#' class='inline' val='"+i+"'>"+i+"</a><a href='#' class='inline' val='"+(i+10)+"'>"+(i+10)+"</a></li>";
    				}

    	} 
        $("#classSelect").html(html);
        
    

        /* 合同类型 */
        var params = {};
           $.ajax({
    		type:"post",
    		url:"/contract/system/studentManagent_getDictionary.do?DictionaryId=322",
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

    	            $("#status").html(compyHtml);
    			
    		}
    	});
           /* 学员类型 */
           var params = {};
              $.ajax({
       		type:"post",
       		url:"/contract/system/studentManagent_getDictionary.do?DictionaryId=3",
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

       	            $("#stu").html(compyHtml);
       			
       		}
       	});
              /* 客户单位 */
              var params = {};
                 $.ajax({
          		type:"post",
          		url:"/contract/system/studentManagent_getDictionary.do?DictionaryId=2",
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

          	            $("#compys").html(compyHtml);
          			
          		}
          	});
                 /* 合同性质 */
                 var params = {};
                    $.ajax({
             		type:"post",
             		url:"/contract/system/studentManagent_getDictionary.do?DictionaryId=557",
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

             	            $("#ContractNature").html(compyHtml);
             			
             		}
             	});
        new $.dropDownList(0, true, 243);
   		new $.dropDownList(1, true, 243);
   		new $.dropDownList(2, true, 243);
   		new $.dropDownList(3, true, 243);
   		new $.dropDownList(4, true, 243);
    	});

$(function() {
			$('#Button2').click(function() {
				updateFormSubmit();								
			});
			$('#Button1').click(function() {
				formSubmit();
			});
			
		}); 
		function formSubmit(){
			$("#contractName").val($.trim($("#strContractName").val()));
			$("#contractID").val($.trim($("#strContractID").val()));
			$("#contractType").val($.trim($("#strContractType").val()));
			$("#studentType").val($.trim($("#strStudentType").val()));
			$("#contractStatus").val($.trim($("#strContractStatus").val()));
			$("#contractNature").val($.trim($("#strContractNature").val()));
			$("#compy").val($.trim($("#strCompy").val()));
			$("#signTime").val($.trim($("#strSignTime").val()));
			$("#privateName").val($.trim($("#strPrivateName").val()));
		 	/* $("#gradeInfo").val($.trim(strgGradeInfo));  */
			$("#contractRecPayment").submit();
		}
		//updateForm
		function updateFormSubmit(){
			$("#contractName1").val($.trim($("#strContractName").val()));
			$("#contractID1").val($.trim($("#strContractID").val()));
			$("#contractType1").val($.trim($("#strContractType").val()));
			$("#studentType1").val($.trim($("#strStudentType").val()));
			$("#contractStatus1").val($.trim($("#strContractStatus").val()));
			$("#contractNature1").val($.trim($("#strContractNature").val()));
			$("#compy1").val($.trim($("#strCompy").val()));
			$("#signTime1").val($.trim($("#strSignTime").val()));
			$("#privateName1").val($.trim($("#strPrivateName").val()));
			//图片
			var picture=$("#pic").val();
			for(var j=0;j<addPicNum;j++){
				picture=picture+$("#addPic"+j).val()+",";
			}
			$("#pictureHide").val(picture);
		 /* 	$("#gradeInfo1").val($.trim(strgGradeInfo));  */
			//alert($("#gradeInfo1").val());
			$("#updateContract").submit();
		}
				
		function addMore(imgFile){
			debugger;
			var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
			if(!pattern.test(imgFile.value)){
				alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
				return false;	
				}
			 
			var path; 
				if(document.all){ 																	
					imgFile.select(); 
					path = document.selection.createRange().text; 
					document.getElementById("imgPreview").innerHTML=""; 
					document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
					} 
				else{ 
					path = URL.createObjectURL(imgFile.files[0]);
					//alert(path);
					var namePath =path.substring(path.lastIndexOf("/")+1)
					$("#pic").after("<div id='imgPreview"+picNum+"' class='fpWrap'><img id='imId"+picNum+"' name='"+namePath+"' value='"+path.substring(path.lastIndexOf("/")+1)+"' src='"+path+"'/><input type='hidden' id='addPic"+addPicNum+"' value='"+path.substring(path.lastIndexOf("/")+1)+"'></div>");
					addPicNum++;
					/*$("#imgPreview").html("<img id='a' value='"+path.substring(path.lastIndexOf("/")+1)+"' src='"+path+"'/>");
					document.getElementById("imgPreview").innerHTML = "<img id='a' value='"+path.substring(path.lastIndexOf("/")+1)+"' src='"+path+"'/>"; */
					$("#serialHide2").val($("#aaa").val());
					picNum++;
					//alert($("input:file").attr("name"));
					//$("#picPayForm").submit();
					var params = {};
					
					$("#loading").ajaxStart(function(){$(this).show();})
							.ajaxComplete(function(){$(this).hide();});
					
					$.ajaxFileUpload({
		        		type:"post",
		        		url:"/contract/contract/ProcessUpload.do?picId="+path.substring(path.lastIndexOf("/")+1),
		        		fileElementId:'btnupload',
		        		//data:$("input:file").attr("name"),
		        		//dataType:"json",
		        		async:false,
		        		success:function(data){
		        			$("#picPayForm").resetform();
		        		}
					})
				}
		}