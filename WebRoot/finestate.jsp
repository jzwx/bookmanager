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
    
    <title>My JSP 'finestate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<SCRIPT type="text/javascript" src="js/createXMLHttpRequest.js"></SCRIPT>
	<SCRIPT type="text/javascript">
		function funvalidata(){
			var txtreaderid=document.getElementById('txtreaderid').value;
			if(txtreaderid==""){
				alert("���߱�Ų���Ϊ��!");
				return false;
			}
			return true;
		}
		
		function readersearch(){
			var txtname=document.getElementById('txtname').value;
			var textdepartment=document.getElementById('textdepartment').value;
			var strparm="name="+txtname+"&textdepartment="+textdepartment;
		//	alert(strparm);
			var xmlhttpreq=createXMLHttpRequest();
			xmlhttpreq.Onreadystatechange=callback;
			xmlhttpreq.open("post","readerajax!search?"+strparm,"true");
			xmlhttpreq.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=gbk");
			xmlhttpreq.send(null);
			function callback(){
			/*
				alert(xmlhttpreq.readyState);
				alert(xmlhttpreq.Status);
			*/
				if(xmlhttpreq.readyState==4){
					if(xmlhttpreq.Status==200){
				//		alert("33");
						var strdata=eval("("+xmlhttpreq.responseText+")").jsonreader;
			//			alert(strdata);
						var rs = eval("("+strdata+")").rs;
			//			alert(rs);
						var tnode=document.getElementById("tablereader");
						while(tnode.rows.length>1){
							tnode.deleteRow(1);
						}
						for(i=0;i<rs.length;i++){
							var trnode=tnode.insertRow(tnode.rows.length);
							var tdnodeid=trnode.insertCell(trnode.cells.length);
							var tdnodename=trnode.insertCell(trnode.cells.length);
							var tdnodesex=trnode.insertCell(trnode.cells.length);
							var tdnodephone=trnode.insertCell(trnode.cells.length);
							var tdnodedepartment=trnode.insertCell(trnode.cells.length);
							var tdnoderc=trnode.insertCell(trnode.cells.length);
							var tdnoderemark=trnode.insertCell(trnode.cells.length);
							tdnodeid.innerHTML=rs[i].id;
							tdnodename.innerHTML=rs[i].name;
							tdnodesex.innerHTML=rs[i].sex;
							tdnodephone.innerHTML=rs[i].phone;
							tdnodedepartment.innerHTML=rs[i].department;
							tdnoderc.innerHTML=rs[i].rc;
							tdnoderemark.innerHTML="<input type='button' value='ѡ��' onclick='document.getElementById(\"txtreaderid\").value="+rs[i].id+";document.getElementById(\"divreader\").style.display=\"none\";'/>";
						}
					}
				}
			}
		}
	</SCRIPT>
  </head>
  
  <body>
    ���ɷ���<br/>
    <s:form action="fine!findByRid" method="post" theme="simple">
    	���߱��:<s:textfield name="fine.borrow.reader.id" label="���߱��" id="txtreaderid" onfocus="document.getElementById('divreader').style.display='block';"></s:textfield>
    	<s:submit value="��ѯ����ɷ������" onclick="return funvalidata();"></s:submit>
    </s:form>
    <div id="divreader" style="display:none;background:aqua;width:500px;">
    	����:<input type="text" id="txtname"/>��λ:<input type="text" id="textdepartment"/>
    	<input type="button" value="��ѯ" onclick="return readersearch();"/>
    	<input type="button" value="ȡ��"/>
    	<table border="1" id="tablereader">
    		<tr>
    			<th>���</th>
    			<th>����</th>
    			<th>�Ա�</th>
    			<th>�绰</th>
    			<th>��λ</th>
    			<th>����</th>
    			<th>ѡ��</th>
    		</tr>
    	</table>
    </div>
    <s:actionerror/>
    <s:iterator value="#request.list">
    	<s:form action="fine!fineadd" method="post" theme="simple">
    	<input type="hidden" name="fine.borrow.id" value="${borrow.id}"/>
    	<input type="hidden" name="fine.borrow.reader.id" value="${borrow.reader.id}"/>
    	<input type="hidden" name="fine.borrow.book.id" value="${borrow.book.id}"/>
    		ͼ������:<input type="text" name="fine.borrow.book.name" value="${borrow.book.name}"/>
    		�����ܶ�:<input type="text" name="fine.finenumber" value="${finenumber}"/>
    		��ע<s:textarea name="fine.remark"/>
    		<s:submit value="����"></s:submit>
    	</s:form>
    </s:iterator>
  </body>
</html>
