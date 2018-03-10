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
				alert("用户名不能为空!");
				return false;
			}
			if(password==""){
				alert("密码不能为空!");
				return false;
			}
			if(password.length>6){
				alert("密码不能大于6位,请重新输入!");
				return false;
			}
			if(username.length>10){
				alert("用户名不能大于10位,请重新输入!");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
  用户添加<br/>
   		<s:form action="userinfo!add" method="post">
   			<s:textfield label="用户名" size="20" name="user.username" id="txtusername"></s:textfield>
   			<s:password label="密码" size="21" name="user.password" id="txtpassword"></s:password>
   			<s:submit value="添加" align="left" onclick="return funvalidata();"></s:submit>
   		</s:form>
  </body>
</html>
