$(function() {
	initTree(getAllDics(516));
	initTree(getAllDics(517));
	initTree(getAllDics(518));
	
	$('.thirdlevel').each(function(){		
		var str = $(this).next().html();		
		if(str.length<1){
			if(str==''){
				$(this).css('display','block');
			}else{
				$(this).css('display','none');
			}
		}
	})
	$('.secondlevel').each(function(){
		var temp=false;
		$(this).next().find(".thirdlevel").each(function(){
			if($(this).css('display')!='none'){
				temp=true;
			}
		})
		if(!temp){
			$(this).css('display','none');
		}
	})
		$('.firstlevel').each(function(){
			var temp=false;
			$(this).next().find(".secondlevel").each(function(){
				if($(this).css('display')!='none'){
					temp=true;
				}
			})
			if(!temp){
				$(this).css('display','none');
			}
			
	})
	function initTree(data) {
		//alert(JSON.stringify(data));
		// debugger;
		if (data.length > 0) {
			strHtml = '';
			var showPaymentInfo = eval("[" + $("#paymentInfo").val()+ "]");
			for (var i = 1; i < data.length; i++) {
				strHtml = ""
				if (data[i].id == data[i].TopId) {
					var did = "D" + data[i].id;
					strHtml = '<li class="folderNode rootNode firstlevel"><input type="hidden" value="'
							+ data[i].id + '">' + data[i].name + '</li>';
					strHtml += '<ul id=' + did + '></ul>';
					$('#treeView0ul').append(strHtml);
				} else if (data[i].level == 2) {
					var did = "D" + data[i].id;
					var pdid = "D" + data[i].ParentId;
					strHtml = '<li class="folderNode secondlevel"><input type="hidden" value="'
							+ data[i].id + '" >&nbsp;' + data[i].name + '</li>';
					strHtml += '<ul id=' + did + '></ul>';
					$("#" + pdid).append(strHtml);
				} else if (data[i].level == 3) {
					var did = "D" + data[i].id;
					var pdid = "D" + data[i].ParentId;
					//var showPaymentInfo = eval("[" + $("#paymentInfo").val()+ "]");
					if ($("#paymentInfo").val() != '') {
						for (var k = 0; k < showPaymentInfo.length; k++) {
							if (data[i].id == showPaymentInfo[k].name) {
								if (showPaymentInfo[k].value != '') {
									strHtml = '<li class="treeNode thirdlevel"><input type="hidden"  value="'+ data[i].id+ '">'
											+ '<span >'+ data[i].name+ '&nbsp;:</span>'
											+ '<span class="bold"><lable id ="'+ data[i].id+ '" value="'+ showPaymentInfo[k].value
											+ '">&nbsp;'+ showPaymentInfo[k].value+ '</lable></span>元</li>';									
								}
							}
						}						
					}
					strHtml += '<ul id=' + did + '></ul>';
					$("#" + pdid).append(strHtml);
				}
				else if(data[i].level == 4){
					var pdid = "D" + data[i].ParentId;
					//alert(pdid);
					for (var k = 0; k < showPaymentInfo.length; k++) {
						if (data[i].id == showPaymentInfo[k].name) {
							if (showPaymentInfo[k].value != '') {
								//alert(data[i].id+"---"+showPaymentInfo[k].name+"---"+showPaymentInfo[k].value);
								strHtml = '<li class="treeNode "><input type="hidden"  value="'+ data[i].id+ '">'
								+ '<span >'+ data[i].name+ '&nbsp;:</span>'
								+ '<span class="bold"><lable id ="'+ data[i].id+ '" value="'+ showPaymentInfo[k].value
								+ '">&nbsp;'+ showPaymentInfo[k].value+ '</lable></span>时</li>';
							}
						}
					}
					$("#" + pdid).append(strHtml);
				}
			}
		}
		return strHtml;
	}

	$(document).ready(
			function() {
				/* 合同类型 */
				var CType = $('#strCType').val();
				// alert(CType);
				var data1 = getDics(322);
				var resultHtml = "";
				for (var j = 1; j < data1.dics.length; j++) {
					if (data1.dics[j].level == 1) {
						resultHtml += "<td class='col20_ textR' value='"
								+ data1.dics[j].id + "'>" + data1.dics[j].name
								+ "</td>";
					}
				}
				for (var i = 1; i < data1.dics.length; i++) {
					if (data1.dics[i].level == "" || data1.dics[i].level != 1) {
						if (data1.dics[i].id == CType) {
							resultHtml += "<td class='col20_' value='"
									+ data1.dics[i].id + "'>"
									+ data1.dics[i].name + "</td>";
						}
					}
				}
				$("#modifyTable ").find('tr').eq(1).append(resultHtml);

				/* 学员类型 */
				var CStuType = $('#strCStuType').val();
				// alert(CType);
				var data1 = getDics(3);
				var resultHtml = "";
				for (var j = 1; j < data1.dics.length; j++) {
					if (data1.dics[j].level == 1) {
						resultHtml += "<td class='col20_ textR' value='"
								+ data1.dics[j].id + "'>" + data1.dics[j].name
								+ "</td>";
					}
				}
				for (var i = 1; i < data1.dics.length; i++) {
					if (data1.dics[i].level == "" || data1.dics[i].level != 1) {
						if (data1.dics[i].id == CStuType) {
							resultHtml += "<td class='col20_' value='"
									+ data1.dics[i].id + "'>"
									+ data1.dics[i].name + "</td>";
						}
					}
				}
				$("#modifyTable ").find('tr').eq(1).append(resultHtml);

				/* 合同性质 */
				var CNature = $('#strCNature').val();
				// alert(CType);
				var data1 = getDics(557);
				var resultHtml = "";
				for (var j = 1; j < data1.dics.length; j++) {
					if (data1.dics[j].level == 1) {
						resultHtml += "<td class='col20_ textR' value='"
								+ data1.dics[j].id + "'>" + data1.dics[j].name
								+ "</td>";
					}
				}
				for (var i = 1; i < data1.dics.length; i++) {
					if (data1.dics[i].level == "" || data1.dics[i].level != 1) {
						if (data1.dics[i].id == CNature) {
							resultHtml += "<td class='col20_' value='"
									+ data1.dics[i].id + "'>"
									+ data1.dics[i].name + "</td>";
						}
					}
				}
				$("#modifyTable ").find('tr').eq(2).append(resultHtml);

				/* 客户单位 */
				var CCompy = $('#strCCompy ').val();
				// alert(CType);
				var data1 = getDics(2);
				var resultHtml = "";
				for (var j = 1; j < data1.dics.length; j++) {
					if (data1.dics[j].level == 1) {
						resultHtml += "<td class='col20_ textR' value='"
								+ data1.dics[j].id + "'>" + data1.dics[j].name
								+ "</td>";
					}
				}
				for (var i = 1; i < data1.dics.length; i++) {
					if (data1.dics[i].level == "" || data1.dics[i].level != 1) {
						if (data1.dics[i].id == CCompy) {
							resultHtml += "<td class='col20_' value='"
									+ data1.dics[i].id + "'>"
									+ data1.dics[i].name + "</td>";
						}
					}
				}
				$("#modifyTable ").find('tr').eq(3).find('td').eq(-2).before(
						resultHtml);

			});

	// 设置时间格式
	for (var i = 0; i < $('.date1').length; i++) {
		var date = $(".date1:eq(" + i + ")").val();
		if (date != null) {
			date = date.substring(0, 10);
			$(".pdate:eq(" + i + ")").text(date);
		}
	}

	$('#Button2').click(function() {
		$("#back").submit();
	});
});