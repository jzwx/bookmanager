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
    
    <title>My JSP 'userinfoadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function funvalidata(){
			var username=document.getElementById('txtusername').value;
			var password=document.getElementById('txtpassword').value;
			if(username==""){
				alert("�û�������Ϊ��!");
				return false;
			}
			if(password==""){
				alert("���벻��Ϊ��!");
				return false;
			}
			if(password.length>6){
				alert("���벻�ܴ���6λ,����������!");
				return false;
			}
			if(username.length>10){
				alert("�û������ܴ���10λ,����������!");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
  �û����<br/>
   		<s:form action="userinfo!add" method="post">
   			<s:textfield label="�û���" size="20" name="user.username" id="txtusername"></s:textfield>
   			<s:password label="����" size="21" name="user.password" id="txtpassword"></s:password>
   			<s:submit value="���" align="left" onclick="return funvalidata();"></s:submit>
   		</s:form>
  </body>
</html>
