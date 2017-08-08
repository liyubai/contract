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