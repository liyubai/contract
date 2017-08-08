var activeLinkId = 0; //保存实时的激活标签linkId，不是序号，标签的序号和数组linkIdArray下标实时对应
var linkIdArray = new Array("0","1","2","3","4","5","6"); //初始的linkId列表，linkId不用按顺序来，并且通过这个数组进行管理。如果赋值不是字符串而是整数型，则可能会有一些问题
var TAB_FIXED_COUNT = linkIdArray.length; //默认已有的标签数量
var TAB_MAX_COUNT = 11; //导航区最多的标签数量
var TOP_HEIGHT = 90; //留给上侧导航区的高度

/*
function getArrayIndexByLinkId(linkId)
{
	var n=-1;
	for(var i=0;i<linkIdArray.length;i++)
	{
		if(linkIdArray[i]==linkId)
			n=i;
	}
	$.each(linkIdArray, function(i, value){
		if(value==linkId) n=i;
	});
	return n;
}
//两种写法都可以，但是jquery已经自带了根据数值查找下标的函数$.inArray
*/

function removeFromArrayByLinkId(linkId)
{
	for(var i=0;i<linkIdArray.length;i++)
	{
		if(linkIdArray[i]==linkId)
			linkIdArray.splice(i, 1);
	}
}


var tabTemplate = "<li><a class='tabLink' href='#{href}' url='#{url}' target='indexFrame'>#{label}</a><span class='ui-icon ui-icon-close' role='presentation'>[X]</span></li>",
	tabContentTemplate = "<div class='tabDiv' id='#{id}'></div>",
	$tabDropDownLi,
	tabCounter,
	$menuDivider2,
	menuItemTemplate = "<li><a class='menuNavLink' href='#N' id='#{id}'>#{label}</a></li>";
var $tabs,$navMenu; //定义在外面，变成全局变量，于是几个函数也可以拿到外面来了。另外，定义一个临时变量，避免重复使用同一个选择器选择页面中的元素，提升程序效率。


