//����ȫ�ֳ���������
var A_WIDTH=200;
var B_WIDTH=200;
var C_WIDTH=160;
var D_WIDTH=200;

//����������ť��
(function ($) {
	$.dropDownList = function (i,showValue,menuWidth) { //Div�������������е����,ѡ��ѡ����Ƿ���ʾ��ѡ����,�˵����
		var _this = this;
		//�������������ķ����������ķ����������ÿ�������򶼼���id���ԣ������㣺
		//this.div = $("#dropDownList"+i);
		this.div = $(".dropDownList").eq(i);
		this.menu = this.div.find("ul:first").menu().css({ width: (menuWidth?menuWidth:100)+"px", "z-index": 1000-i, position: "absolute" });
		this.value = this.div.find("input:first");
		this.button = this.div.find("button:first").button({
			icons: {
				secondary: "ui-icon-carat-1-s"
			}
		}).click(function(e){
			e.stopPropagation();
			$(".ui-menu:not([id='"+_this.menu.attr("id")+"'])").fadeOut(150); //���س��˵�ǰ֮���menu������ҳ������ж���˵���ҲҪ�����ַ���
			_this.menu.fadeToggle(150); //���ﲻ��ֱ��д this.menu Ϊ����menu������ɼ���������ǰ�渳ֵ
		});

		function changeValue(){
			_this.menu.find("span.ui-icon").remove();
			_this.menu.find("a").each(function(){
				if($(this).attr("val")==_this.value.val()){
					if(showValue) _this.button.find(".ui-button-text").html($(this).html());
					if($(this).hasClass("inline")) $(this).prepend($("<span class='ui-icon ui-icon-bullet' style='margin-left: -1.3em;'></span>"));
					else $(this).prepend($("<span class='ui-icon ui-icon-bullet'></span>"));
				}
			});
		}

		this.value.change(function(){
			changeValue();
		});

		this.value.change();

		this.menu.delegate( "a", "click", function() {
			$(this).find("span.ui-icon-bullet").remove().end().parent().parent().find("span.ui-icon").remove();
			if(showValue) _this.button.find(".ui-button-text").html($(this).html()); //��ʼ��֮���Ѿ���������buttonȥ����
			if($(this).hasClass("inline")) $(this).prepend($("<span class='ui-icon ui-icon-bullet' style='margin-left: -1.3em;'></span>"));
			else $(this).prepend($("<span class='ui-icon ui-icon-bullet'></span>"));
			_this.value.val($(this).attr("val"));
			_this.menu.hide();
		});
	};
	$.extend($.dropDownList.prototype, {
		div: null,
		button: null,
		menu: null,
		value: null,
		css: function (x, y) {
			if(!y)
				this.button.css(x);
			else
				this.button.css(x,y);
		}
	});
})(jQuery);


//����ȫѡ��ť��
(function ($) {
	$.checkAllButton = function (i,inputName,menuWidth) { //Div�������������е����,�ȴ�ȫѡ��checkbox����,�˵����
		var _this = this;
		this.div = $(".checkAllButton").eq(i).children("span").addClass("ui-button ui-widget ui-state-default ui-button-text-icon-secondary ui-corner-all").end();
		this.menu = this.div.children("ul").menu().css("width",(menuWidth?menuWidth:180)+"px");
		this.menu.find("a").css("padding-left","2em");
		this.checkboxes = $('input[name='+inputName+']');
		this.checkAllbox = this.div.find("input:first").click(function(){
			//$('[name=operate]:checkbox').attr("checked", this.checked); //�������и�BUG���������span������λ�ú��������ȫѡ����ʧЧ��
			_this.check("*",this.checked);
		});
		this.icon = this.div.children("span").children("span").mouseover(function(){
			$(this).addClass("ui-state-hover");
		}).mouseout(function(){
			$(this).removeClass("ui-state-hover");
		}).mousedown(function(){
			$(this).addClass("ui-state-active");
		}).mouseup(function(){
			$(this).removeClass("ui-state-active");
		}).click(function(e){
			e.stopPropagation();
			_this.menu.toggle();
		});

		this.menu.delegate( "a", "click", function() {
			_this.menu.hide();
		});

		this.checkboxes.change(function(){
			if(!this.checked) _this.checkAllbox[0].checked=false;
			if(_this.checkboxes.size()==_this.checkboxes.filter(":checked").size()) _this.checkAllbox[0].checked=true;
			_this.checkAllbox.trigger("change");
		});
	};
	$.extend($.checkAllButton.prototype, {
		div: null,
		menu: null,
		checkboxes: null,
		checkAllbox: null,
		icon: null,
		setMenuWidth: function (menuWidth) {
			this.menu.css("width", menuWidth+"px");
		},
		setMenu: function (menuFunction) {
			this.menu.find("a").each(menuFunction);
		},
		check: function (filter, checked) {
			var checkboxes;
			if(filter=="*")
				checkboxes = this.checkboxes;
			else
				checkboxes = this.checkboxes.filter(filter);
			checkboxes.each(function(){
				this.checked = checked;
				$(this).trigger("change");
			});
		}
	});
})(jQuery);


