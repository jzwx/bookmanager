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
				alert("�û�������Ϊ��,����������!");
				return false;
			}
			if(password==""){
				alert("���벻��Ϊ��,����������!");
				return false;
			}
			if(username.length>10){
				alert("�û������Ȳ��ܴ���10,����������!");
				return false;
			}
			if(password.length>6){
				alert("���볤�Ȳ��ܴ���6,����������!");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
    �û��޸�ҳ��<br/>
    <s:form action="userinfo!update" method="post">
    	<s:hidden name="user.id"></s:hidden>
    	<s:textfield name="user.username" label="�û���" id="txtusername"></s:textfield>
    	<s:textfield name="user.password" label="����" id="txtpassword"></s:textfield>
    	<s:submit value="ȷ���޸�" onclick="return checkusername();"></s:submit>
    </s:form>
  </body>
</html>
