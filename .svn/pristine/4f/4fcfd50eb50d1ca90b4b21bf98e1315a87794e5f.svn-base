<%@page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8 " />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>中国民航大学飞行训练电子记录系统</title>
<link rel="stylesheet" href="pages/login/themes/cupertino/jquery.ui.all.css">
<script src="pages/login/scripts/jquery.min.js"></script>
<script src="pages/login/scripts/jquery-ui.min.js"></script>
<script src="pages/login/scripts/ui/jquery.ui.position.min.js"></script>
<script src="pages/login/scripts/ui/jquery.ui.core.min.js"></script>
<script src="pages/login/scripts/ui/jquery.ui.widget.min.js"></script>
<script src="pages/login/scripts/ui/jquery.ui.button.min.js"></script>
<script src="pages/login/scripts/ui/jquery.ui.tabs.min.js"></script>
<script src="pages/login/scripts/ui/jquery.ui.dialog.min.js"></script>
<script src="pages/login/scripts/ui/jquery.ui.menu.min.js"></script>
<script src="pages/login/scripts/function.min.js"></script>
<style>
.testDiv { padding: 5px; }
#loginWrapper { position: relative; } /*不要在td上面加"position: relative;"这个样式，火狐里不支持*/
#loginDiv { width: 295px; height: 305px; font-weight: normal; outline: none; -o-box-shadow: 1px 1px 3px #888; -icab-box-shadow: 1px 1px 3px #888; -khtml-box-shadow: 1px 1px 3px #888; -moz-box-shadow: 1px 1px 3px #888; -webkit-box-shadow: 1px 1px 3px #888; box-shadow: 0px 0px 10px #CFCFCF; }

