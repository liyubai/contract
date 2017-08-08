(function($) {
    $.treeView = function(i, nodeArray, valueArray, inputName, isRadio) {
        var _this = this;
        this.div = $(".treeView").eq(i);
        if (nodeArray && valueArray && inputName) {
            if (!isRadio) $(this.genCheckboxTree(nodeArray, valueArray, inputName, this.div, 0)).appendTo(this.div);
            else $(this.genRadioTree(nodeArray, valueArray, inputName, this.div, 0)).appendTo(this.div);
        }
        //alert(this.div.html());
        this.folderNodes = this.div.find("li.folderNode");
        this.nodes = this.div.find("li.treeNode");
        this.root = this.div.find("li.rootNode");
        this.folders = this.div.find("li.folderNode ~ ul");

        /*this.div.delegate(this.folderNodes, "click", function(e) {
            
        $(e.target).parent().children(".ui-icon").toggleClass("ui-icon-circlesmall-plus").toggleClass("ui-icon-circlesmall-minus");
        var $ul = $(e.target).parent().next("ul");
        $ul.toggle();
        $ul.children("li").toggle($ul.is(":visible"));
        });*/

        this.folderNodes.click(function() {
            $(this).children(".ui-icon").toggleClass("ui-icon-circlesmall-plus").toggleClass("ui-icon-circlesmall-minus");
            var $ul = $(this).next("ul");
            $ul.toggle();
            $ul.children("li").toggle($ul.is(":visible"));
        });

        this.div.find("input[type='checkbox']").click(function(e) {
            e.stopPropagation();
            var checked = this.checked;
            $(this).parent().next("ul").find("input[type='checkbox']").each(function() {
                this.checked = checked;
                $(this).change();
            });
            $(this).change(); //ie中，需要这条语句才能触发事件
            //下面这两个函数调用不要放在change事件中，否则被调用次数会过多：
            if (this.checked) _this.redoCheckAll($(this));
            else _this.cancelCheckAll($(this));
        }).change(function() {
            //这段代码用于勾选全选钮时执行，不可以放在click事件中：
            if (this.checked) {
                $(this).parent().show().parent().show();
                $(this).prev(".ui-icon").removeClass("ui-icon-circlesmall-plus").addClass("ui-icon-circlesmall-minus");
            }
        });

        this.div.find("input[type='radio']").click(function(e) {
            e.stopPropagation();
        });

        var $span = this.div.find("span");

        $span.click(function(e) { //不用label了，label也得指定id，很麻烦
            if ($(this).parent().hasClass("treeNode")) {
                $(this).prev().click();
                e.stopPropagation();
            }
            else if ($(this).prev().is("input[type='radio']")) {
                //只能绑定一个事件。如果点击文字也只让勾选复选框，则应该取消事件冒泡：
                $(this).prev().click();
                e.stopPropagation();
            }
        });

        /*write by lishuang*/
        var $val = this.div.find(".ddlJF");
        $val.blur(function(e) {
            var check = $(this).prev().prev().hasClass('boxChecked');
            if ($(this).val() != '' && !check) {
                $(this).prev().click();
                e.stopPropagation();
            }
            if ($(this).val() == '' && check) {
                $(this).prev().click();
                e.stopPropagation();
            }
        })
        //if(!$.support.leadingWhitespace) $span.css({ float: "left", margin: ".5em 0 0 0" }).prev().; //为ie6~8单独设置一下样式

        this.foldAll();
    };
    $.extend($.treeView.prototype, {
        div: null,
        folderNodes: null,
        folders: null,
        nodes: null,
        foldAll: function() {
            //this.folderNodes.hide();
            //this.nodes.hide();
            //this.folders.hide();
            //this.folderNodes.children(".ui-icon").removeClass("ui-icon-circlesmall-minus").addClass("ui-icon-circlesmall-plus");
            //this.root.fadeIn(150);
        	this.folderNodes.children(".ui-icon").removeClass("ui-icon-circlesmall-plus").addClass("ui-icon-circlesmall-minus");
        },
        expandAll: function() {

        },
        redoCheckAll: function($childCheckbox) {
            var $newCheckbox = $childCheckbox.parent().parent().prev(".folderNode").children("input[type='checkbox']");
            if ($childCheckbox.parent().siblings().find("input[type='checkbox']").filter(":not(:checked)").size() == 0 && $newCheckbox.size() != 0 && !$newCheckbox[0].checked) {
                $newCheckbox.trigger("click");
                //this.redoCheckAll($newCheckbox); //因为使用了.trigger("click");，不需要递归了
            }
        },
        cancelCheckAll: function($childCheckbox) {
            //alert($childCheckbox.parent().parent().prev(".folderNode")[0].outerHTML);
            var $newCheckbox = $childCheckbox.parent().parent().prev(".folderNode").children("input[type='checkbox']");
            if ($newCheckbox.size() > 0) {
                $newCheckbox[0].checked = false;
                $newCheckbox.change(); //这里不能用click，要用change来触发事件，如果不用change，而是用click的话，则会导致死循环
                this.cancelCheckAll($newCheckbox); //递归执行直到冒泡到最父层元素为止，这个如果像上面那么改，反而报错，不太理解啊
            }
        },
        genCheckboxTree: function(nodeArray, valueArray, inputName, div, n) {
            var html = "";
            for (var i = 0; i < nodeArray.length; i++) {
                if ($.isArray(nodeArray[i])) {
                    html += this.genCheckboxTree(nodeArray[i], valueArray[i], inputName, div, n + 1);
                }
                else {
                    if (n == 0) {
                        html += '<li class="folderNode rootNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="checkbox" name="' + inputName + '" value="' + valueArray[i] + '"><b></b><span>' + nodeArray[i] + '</span></li>';
                    }
                    else if (nodeArray[i + 1] && $.isArray(nodeArray[i + 1])) {
                        html += '<li class="folderNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="checkbox" name="' + inputName + '" value="' + valueArray[i] + '"><b></b><span>' + nodeArray[i] + '</span></li>';
                    }
                    else {
                        html += '<li class="treeNode"><input type="checkbox" name="' + inputName + '" value="' + valueArray[i] + '"><b></b><span>' + nodeArray[i] + '</span></li>';
                    };
                }
            }
            html = "<ul>" + html + "</ul>"
            return html;
        },
        genRadioTree: function(nodeArray, valueArray, inputName, div, n) {
            var html = "";
            for (var i = 0; i < nodeArray.length; i++) {
                if ($.isArray(nodeArray[i])) {
                    html += this.genRadioTree(nodeArray[i], valueArray[i], inputName, div, n + 1);
                }
                else {
                    if (n == 0) {
                        html += '<li class="folderNode rootNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="radio" name="' + inputName + '" value="' + valueArray[i] + '"><b></b><span>' + nodeArray[i] + '</span></li>';
                    }
                    else if (nodeArray[i + 1] && $.isArray(nodeArray[i + 1])) {
                        html += '<li class="folderNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><input type="radio" name="' + inputName + '" value="' + valueArray[i] + '"><b></b><span>' + nodeArray[i] + '</span></li>';
                    }
                    else {
                        html += '<li class="treeNode"><input type="radio" name="' + inputName + '" value="' + valueArray[i] + '"><b></b><span>' + nodeArray[i] + '</span></li>';
                    };
                }
            }
            html = "<ul>" + html + "</ul>"
            return html;
        }
    });
})(jQuery);