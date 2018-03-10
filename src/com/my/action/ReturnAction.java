package com.my.action;

import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.ReturnBussiness;
import com.my.hibernate.Borrow;
import com.my.util.page;
import com.opensymphony.xwork2.ActionSupport;

public class ReturnAction extends ActionSupport {
	private Borrow borrow;
	
	private ReturnBussiness mybussiness=new ReturnBussiness();
	
	public Borrow getBorrow() {
		return borrow;
	}

	public void setBorrow(Borrow borrow) {
		this.borrow = borrow;
	}

	public String findAll() throws Exception{
		page mypage=new page();
		String strsql="from Borrow where returndate is not null";
		mypage.setStrsql(strsql);
		mypage.setPagename("returnpage");
		mypage.setLstname("returnlist");
		mypage.setResultname("returnshow");
		HttpServletRequest request=ServletActionContext.getRequest();
		ServletActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		List list=mybussiness.findAll(mypage);
		System.out.println(list.size());
		request.setAttribute(mypage.getLstname(), list);
		return mypage.getResultname();
	}
	
	public String returnbook() throws Exception{
		borrow=mybussiness.getBorrowById(borrow.getBook().getId());
		borrow.setReturndate(new Date());
		borrow.setRemark(borrow.getRemark());
		int falg=mybussiness.returnbook(borrow);
		if(falg==-1){
			this.addActionError("图书存在超期,请缴纳罚金后，在进行归还操作！");
			return "bookback";
		}else{
			
		}
		return "bookbacksuccess";
	}
}
