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
    
    <title>My JSP 'bookadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/setdate.js"></script>
	<script type="text/javascript">
	function funvalidate(){
		var txtname=document.getElementById('txtname').value;
		var txtprice=document.getElementById('txtprice').value;
		if(txtname==""){
			alert("图书名称不能为空,请重新输入!");
			return false;
		}
		if(txtprice==""){
			alert("图书价格不能为空,请重新输入!");
			return false;
		}
		if(isNaN(txtprice)){
			alert("图书价格必须为数字,请重新填写!");
			return false;
		}
		return true;
	}
	</script>
  </head>
  
  <body>
    图书修改页面<br/>
    <s:form action="book!update" method="post" enctype="multipart/form-data">
        <s:hidden name="book.id"></s:hidden>
        <s:head name="book.state"></s:head>
        <s:hidden name="book.picpath"></s:hidden>
    	<s:textfield name="book.name" label="图书名称" id="txtname"></s:textfield>
    	<s:textfield name="book.author" label="作者"></s:textfield>
    	<s:textfield name="book.pubs" label="出版社"></s:textfield>
    	<s:textfield name="book.pubdate" label="出版日期" onfocus="HS_setDate(this)"></s:textfield>
    	<s:textfield name="book.price" label="价格" id="txtprice"></s:textfield>
    	<s:textfield name="book.isbn" label="Isbn号"></s:textfield>
    	<s:select list="#request.lstbc" listValue="name" listKey="id" label="图书分类" name="book.bookcategory.id"></s:select>
    	<s:textfield name="book.remark" label="备注"></s:textfield>
    	<s:file name="picpath" label="请选择图书封面" onchange="document.getElementById('images').src=this.value"></s:file>
    	<s:submit value="确认修改" onclick="return funvalidate()"></s:submit>
    </s:form>
    <table>
    	<tr>
    		<td>原图片</td><td><img alt="原图片" src="upload/${book.picpath}"/></td>
    	</tr>
    	<tr>
    		<td>新图片</td><td><img alt="新图片" src="" id="images"/></td>
    	</tr>
    </table>
  </body>
</html>
