/*  
 * src: common.js 
 *
 * 简单表单验证脚本
 *author    : ZhaoChunHui
 *created on: 12/09/2008 17:09
 *version   : 0.2
 *file required:
 *--------------------------------------------------------------------------*/
  /**
  *     @desc: 根据参数名称将URL(self.location.search)上该参数去掉
  *     @type: public
  *     @param: str  - url参数字符串
  *     @param: agrs - 需要去掉的参数名称  
  *     @topic: 0
  *		@return true or false
  */  
  function removeURLArgument(str,args){
	  var argsArray=str.substring(1).split("&");
	  var result="?";
	  for(var i=0;i<argsArray.length;i++){
		  if(i==argsArray.length-1){
			  if(argsArray[i].indexOf(args)<0)
				  result+=argsArray[i];
		  }else{
			  if(argsArray[i].indexOf(args)<0)
				  result+=argsArray[i]+"&";		
		  }
	  }
	  return result;
  }
  /**
  *     @desc: 根据iframe的名称调整窗口大小
  *     @type: public
  *     @param: str  - iframe的名称
  *     @topic: 0
  *		@return true or false
  */    
 function resize(iframeName){
    try{
        if(window.top != this){
            PIframe=window.parent.document.getElementById(iframeName);
           // if (PIframe.offsetHeight<this.document.body.scrollHeight){
                PIframe.style.height  = this.document.body.scrollHeight;
           // }
        }
        return true;
    }catch(e){
        return false;
    }
 }  
  /**
  *     @desc: 跳转至登录页面
  *     @type: public
  *     @param: str  - iframe的名称
  *     @topic: 0
  *		@return true or false
  */  
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
}

/**
      *     @desc:  弹出层
      *     @type: private
      *     @topic: 0
      */	
	function showDiv(id){
		timer=new Object();
		obj=document.getElementById(id);
		show();
	}
	function show(){
		obj.style.visibility="visible";
		obj.style.width=document.body.clientWidth;
		var h=null;
		if(window.parent.document.getElementById("mainFrame")==null)
			h=document.body.clientHeight;
		else
			h=window.parent.document.getElementById("mainFrame").scrollHeight;
		obj.style.height=h;
		if(obj.filters.alpha.opacity>90){
			obj.filters.alpha.opacity=90;
			clearTimeout(timer.timer1);
			return;
		}else{
			obj.filters.alpha.opacity+=10;
			timer.timer1=setTimeout("show()",2)
		}
		return;
	}	
	/**
      *     @desc:  隐藏查询层
      *     @type: private
      *     @topic: 0
      */	
	function hideDiv(id){
		 timer=new Object();
		 obj=document.getElementById(id);
		 hide();
	}	
	function hide(){
		if(obj.filters.alpha.opacity<=0){
			obj.filters.alpha.opacity=0;
			obj.style.visibility="hidden"
			clearTimeout(timer.timer2);
			return;
		}else{
			obj.filters.alpha.opacity-=10;
			timer.timer2=setTimeout("hide()",2);
		}
		return;
	}
	
	//取得url中的参数值
function getUrlArgs(param){
    var rs="";
    var urlSearch=self.location.search;
    var params=urlSearch.substring(1).split("&");
    for(var i=0;i<params.length;i++){
        if(params[i].indexOf(param)>-1){
            rs=params[i].substring(params[i].indexOf("=")+1);
            rs=decodeURI(rs);
            break;
        }
    }
    return rs;
}

function clearNoNum(event,obj){ 
	//响应鼠标事件，允许左右方向键移动 
	event = window.event||event; 
	if(event.keyCode == 37 | event.keyCode == 39){ 
		return; 
	} 
	//先把非数字的都替换掉，除了数字和. 
	obj.value = obj.value.replace(/[^\d.]/g,""); 
	//必须保证第一个为数字而不是. 
	obj.value = obj.value.replace(/^\./g,""); 
	//保证只有出现一个.而没有多个. 
	obj.value = obj.value.replace(/\.{2,}/g,"."); 
	//保证.只出现一次，而不能出现两次以上 
	obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
} 
function checkNum(obj){ 
	//为了去除最后一个. 
	if(obj.value==""){
		obj.value = "0";
	}else{
		obj.value = obj.value.replace(/\.$/g,""); 
	}
} 

