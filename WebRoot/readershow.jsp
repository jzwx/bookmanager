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
    
    <title>My JSP 'readershow.jsp' starting page</title>
    
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
    ���������<br/>
    <s:actionerror/>
   	<table border="1">
   		<tr>
   			<th>���</th>
   			<th>��������</th>
   			<th>�Ա�</th>
   			<th>�绰</th>
   			<th>����ϵ��</th>
   			<th>��������</th>
   			<th>������Ƭ</th>
   			<th>��ע</th>
   			<th>����</th>
   		</tr>
   		<s:iterator value="#request.readerlist">
   		<tr>
   			<td>${id}</td>
   			<td>${name}</td>
   			<td>${sex}</td>
   			<td>${phone}</td>
   			<td>${department}</td>
   			<td>${readercategory.name}</td>
   			<td><img src="upload/${photopath}" height="60"/></td>
   			<td>${remark}</td>
   			<td><a href="reader!preupdate?id=${id}">�޸�</a>&nbsp;&nbsp;<a href="reader!delete?id=${id}" onclick="return confirm('ȷ��ɾ����?');">ɾ��</a></td>
   		</tr>
   		</s:iterator>
   	</table>
   	${readerpage.toolBar}
  </body>
</html>
