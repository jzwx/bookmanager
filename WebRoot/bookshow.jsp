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
   			<th>ͼ����</th>
   			<th>ͼ������</th>
   			<th>����</th>
   			<th>������</th>
   			<th>��������</th>
   			<th>�۸�</th>
   			<th>ISBN��</th>
    		<th>״̬</th>
    		<th>ͼ�����</th>
    		<th>ͼ�����</th>
    		<th>����</th>
   		</tr>
   		<s:iterator value="#request.booklist">
   		<tr>
   			<td>${id}</td>
   			<td>${name}</td>
   			<td>${author}</td>
   			<td>${pubs}</td>
    		<td><s:date name="pubdate" format="yyyy-MM-dd"/></td>
    		<td>${price}</td>
    		<td>${isbn}</td>
    		<td>${state}</td>
    		<td>${bookcategory.name}</td>
    		<td><img src="upload/${picpath}" height="60" width="60"/></td>
    		<td><a href="book!tushu?id=${id}">�鿴</a>&nbsp;<a href="book!preupdate?id=${id}">�޸�</a>&nbsp;<a href="book!delete?id=${id}" onclick="return confirm('ȷ��ɾ����?');">ɾ��</a></td>
   		</tr>
   		</s:iterator>
   	</table>
   	${bookpage.toolBar }
  </body>
</html>
