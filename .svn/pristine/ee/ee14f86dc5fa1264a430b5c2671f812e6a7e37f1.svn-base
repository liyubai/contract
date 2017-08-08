var dateNum = Number(1);
var picNum = Number(0);
var addPicNum=Number(0);
$(function(){
	//动态加载真实到款信息
	$('body').delegate("#addNewTr","click",function(){
         var str = '<tr><td class="col15_ textR">到款金额</td>'
     + '<td class="col35_"><input id="Tet'+dateNum+'" type="text" class="tableinput" value=""/></td>'
     + '<td class="col15_ textR">实际到款日期</td>'
     + '<td><input id="Tex'+dateNum+'" type="text" class="tableinput date" onmousedown="WdatePicker()" value="" /></td></tr>';
         dateNum++;
         $("#debtMoney").before(str);
         
	 });	
		/** 付款单位 */
		var CCompy = $('#Text2 ').val();
		var data1 = getDics(2);
		var resultHtml = "";
		/*for (var j = 1; j < data1.dics.length; j++) {
			if (data1.dics[j].level == 1) {
				resultHtml += "<td class='col15_ textR' value='"+ data1.dics[j].id + "'>" + data1.dics[j].name+ "</td>";
			}
		}*/
		for (var i = 1; i < data1.dics.length; i++) {
			if (data1.dics[i].level == "" || data1.dics[i].level != 1) {
				if (data1.dics[i].id == CCompy) {
					resultHtml += "<td class='col35_' value='"+ data1.dics[i].id + "'>"+ data1.dics[i].name + "</td>";
				}
			}
		}
		$(".modifyTable ").find('tr').eq(0).append(resultHtml);
		/** 训练状态 */
		/*var status = $("#pstatus").val();
		var data1 = getDics(512);
		var html = "";
		for (var i = 1; i < data1.dics.length; i++) {
			if (data1.dics[i].level == "" || data1.dics[i].level != 1) {
				if (data1.dics[i].id == status) {
					html += "<td class='col35_' value='"+ data1.dics[i].id + "'>"+ data1.dics[i].name + "</td>";
				}
			}
		}
		$("#debtMoney ").append(html);*/
		/**
		 * 动态加载实际到款时间
		 */
		var moneyDate=$('#truedateHide').val();	
		if(moneyDate.length>0){
			moneyDate = moneyDate.substring(0,moneyDate.length-1);
		}
		moneyDate  = eval("["+moneyDate+"]");
		if($('#truedateHide').val()!=''){ //有信息
			for(var i=0;i<moneyDate.length;i++){
				var str="";
					if($("#debtMoney").find('td').eq(-1).find('label').html()=="已付款"){
						str += '<tr><td class="col15_ textR">到款金额</td>'
					        + '<td class="col35_"><input id="Tet'+i+'" type="text" class="tableinput" readonly="readonly" value="'+moneyDate[i].trueMoney+'"/></td>'
					        + '<td class="col15_ textR">实际到款日期</td>'
					        + '<td><input id="Tex'+i+'"" type="text" class="tableinput date" value="'+moneyDate[i].trueDate+'"'
					        + 'onmousedown="WdatePicker()" /></td></tr>';
						 $("#debtMoney").before(str);
					}else{
						str += '<tr><td class="col15_ textR">到款金额</td>'
					        + '<td class="col35_"><input id="Tet'+i+'" type="text" class="tableinput" value="'+moneyDate[i].trueMoney+'"/></td>'
					        + '<td class="col15_ textR">实际到款日期</td>'
					        + '<td><input id="Tex'+i+'"" type="text" class="tableinput date" value="'+moneyDate[i].trueDate+'"'
					        + 'onmousedown="WdatePicker()" /></td></tr>';
						 $("#debtMoney").before(str);
					}
			}
		}else{ //无信息
			var str="";
			str += '<tr><td class="col15_ textR">到款金额</td>'
		        + '<td class="col35_"><input id="Tet0" type="text" class="tableinput" value="'+$('#Text4').val()+'"/></td>'
		        + '<td class="col15_ textR">实际到款日期</td>'
		        + '<td><input id="Tex0" type="text" class="tableinput date" value=""'
		        + 'onmousedown="WdatePicker()" /><button id="addNewTr" class="greenBtn"  style="margin-left:10px;">+</button></td></tr>';
			//alert(str);
			 $("#www").after(str);
		}
		
		 /**
		 * 动态加载发票图片 src="D:\\JProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\contract\\'+picture[i]+'"' 
		 */		 
		 var picture = $("#pic").val().split(",");
		 for(var i=0;i<picture.length-1;i++){  
			 var pictureHtml="";
			 pictureHtml += '<div class="fpWrap" >'
						+'<img id="imghead'+i+'" '
						//+' src="/contract/contract/themes/cupertino/images/'+picture[i]+'"' //发布用此路径****
						+' src="/fileupload/'+picture[i]+'"'
						+' class="fpImg" />'
						+'<div class="removeClose"></div>'
						  +'<input type="hidden" id="deltext" name="deltext" value ='+picture[i]+'>'
						  +'</div></td>'
						  $("#picture").append(pictureHtml);	
		 }
		 
		 	$('.fpWrap').hover(function() {
	            $(this).find('.removeClose').show();
	        }, function() {
	            $(this).find('.removeClose').hide();
	        });
	        $('.fpWrap .removeClose').click(function() {
	           // $(this).parent().remove();
	        	var delUrlStr = $(this).parent().find('input').val();	        	
	        	var serial = $("#serial").val();
	             $.ajax({
	     			type:"post",
	     			//async:false, 
	     			url:"/contract/delPicture.do",
	     			data:{
	     				delUrlStr:delUrlStr,
	     				serial:serial
	     			},
	     			dataType:'text',
	     			success:function(data){
	     				if (data == "OK") {
	     		           	alert("发票删除成功");  
	     		         //  $(this).parent().remove();
	     		       	$("#returnUpdateForm").submit();
	     				}
	     				else {
	     					alert("发票删除失败");	
	     				}
	     			}, 
	     			error:function(XMLHttpRequest, textStatus, errorThrown){
	     				alert(errorThrown);
	     			}
	     		});
	        });
		 
		 /**
		  * 动态加载pdf
		  */
		// alert($("#pdfUrl").val());
		 var pdfUrl = $("#pdfUrl").val().split(",");
		// alert(pdfUrl);
		 var pdfUrlHtml="";
		 for(var i=0;i<pdfUrl.length-1;i++){
			 var pdfName = pdfUrl[i];
			 pdfName =  pdfName.substring(pdfName.lastIndexOf("/")+1);
			 
			// alert(pdfUrl[i]);
			
			/* pdfUrlHtml += '<div class="fjWrap" >'
				        +'<a href="javascript:downloadpdf('+pdfUrl[i]+')">'
						+'<img src="/contract/contract/themes/cupertino/images/pdfimg.png"/>'
						+'</a>'
						+'<div class="fj_descript">pdf附件</div>'
						+'<div class="removeClose"></div></div></td>'*/
						
			pdfUrlHtml += "<div class='fjWrap' >"
					  +"<a href='javascript:downloadpdf("+i+")'>"
					  +"<input type='hidden' id='backUrl"+i+"' name='downloadUrl' value ='"+pdfUrl[i]+"'>"
					  +"<img src='/contract/contract/themes/cupertino/images/pdfimg.png'/>"
					  +"</a>"
				     /* +"<div class='fj_descript'>pdf附件</div>"*/
					  +"<div class='fj_descript'>"+pdfName+"</div>"
					  +"<div class='removeClose'>" 
					  +"<input type='hidden' id='delbackUrl' name='delbackUrl' value ='"+pdfUrl[i]+"'>"
					  +"</div></div></td>"				
						
		 } 
		 $("#showpdf").append(pdfUrlHtml);	

         $('.fjWrap').hover(function() {
             $(this).find('.removeClose').show();
         }, function() {
             $(this).find('.removeClose').hide();
         });
         
         $('.fjWrap .removeClose').click(function() {
        	// alert(1);
        	 var delUrlStr = $(this).parent().find('#delbackUrl').val();
        	 var serial = $("#serial").val();
             $.ajax({
     			type:"post",
     			//async:false, 
     			url:"/contract/delNoticeUrl.do",
     			data:{
     				delUrlStr:delUrlStr,
     				serial:serial
     			},
     			dataType:'text',
     			success:function(data){
     				if (data == "OK") {
     		           	alert("通知删除成功");  
     		         //  $(this).parent().remove();
     		       	$("#returnUpdateForm").submit();
     				}
     				else {
     					alert("通知删除失败");	
     				}
     			}, 
     			error:function(XMLHttpRequest, textStatus, errorThrown){
     				alert(errorThrown);
     			}
     		});	
        	 
            // $(this).parent().remove();
         });
         /**jisuan*/
       /*  var receivemoney =parseFloat( $("#Text4").val());
         var money =parseFloat(0);
         var pareas = $('#debtMoney').find('td').eq(1).html();
        	 alert(pareas);
 		 for(var i =0;i<dateMoneyNum();i++){
 			money +=  parseFloat($("#Tet"+i).val());
 		 }
 		 if(money < receivemoney){
 			pareas=receivemoney-money;
 		 }*/
	
	function checkForm(){
		var receivemoney = $("#Text4").val();
		//alert($("#Text4").val());
		var money = 0;
		for(var i =0;i<dateNum;i++){
	//		alert(i+"------------")
			money = money+ parseFloat($("#Tet"+i).val());
	//		alert(money);
		}
		if(money>receivemoney){
			alert("实际到款总金额大于预计付款金额");
			return false;		
		}
		else 
			return true;
	}	
	/**
	 * 修改页面保存摁扭
	 */
	$("#Button2").click(function(){
		if(checkForm()){
			//alert(1);
			$("#serial").val();//序号
			$("#companyHide").val($("#Text2").val());//付款单位
			$("#contractidHide").val($("#Text1").html());//合同编号
			$("#receivemoneyHide").val($("#Text4").val());//预计款金额
			$("#paymentpercentHide").val($("#Text5").val());//百分比
			$("#receivedateHide").val($("#Text10").val());//到款日期
			$("#moneyHide").val($("#Text33").val());//到款金额
			$("#arrearsHide").val($("#Text11").html());//欠款金额
			$("#remark").val($("#Text17").val());//备注		
			if($("#Tex0").val()!=''){
			    var str ="";
				for(var i = 0;i<dateMoneyNum();i++){
					str += "{\"trueMoney\":\""+$("#Tet"+i).val()+"\",\"trueDate\":\""+$("#Tex"+i).val()+"\"},";
				}
				//alert(str)
				$("#truedateHide").val(str);
				//图片
				var picture=$("#pic").val();
				for(var j=0;j<addPicNum;j++){
					picture=picture+$("#addPic"+j).val()+",";
				}
				$("#pictureHide").val(picture);
				$("#updatePayForm").submit();	
			}else{
				alert("请添加实际到款日期");
				$("#Tex0").focus();
			}				
		}		
	})		
})
function dateMoneyNum(){
	var num=0;
	$('tbody').find('tr').each(function(){
		if($(this).find('td').html()=="到款金额"){
			num++;
		}
	})
	return num;
}
/**
 * 图片浏览
 * @param imgFile
 *//*
 function PreviewImage(imgFile){ 
    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
    if(!pattern.test(imgFile.value)){
    	alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
    	imgFile.focus(); 
    	} else 
    		 { 
    			var path; 
    				if(document.all){ 
						imgFile.select(); 
						path = document.selection.createRange().text; 
						document.getElementById("imgPreview").innerHTML=""; 
						document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
    					} 
    				else{ 
    					alert(path+"-------------------1");
    					path = URL.createObjectURL(imgFile.files[0]);
    					alert(path+"--------------------2");
    					document.getElementById("imgPreview").innerHTML = "<img id='a' value='"+path.substring(path.lastIndexOf("/")+1)+"' src='"+path+"'/>"; 
    					
    					var a = path.substring(path.lastIndexOf("/")+1);
    					alert(a);
    					$("#updatePayForm").submit();
    					} 
    		 } 
   } */