$(function() {

	$tabs = $( "#tabs" ).tabs();
	$navMenu = $("#navMenu");
	tabCounter = TAB_FIXED_COUNT;
	$navMenu.menu().find("#menuDevider2").hide();
	$tabDropDownLi = $("#dropDownLi");
	$tabDropDownLi.find("a").css({ margin: 0, padding: "8px 5px 0 5px", height: "22px" }); //这里写成单独的CSS不成功，什么原因？
	$menuDivider2 = $("#menuDevider2");
	
	$tabs.on( "tabsbeforeactivate", function( event, ui ) {
		if(ui.newTab.find("span").html()=="More") //也可以用ui.newTab.index()来验证
		{
			event.preventDefault();
			event.stopPropagation(); //阻止事件冒泡到BODY、HTML级别
			//var position = $tabs.find( ".ui-tabs-nav > li:last" ).position();
			$navMenu.css({ left: ui.newTab.offset().left + 22 - 180 }).fadeToggle(150); //原来用absolute，但是用relative，只移动横坐标更好一些。
		}
		else
		{
			indexFrame.location.href=ui.newTab.find("a").attr("url");
			switchMenuItem(ui.newTab.index());
			activeLinkId=linkIdArray[ui.newTab.index()];
			saveCookie();
		}
		//if($tabDropDownLi.offset().left<200) $("#indexHead").css("width","1475px"); //以后可能需要在这里和removeTab中增加这种处理代码
	} );
	
	//由于这个页有iframe，所以一些默认的事件触发方式出现了问题，但是多写几个hide()语句，总归是没有问题的，其它的菜单也可以这样处理，只在选择之后才去hide。于是下面这句，就没有用了
	$navMenu.on( "menuselect", function( event, ui ) { if(ui.item.children().length==1) $(this).hide(); } );

	$tabs.delegate( "span.ui-icon-circle-close", "click", function() {
	/*
		var panelId = $( this ).closest( "li" ).remove().attr( "aria-controls" );
		$( "#" + panelId ).remove();
		$tabs.tabs( "refresh" );
		var divId=$(".tabDiv").eq($tabs.tabs("option", "active")).attr("id"); //也可以用$tabs.tabs("option", "active")
		saveCookie(divId.substring(6, divId.length));
		tabCounter--;*/
		var linkId = $(this).prev().attr("href").replace("#tabDiv","");
		removeTab(linkId);
	});
	
	$tabs.delegate( "span.ui-icon-close", "mouseover", function() {
		$(this).removeClass("ui-icon-close").addClass("ui-icon-circle-close");
	}).delegate( "span.ui-icon-circle-close", "mouseout", function() {
		$(this).removeClass("ui-icon-circle-close").addClass("ui-icon-close");
	});

	$navMenu.delegate( "a.closeAllLink", "click", function() {
		if(tabCounter != TAB_FIXED_COUNT && activeLinkId>TAB_FIXED_COUNT-1){ //在没有打开任何页面的情况下，不做重新激活。这段要先执行，否则activeLinkId>TAB_FIXED_COUNT-1的判断就会无效。这个条件的作用就是在关闭所有标签时，激活首页的标签
			$tabs.tabs("option", "active", 0);
			switchMenuItem(0); //先切换圆点，再remove
			activeLinkId=0;
		}

		$tabList = $tabs.find(".ui-tabs-nav > li");
		/*$tabList.each(function(i){
			if(i>=TAB_FIXED_COUNT && i<$tabList.size()-1){
				var panelId = $(this).remove().attr( "aria-controls" );
				$( "#" + panelId ).remove();
			}
		});*/
		var panelId = $tabs.find(".ui-tabs-nav > li:gt("+(TAB_FIXED_COUNT-1)+"):not(:last)").remove().attr( "aria-controls" ); //上面的循环改用选择器来完成
		$( "#" + panelId ).remove();
		
		$tabs.tabs( "refresh" );

		tabCounter = TAB_FIXED_COUNT;

		saveCookie();
		$navMenu.find("a.menuNavLink:gt("+(TAB_FIXED_COUNT-1)+")").parent().remove();
		$menuDivider2.hide();
		for(var i=linkIdArray.length;i>0;i--)
		{
			if(i>TAB_FIXED_COUNT)
				linkIdArray.pop();
			else
				break;
		}
		$navMenu.hide();
	});

	$navMenu.delegate( "a.menuNavLink", "click", function(event) {
		//$(this).find("span.ui-icon-bullet").remove().end().parent().siblings().find("span.ui-icon-bullet").remove();
		//$(this).prepend($("<span class='ui-icon ui-icon-bullet'></span>"));
		//以上两行用新方法实现：
		event.preventDefault();
		var i = $navMenu.find("a.menuNavLink").index($(this));
		switchMenuItem(i);
		$tabs.tabs("option", "active", i);
		$navMenu.hide();
	});

	loadCookie();
	
	

});

function switchMenuItem(i)
{
	$navMenu.find("span.ui-icon-bullet").prependTo($navMenu.find("a.menuNavLink:eq("+i+")"));
}

function removeTab(linkId) {
	var panelId = $tabs.find(".ui-tabs-nav li:eq("+$.inArray(linkId, linkIdArray)+")").remove().attr( "aria-controls" );
	$("#"+panelId).remove();
	$tabs.tabs("refresh"); //先刷新，下一行才能得到激活标签的序号
	$navMenu.find("a.menuNavLink:eq("+$.inArray(linkId, linkIdArray)+")").parent().remove();
	removeFromArrayByLinkId(linkId)
	tabCounter--;
	if(tabCounter==TAB_FIXED_COUNT){
		$tabs.tabs("option", "active", 0);
		$menuDivider2.hide();
	}
	saveCookie();
}

