package com.my.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.BorrowBussiness;
import com.my.hibernate.Borrow;
import com.my.util.page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BorrowAction extends ActionSupport {
	private Borrow borrow;
	private BorrowBussiness mybussiness=new BorrowBussiness();
	public Borrow getBorrow() {
		return borrow;
	}

	public void setBorrow(Borrow borrow) {
		this.borrow = borrow;
	}
	
	public String findAll() throws Exception{
		page mypage=new page();
		mypage.setPagename("borrowpage");
		mypage.setLstname("borrowlist");
		mypage.setResultname("borrowshow");
		mypage.setStrsql("from Borrow");
		List list=mybussiness.findAll(mypage);
		ActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		return mypage.getResultname();
	}
	
	public String borrowbook() throws Exception{
		borrow.setBorrowdate(new Date());
		int falg=mybussiness.borrowbook(borrow);
		if(falg==-1){
			this.addActionError("该用户借阅书籍存在超期！");
			return "borrow";
		}else if(falg==-2){
			this.addActionError("该用户超过借阅书籍最大数量！");
			return "borrow";
		}else{
			return "borrowbooksuccess";
		}
	}
}
