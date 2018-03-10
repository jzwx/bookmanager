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
    
    <title>My JSP 'userinfopreupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function checkusername(){
			var username=document.getElementById('txtusername').value;
			var password=document.getElementById('txtpassword').value;
			if(username==""){
				alert("用户名不能为空,请重新输入!");
				return false;
			}
			if(password==""){
				alert("密码不能为空,请重新输入!");
				return false;
			}
			if(username.length>10){
				alert("用户名长度不能大于10,请重新输入!");
				return false;
			}
			if(password.length>6){
				alert("密码长度不能大于6,请重新输入!");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
    用户修改页面<br/>
    <s:form action="userinfo!update" method="post">
    	<s:hidden name="user.id"></s:hidden>
    	<s:textfield name="user.username" label="用户名" id="txtusername"></s:textfield>
    	<s:textfield name="user.password" label="密码" id="txtpassword"></s:textfield>
    	<s:submit value="确认修改" onclick="return checkusername();"></s:submit>
    </s:form>
  </body>
</html>
