<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据字典操作</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <style type="text/css">
    .bottom
    {width:100%;height:60px;position:absolute;bottom:0; }
    .panelContent
    {position:relative;}
    .treeView li
    {
    	cursor:default;
    	font-size:12px;
    }
    .treeView li span
    {
    	font-size:12px;
    }
    </style>
</head>
<body oncontextmenu="return false">
	<jsp:include page="/pages/common/topPart.jsp"/>
    <jsp:include page="/pages/common/leftPart.jsp"/>
   <div id="rightPartA" style="overflow-x: hidden;">
        <div>
            <div class="Panel">
                <div class="panelHead">
                    <span>数据字典</span>
                </div>
                <div class="panelContent" style="min-height: 400px;">
                    <div class="treeView ml10" id="treeView0">
                   
                    </div>
                    <div class="bottom"> <div style=" text-align:center;"><button class="green" style="margin-bottom:20px;" onclick="javascript:window.location.href='<%=request.getContextPath()%>/contract/dataDictionary_list.do'">返回</button></div></div></div>                    
                </div>
               </div>
        </div>
       
    </div>
<input id="hidNodeLevel" type="hidden" value="" />
<input id="hidNodeId" type="hidden" value="" />
<input id="hidNodeName" type="hidden" value="" />
<div id="showMes" class="showMes">
       <span class="span" id="addNode">新建子分类</span> <span class="span"
			id="updateNode">修改本分类</span> <span class="span" id="delNode">删除本分类</span>
	</div>
	<div id="dialogFormAdd" title="新建子分类">
		<p class="validateTips">节点信息</p>
		<form
			action="<%=request.getContextPath()%>/contract/dataDictionaryManage_save.do"
			method="post" id="addDicForm"  onkeydown="if(event.keyCode==13)return false;">
			<div>
				<input type="hidden" id="parentId_add" name="dictionary.parentId"
					value=""> <input type="hidden" id="TopId_add"
					name="dictionary.TopId" value="">
					 <input type="hidden" id="dictionaryId_send"
					name="dictionaryId" value="${dictionaryId}"> <input type="hidden"
					id="Level_add" name="dictionary.Level" value=""> <span>子分类名称</span>
				<input id="dictionaryName_add" name="dictionary.dictionaryName"
					type="text" class="tableinput2" />
			</div>
		</form>
	</div>
	<div id="dialogFormUpdate" title="修改本分类">
		<p class="validateTips">节点信息</p>
		<form method="post" id="updateDicForm"  onkeydown="if(event.keyCode==13)return false;">
			<div>
				<input type="hidden" id="dictionaryId_update"
					name="dictionary.dictionaryId" value=""> <span>本分类名称</span>
				<input id="dictionaryName_update" name="dictionary.dictionaryName"
					type="text" class="tableinput2" />
			</div>
		</form>
	</div>
	<script>
    $(function() {

       ajaxZtree();

        var txt1 = $("#txtNode"),
		allFields = $([]).add(txt1),
		tips = $(".validateTips");

        function updateTips(t) {
            tips.html(t).addClass("ui-state-highlight");
            setTimeout(function() {
                tips.removeClass("ui-state-highlight", 1500);
            }, 2000);
        }

    	$("#dialogFormAdd").dialog(
				{
					autoOpen : false,
					height : 200,
					width : 300,
					background : '#FF0000', // 背景色
					opacity : 0.27, // 透明度
					modal : true,
					resizable : false,
					buttons : {
						"确 定" : function() {
							//确定按钮的处理代码段：
							// 添加之前先获取父类的内容	

							if($.trim($("#dictionaryName_add").val()).length<=0)
									{
							        	alert("输入内容不能为空");
									}
							else if($.trim($("#dictionaryName_add").val()).length>20)
							{
					        	alert("输入内容不能超过20个字符");
							}
							       else
								   {
									$("#addDicForm").submit();		

									$(this).dialog("close");
							       }
								},
								"取 消" : function() {
									$(this).dialog("close");
								}
							},
							close : function() {
								allFields.val("").removeClass("error");
							}
						});

		$("#dialogFormUpdate")
				.dialog(
						{
							autoOpen : false,
							height : 200,
							width : 300,
							background : '#FF0000', // 背景色
							opacity : 0.27, // 透明度
							modal : true,
							resizable : false,
							buttons : {
								"确 定" : function() {
									//确定按钮的处理代码段：
					
									if($.trim($("#dictionaryName_update").val()).length<=0)
									{
							        	alert("输入内容不能为空");
									}
									else if($.trim($("#dictionaryName_update").val()).length>20)
									{
							        	alert("输入内容不能超过20个字符");
									}
									else
									{							
									var params = $("#updateDicForm").serialize();
									$.ajax({
												type : "post",
												url : "dataDictionaryManage_update.do",
												data : params,
												dataType : "json",
												success : function(data) {
													$("#"+ $("#hidNodeId").val()).html(data.dictionaryName);
													$(this).dialog("close");
												},
												error : function() {
													alert("修改失败");
												}
											});
									$(this).dialog("close");
									}
								},
								"取 消" : function() {
									$(this).dialog("close");
								}
							},
							close : function() {
								allFields.val("").removeClass("error");
							}
						});

		var folderNodes = $(".treeView").find("li.rootNode");
		$(".treeView").delegate(folderNodes, "mousedown", function(e) {
			var id = e.target.id;
			$("#parentId_add").val(id);
			$("#dictionaryId_update").val(id);
			$("#hidNodeId").val(id);
			$("#hidNodeName").val($("#" + id).html());
			if (e.which == 3) {
				var mouseX = e.pageX;
				var mouseY = e.pageY;
				$('#showMes').css({
					'left' : mouseX + 'px',
					'top' : mouseY + 'px'
				}).show();
			}
		});

		$('#addNode').click(function() {
			//确定按钮的处理代码段：
			// 添加之前先获取父类的内容
			params = {"parentdictionaryId":$.trim($("#parentId_add").val())};
			$.ajax({
				type : "post",
				url : "<%=request.getContextPath()%>/contract/ajaxGetDictionary.do",
								data : params,
								dataType : "json",
								success : function(data) {
									var dataarray = data.split(',');
									if (data.split(',').length > 0) {
										if (dataarray[1].length > 0) {	
											if((parseInt(dataarray[1]))==4)
												{
											    	alert("子分类最多为4级");
											    	return false;
												}

											$("#TopId_add").val(dataarray[0]);
											$("#dictionaryId_send").val(dataarray[0]);
											$("#Level_add").val(parseInt(dataarray[1])+ parseInt(1));
											
											tips.removeClass("ui-state-highlight").html("请填写所有信息");
											$("#modalDialogButton1 input.error").removeClass("error");
											$("#dialogFormAdd").dialog("open");
										}
												
									} else {
										alert("新建子分类失败");
									}

								},
								error : function() {
									alert("新建子分类失败");
								}
							});  // end ajax		
		});

		$('#updateNode').click(		
				function() {
					tips.removeClass("ui-state-highlight").html("请填写所有信息");
					$("#modalDialogButton1 input.error").removeClass("error");
					$("#dictionaryName_update").val($("#hidNodeName").val().trim());
					$("#dialogFormUpdate").dialog("open");
				});

		$('#delNode').click(function() {
			var r = confirm("确认是否删除？")
			if (r == true) {

				$.ajax({
					type : "get",
					url : "<%=request.getContextPath()%>/contract/ajaxDeleteDictionary.do",
									data : {"parentdictionaryId":$.trim($("#parentId_add").val())},
									dataType : "text",
									success : function(data) {
										window.location.reload();
									},
									error : function() {
										alert("删除本分类失败");
									}
								});  // end ajax		
			} else {

			}
		});

		
		function ajaxZtree(){
			params = {"dictionaryId":$.trim($("#dictionaryId_send").val())};
			$.ajax({
				type:"post",
				async:false, 
				url:"<%=request.getContextPath()%>/contract/ajaxGetDictionaryList.do",
				data:params,
				dataType:"json",
				success:function(data ){
					if(data==null){
						alert("data is null");
					}else{			
						data = eval(data);
						if (data!=null && data.length>0){
							initTree(data);
						}
			
					}
				}, 
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert(errorThrown);
				}
			});				
		}

		function  initTree(data) {
			var dataInfo = "<ul class='tV' style='overflow:hidden;'>";
			var id1 = -1;
				data = eval(data);
				for (var i = 0; i < data.length; i++) {		
				
					if(data[i].level==1)
						{
					   	    dataInfo+="<ul style=\"margin-bottom:60px;\">";
							dataInfo += "<li class='folderNode rootNode' id="+ data[i].dictionaryId+"> "+ data[i].dictionaryName +"</li>";							
							id1 = data[i].dictionaryId;							
							dataInfo += "<ul>";
							for (var j = i; j < data.length; j++) 
							{								
								if(data[j].level==2&& data[j].parentId == id1)
									{
										dataInfo += "<li class='folderNode'  id="+ data[j].dictionaryId+"> "+ data[j].dictionaryName +"</li>";
										var id2=data[j].dictionaryId;
										dataInfo += "<ul>";
										for (var k = j; k < data.length; k++) 
										{								
											if(data[k].level==3&& data[k].parentId == id2)
												{
													dataInfo += "<li class='folderNode'  id="+ data[k].dictionaryId+"> "+ data[k].dictionaryName +"</li>";
													var id3=data[k].dictionaryId;
													dataInfo += "<ul>";
													for (var p = k; p < data.length; p++) 
													{								
														if(data[p].level==4&& data[p].parentId == id3)
															{
																dataInfo += "<li class='folderNode'  id="+ data[p].dictionaryId+"> "+ data[p].dictionaryName +"</li>";
															
															}
													}  // level4
													dataInfo += "</ul>";
												}
											
										}  // level3
										dataInfo += "</ul>";
									}
							}  // level2
							dataInfo += "</ul>";
						} // level1
				        dataInfo+="</ul>";
				}
				$("#treeView0").append(dataInfo);

		}
        $(document).bind("click", function(e) {
            var target = $(e.target);
            if (target.closest("#showMes").length == 0) {
                $('#showMes').hide();
            }
        });
    });
</script>
</body>
</html>