function clearValue(obj){
	if(obj.value=="0")
		obj.value = "";
}

function checkisNum(str){
	return str.match(/\D/)==null 
}

function isChinaIDCard(StrNo){   
  StrNo = StrNo.toString();
  if(StrNo.length == 15){        
   if(!isValidDate("19"+StrNo.substr(6,2),StrNo.substr(8,2),StrNo.substr(10,2))){return false;}      
  }else if(StrNo.length == 18){     
   if (!isValidDate(StrNo.substr(6,4),StrNo.substr(10,2),StrNo.substr(12,2))){return false;}  
   }else{   
   alert("输入的身份证号码必须为15位或者18位！");   
   return false;
   }
  
  if (StrNo.length==18)   
  {   
var a,b,c   
if (!isNumber(StrNo.substr(0,17))){alert("身份证号码错误,前17位不能含有英文字母！");return false;}   
a=parseInt(StrNo.substr(0,1))*7+parseInt(StrNo.substr(1,1))*9+parseInt(StrNo.substr(2,1))*10;   
a=a+parseInt(StrNo.substr(3,1))*5+parseInt(StrNo.substr(4,1))*8+parseInt(StrNo.substr(5,1))*4;   
a=a+parseInt(StrNo.substr(6,1))*2+parseInt(StrNo.substr(7,1))*1+parseInt(StrNo.substr(8,1))*6;     
a=a+parseInt(StrNo.substr(9,1))*3+parseInt(StrNo.substr(10,1))*7+parseInt(StrNo.substr(11,1))*9;     
a=a+parseInt(StrNo.substr(12,1))*10+parseInt(StrNo.substr(13,1))*5+parseInt(StrNo.substr(14,1))*8;     
a=a+parseInt(StrNo.substr(15,1))*4+parseInt(StrNo.substr(16,1))*2;   
b=a%11;   
if (b==2)   //最后一位为校验位   
{   
  c=StrNo.substr(17,1).toUpperCase();   //转为大写X   
}   
else   
{   
  c=parseInt(StrNo.substr(17,1));   
}   
switch(b)   
{     
  case 0: if ( c!=1 ) {alert("身份证号码错误");return false;}break;//校验位错:最后一位应该为:1   
  case 1: if ( c!=0 ) {alert("身份证号码错误");return false;}break;   
  case 2: if ( c!="X") {alert("身份证号码错误");return false;}break;   
  case 3: if ( c!=9 ) {alert("身份证号码错误");return false;}break;   
  case 4: if ( c!=8 ) {alert("身份证号码错误");return false;}break;   
  case 5: if ( c!=7 ) {alert("身份证号码错误");return false;}break;   
  case 6: if ( c!=6 ) {alert("身份证号码错误");return false;}break;   
  case 7: if ( c!=5 ) {alert("身份证号码错误");return false;}break;   
  case 8: if ( c!=4 ) {alert("身份证号码错误");return false;}break;   
  case 9: if ( c!=3 ) {alert("身份证号码错误");return false;}break;   
  case 10: if ( c!=2 ){alert("身份证号码错误");return false;}   
}   
  } else {//15位身份证号   
if (!isNumber(StrNo)) {alert("身份证号码错误,前15位不能含有英文字母！");return false;}     
  }  
  
  return true;

}   
    
  function isValidDate(iY, iM, iD) {
   if (iY>2200 || iY<1900 || !isNumber(iY)){
            alert("输入身份证号,年度"+iY+"非法！");
            return false;
        }
   if (iM>12 || iM<=0 || !isNumber(iM)){
            alert("输入身份证号,月份"+iM+"非法！");
            return false;
        }
   if (iD>31 || iD<=0 || !isNumber(iD)){
            alert("输入身份证号,日期"+iD+"非法！");
            return false;
        }
  return true;
  }  