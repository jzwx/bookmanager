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
				alert("读者编号不能为空!");
				return false;
			}
			if(txtbid==""){
				alert("图书编号不能为空!");
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
							tdnodeselect.innerHTML="<input type='button' value='选择' onclick='document.getElementById(\"txtrid\").value="+rs[i].id+";document.getElementById(\"divreader\").style.display=\"none\";'/>";
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
			var sbook='可借';
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
							tdnodeselect.innerHTML="<input type='button' value='选择' onclick='document.getElementById(\"txtbid\").value="+rs[i].id+";document.getElementById(\"divbook\").style.display=\"none\";'/>";
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
    读者编号:<s:textfield name="borrow.reader.id" label="读者编号" id="txtrid" onfocus="document.getElementById('divreader').style.display='block';document.getElementById('divbook').style.display='none';"></s:textfield>
    图书编号:<s:textfield name="borrow.book.id" label="图书编号" id="txtbid" onfocus="document.getElementById('divbook').style.display='block';document.getElementById('divreader').style.display='none';"></s:textfield>
 备注:<s:textarea name="borrow.remark" label="备注" ></s:textarea>
 <s:submit value="借阅" onclick="return funvalidata();"></s:submit>
    </s:form>
    <div id="divreader" style="display:none;background:aqua;width:500px;">
	姓名:<input type="text" id="txtname"/>单位:<input type="text" id="textdepartment"/>	
	<input type="button" value="查询" onclick="return readersearch();"/>
	<input type="button" value="取消"/>
    	<table border="1" id="tablereader">
    		<tr>
    			<th>编号</th>
    			<th>姓名</th>
    			<th>性别</th>
    			<th>电话</th>
    			<th>单位</th>
    			<th>分类</th>
    			<th>选择</th>
    		</tr>
    	</table>
    </div>
    
    <div id="divbook" style="display:none;background:aqua;width:750px">
    	图书名称:<input type="text" id="txtbname"/>作者:<input type="text" id="txtauthor"/>出版社:<input type="text" id="txtpubs"/>
    	<input type="button" value="查询" onclick="return booksearch();"/>
    	<input type="button" value="取消"/>
    	<table border="1" id="tablebook">
    		<tr>
    			<th>编号</th>
    			<th>名称</th>
    			<th>作者</th>
    			<th>出版社</th>
    			<th>出版日期</th>
    			<th>价格</th>
    			<th>分类</th>
    			<th>选择</th>
    		</tr>
    	</table>
    </div>
  </body>
</html>
