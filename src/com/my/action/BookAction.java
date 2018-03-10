package com.my.action;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.BookBussiness;
import com.my.hibernate.Book;
import com.my.util.page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	private Book book;
	private BookBussiness myBussiness=new BookBussiness();
	
	//�ļ����ϴ�
	private File picpath;
	private String picpathContentType;
	private String picpathFileName;
	private Date begindate;
	private Date enddate;
	private float minprice;
	private float maxprice;
	
	
	public Date getBegindate() {
		return begindate;
	}

	public void setBegindate(Date begindate) {
		this.begindate = begindate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public float getMinprice() {
		return minprice;
	}

	public void setMinprice(float minprice) {
		this.minprice = minprice;
	}

	public float getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(float maxprice) {
		this.maxprice = maxprice;
	}

	public File getPicpath() {
		return picpath;
	}

	public void setPicpath(File picpath) {
		this.picpath = picpath;
	}

	public String getPicpathContentType() {
		return picpathContentType;
	}

	public void setPicpathContentType(String picpathContentType) {
		this.picpathContentType = picpathContentType;
	}

	public String getPicpathFileName() {
		return picpathFileName;
	}

	public void setPicpathFileName(String picpathFileName) {
		this.picpathFileName = picpathFileName;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String findAll() throws Exception{
		String strsql="from Book";
		page mypage=new page();
		mypage.setStrsql(strsql);
		mypage.setPagename("bookpage");
		mypage.setLstname("booklist");
		mypage.setResultname("bookshow");
		ActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		List list=myBussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		return mypage.getResultname();
	}
	
	public String findAllbookcategory() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		List list=myBussiness.findAllbookcategory();
		request.setAttribute("lstbookcategory", list);
		return "bookadd";
	}
	
	public String add() throws Exception{
//		System.out.println(picpath);
//		System.out.println(picpathContentType);
//		System.out.println(picpathFileName);
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
//		System.out.println(realpath);		
		book.setState("�ɽ�");
		int falg=myBussiness.add(book,picpath,picpathFileName,realpath);
		if(falg==-1){
			this.addFieldError("book.name", "�ϴ�ͼƬ����,��ѡ��ͼƬ!");
			return findAllbookcategory();
		}else{
			return "bookaddsuccess";
		}
	}
	
	public String preupdate() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		book=myBussiness.preupdate(id);
		List list=myBussiness.findAllbookcategory();
		request.setAttribute("lstbc", list);
		return "bookpreupdate";
	}
	
	public String update() throws Exception{
		int falg=0;
		HttpServletRequest request=ServletActionContext.getRequest();
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		System.out.println(realpath);
		falg=myBussiness.update(book,picpath,picpathFileName,realpath);
		if(falg==-1){
			this.addFieldError("book.name", "Isbn�Ŵ���,����������!");
			List list=myBussiness.findAllbookcategory();
			request.setAttribute("lstbc", list);
			return "bookpreupdate";
		}else if(falg==-2){
			this.addFieldError("book.name", "ͼ������ϴ�ʧ��,����������!");
			List list=myBussiness.findAllbookcategory();
			request.setAttribute("lstbc", list);
			return "bookpreupdate";
		}else{
			return "bookupdatesuccess";
		}
	}
	
	public String delete() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		int falg=myBussiness.delete(id,realpath);
		if(falg==-1){
			this.addActionError("ͼ�������Ϣ�д��ڸ�ͼ����Ϣ,��ɾ�����ٽ��в���!");
			return findAll();
		}else{
			return "bookdeletesuccess";
		}
	}
	
	public String tushu() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		book=myBussiness.tushu(id);
		return "bookgetbook";
	}
	
	public String find() throws Exception{
		page mypage=new page();
		mypage.setPagename("bookpage");
		mypage.setLstname("booklist");
		mypage.setResultname("bookshow");
		List list=myBussiness.find(book,begindate,enddate,minprice,maxprice,mypage);
		ActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(),list);
		return mypage.getResultname();
	}
}
