function createXMLHttpRequest(){
	var xmlHttpReq = false;
	if(window.ActiveXObject){   //在IE浏览中创建
		try{
			xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch(e){
			try{
				xmlHttpReq = new ActiveObject("Microsoft.XMLHTTP");
			}
			catch(ex){
				xmlHttpReq = false;
			}
		}
	}
	else if(window.XMLHttpRequest){ //在非IE浏览器中创建
		try{
			xmlHttpReq = new XMLHttpRequest();
		}
		catch(e){
			xmlHttpReq = false;
		}
	}
	return xmlHttpReq;
}