//�������β˵���
/*(function ($) {
	$.treeView = function (i,nodeArray,valueArray,inputName,isRadio) {
		var _this = this;
		this.div = $(".treeView").eq(i);
		if(nodeArray&&valueArray&&inputName){
			if(!isRadio) $(this.genCheckboxTree(nodeArray,valueArray,inputName,this.div,0)).appendTo(this.div);
			else $(this.genRadioTree(nodeArray,valueArray,inputName,this.div,0)).appendTo(this.div);
		}
		//alert(this.div.html());
		this.folderNodes = this.div.find("li.folderNode");
		this.nodes = this.div.find("li.treeNode");
		this.root = this.div.find("li.rootNode");
		this.folders = this.div.find("li.folderNode ~ ul");
		
		this.folderNodes.click(function(){
			$(this).children(".ui-icon").toggleClass("ui-icon-circlesmall-plus").toggleClass("ui-icon-circlesmall-minus");
			var $ul = $(this).next("ul");
			$ul.toggle();
			$ul.children("li").toggle($ul.is(":visible"));
		});

		this.div.find("input[type='checkbox']").click(function(e){
			e.stopPropagation();
			var checked = this.checked;
			$(this).parent().next("ul").find("input[type='checkbox']").each(function(){
				this.checked = checked;
				$(this).change();
			});
			$(this).change(); //ie�У���Ҫ���������ܴ����¼�
			//�����������������ò�Ҫ����change�¼��У����򱻵��ô�������ࣺ
			if(this.checked) _this.redoCheckAll($(this));
			else _this.cancelCheckAll($(this));
		}).change(function(){
			//��δ������ڹ�ѡȫѡťʱִ�У������Է���click�¼��У�
			if(this.checked){
				$(this).parent().show().parent().show();
				$(this).prev(".ui-icon").removeClass("ui-icon-circlesmall-plus").addClass("ui-icon-circlesmall-minus");
			}
		});

		this.div.find("input[type='radio']").click(function(e){
			e.stopPropagation();
		});

		var $span = this.div.find("span");
		
		$span.click(function(e){ //����label�ˣ�labelҲ��ָ��id�����鷳
			if($(this).parent().hasClass("treeNode")){
				$(this).prev().click();
				e.stopPropagation();
			}
			else if($(this).prev().is("input[type='radio']")){
				//ֻ�ܰ�һ���¼�������������Ҳֻ�ù�ѡ��ѡ����Ӧ��ȡ���¼�ð�ݣ�
				$(this).prev().click();
				e.stopPropagation();
			}
		});
		//if(!$.support.leadingWhitespace) $span.css({ float: "left", margin: ".5em 0 0 0" }).prev().; //Ϊie6~8��������һ����ʽ
		
		this.foldAll();
	};
	$.extend($.treeView.prototype, {
		div: null,
		folderNodes: null,
		folders: null,
		nodes: null,
		foldAll: function () {
			this.folderNodes.hide();
			this.nodes.hide();
			this.folders.hide();
			this.folderNodes.children(".ui-icon").removeClass("ui-icon-circlesmall-minus").addClass("ui-icon-circlesmall-plus");
			this.root.fadeIn(150);
		},
		expandAll: function () {

		},
		redoCheckAll: function ($childCheckbox){
			var $newCheckbox = $childCheckbox.parent().parent().prev(".folderNode").children("input[type='checkbox']");
			if($childCheckbox.parent().siblings().find("input[type='checkbox']").filter(":not(:checked)").size()==0 && $newCheckbox.size()!=0 && !$newCheckbox[0].checked){
				$newCheckbox.trigger("click");
				//this.redoCheckAll($newCheckbox); //��Ϊʹ����.trigger("click");������Ҫ�ݹ���
			}
		},
		cancelCheckAll: function ($childCheckbox){
			//alert($childCheckbox.parent().parent().prev(".folderNode")[0].outerHTML);
			var $newCheckbox = $childCheckbox.parent().parent().prev(".folderNode").children("input[type='checkbox']");
			if($newCheckbox.size()>0){
				$newCheckbox[0].checked = false;
				$newCheckbox.change(); //���ﲻ����click��Ҫ��change�������¼����������change��������click�Ļ�����ᵼ����ѭ��
				this.cancelCheckAll($newCheckbox); //�ݹ�ִ��ֱ��ð�ݵ����Ԫ��Ϊֹ����������������ô�ģ�����������̫��Ⱑ
			}
		},
		genCheckboxTree: function (nodeArray, valueArray, inputName, div, n){
			var html="";
			for(var i=0; i<nodeArray.length; i++){
				if($.isArray(nodeArray[i])){
					html += this.genCheckboxTree(nodeArray[i], valueArray[i], inputName, div, n+1);
				}
				else{
					if(n==0){
						html += '<li class="folderNode rootNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="checkbox" name="'+inputName+'" value="'+valueArray[i]+'"><b></b><span>'+nodeArray[i]+'</span></li>';
					}
					else if(nodeArray[i+1]&&$.isArray(nodeArray[i+1])){
						html += '<li class="folderNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="checkbox" name="'+inputName+'" value="'+valueArray[i]+'"><b></b><span>'+nodeArray[i]+'</span></li>';
					}
					else{
						html += '<li class="treeNode"><input type="checkbox" name="'+inputName+'" value="'+valueArray[i]+'"><b></b><span>'+nodeArray[i]+'</span></li>';
					};
				}
			}
			html = "<ul>"+html+"</ul>"
			return html;
		},
		genRadioTree: function (nodeArray, valueArray, inputName, div, n){
			var html="";
			for(var i=0; i<nodeArray.length; i++){
				if($.isArray(nodeArray[i])){
					html += this.genRadioTree(nodeArray[i], valueArray[i], inputName, div, n+1);
				}
				else{
					if(n==0){
						html += '<li class="folderNode rootNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="radio" name="'+inputName+'" value="'+valueArray[i]+'"><b></b><span>'+nodeArray[i]+'</span></li>';
					}
					else if(nodeArray[i+1]&&$.isArray(nodeArray[i+1])){
						html += '<li class="folderNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="radio" name="'+inputName+'" value="'+valueArray[i]+'"><b></b><span>'+nodeArray[i]+'</span></li>';
					}
					else{
						html += '<li class="treeNode"><input type="radio" name="'+inputName+'" value="'+valueArray[i]+'"><b></b><span>'+nodeArray[i]+'</span></li>';
					};
				}
			}
			html = "<ul>"+html+"</ul>"
			return html;
		}
	});
})(jQuery);
*/

