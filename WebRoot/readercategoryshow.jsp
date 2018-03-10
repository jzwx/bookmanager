<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'readercategoryshow.jsp' starting page</title>
    
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
    读者分类浏览<br/>
    <table border="1">
    	<tr>
    		<th>编号</th>
    		<th>读者分类名称</th>
    		<th>最大借阅时间</th>
    		<th>超期罚金数</th>
    		<th>最大借阅数</th>
    		<th>备注</th>
    		<th>操作</th>
    	</tr>
    	<s:iterator value="#request.readercategorylist">
    	<tr>
    		<td>${id}</td>
    		<td>${name}</td>
    		<td>${maxperiod}</td>
    		<td>${fineperday}</td>
    		<td>${maxborrownumber}</td>
    		<td>${remark}</td>
    		<td><a href="readercategory!preupdate?id=${id}">修改</a>&nbsp;&nbsp;<a href="#">删除</a></td>
    	</tr>
    	</s:iterator>
    </table>
    ${readercategorypage.toolBar}
  </body>
</html>
