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
			alert("ͼ�����Ʋ���Ϊ��,����������!");
			return false;
		}
		if(txtprice==""){
			alert("ͼ��۸���Ϊ��,����������!");
			return false;
		}
		if(isNaN(txtprice)){
			alert("ͼ��۸����Ϊ����,��������д!");
			return false;
		}
		return true;
	}
	</script>
  </head>
  
  <body>
    ͼ���޸�ҳ��<br/>
    <s:form action="book!update" method="post" enctype="multipart/form-data">
        <s:hidden name="book.id"></s:hidden>
        <s:head name="book.state"></s:head>
        <s:hidden name="book.picpath"></s:hidden>
    	<s:textfield name="book.name" label="ͼ������" id="txtname"></s:textfield>
    	<s:textfield name="book.author" label="����"></s:textfield>
    	<s:textfield name="book.pubs" label="������"></s:textfield>
    	<s:textfield name="book.pubdate" label="��������" onfocus="HS_setDate(this)"></s:textfield>
    	<s:textfield name="book.price" label="�۸�" id="txtprice"></s:textfield>
    	<s:textfield name="book.isbn" label="Isbn��"></s:textfield>
    	<s:select list="#request.lstbc" listValue="name" listKey="id" label="ͼ�����" name="book.bookcategory.id"></s:select>
    	<s:textfield name="book.remark" label="��ע"></s:textfield>
    	<s:file name="picpath" label="��ѡ��ͼ�����" onchange="document.getElementById('images').src=this.value"></s:file>
    	<s:submit value="ȷ���޸�" onclick="return funvalidate()"></s:submit>
    </s:form>
    <table>
    	<tr>
    		<td>ԭͼƬ</td><td><img alt="ԭͼƬ" src="upload/${book.picpath}"/></td>
    	</tr>
    	<tr>
    		<td>��ͼƬ</td><td><img alt="��ͼƬ" src="" id="images"/></td>
    	</tr>
    </table>
  </body>
</html>