//����ҳ��֮��������ҿ�ȡ���ҳ���е���
function modWidthA(A_WIDTH){
	$("#leftPartA").css("width", A_WIDTH);
	$("#rightPartA").css("width", $("body").innerWidth() - A_WIDTH - 1);
	$("#bottomPartA").css("width", $("body").innerWidth() - A_WIDTH - 1);

	//var $leftPartA=$("#leftPartA");
	//var margin=LEFT_WIDTH+parseInt($leftPartA.css("padding-left").replace("px",""))+parseInt($leftPartA.css("padding-right").replace("px",""));
	//��Ҫ����padding�ˣ�û������
	//if($.isNumeric(margin)){
		//$("#rightPartA").css("margin-left", LEFT_WIDTH+"px");
	//}
}
function modWidthB(B_WIDTH){
	$("#rightPartB").css("width", B_WIDTH);
	$("#topPartB").css("width", $("body").innerWidth() - B_WIDTH - 1);
	$("#leftPartB").css("width", $("body").innerWidth() - B_WIDTH - 1);
	$("#leftPartB").css("height", $("body").innerHeight() - 50 - 1);
	//$("#bottomPartB").css("width", $("body").innerWidth() - B_WIDTH - 1);
}
function modWidthC(A_WIDTH, C_WIDTH){
	$("#leftPartC").css({"left": A_WIDTH+1, "width": C_WIDTH});
	$("#rightPartC").css({"width": $("body").innerWidth() - A_WIDTH - C_WIDTH - 1});
}
function modWidthD(D_WIDTH){
	$("#leftPartA").css("width", D_WIDTH);
	$("#topPartD").css("width", $("body").innerWidth() - D_WIDTH - 1);
	$("#rightPartD").css("width", $("body").innerWidth() - D_WIDTH - 1);
	$("#rightPartD").css("height", $("body").innerHeight() - 50 - 1);
}

