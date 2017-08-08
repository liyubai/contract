//定义全局常量及函数
var A_WIDTH=200;
var B_WIDTH=200;
var C_WIDTH=160;

//定义下拉按钮类
(function ($) {
	$.dropDownList = function (i,showValue,menuWidth) { //Div在所有下拉框中的序号,选择选项后是否显示所选内容,菜单宽度
		var _this = this;
		//不建议用这样的方法，这样的方法，必须给每个下拉框都加上id属性，不方便：
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
			$(".ui-menu:not([id='"+_this.menu.attr("id")+"'])").fadeOut(150); //隐藏除了当前之外的menu，其他页面如果有多个菜单，也要用这种方法
			_this.menu.fadeToggle(150); //这里不能直接写 this.menu 为了让menu在这里可见，必须在前面赋值
		});
		
		this.menu.delegate( "a", "click", function() {
			$(this).find("span.ui-icon-bullet").remove().end().parent().siblings().find("span.ui-icon-bullet").remove();
			if(showValue) _this.button.find(".ui-button-text").html($(this).html()); //初始化之后，已经不能再用button去访问
			$(this).prepend($("<span class='ui-icon ui-icon-bullet'></span>"));
			_this.value.attr("value", $(this).attr("val"));
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


//定义全选按钮类
(function ($) {
	$.checkAllButton = function (i,inputName,menuWidth) { //Div在所有下拉框中的序号,等待全选的checkbox名称,菜单宽度
		var _this = this;
		this.div = $(".checkAllButton").eq(i).children("span").addClass("ui-button ui-widget ui-state-default ui-button-text-icon-secondary ui-corner-all").end();
		this.menu = this.div.children("ul").menu().css("width",(menuWidth?menuWidth:180)+"px");
		this.menu.find("a").css("padding-left","2em");
		this.checkboxes = $('input[name='+inputName+']');
		this.checkAllbox = this.div.find("input:first").click(function(){
			//$('[name=operate]:checkbox').attr("checked", this.checked); //这个语句有个BUG，当点击了span的其它位置后，再来点击全选框则失效。
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


//定义树形菜单类
(function ($) {
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
			$(this).change(); //ie中，需要这条语句才能触发事件
			//下面这两个函数调用不要放在change事件中，否则被调用次数会过多：
			if(this.checked) _this.redoCheckAll($(this));
			else _this.cancelCheckAll($(this));
		}).change(function(){
			//这段代码用于勾选全选钮时执行，不可以放在click事件中：
			if(this.checked){
				$(this).parent().show().parent().show();
				$(this).prev(".ui-icon").removeClass("ui-icon-circlesmall-plus").addClass("ui-icon-circlesmall-minus");
			}
		});

		this.div.find("input[type='radio']").click(function(e){
			e.stopPropagation();
		});

		var $span = this.div.find("span");
		
		$span.click(function(e){ //不用label了，label也得指定id，很麻烦
			if($(this).parent().hasClass("treeNode")){
				$(this).prev().click();
				e.stopPropagation();
			}
			else if($(this).prev().is("input[type='radio']")){
				//只能绑定一个事件。如果点击文字也只让勾选复选框，则应该取消事件冒泡：
				$(this).prev().click();
				e.stopPropagation();
			}
		});
		//if(!$.support.leadingWhitespace) $span.css({ float: "left", margin: ".5em 0 0 0" }).prev().; //为ie6~8单独设置一下样式
		
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
				//this.redoCheckAll($newCheckbox); //因为使用了.trigger("click");，不需要递归了
			}
		},
		cancelCheckAll: function ($childCheckbox){
			//alert($childCheckbox.parent().parent().prev(".folderNode")[0].outerHTML);
			var $newCheckbox = $childCheckbox.parent().parent().prev(".folderNode").children("input[type='checkbox']");
			if($newCheckbox.size()>0){
				$newCheckbox[0].checked = false;
				$newCheckbox.change(); //这里不能用click，要用change来触发事件，如果不用change，而是用click的话，则会导致死循环
				this.cancelCheckAll($newCheckbox); //递归执行直到冒泡到最父层元素为止，这个如果像上面那么改，反而报错，不太理解啊
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


//进入页面之后调整左右宽度。在页面中调用
function modWidthA(A_WIDTH){
	$("#leftPartA").css("width", A_WIDTH);
	$("#rightPartA").css("width", $("body").innerWidth() - A_WIDTH - 1);
	$("#bottomPartA").css("width", $("body").innerWidth() - A_WIDTH - 1);

	//var $leftPartA=$("#leftPartA");
	//var margin=LEFT_WIDTH+parseInt($leftPartA.css("padding-left").replace("px",""))+parseInt($leftPartA.css("padding-right").replace("px",""));
	//不要设置padding了，没有意义
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

//IE下为元素增加阴影
function addShadow($target, cssProps){
	if(!cssProps) cssProps = {top: -4, left: -5, width: "290px", height: "300px"};
	if(!$.support.leadingWhitespace) //另一种阴影的实现方法。support中的很多属性可以用来判断是否微软
		$target.parent().css("position","relative").end().clone().css({ "filter": "progid:DXImageTransform.Microsoft.Blur(makeShadow=true,pixelRadius=8,shadowOpacity=0.3);", position: "absolute", "z-index": "-1", "background-color": "#000000" }).css(cssProps).html("").insertAfter($target);
}