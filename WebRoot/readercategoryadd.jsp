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
    读者分类添加页面<br/>
    <s:form action="readercategory!add" method="post">
    	<s:textfield name="readercategory.name" label="读者分类名称"></s:textfield>
    	<s:textfield name="readercategory.maxperiod" label="最大借阅时间"></s:textfield>
    	<s:textfield name="readercategory.maxborrownumber" label="超期罚金数"></s:textfield>
    	<s:textfield name="readercategory.fineperday" label="最大借阅数" ></s:textfield>
    	<s:textfield name="readercategory.remark" label="备注"></s:textfield>
    	<s:submit value="确认添加"></s:submit>
    </s:form>
  </body>
</html>
