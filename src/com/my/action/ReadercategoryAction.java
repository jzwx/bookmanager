package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.ReadercategoryBussiness;
import com.my.hibernate.Readercategory;
import com.my.util.page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ReadercategoryAction extends ActionSupport {
	private Readercategory readercategory;
	private ReadercategoryBussiness myBussiness=new ReadercategoryBussiness();
	public Readercategory getReadercategory() {
		return readercategory;
	}
	
	public void setReadercategory(Readercategory readercategory) {
		this.readercategory = readercategory;
	}
	
	public String findAll() throws Exception{
		page mypage=new page();
		mypage.setStrsql("from Readercategory");
		mypage.setPagename("readercategorypage");
		mypage.setLstname("readercategorylist");
		mypage.setResultname("readercategoryshow");
		List list=myBussiness.findAll(mypage);
		ActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		return mypage.getResultname();
	}
	
	public String add() throws Exception{
		int falg=myBussiness.add(readercategory);
		if(falg==-1){
			this.addFieldError("readercategory.name", "读者类型存在,请重新输入!");
			return "readercategoryadd";
		}else{
			return "readercategoryaddsuccess";
		}
	}
	
	public String preupdate() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		readercategory=myBussiness.preupdate(id);
		return "readercategorypreupdate";
	}
	
	public String update() throws Exception{
		int falg=0;
		falg=myBussiness.update(readercategory);
		if(falg==-1){
			this.addFieldError("readercategory.name", "读者类型存在,请重新输入!");
			return "readercategorypreupdate";
		}else{
			return "readercategoryupdatesuccess";
		}
	}
}
