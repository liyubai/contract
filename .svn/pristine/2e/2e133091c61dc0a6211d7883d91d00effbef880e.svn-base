<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>


  <table class="panelTable" border="0" cellspacing="0" cellpadding="3">
            <thead>
	          <tr class="trSpliter">
	            <th></th>
				<th width="240"></th>
				<th width="240"></th>
				<th width="240"></th>
				
			  </tr>
			  <tr>
				<th class="thSortableGray">DictionaryName</th>
				<th class="thSortableGray">Level</th>
				<th class="thSortableGray">ParentId</th>


			  </tr>
			</thead>
			<tbody>
			 <s:iterator value="dicList">
			   <tr>
			 
			     <td id="studentName_${DictionaryId}">${DictionaryName}</td>
				<td id="idCard_${DictionaryId}">${Level}</td>
				<td id="no_${DictionaryId}">${ParentId}</td>
				
				</tr>
			</s:iterator>
			 <!-- <tr>
			    <td><input name="checkboxName" type="checkbox" value=""><b></b></td>
				<td>某某某</td>
				<td>2105xxxxxxxxxx</td>
				<td>001</td>
				<td>山东航空</td>
				<td>2012</td>
				<td>CAUC2012-G01</td>
				<td>已停飞</td>
				<td><a href="#" class="blue setStop">修改</a></td>
			  </tr> -->
			  
			</tbody>
        </table>


${pageStr}
</div>


</body>
</html>