/**
*
*/
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
			var namePath =path.substring(path.lastIndexOf("/")+1)
			$("#pic").after("<div id='imgPreview"+picNum+"' class='fpWrap'>" +
					"<img id='imId"+picNum+"' name='"+namePath+"' value='"+path.substring(path.lastIndexOf("/")+1)+"' src='"+path+"'/>" +
					"<input type='hidden' id='addPic"+addPicNum+"' value='"+path.substring(path.lastIndexOf("/")+1)+"'></div>");
			addPicNum++;
			/*$("#imgPreview").html("<img id='a' value='"+path.substring(path.lastIndexOf("/")+1)+"' src='"+path+"'/>");
			document.getElementById("imgPreview").innerHTML = "<img id='a' value='"+path.substring(path.lastIndexOf("/")+1)+"' src='"+path+"'/>"; */
			//$("#serialHide2").val($("#aaa").val());
			picNum++;
			//alert($("input:file").attr("name"));
			//$("#picPayForm").submit();
			var params = {};
			$("#loading").ajaxStart(function(){$(this).show();})
					.ajaxComplete(function(){$(this).hide();});			
			$.ajaxFileUpload({
        		type:"post",
        		url:"/contract/ProcessUpload.do?picId="+path.substring(path.lastIndexOf("/")+1),
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

//下载pdf swq
function downloadpdf(id){
	var downloadUrl = $("#backUrl"+id).val();
	$("#downloadUrlStr").val(downloadUrl);	
	$("#downloadUrlForm").submit();
	
}