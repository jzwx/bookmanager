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
    
    <title>My JSP 'borrow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/createXMLHttpRequest.js"></script>
	<script type="text/javascript">
		function funvalidata(){
			var txtrid=document.getElementById("txtrid").value;
			var txtbid=document.getElementById("txtbid").value;
			if(txtrid==""){
				alert("���߱�Ų���Ϊ��!");
				return false;
			}
			if(txtbid==""){
				alert("ͼ���Ų���Ϊ��!");
				return false;
			}
			return true;
		}
		
		function readersearch()
		{
			//alert("1");
			var txtname=document.getElementById('txtname').value;
			var textdepartment=document.getElementById('textdepartment').value;
			var strparm="name="+txtname+"&textdepartment="+textdepartment;
		//	alert(strparm);
			var xmlhttpreq=createXMLHttpRequest();
		//	alert(xmlhttpreq.readyState);			
			xmlhttpreq.Onreadystatechange=callback;
			xmlhttpreq.Open("post","readerajax!search?"+strparm,"true");
			xmlhttpreq.setRequestHeader("content-type","application/x-www-from-urlencoded;charset=gbk");
			xmlhttpreq.send(null);
			function callback(){
				if(xmlhttpreq.readyState==4){
					if(xmlhttpreq.Status==200){
			//			alert("33");
						var strdata=eval("("+xmlhttpreq.responseText+")").jsonreader;
		//				alert(strdata);
						var rs=eval("("+strdata+")").rs;
			//			alert(rs);
						var tnode=document.getElementById('tablereader');
						while(tnode.rows.length>1){
							tnode.deleteRow(1);
						}
						for(var i=0;i<rs.length;i++){
							var trnode=tnode.insertRow(tnode.rows.length);
							var tdnodeid=trnode.insertCell(trnode.cells.length);
							var tdnodename=trnode.insertCell(trnode.cells.length);
							var tdnodesex=trnode.insertCell(trnode.cells.length);
							var tdnodephone=trnode.insertCell(trnode.cells.length);
							var tdnodedepartment=trnode.insertCell(trnode.cells.length);
							var tdnoderc=trnode.insertCell(trnode.cells.length);
							var tdnodeselect=trnode.insertCell(trnode.cells.length);
							tdnodeid.innerHTML=rs[i].id;
							tdnodename.innerHTML=rs[i].name;
							tdnodesex.innerHTML=rs[i].sex;
							tdnodephone.innerHTML=rs[i].phone;
							tdnodedepartment.innerHTML=rs[i].department;
							tdnoderc.innerHTML=rs[i].rc;
							tdnodeselect.innerHTML="<input type='button' value='ѡ��' onclick='document.getElementById(\"txtrid\").value="+rs[i].id+";document.getElementById(\"divreader\").style.display=\"none\";'/>";
						}
					}
				}
			}
			
		}
		function booksearch(){
			//alert("11");
			var txtbname=document.getElementById('txtbname').value;
			var txtauthor=document.getElementById('txtauthor').value;
			var txtpubs=document.getElementById('txtpubs').value;
			var sbook='�ɽ�';
		//	alert(sbook);
			var strparm="name="+txtbname+"&author="+txtauthor+"&pubs="+txtpubs+"&s="+sbook;
		//	alert(strparm);
			var xmlhttpreq=createXMLHttpRequest();
			xmlhttpreq.Onreadystatechange=callback;
			xmlhttpreq.open("post","bookajax!search?"+strparm,"true");
			xmlhttpreq.setRequestHeader("content-type","application/x-www-from-urlencoded;charset=gbk");
			xmlhttpreq.send(null);
			function callback(){
		//		alert(xmlhttpreq.readystate);
		//		alert(xmlhttpreq.Status);
				if(xmlhttpreq.readystate){
					if(xmlhttpreq.Status){
			//			alert("33");
						var strdata=eval("("+xmlhttpreq.responseText+")").jsonbook;
			//			alert(strdata);
						var rs=eval("("+strdata+")").rs;
			//			alert(rs);
						var tnode=document.getElementById("tablebook");
						while(tnode.rows.length>1){
							tnode.deleteRow(1);
						}
						for(var i=0;i<rs.length;i++){
							var trnode=tnode.insertRow(tnode.rows.length);
							var tdnodeid=trnode.insertCell(trnode.cells.length);
							var tdnodename=trnode.insertCell(trnode.cells.length);
							var tdnodeauthor=trnode.insertCell(trnode.cells.length);
							var tdnodepubs=trnode.insertCell(trnode.cells.length);
							var tdnodepubdate=trnode.insertCell(trnode.cells.length);
							var tdnodeprice=trnode.insertCell(trnode.cells.length);
							var tdnodebc=trnode.insertCell(trnode.cells.length);
							var tdnodeselect=trnode.insertCell(trnode.cells.length);
							tdnodeid.innerHTML=rs[i].id;
							tdnodename.innerHTML=rs[i].name;
							tdnodeauthor.innerHTML=rs[i].author;
							tdnodepubs.innerHTML=rs[i].pubs;
							tdnodepubdate.innerHTML=rs[i].pubdate;
							tdnodeprice.innerHTML=rs[i].price;
							tdnodebc.innerHTML=rs[i].bc;
							tdnodeselect.innerHTML="<input type='button' value='ѡ��' onclick='document.getElementById(\"txtbid\").value="+rs[i].id+";document.getElementById(\"divbook\").style.display=\"none\";'/>";
						}
					}
				}
			}
		}
	</script>
  </head>
  
  <body>
  <s:actionerror/>
    <s:form action="borrow!borrowbook" method="post" theme="simple">
    ���߱��:<s:textfield name="borrow.reader.id" label="���߱��" id="txtrid" onfocus="document.getElementById('divreader').style.display='block';document.getElementById('divbook').style.display='none';"></s:textfield>
    ͼ����:<s:textfield name="borrow.book.id" label="ͼ����" id="txtbid" onfocus="document.getElementById('divbook').style.display='block';document.getElementById('divreader').style.display='none';"></s:textfield>
 ��ע:<s:textarea name="borrow.remark" label="��ע" ></s:textarea>
 <s:submit value="����" onclick="return funvalidata();"></s:submit>
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
    
    <div id="divbook" style="display:none;background:aqua;width:750px">
    	ͼ������:<input type="text" id="txtbname"/>����:<input type="text" id="txtauthor"/>������:<input type="text" id="txtpubs"/>
    	<input type="button" value="��ѯ" onclick="return booksearch();"/>
    	<input type="button" value="ȡ��"/>
    	<table border="1" id="tablebook">
    		<tr>
    			<th>���</th>
    			<th>����</th>
    			<th>����</th>
    			<th>������</th>
    			<th>��������</th>
    			<th>�۸�</th>
    			<th>����</th>
    			<th>ѡ��</th>
    		</tr>
    	</table>
    </div>
  </body>
</html>
