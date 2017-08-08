$(function() {

    //功能13
    //隐藏select
    hideSelect = function() {
        $(".jy-sel-o").hide().parent().css({ "z-index": 0 });
        $(".seled").hide();
    },
    //显示select
	showSelect = function(obj) {
	    hideSelect();
	    obj.parent().css("z-index", 10);
	    obj.siblings(".jy-sel-o,.jy-seled").show();
	},
    //阻止默认行为
	stopEvent = function(e) {
	    var e = e || window.event;
	    if (e.preventDefault) {
	        e.preventDefault();
	        e.stopPropagation();
	    } else {
	        e.returnValue = false; //IE
	        e.cancelBubble = true; //IE
	    }
	},
    //新版首页初始化方法（绑定各种事件）
	init = function() {
	    var jydate = {
	        y: new Date().getFullYear(),
	        m: new Date().getMonth() + 1,
	        d: new Date().getDate(),
	        min: 0, //min: 18, 18是18年前，那么设置为0，就是今天之前的所有日期都可以
	        max: 99
	    };
	    function insertYear() {
	        var html = '';
	        for (var i = 11; i > 0; i--) { //修改9和2，可以调整上下限：for(var i = 9; i > 2; i--){
	            html += '<li><span class="aText">'; //padding值需要和蓝背景的a保持一致，所以这里用一个样式aText描述
	            html += i % 10; //原来：html += i;
	            html += '0\u540e\uff1a'; //'0后'
	            html += '</span>';
	            for (var j = 0; j < 10; j++) {
	                var temp = 1900 + i * 10 + j;
	                if (jydate.y - temp < jydate.min || jydate.y - temp > jydate.max) {
	                    continue;
	                }
	                html += '<a href="">';
	                html += temp;
	                html += '</a>';
	            }
	            html += '</li>';
	        }
	        return html;
	    }
	    function insertMD(arg) {
	        var html = '<li>';
	        for (var i = 1; i <= arg; i++) {
	            html += '<a href="">';
	            html += i;
	            html += '</a>';
	        }
	        html += '</li>';
	        return html;
	    }
	    //生日
	    $("#year").click(function(e) {
	        is_change_reg_default = 1; //修改注册表单
	        //$("#year-o ul").html(writeYear());
	        $("#year-o ul").html(insertYear());
	        showSelect($(this));
	        stopEvent(e);
	    });
	    $("#year-o").delegate("a", "click", function(e) {
	        var text = $(this).text();
	        $(this).parents(".jy-sel-o").siblings(".jy-sel-i").val(text);
	        hideSelect();
	        //$("#month-o ul").html(writeMonth());
	        if (jydate.y - text === jydate.min) $("#month-o ul").html(insertMD(jydate.m));
	        else $("#month-o ul").html(insertMD(12));
	        $("#month-o").show().prev(".jy-seled").show().parent().css("z-index", 10);
	        stopEvent(e);
	    });
	    $("#month").click(function(e) {
	        is_change_reg_default = 1; //修改注册表单
	        //$("#month-o ul").html(writeMonth());
	        showSelect($(this));
	        stopEvent(e);
	    });
	    $("#month-o").delegate("a", "click", function(e) {
	        var text = $(this).html();
	        $(this).parents(".jy-sel-o").siblings(".jy-sel-i").val(text);
	        hideSelect();
	        //$("#day-o ul").html(writeDay(text));
	        if (jydate.m.toString() === text && jydate.y - $("#year").val() === jydate.min) {
	            $("#day-o ul").html(insertMD(jydate.d));
	        } else if (text === "2") {
	            if ($("#year").val() % 4 === 0 && $("#year").val() % 100 !== 0) { //闰年
	                $("#day-o ul").html(insertMD(29));
	            } else if (jydate.y % 400 === 0) { //闰年
	                $("#day-o ul").html(insertMD(29));
	            } else { //平年
	                $("#day-o ul").html(insertMD(28));
	            }
	        } else if (text === "1" || text === "3" || text === "5" || text === "7" || text === "8" || text === "10" || text === "12") {
	            $("#day-o ul").html(insertMD(31));
	        } else if (text === "4" || text === "6" || text === "9" || text === "11") {
	            $("#day-o ul").html(insertMD(30));
	        }
	        $("#day-o").show().prev(".jy-seled").show().parent().css("z-index", 10);
	        stopEvent(e);
	    });
	    $("#day").click(function(e) {
	        is_change_reg_default = 1; //修改注册表单
	        //$("#day-o ul").html(writeDay($('#month').val()));
	        showSelect($(this));
	        stopEvent(e);
	    });
	    $("#day-o").delegate("a", "click", function(e) {
	        var text = $(this).text();
	        $(this).parents(".jy-sel-o").siblings(".jy-sel-i").val(text);
	        hideSelect();
	        stopEvent(e);
	    });
	    /*弹层绑定 开始*/
	    //生日
	    $("#year-p").click(function(e) {
	        is_change_reg_default = 1; //修改注册表单
	        //$("#year-p-o ul").html(writeYear());
	        $("#year-p-o ul").html(insertYear());
	        showSelect($(this));
	        stopEvent(e);
	    });
	    $("#year-p-o").delegate("a", "click", function(e) {
	        var text = $(this).text();
	        $(this).parents(".jy-sel-o").siblings(".jy-sel-i").val(text);
	        hideSelect();
	        //$("#month-p-o ul").html(writeMonth());
	        if (jydate.y - text === jydate.min) {
	            $("#month-p-o ul").html(insertMD(jydate.m));
	        } else {
	            $("#month-p-o ul").html(insertMD(12));
	        }
	        $("#month-p-o").show().prev(".jy-seled").show().parent().css("z-index", 10);
	        stopEvent(e);
	    });
	    $("#month-p").click(function(e) {
	        is_change_reg_default = 1; //修改注册表单
	        //$("#month-p-o ul").html(writeMonth());
	        showSelect($(this));
	        stopEvent(e);
	    });
	    $("#month-p-o").delegate("a", "click", function(e) {
	        var text = $(this).text();
	        $(this).parents(".jy-sel-o").siblings(".jy-sel-i").val(text);
	        hideSelect();
	        //$("#day-p-o ul").html(writeDay(text));
	        if (jydate.m.toString() === text && jydate.y - $("#year-p").val() === jydate.min) {
	            $("#day-o ul").html(insertMD(jydate.d));
	        } else if (text === "2") {
	            if ($("#year-p").val() % 4 === 0 && $("#year-p").val() % 100 !== 0) { //闰年
	                $("#day-p-o ul").html(insertMD(29));
	            } else if (jydate.y % 400 === 0) { //闰年
	                $("#day-p-o ul").html(insertMD(29));
	            } else { //平年
	                $("#day-p-o ul").html(insertMD(28));
	            }
	        } else if (text === "1" || text === "3" || text === "5" || text === "7" || text === "8" || text === "10" || text === "12") {
	            $("#day-p-o ul").html(insertMD(31));
	        } else if (text === "4" || text === "6" || text === "9" || text === "11") {
	            $("#day-p-o ul").html(insertMD(30));
	        }
	        $("#day-p-o").show().prev(".jy-seled").show().parent().css("z-index", 10);
	        stopEvent(e);
	    });
	    $("#day-p").click(function(e) {
	        is_change_reg_default = 1; //修改注册表单
	        //$("#day-p-o ul").html(writeDay($('#month').val()));
	        showSelect($(this));
	        stopEvent(e);
	    });
	    $("#day-p-o").delegate("a", "click", function(e) {
	        var text = $(this).text();
	        $(this).parents(".jy-sel-o").siblings(".jy-sel-i").val(text);
	        hideSelect();
	        stopEvent(e);
	    });
	    /*弹层绑定 结束*/
	};
    init();

    $("html,body").click(function(e) {
        hideSelect();
    });
});
