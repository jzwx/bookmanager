package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.BookcategoryBussiness;
import com.my.hibernate.Bookcategory;
import com.my.util.page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookcategoryAction extends ActionSupport {
	private Bookcategory bc;
	private BookcategoryBussiness myBussiness=new BookcategoryBussiness();
	public Bookcategory getBc() {
		return bc;
	}
	public void setBc(Bookcategory bc) {
		this.bc = bc;
	}
	
	public String findAll() throws Exception{
		page mypage=new page();
		mypage.setStrsql("from Bookcategory");
		mypage.setPagename("bookcategorypage");
		mypage.setLstname("bookcategorylist");
		mypage.setResultname("bookcategoryshow");
		ActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		List list=myBussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(),list);
		return mypage.getResultname();
	}
	
	public String delete() throws Exception{
		int falg=0;
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		falg=myBussiness.delete(id);
		if(falg==-1){
			this.addActionError("图书管理存在该类型图书,请删除完全再继续操作!");
			return findAll();
		}else
		{
			return "bookcategorydeletesuccess";
		}
	}
	
	public String preupdate() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		bc=myBussiness.preupdate(id);
		return "bookcategorypreupdate";
	}
	
	public String update() throws Exception{
		int falg=myBussiness.update(bc);
		if(falg==-1){
			this.addFieldError("bc.name", "图书类型存在,请重新输入!");
			return "bookcategorypreupdate";
		}else{
			return "bookcategoryupdatesuccess";
		}
	}
	
	public String add() throws Exception{
		int falg=myBussiness.add(bc);
		if(falg==-1){
			this.addFieldError("bc.name", "图书类型存在,请重新输入!");
			return "bookcategoryadd";
		}else{
			return "bookcategoryaddsuccess";
		}
	}
}
