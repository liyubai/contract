<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set name="actionNameValue" value="name"/>
<s:iterator value="leftNavigationList">
<s:if test='functionList.size()==0 || isnext==0'>
    <ul class="itemList">
    <s:if test='VParentid.indexOf(#actionNameValue)!=-1'><li class="active" style="cursor:default"><a>${VName}</a></li></s:if>
    <s:else><li><a href="${VUrl}">${VName}</a></li></s:else>
    </ul>
</s:if>
<s:else>
    <ul class="foldList">
      <li><span class="ui-icon ui-icon-carat-1-s"></span>${VName}</li>
      <ul class="itemList">
    
            <s:iterator value="functionList">
                <s:if test='isnext>0'>
                    <ul class="foldList">
                        <li id="li1"><span class="ui-icon ui-icon-carat-1-s"></span>${VName}</li>
                        <ul class="itemList">
                            <s:iterator value="functionNextList">
                                <s:if test='VParentid.indexOf(#actionNameValue)!=-1'><li class="active" style="cursor:default">&nbsp;&nbsp;<a>${VName}</a></li></s:if>
                                <s:else><li>&nbsp;&nbsp;<a href="${VUrl}">${VName}</a></li></s:else>
                            </s:iterator>
                        </ul>
                    </ul>
                </s:if>
                <s:else>
                    <s:if test='IDh==0'>
                        <s:if test='VParentid.indexOf(#actionNameValue)!=-1'><li class="active" style="cursor:default"><a>${VName}</a></li></s:if>
                        <s:else><li><a href="${VUrl}">${VName}</a></li></s:else>
                    </s:if> 
                </s:else>
            </s:iterator>
      </ul>
    </ul>
</s:else>
<span class="panelLine"></span>
</s:iterator>