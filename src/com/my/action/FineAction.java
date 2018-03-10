package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.FineBussiness;
import com.my.hibernate.Fine;
import com.my.hibernate.Userinfo;
import com.my.util.page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FineAction extends ActionSupport {
	private Fine fine;
	private FineBussiness mybussiness=new FineBussiness();
	
	
	public Fine getFine() {
		return fine;
	}

	public void setFine(Fine fine) {
		this.fine = fine;
	}

	public String findAll() throws Exception{
		String strsql="from Fine";
		page mypage=new page();
		mypage.setStrsql(strsql);
		mypage.setPagename("finepage");
		mypage.setLstname("finelist");
		mypage.setResultname("fineshow");
		ServletActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		List list=mybussiness.findAll(mypage);
		request.setAttribute(mypage.getLstname(), list);
		return mypage.getResultname();
	}
	
	public String findByRid() throws Exception{
		System.out.println(fine.getBorrow().getReader().getId());
		List list=mybussiness.findByRid(fine.getBorrow().getReader().getId());
		if(list.isEmpty()){
			this.addActionError("该同学没有过期图书记录！");
			return "fine";
		}else{
			ServletActionContext.getRequest().setAttribute("list", list);
			return "fine";
		}
	}
	
	public String fineadd() throws Exception{
		Userinfo ui=(Userinfo) ActionContext.getContext().getSession().get("ui");
		fine.setUserinfo(ui);
		mybussiness.fineadd(fine);
		List list=mybussiness.findByRid(fine.getBorrow().getReader().getId());
		if(list.isEmpty()){
			return "fineaddsuccess";
		}else{
			ServletActionContext.getRequest().setAttribute("list", list);
			return "fine";
		}
	}
}