//IE��ΪԪ��������Ӱ
function addShadow($target, cssProps){
	if(!cssProps) cssProps = {top: -4, left: -5, width: "290px", height: "300px"};
	if(!$.support.leadingWhitespace) //��һ����Ӱ��ʵ�ַ�����support�еĺܶ����Կ��������ж��Ƿ�΢��
		$target.parent().css("position","relative").end().clone().css({ "filter": "progid:DXImageTransform.Microsoft.Blur(makeShadow=true,pixelRadius=8,shadowOpacity=0.3);", position: "absolute", "z-index": "-1", "background-color": "#000000" }).css(cssProps).html("").insertAfter($target);
}

/**
 * 取得下拉列表的值（共通）by libin 2016.7.22
 * @param id
 * @returns
 */ 
function getDics(id){
	var dics = null;
	var params = {};
	$.ajax({
		type:"post",
		url:"/contract/dics/getDics.do?id="+id,
		data:params,
		dataType:"json",
		async:false,
		success:function(data){			
			dics = data;
		}
	});

	/*var myJson=eval('(' + JSON.stringify(dics) + ')');
    var obj=myJson.dics;*/

	//alert($.parseJSON(s).length);
	//alert("id = "+dics.dics[0].id+" , name = "+dics.dics[0].name);
	//alert("id = "+dics.dics[0].id+" , name = "+dics.dics[0].name+" , level = "+dics.dics[0].level);
	//alert("id = "+dics.dics[2].id+" , name = "+dics.dics[2].name+" , level = "+dics.dics[2].level);
	return dics;
}
/*--测--*/
function getAllDics(id){
	var dics = null;
	var params = {};
	$.ajax({
		type:"post",
		url:"/contract/dics/getAllDics.do?id="+id,
		data:params,
		dataType:"json",
		async:false,
		success:function(data){			
			dics = data;
		}
	});
	var myJson=eval('(' + JSON.stringify(dics) + ')');
    var obj=myJson.dics;
	//alert($.parseJSON(s).length);
	//alert("id = "+dics.dics[0].id+" , name = "+dics.dics[0].name);
	//alert("id = "+dics.dics[0].id+" , name = "+dics.dics[0].name+" , level = "+dics.dics[0].level);
	//alert("id = "+dics.dics[2].id+" , name = "+dics.dics[2].name+" , level = "+dics.dics[2].level);
	return obj;
}