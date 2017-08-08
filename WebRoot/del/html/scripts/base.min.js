//页面加载后需要运行的代码
$(function() {

	//点击菜单外部，隐藏菜单
	$("html,body").click(function(e) {
		$(".ui-menu").fadeOut(150);
		top.$(".ui-menu").fadeOut(150);
	});
	$(".ui-menu").click(function(e) {
		e.stopPropagation(); //阻止事件冒泡到BODY、HTML级别
	});

	//与Tab互动的超链接处理
	$("a.navLink").click(function(event) { //用tabTitle属性，可以额外设定点击后标签页显示的文字，默认显示的是超链接文字
		event.preventDefault();
		event.stopPropagation(); //如果添加在左侧导航处列表，可能因为li的click事件而发生重复点击，需要阻止事件冒泡
		top.addTab($(this).attr("id").substring(7, $(this).attr("id").length), $(this).attr("tabTitle")?$(this).attr("tabTitle"):$(this).html(), $(this).attr("href"), true);
	});

	//li内部的超链接处理
	$(".itemList li").click(function(){
		if(!$(this).hasClass("active")) $(this).children("a")[0].click(); //为何jquery不能直接触发
	});

	//可折叠列表处理
	$(".foldList").children("li").click(function(){
		$(this).siblings().toggle(200).end().children(".ui-icon").toggleClass("ui-icon-carat-1-s").toggleClass("ui-icon-carat-1-e");
	});

	//表格面板处理
	$(".panelTable tbody tr").filter(":not(.normal)").mouseover(function(){ //对大多数表格都加入经过变色效果，不想加的需要额外声明
		$(this).children().addClass("hover");
	}).mouseout(function(){
		$(this).children().removeClass("hover");
	}).find("input[type='checkbox']").change(function(){
		$(this).closest("tr").children().toggleClass("selected", this.checked);
	});
	$(".panelTable th.thSortable").mouseover(function(){ //对大多数表格都加入经过变色效果，不想加的需要额外声明
		$(this).addClass("thSortableHover");
	}).mouseout(function(){
		$(this).removeClass("thSortableHover");
	});
	$(".colorTable tbody tr:even").addClass("white");
	$(".colorTable tbody tr:odd").addClass("gray");

	//按钮处理
	$("button.normal").button();
	$("button.green").each(function(){
		if($(this).attr("primary")) {$(this).button({icons:{primaryCustom:$(this).attr("primary")}}); return;}
		if($(this).attr("secondary")) {$(this).button({icons:{secondaryCustom:$(this).attr("secondary")}}); return;}
		$(this).button();
	});
	$("button.icon").each(function(){
		$(this).button({icons:{primary: $(this).attr("icon"),text: false}});
	});

	//复选框处理
	//IE下面的处理
	var $checkboxAll = $("input[type='checkbox']"), $radioAll=$("input[type='radio']");
	if(!$.support.leadingWhitespace){
		//移除对复选框、单选钮的特殊样式描述
		$checkboxAll.css({width: "auto", height: "auto", border: 0, background: "none", margin: "5px, 0, 0, 0"});
		$radioAll.css({width: "auto", height: "auto", border: 0, background: "none", margin: "5px, 0, 0, 0"});
	}
	//其它处理	
	$checkboxAll.each(function(){
		var $mayB=$(this).next(), $mayLabel=$mayB.next(), checkbox=this;
		if($mayB.is("b")){
			$(this).hide().change(function(){
				$mayB.toggleClass("boxChecked", this.checked).toggleClass("boxUnhecked", !this.checked);
			});
			$mayB.addClass("check").toggleClass("boxChecked", checkbox.checked).toggleClass("boxUnhecked", !checkbox.checked).click(function(e){
				e.stopPropagation();
				$(checkbox).trigger("click").change(); //其实，这只是模拟点击事件
			});
			if($mayLabel.is("label")){
				$mayLabel.click(function(){
					$mayB.click();
				});
			}
		}
	});
	$radioAll.each(function(){
		var $mayB=$(this).next(), $mayLabel=$mayB.next(), radio=this;
		if($mayB.is("b")){
			$(this).hide().change(function(){
				$mayB.toggleClass("radioChecked", this.checked).toggleClass("radioUnchecked", !this.checked);
			});
			$mayB.addClass("check").toggleClass("radioChecked", radio.checked).toggleClass("radioUnchecked", !radio.checked).click(function(e){
				e.stopPropagation();
				$(radio).trigger("click");
				$("input[name='"+$(radio).attr("name")+"']").change(); //触发所有同名radio的change事件，以修改图片
			});
			if($mayLabel.is("label")){
				$mayLabel.click(function(){
					$mayB.click();
				});
			}
		}
	});

	//输入框处理
	var PADDING_CONST = 0.4;
	$(".iconInput").each(function(){
		var div=$(this);
		var input=$(this).children("input");
		var prevIcon=$(this).children(".prevIcon");
		var nextIcon=$(this).children(".nextIcon");
		var iconSize=parseInt(div.attr("iconSize")), width=parseInt(div.attr("width")), height=div.attr("height")?parseInt(div.attr("height")):(iconSize+Math.ceil(iconSize*PADDING_CONST)*2);
		div.css({"width": width+"px", "height": height+"px"});
		var prevIconSize=Math.ceil(iconSize*(1+PADDING_CONST)), nextIconSize=Math.ceil(iconSize*(1+PADDING_CONST));
		if(prevIcon.size()==0) prevIconSize=Math.ceil(iconSize*PADDING_CONST);
		if(nextIcon.size()==0) nextIconSize=Math.ceil(iconSize*PADDING_CONST);
		input.css({"width": (width-(prevIconSize+nextIconSize)-10)+"px", "margin-left": (prevIconSize+6)+"px", "font-size": (iconSize-2)+"px", "padding-top": (Math.floor(iconSize*PADDING_CONST)-4)+"px"});
		prevIcon.css({"left": Math.ceil(iconSize*PADDING_CONST)+"px", "top": Math.ceil(iconSize*PADDING_CONST)+"px"});
		nextIcon.css({"right": Math.ceil(iconSize*PADDING_CONST)+"px", "top": Math.ceil(iconSize*PADDING_CONST)+"px"});
		input.focus(function(){
			if(input.val()==input.attr("title")) input.val("");
		}).blur(function(){
			if(input.val()==""){ //$.trim(input.val())
				input.val(input.attr("title"));
				if(nextIcon.hasClass("ui-icon-close")){
					nextIcon.addClass("ui-icon-search").removeClass("ui-icon-close").off();
				}
			}
		}).keyup(function(){
			if(input.val()==""){
				input.val("");
				if(nextIcon.hasClass("ui-icon-close")){
					nextIcon.addClass("ui-icon-search").removeClass("ui-icon-close").off();
				}
			}else{
				if(nextIcon.hasClass("ui-icon-search")){
					nextIcon.addClass("ui-icon-close").removeClass("ui-icon-search").html("").click(function(){
						//form.submit(); //这里如果增加表单提交功能，则.addClass().removeClass()的语句就不能要了
						//或者像下面这样：关闭按钮可以清除框内内容
						input.val("").blur();
					});
				}
			}
		});
	});
	$(".buttonInput").each(function(){
		var div=$(this);
		var input=$(this).children("input");
		var button=$(this).children("button").button();
		var width=parseInt(div.attr("width")), height=parseInt(div.attr("height"));
		div.css({"width": width+"px", "height": height+"px"});
		input.css({"width": (width-60)+"px", "height": (height-10)+"px"});
		button.css({"width": 50+"px", "height": height+"px"});
		input.focus(function(){
			if(input.val()==input.attr("title")) input.val("");
		}).blur(function(){
			if(input.val()=="") input.val(input.attr("title"));
		}).keyup(function(){
			if(input.val()=="") input.val("");
		});
		button.click(function(){
			//绑定按钮点击事件
		});
	});

	//所有处理结束后，渐隐显现
	$("body").fadeIn(300);
	//现在所有布局都使用fixed图层+mod函数调整，希望这样的调整方法不会有问题
	modWidthA(A_WIDTH); $(window).resize(function(){modWidthA(A_WIDTH);});
	modWidthB(B_WIDTH); $(window).resize(function(){modWidthB(B_WIDTH);});
	modWidthC(A_WIDTH, C_WIDTH); $(window).resize(function(){modWidthC(A_WIDTH, C_WIDTH);});
	modWidthD(D_WIDTH); $(window).resize(function(){modWidthD(D_WIDTH);});
	if(typeof(modHeight)=="function") modHeight();
});