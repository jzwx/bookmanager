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
    �������<br>
    <s:form action="reader!add" method="post" enctype="multipart/form-data">
    	<s:textfield name="reader.name" label="��������" ></s:textfield>
    	<s:radio list="#{'��':'��','Ů':'Ů'}" name="reader.sex" label="�Ա�" value="'��'"></s:radio>
    	<s:textfield name="reader.phone" label="�绰" ></s:textfield>
    	<s:textfield name="reader.department" label="����ϵ��"></s:textfield>
    	<s:select list="#request.lstlist" listValue="name" listKey="id" label="��������" name="reader.readercategory.id"></s:select>
    	<s:textarea name="reader.remark" label="��ע"></s:textarea>
    	<s:file name="photopath" label="��ѡ��ͼƬ" onchange="document.getElementById('images').src=this.value"></s:file>
    	<s:submit value="ȷ�����" align="right"></s:submit>
    </s:form>
    <img src="" alt="�ϴ�ͼƬ���" id="images"/>
  </body>
</html>
