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
    
    <title>My JSP 'bookback.jsp' starting page</title>
    
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
			var bookid=document.getElementById('bookid').value;
			if(bookid==""){
				alert("ͼ���Ų���Ϊ��!");
				return false;
			}
			return true;
		}
		
		function booksearch(){
			var txtbname=document.getElementById('txtbname').value;
			var txtauthor=document.getElementById('txtauthor').value;
			var txtpubs=document.getElementById('txtpubs').value;
			var sbook='�ѽ�';
			var strparm="name="+txtbname+"&author="+txtauthor+"&pubs="+txtpubs+"&s="+sbook;
		//	alert(strparm);
			var xmlhttpreq=createXMLHttpRequest();
			xmlhttpreq.Onreadystatechange=callback;
			xmlhttpreq.Open("post","bookajax!search?"+strparm,"true");
			xmlhttpreq.setRequestHeader("content-type","application/x-www-from-urlencoded;charset=gbk");
			xmlhttpreq.send(null);
			function callback(){
				if(xmlhttpreq.readyState==4){
					if(xmlhttpreq.Status==200){
					//	alert("111");
						var strdata=eval("("+xmlhttpreq.responseText+")").jsonbook;
				//		alert(strdata);
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
							tdnodeselect.innerHTML="<input type='button' value='ѡ��' onclick='document.getElementById(\"bookid\").value="+rs[i].id+";document.getElementById(\"divbook\").style.display=\"none\";'/>";
						}
					}
				}
			}
		}
	</script>
  </head>
  
  <body>
  ͼ��黹<br/>
    <s:form action="return!returnbook" method="post" theme="simple">
    ͼ����:<s:textfield name="borrow.book.id" id="bookid" label="ͼ����" onfocus="document.getElementById('divbook').style.display='block';"></s:textfield>
    ��ע:<s:textarea name="borrow.remark" label="��ע" onfocus="document.getElementById('divbook').style.display='none';"></s:textarea>
    <s:submit value="�黹" onclick="return funvalidata();"></s:submit>
    </s:form>
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
