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
    
    <title>My JSP 'bookshow.jsp' starting page</title>
    
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
  <s:actionerror/>
   	<table border="1">
   		<tr>
   			<th>���</th>
   			<th>��������</th>
   			<th>ͼ������</th>
   			<th>��������</th>
   			<th>�黹����</th>
   			<th>��ע</th>
   		</tr>
   		<s:iterator value="#request.borrowlist">
   		<tr>
   			<td>${id}</td>
   			<td>${reader.name}</td>
   			<td>${book.name}</td>
   			<td><s:date name="borrowdate" format="yyyy-MM-dd"/></td>
    		<td><s:date name="returndate" format="yyyy-MM-dd"/></td>
    		<td>${remark}</td>
   		</tr>
   		</s:iterator>
   	</table>
   	${borrowpage.toolBar }
  </body>
</html>