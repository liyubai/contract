<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8 " />
    <title>民航凯亚飞行培训合同管理系统</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/loginSheet.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/loginJScript.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/messages_zh.js"></script>
   
    <script>
    
    $.validator.setDefaults({
        submitHandler: function() {
        	userLogin();
        }
    });
    $().ready(function() {
    	 $("#checkForm").validate();  
    	 /* 为用户名文本框获取焦点 */
    	  $("#struseName").focus(function(){
    		  $("#userappend").empty();
      	     
    	  });
    	  /* 为密码文本框获取焦点 */
    	  $("#strpassword").focus(function(){
    		  $("#passwordappend").empty();
    	  });
    	 
    	});
    
    </script>
    <style>
    .error{
	     color:red;
     }
     .noticeRed{
         color:red;
     }
    </style>
</head>
<body>
    <div class="content">
        <div class="main-box">
            <div class="title">民航凯亚飞行培训合同管理系统</div>
            
             <form action="" id="checkForm" name="checkForm">
             <div class="login-box">
                <div class="userpart">
                
                    <div id="nnnnn" class ="userimg"></div>
                     <input  type="text"  class="usertext" name="struseName" id="struseName" maxlength="15" placeholder="请输入用户名" value=""   required/>
                    <span id="userappend" class = "noticeRed" ></span>
                 </div>
                <div class="passwordpart">
                    <div  class ="passwordimg"></div>
                     <input type="password"  class="passwordtext" name="strpassword" id="strpassword" placeholder="请输入密码" maxlength="15"  value=""   required/>
                      <span id="passwordappend"  class = "noticeRed"></span>
   
                 </div> 
                 <div class="buttonpart">
                       &nbsp; &nbsp; &nbsp;
                     <input type="submit" id="loginBtn" class="loginBtn" value=""/>
                     <!-- <input type="button" class="registerBtn"/> -->
                 </div>                              
            </div>
            </form>
        </div>
     </div>
     <form action="<%=request.getContextPath()%>/contract/userLogin.do" id="loginForm" name="loginForm">
       <input type="hidden" id="userName" name="userName">
       <input type="hidden" id="password" name="password">   
     </form>
     <form action="<%=request.getContextPath()%>/pages/cContractWaitDeal.do" name="toMain" id="toMain"></form>
  
<script>
    function userLogin(){
    	    $("#userappend").empty();
    	    $("#passwordappend").empty();
    		var userName = $.trim($("#struseName").val());
    		var password = $.trim($("#strpassword").val());
			$.ajax({
				type:"post",
				//async:false, 
				url:"<%=request.getContextPath()%>/contract/userLogin.do",
				data:{
					userName:userName,
					password:password
				},
				dataType:'text',
				success:function(data){
					if (data == "OK") {
			           	$("#toMain").submit();
					}else if(data == "halfOK"){
						if($.trim($("#strpassword").val()).length>0){
							$("#passwordappend").append("密码错误");	
						}
					}
					
					else {
						if($.trim($("#struseName").val()).length>0){
							$("#userappend").append("该用户不存在");
						}	
					}
				}, 
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert(errorThrown);
				}
			});	
    }
    

</script>
</body>
</html>