.loginFormInput,.btn,.ico,.ico-uid,.ico-pwd{background-image:url(pages/login/themes/cupertino/images/ui-bg_new_login.png)}
.loginInput{position:absolute;width:205px;padding:9px 0 10px;ime-mode:disabled;height:21px;top:1px;left:28px;font-size:14px;font-weight:700;border:none;font-family:verdana;line-height:21px;color:#92a4bf;background:transparent!important;}
.ico-uid{width:14px;height:16px;background-position: -154px -12px}
.ico-pwd{width:14px;height:16px;background-position: -178px -12px}
.login{padding:14px 16px 15px;margin-left:90px;text-align:left;position:absolute;z-index:2;}
.loginTitle{width:260px;height:47px;overflow:hidden;clear:both;position:relative;line-height:46px;float:left;font-size:14px;text-align:center;+line-height:48px;color:#626262;}
.loginForm{position:relative;height:380px;padding-top:30px;}
.loginFormInput{position:relative;width:240px;height:42px;line-height:42px;margin:0 0 18px 25px;padding-right:5px;clear:both;border-radius:4px;background-position:0 -300px;z-index:2}
.loginFormInput .ico{position:absolute;left:9px;top:13px;z-index:1;}
.loginFormInput-over{}
.loginFormInput-focus{box-shadow:0 0 5px rgba(2,145,252,.5);}
.loginFormInput-focus .placeholder{color:#C9C9C9;}
.loginFormButton{position:relative;width:245px;height:43px;margin:16px 0 0 25px}
.loginInput{width:205px;padding:9px 0 10px;ime-mode:disabled;height:21px;top:1px;left:28px;font-size:14px;font-weight:700;border:none;font-family:verdana;line-height:21px;color:#92a4bf;background:transparent!important;}
.loginInput:focus{outline:0;}
.loginInput-focus{color:#333;font-weight:700;}
.showPlaceholder .placeholder{visibility:visible;cursor:text;}
.placeholder{color:#C9C9C9;;font-size:14px;position:absolute;left:30px;top:14px;line-height:14px;visibility:hidden;background:none;}
.domain{width:80px;height:33px;background-position:0 -60px;line-height:999em;overflow:hidden;display:block;right:8px;top:4px;}
.loginFormCheck{height:13px;line-height:13px;color:#555;margin-left:25px;clear:both;width:245px;position:relative;z-index:1;}
.loginFormCheckInner{height:14px;width:150px;float:left;position: relative;}
.forgetPwdLine{text-align: right}
.ico-checkbox{display: inline-block; width: 13px; height: 13px; background-position: -40px -108px; vertical-align: middle; cursor: pointer;}
.autoLogin-checked .ico-checkbox{background-position: -40px -128px;}
.loginFormCheckbox{width:13px;height:13px;padding:0;overflow:hidden;margin:0; vertical-align: middle;}
.btn{width:110px;height:38px;float:left;text-align:center;cursor:pointer;border:0;padding:0;font-weight:700;font-size:14px;display:inline-block;vertical-align:baseline;line-height:38px;outline:0;background-color:transparent;border-radius:3px;}
.btn-login{background-position:0 -156px;color:#fff;box-shadow:0 2px 5px rgba(0,28,88,.3)}
.btn-login:hover{background-position:0 -204px;}
.btn-login:active{background-position:0 -252px;color:#b5d1ee;}
.btn-reg{background-position:-117px -156px;color:#6d798c;float:right;box-shadow:0 2px 5px rgba(0,0,0,.1);}
.loginFormButton .btn-reg:hover{background-position:-117px -204px;color:#347bc7;}
.loginFormButton .btn-reg:active{background-position:-117px -252px;color:#6d798c;}
.loginFormConf{height:12px;line-height:14px;margin-left:25px;margin-top:12px;clear:both;width:245px;position:relative;color:#848585;z-index:1;}
.loginFormConfTip{float:left;width:100%;}

#login{height: 215px;}
#idInputTest{visibility: hidden; float: left; font-size: 14px; font-weight: 700;}
#capsLockHint{position: absolute; top: 42px; left: 0px;padding: 4px 8px; line-height: 12px; background-color: #ffffcc; border: 1px solid #d7d7d7; color: #555; z-index: 2;}
#autoLogin{display: none;}
#autoLoginTxt, .forgetPwd{color:#848585;}
#autoLoginTxt:hover, .forgetPwd:hover{color:#626262;}
#autologinTip{z-index:9; width:180px; height:36px;background-color:#fffde4; border:1px #dfb86d solid; left:0px;top:16px;text-align:left; padding:5px 10px;line-height:18px; color:#dc9632;display:none;border-radius: 4px}

.error-hd,
.error-mid,
.error-ft,
.error-arrow,
.error-tt p{background-image: url("pages/login/themes/cupertino/images/ui-bg_new_login_error.png"); _background-image: url("pages/login/themes/cupertino/images/ui-bg_new_login_error.png");}
#errorAlert{position: absolute; width: 347px; top: 0; left: -300px; text-align: left; z-index: 1000; display: none;}
#errorAlert.errorAlert-show{display: block; -webkit-animation: shake 0.6s ease-in-out 0.3s; -moz-animation: shake 0.6s ease-in-out 0.3s; -o-animation: shake 0.6s ease-in-out 0.3s; animation: shake 0.6s ease-in-out 0.3s;}
#errorAlert .error-hd,
#errorAlert .error-ft{overflow: hidden; font-size: 0; line-height: 0;}
#errorAlert .error-hd{height: 8px; background-position: -10px 0; background-repeat: no-repeat;}
#errorAlert .error-ft{height: 10px; background-position: -10px -8px; background-repeat: no-repeat;}
#errorAlert .error-mid{padding: 5px 20px 7px; background-position: -357px 0; background-repeat: repeat-y;}
#errorAlert .error-arrow{position: absolute; top: 35px; right: -6px; width: 10px; height: 19px; background-position: 0 0; background-repeat: no-repeat;}
#errorAlert .error-tt p{padding: 10px 20px 8px 60px; color: #434343; line-height: 22px; font-weight: bold; font-size: 14px; background-position: -704px center; background-repeat: no-repeat;}
#errorAlert .error-detail{margin-top:2px; padding: 8px 18px 5px 18px; color: #7d7d7d; line-height: 18px; border-top: 1px solid #e1e1e1;}
#errorAlert .error-detail a{color: #4e90e2; text-decoration: underline;}
.yanzheng { border: solid 1px #BFCBD7;width:60px;}
/*
@-webkit-keyframes shake{0%{margin-left: -265px;}25%{margin-left: -262px;}50%{margin-left: -265px;}75%{margin-left: -262px;}100%{margin-left: -265px;}}
@-moz-keyframes shake{0%{margin-left: -265px;}25%{margin-left: -262px;}50%{margin-left: -265px;}75%{margin-left: -262px;}100%{margin-left: -265px;}}
@-o-keyframes shake{0%{margin-left: -265px;}25%{margin-left: -262px;}50%{margin-left: -265px;}75%{margin-left: -262px;}100%{margin-left: -265px;}}
@keyframes shake{0%{margin-left: -265px;}25%{margin-left: -262px;}50%{margin-left: -265px;}75%{margin-left: -262px;}100%{margin-left: -265px;}}
*/
</style>


<script>
$(function() {

	addShadow($("#loginDiv"), {top: -4, left: -5, width: "290px", height: "300px"});
	
	$(".loginInput").change(function(){
		if($.trim(this.value)!="")
			$(this).addClass("loginInput-focus").parent().removeClass("showPlaceholder");
		else
			$(this).removeClass("loginInput-focus").parent().addClass("showPlaceholder");
	}).keydown(function(){
		if($.trim(this.value)=="")
			$(this).val("").addClass("loginInput-focus").parent().removeClass("showPlaceholder");
	}).keyup(function(){
		if($.trim(this.value)=="")
			$(this).val("").removeClass("loginInput-focus").parent().addClass("showPlaceholder");
	});
	
	
	$("#loginBtn").click(function(e){
		e.stopPropagation();
		checkForm();		
	});
	
	$("html,body").click(function(e) {
		$("#errorAlert").removeClass("errorAlert-show");
		$("#overlayMask").hide();
		top.$("#overlayMask").hide();
	});

	$(window).unload( function () { top.$("#overlayMask").hide(); } );

});

function checkForm(){
	var $idInput = $("#idInput"), $pwdInput = $("#pwdInput"), $verifyCode = $("#verifyCode");
	if($.trim($idInput.val()).length==0){
		showError($idInput, "用户名不能为空！");
		return;
	}
	if($.trim($pwdInput.val()).length==0){
		showError($pwdInput, "密码不能为空！");
		return;
	}
	if($.trim($verifyCode.val()).length==0){
		showError($verifyCode, "验证码不能为空！");
		return;
	}
	$("#errorAlert").removeClass("errorAlert-show");
	$("#overlayMask").hide();
	top.$("#overlayMask").hide();
	if($.trim($idInput.val()) == "htgl"){
		$("#redirectTo").val("/pages/main/cMain.jsp");
	}
	$("#login").submit();
}
function setValue(){
	$("#idInput").val("");
	$("#pwdInput").val("");
	$(".loginInput").change();
}
function showError($nErrorTarget,nErrorText){
	var nErrorBaseTop = 115;
	var $errorAlert = $("#errorAlert"), $errorArr = $("#errorArr");
	$nErrorTarget.focus();
	if($nErrorTarget.attr("id") == "idInput"){
		nErrorBaseTop -= 30;
	}else if($nErrorTarget.attr("id") == "pwdInput"){
		nErrorBaseTop += 30;
	}else{
		nErrorBaseTop += 80;
	}
	$("#errorTitle").html(nErrorText);
	$("#overlayMask").show();
	top.$("#overlayMask").show();
	
	$errorAlert.addClass("errorAlert-show").css("top", nErrorBaseTop - $errorAlert[0].offsetHeight/2 + "px");
	$errorArr.css("top", ($errorAlert[0].offsetHeight - $errorArr[0].offsetHeight)/2 + "px");
	$errorAlert.effect( "shake", {distance: 3, times: 2}, 500 );
}

	/*
	 function redirectLoginPage(){
	 try{
	 if(window.top != this){
	 var args = decodeURIComponent(this.location.search);
	 var arg = "";
	 if (args.indexOf("redirectTo=/system")!=-1) arg = "redirectTo=/system/index.do";
	 else
	 arg = "redirectTo=/index.do";
	 var loginPage = this.location.protocol + '//' + this.location.host + this.location.pathname;
	 if (args!="") loginPage=loginPage+"?"+arg;
	 window.top.location.href = loginPage;
	 }
	 }catch(e){
	 return false;
	 }
	 }*/
</script>

<script src="pages/login/scripts/base.min.js"></script>
</head>
<body  class="hide">
<div>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="image/top0.jpg" height="147" ></td>
  </tr>
  <tr>
    <td height="532" background="image/top.jpg" >
    <table width="100%" height="100%" border="0">
  <tr>
    <td width="500"></td>
    <td height="30">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" valign="top">&nbsp;</td>
    <td valign="top">
	<div id="loginWrapper">
		<div id="errorAlert">
			<div class="error-hd"></div>
			<div class="error-mid">
				<div class="error-tt">
					<p id="errorTitle"></p>
				</div>
				<div id="errorDetail" class="error-detail" style="display:none;">
					<p>提示：</p>
					<p id="errorInfo" class="error-info"></p>
				</div>
			</div>
			<div class="error-ft"></div>
			<div id="errorArr" class="error-arrow"></div>
		</div>
       
		<div id="loginDiv" class="login tab-1 ui-state-default ui-corner-all-4">
			<div class="loginTitle loginTitleNormal"><div class="loginFormCheck" align="center"><br><input name="loginType"  class="loginFormCheckbox"  type="radio" checked="checked" value="0"><b></b>用户名密码登录&nbsp;&nbsp;&nbsp;&nbsp;<input name="loginType"  class="loginFormCheckbox"  type="radio" value="1" onClick="goToSign()"><b></b>数字证书登录</div></div>
			<div class="loginForm">
				 <form id="login" name="login" method="post" action="systemUserLogin.do">
					<div id="idInputLine" class="loginFormInput showPlaceholder"> <b class="ico ico-uid"></b>
						<input class="loginInput" title="请输入帐号" id="idInput" name="loginID" type="text" maxlength="50" value="" />
							<div id="mobtips"></div>
						<label for="idInput" class="placeholder" id="idPlaceholder">请输入帐号</label>
						<div id="idInputTest"></div>
						</div>
						<div id="pwdInputLine" class="loginFormInput showPlaceholder"> <b class="ico ico-pwd"></b>
						<input class="loginInput" title="请输入密码" id="pwdInput" name="password" type="password" onkeypress="javascript:if(event.keyCode==13){checkForm();}" />
						<label for="pwdInput" class="placeholder" id="pwdPlaceholder">请输入密码</label>
						<p id="capsLockHint" style="display: none">大写状态开启</p>
						</div>
                        
						<div class="loginFormCheck" align="center">
                        验证码：<input name="verifyCode" id="verifyCode" type="text" class="yanzheng" onKeyPress="javascript:if(event.keyCode==13){checkForm();}">&nbsp;<img src="GenerateCheckCode" style="vertical-align: middle;"/>
						<div id="autoLoginLine" class="loginFormCheckInner" >
						</div>
						<div class="forgetPwdLine"></div>
						</div>
						<div class="loginFormButton">
						<button id="loginBtn" class="btn btn-login" type="button">登&nbsp;&nbsp;录</button>
						<a id="lfBtnReg" class="btn btn-reg" href="javascript:void(0)" onclick="setValue()">清&nbsp;&nbsp;空</a></div>
						<div class="loginFormConf">
						<div class="loginFormConfTip">
                        <s:if test="errorMessage!=null and errorMessage!=''"><s:property value="errorMessage"/></s:if>
          				</div>
					</div><s:hidden name="redirectTo" value="%{redirectTo}"/>
				</form>
			</div>
            
		</div>
	</div>
    </td>
  </tr>
</table>
</td>
</tr>
</table>
</div>
<div id="overlayMask" style="display:none;"></div>
</body>
</html>
<script>
function goToSign(){
	window.location.replace("open_signLogin.do");
}
</script>