package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.BookBussiness;
import com.my.hibernate.Book;
import com.opensymphony.xwork2.ActionSupport;

public class BookAjaxAction extends ActionSupport {
	
	private BookBussiness mybussiness=new BookBussiness();
	
	private String jsonbook;
	
	public String getJsonbook() {
		return jsonbook;
	}

	public void setJsonbook(String jsonbook) {
		this.jsonbook = jsonbook;
	}

	public String search() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		String name=request.getParameter("name");
		String author=request.getParameter("author");
		String pubs=request.getParameter("pubs");
		String s=request.getParameter("s");
		name=new String(name.getBytes("ISO-8859-1"),"gbk");
		author=new String(author.getBytes("ISO-8859-1"),"gbk");
		pubs=new String(pubs.getBytes("ISO-8859-1"),"gbk");
		s=new String(s.getBytes("ISO-8859-1"),"gbk");
		System.out.println(name+" "+author+" "+pubs+" "+s);
		List list=mybussiness.findbook(name,author,pubs,s);
		System.out.println(list.size());
		StringBuffer strbuffer=new StringBuffer();
		strbuffer.append("{");
		strbuffer.append("rs:[");
		for(int i=0;i<list.size();i++){
			if(i==0){
				strbuffer.append("{");
			}else{
				strbuffer.append(",{");
			}
			Book b=(Book) list.get(i);
			strbuffer.append("id:"+b.getId());
			strbuffer.append(",name:'"+b.getName()+"'");
			strbuffer.append(",author:'"+b.getAuthor()+"'");
			strbuffer.append(",pubs:'"+b.getPubs()+"'");
			strbuffer.append(",pubdate:'"+b.getPubdate()+"'");
			strbuffer.append(",price:"+b.getPrice());
			strbuffer.append(",bc:'"+b.getBookcategory().getName()+"'");
			strbuffer.append("}");
		}
		strbuffer.append("]");
		strbuffer.append("}");
		this.setJsonbook(strbuffer.toString());
		
		return "borrow";
	}
}
