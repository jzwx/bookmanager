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
    ���߷������ҳ��<br/>
    <s:form action="readercategory!add" method="post">
    	<s:textfield name="readercategory.name" label="���߷�������"></s:textfield>
    	<s:textfield name="readercategory.maxperiod" label="������ʱ��"></s:textfield>
    	<s:textfield name="readercategory.maxborrownumber" label="���ڷ�����"></s:textfield>
    	<s:textfield name="readercategory.fineperday" label="��������" ></s:textfield>
    	<s:textfield name="readercategory.remark" label="��ע"></s:textfield>
    	<s:submit value="ȷ�����"></s:submit>
    </s:form>
  </body>
</html>
