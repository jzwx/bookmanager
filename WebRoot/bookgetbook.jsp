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
    ��ʾͼ������<br/>
    <s:label name="book.id" label="ͼ����" ></s:label><br/>
    <s:label name="book.name" label="ͼ������" ></s:label><br/>
    <s:label name="book.author" label="����" ></s:label><br/>
    <s:label name="book.pubs" label="������" ></s:label><br/>
    <s:label name="book.pubdate" label="��������"></s:label><br/>
    <s:label name="book.price" label="�۸�" ></s:label><br/>
    <s:label name="book.isbn" label="ISBN��" ></s:label><br/>
    <s:label name="book.state" label="״̬" ></s:label><br/>
    <s:label name="book.bookcategory.name" label="ͼ���������" ></s:label><br/>
    <s:label name="book.remark" label="��ע" ></s:label><br/>
    <s:label name="book.picpath" label="ͼƬ·��"></s:label><br/>
   	ͼ�����:<img src="upload/${book.picpath}" width="60px" height="60px"/><br/>
    <a href="javascript:history.go(-1);">����</a>
  </body>
</html>
