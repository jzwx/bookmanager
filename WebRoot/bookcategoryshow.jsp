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
    
    <title>My JSP 'bookcategoryshow.jsp' starting page</title>
    
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
    		<th>ͼ����������</th>
    		<th>��ע</th>
    		<th>����</th>
    	</tr>
    	<s:iterator value="#request.bookcategorylist">
    		<tr>
    			<td>${id}</td>
    			<td>${name}</td>
    			<td>${remark}</td>
    			<td><a href="bookcategory!preupdate?id=${id}">�޸�</a>&nbsp;&nbsp;<a href="bookcategory!delete?id=${id}" onclick="return confirm('ȷ��ɾ����?');">ɾ��</a></td>
    		</tr>
    	</s:iterator>
    </table>
    ${bookcategorypage.toolBar}
  </body>
</html>
