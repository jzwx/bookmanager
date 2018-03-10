<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'readeradd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    读者添加<br>
    <s:form action="reader!add" method="post" enctype="multipart/form-data">
    	<s:textfield name="reader.name" label="读者姓名" ></s:textfield>
    	<s:radio list="#{'男':'男','女':'女'}" name="reader.sex" label="性别" value="'男'"></s:radio>
    	<s:textfield name="reader.phone" label="电话" ></s:textfield>
    	<s:textfield name="reader.department" label="所属系别"></s:textfield>
    	<s:select list="#request.lstlist" listValue="name" listKey="id" label="读者类型" name="reader.readercategory.id"></s:select>
    	<s:textarea name="reader.remark" label="备注"></s:textarea>
    	<s:file name="photopath" label="请选择图片" onchange="document.getElementById('images').src=this.value"></s:file>
    	<s:submit value="确认添加" align="right"></s:submit>
    </s:form>
    <img src="" alt="上传图片浏览" id="images"/>
  </body>
</html>
