<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="dropDownList  barLeft"><s:set name="eyear" value="year"/>
<button>年</button><span class="bar"></span><s:if test="year==null || year==''"><s:set name="eyear" value=""></s:set></s:if>
<ul><li><a href="?year=&classNo=${classNo}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val=""  class="inline"  style="width:30px;"><span class="ui-icon ui-icon-bullet"></span>年</a>
<s:iterator value="yearList"  status="stat"><s:set name="index" value="#stat.index"/>
<a href="?year=<s:property value="yearList.get(#index)"/>&classNo=${classNo}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="<s:property value="yearList.get(#index)"/>"  class="inline"  style="width:30px;"><s:property value="yearList.get(#index)"/></a>
</s:iterator>
</li>
</ul><input type="hidden"  id="cyearid" value='${eyear}'/>
</div>

<div class="dropDownList barMiddle"><s:set name="eclassNo" value="classNo"/>
<button>自然班</button><span class="bar"></span><s:if test="classNo==null || classNo==''"><s:set name="eclassNo" value=""></s:set></s:if>
<ul><li><a href="?year=${year}&classNo=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val=""><span class="ui-icon ui-icon-bullet"></span>自然班</a>
</li><s:iterator value="classList"><li>
<a href="?year=${year}&classNo=${VClassid}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="${VClassid}">${VName}</a>
</s:iterator>
</li>
</ul><input type="hidden"  id="cclassNo" value='${eclassNo}'/>
</div>

    <div class="dropDownList barMiddle">
     <s:set name="exstuTypeid" value="xstuTypeid"/>
    <s:if test="xstuTypeid==null || xstuTypeid==''"><s:set name="exstuTypeid" value=""></s:set></s:if>
    <button>学员类型</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xstuTypeid=&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val=""><span class="ui-icon ui-icon-bullet"></span>学员类型</a></li>
        	<s:iterator value="dictionTypeList">
            <li><a href="?year=${year}&classNo=${classNo}&xstuTypeid=${VId}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="cxstuTypeid" value='<s:property value="#exstuTypeid" />'/>
    </div>
    <div class="dropDownList barMiddle">
     <s:set name="excompanyid" value="xcompanyid"/>
    <s:if test="xcompanyid==null || xcompanyid==''"><s:set name="excompanyid" value=""></s:set></s:if>
    <button>所属公司</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xcompanyid=&xstuTypeid=${xstuTypeid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" class="inline"  style="width: 75px;" val=""><span class="ui-icon ui-icon-bullet"></span>所属公司</a>
        <s:iterator value="dictionCompanyList"><a href="?year=${year}&classNo=${classNo}&xcompanyid=${VId}&xstuTypeid=${xstuTypeid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}"  val="${VId}" class="inline"  style="width: 75px;">${VName}</a>
        </s:iterator>
        <a href="?year=${year}&classNo=${classNo}&xcompanyid=0&xstuTypeid=${xstuTypeid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" class="inline"  style="width: 75px;" val="0">无</a>
        </li> 
        </ul><input type="hidden"  id="cxcompanyid" value='<s:property value="#excompanyid" />'/>
    </div>
    
    <div class="dropDownList barMiddle">
     <s:set name="exstatusid" value="xstatusid"/>
    <s:if test="xstatusid==null || xstatusid==''"><s:set name="exstatusid" value=""></s:set></s:if>
    <button>学生状态</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xstatusid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="" class="inline"  style="width: 75px;"><span class="ui-icon ui-icon-bullet"></span>学生状态</a>
        	<s:iterator value="dictionStatusList">
            <a href="?year=${year}&classNo=${classNo}&xstatusid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}"  val="${VId}" class="inline" style="width: 75px;">${VName}</a>
            </s:iterator><a href="?year=${year}&classNo=${classNo}&xstatusid=0&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="0" class="inline"  style="width: 75px;">无</a></li>
        </ul><input type="hidden"  id="cxstatusid" value='<s:property value="#exstatusid" />'/>
    </div>
    <div class="dropDownList barMiddle">
     <s:set name="exxjstatusid" value="xxjstatusid"/>
    <s:if test="xxjstatusid==null || xxjstatusid==''"><s:set name="exxjstatusid" value=""></s:set></s:if>
    <button>学籍状态</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xxjstatusid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="" class="inline"  style="width: 75px;"><span class="ui-icon ui-icon-bullet"></span>学籍状态</a>
        	<s:iterator value="dictionXjList">
           <a href="?year=${year}&classNo=${classNo}&xxjstatusid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}"  val="${VId}" class="inline"  style="width: 75px;">${VName}</a>
            </s:iterator><a href="?year=${year}&classNo=${classNo}&xxjstatusid=0&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="0" class="inline"  style="width: 75px;">无</a></li>
        </ul><input type="hidden"  id="cxxjstatusid" value='<s:property value="#exxjstatusid" />'/>
    </div>
    <div class="dropDownList barMiddle">
    <s:set name="exformid" value="xformid"/>
    <s:if test="xformid==null || xformid==''"><s:set name="exformid" value=""></s:set></s:if>
    <button>招生形式</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xformid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val=""><span class="ui-icon ui-icon-bullet"></span>招生形式</a></li>
        	<s:iterator value="dictionFormList">
            <li><a href="?year=${year}&classNo=${classNo}&xformid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="cxformid" value='<s:property value="#exformid" />'/>
    </div>
    <div class="dropDownList barMiddle">
    <s:set name="exfreetypeid" value="xfreetypeid"/>
     <s:if test="xfreetypeid==null || xfreetypeid==''"><s:set name="exfreetypeid" value=""></s:set></s:if>
    <button>自费/公费</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xfreetypeid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val=""><span class="ui-icon ui-icon-bullet"></span>自费/公费</a></li>
        	<s:iterator value="dictionFreeTypeList">
            <li><a href="?year=${year}&classNo=${classNo}&xfreetypeid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&isAssignid=${isAssignid}&name=${name}&itype=${itype}" val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="cxfreetypeid" value='<s:property value="#exfreetypeid" />'/>
    </div>