function addTab(linkId, linkTitle, linkUrl, last) {
/*
	var tabAdded = false;
	$(".tabDiv").each(function(i){
		if($(this).attr("id")=="tabDiv" + linkId)
		{
			$tabs.tabs("option", "active", i);
			tabAdded = true;
		}
	});
	
	if(tabAdded) return false;

	//if($(".tabDiv[id='tabDiv"+linkId+"']").size()>0) return false; //顺着这个思路写下去也是可以的，但是并不会简化代码
*/
	var n = $.inArray(linkId, linkIdArray);
	if(n>-1){
		$tabs.tabs("option", "active", n);
		return false;
	}

	if(tabCounter>=TAB_MAX_COUNT)
	{
		alert("最多只能打开"+(TAB_MAX_COUNT)+"个页面，请关闭一些页面再尝试。");
		return false;
	}

	var label = linkTitle,
		id = "tabDiv" + linkId,
		li = $( tabTemplate.replace( /#\{href\}/g, "#" + id ).replace( /#\{url\}/g, linkUrl ).replace( /#\{label\}/g, label ) ),
		div = $( tabContentTemplate.replace( /#\{id}/g, id ) ),
		menuItem = $( menuItemTemplate.replace( /#\{id}/g, "menuNavLink"+linkId ).replace( /#\{label\}/g, label ) );

	//$tabDropDownLi.remove();
	//$tabs.find( ".ui-tabs-nav" ).append(li).append( $tabDropDownLi );
	$tabDropDownLi.before(li); //上面两行可以简化成这一行
	$tabs.append( div );

	$tabs.tabs( "refresh" );

	linkIdArray.push(linkId);
	tabCounter++;
	
	//为菜单增加项目
	$navMenu.append(menuItem);

	//加入新的标志位，避免首次打开页面的时候开太多页面浪费性能
	if(last){
		$tabs.tabs("option", "active", tabCounter-1); //选择最新打开的页面
		$menuDivider2.show();
		$navMenu.menu("refresh");
	}

	return true;
}

function loadCookie(){
	//读取cookie里的设置：
	var cookieActiveLinkId = $.cookie("activeLinkId");
	var tabSetup = $.cookie("tabSetup"), tabLinkArrayTemp = new Array(), n; //n用作临时记录当前所选中标签的数组下标
	
	if (tabSetup)
	{
		eval(tabSetup); //如果已有保存设置，则执行cookie中的设置，将新tab加入到页面中来

		for(var i=0;i<tabLinkArrayTemp.length;i++)
		{
			addTab(tabLinkArrayTemp[i].id, tabLinkArrayTemp[i].title, tabLinkArrayTemp[i].url, i==tabLinkArrayTemp.length-1);
			//if(activeLinkId==tabLinkArrayTemp[i].id) n=i;
		}
	}
	//if(activeLinkId>=0 && activeLinkId<TAB_FIXED_COUNT)
		//$tabs.tabs("option", "active", activeLinkId); //如果是默认呈现的几个页则自动选中
	//else
		//$tabs.tabs("option", "active", TAB_FIXED_COUNT+n); //如果不在默认呈现中，则换一种方式选中正确的标签
	if(cookieActiveLinkId)
		$tabs.tabs("option", "active", $.inArray(cookieActiveLinkId, linkIdArray));
	else
		$tabs.tabs("option", "active", 0);
}

function saveCookie() {
	tabSetup = "";
	$(".tabLink").each(function(i){
		if(i>=TAB_FIXED_COUNT)
		{
			tabSetup += "tabLinkArrayTemp.push({id:'"+linkIdArray[i]+"', title:'"+$(this).html()+"', url:'"+$(this).attr("url")+"'}); ";
		}
	});

	$.cookie( "tabSetup" , tabSetup , { path: '/', expires: 30 });
	$.cookie( "activeLinkId" , activeLinkId , { path: '/', expires: 30 }); //即时更新所选中的标签id到cookie中
}

function modHeight(){ //此函数用于动态调整iframe的高度，以适应不同的分辨率
	$("#indexFrame").css("height", $("body").innerHeight() - TOP_HEIGHT);
}

$(window).resize(function(){
	modHeight();
});