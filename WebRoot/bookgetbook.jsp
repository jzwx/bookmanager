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
    
    <title>My JSP 'bookadd.jsp' starting page</title>
    
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
    显示图书详情<br/>
    <s:label name="book.id" label="图书编号" ></s:label><br/>
    <s:label name="book.name" label="图书名称" ></s:label><br/>
    <s:label name="book.author" label="作者" ></s:label><br/>
    <s:label name="book.pubs" label="出版社" ></s:label><br/>
    <s:label name="book.pubdate" label="出版日期"></s:label><br/>
    <s:label name="book.price" label="价格" ></s:label><br/>
    <s:label name="book.isbn" label="ISBN号" ></s:label><br/>
    <s:label name="book.state" label="状态" ></s:label><br/>
    <s:label name="book.bookcategory.name" label="图书分类名称" ></s:label><br/>
    <s:label name="book.remark" label="备注" ></s:label><br/>
    <s:label name="book.picpath" label="图片路径"></s:label><br/>
   	图书封面:<img src="upload/${book.picpath}" width="60px" height="60px"/><br/>
    <a href="javascript:history.go(-1);">返回</a>
  </body>
</html>
