package com.my.action;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.UserinfoBussiness;
import com.my.hibernate.HibernateDAO;
import com.my.hibernate.Userinfo;
import com.my.util.page;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserinfoAction extends ActionSupport {
	private Userinfo user;
//	private HibernateDAO mydao=new HibernateDAO();
	private UserinfoBussiness mybBussiness=new UserinfoBussiness();
	public Userinfo getUser() {
		return user;
	}
	public void setUser(Userinfo user) {
		this.user = user;
	}
	
	public String login() throws Exception{
//		List lstval=new ArrayList();
//		lstval.add(user.getUsername());
//		String strsql="from Userinfo where username=?";
//		List list=mydao.find(strsql, lstval);
//		if(list.isEmpty()){
//			this.addFieldError("user.username", "用户名不存在!");
//			return "error";
//		}else{
//			lstval.add(user.getPassword());
//			strsql="from Userinfo where username=? and password=?";
//			list=mydao.find(strsql, lstval);
//			if(list.isEmpty()){
//				this.addFieldError("user.password", "密码错误");
//				return "error";
//			}else{
//				return "success";
//			}
//		}
		int flag=0;
		flag=mybBussiness.login(user);
		if(flag==-2){
			this.addFieldError("user.username", "用户名不存在!");
			return "error";
		}else{
			if(flag==-1){
				this.addFieldError("user.password", "密码错误!");
				return "error";
			}else{
				ActionContext.getContext().getSession().put("ui", mybBussiness.findByName(user.getUsername()));
				return "success";
			}
		}
	}
	
	public String add() throws Exception{
		int flag=mybBussiness.add(user);
		if(flag==-1){
			this.addFieldError("user.username", "用户名存在,请重新输入!");
			return "userinfoadd";
		}else{
			return "addsuccess";
		}
	}
	
	public String findAll() throws Exception{
		page mypage=new page();
		mypage.setStrsql("from Userinfo");
		mypage.setPagename("userinfopage");
		mypage.setLstname("userinfolist");
		mypage.setResultname("userinfoshow");
		ActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		List list=mybBussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		return mypage.getResultname();
	}
	
	public String delete() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		mybBussiness.delete(id);
		return "deletesuccess";
	}
	
	public String preupdate() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		user=mybBussiness.preupdate(id);
		return "userinfopreupdate";
	}
	
	public String update() throws Exception{
		int falg=mybBussiness.update(user);
		if(falg==-1){
			this.addFieldError("user.username", "用户名存在,请重新输入!");
			return "userinfopreupdate";
		}else{
			return "userupdatesuccess";
		}
	}
	
	public String logout() throws Exception{
		ActionContext.getContext().getSession().remove("ui");
		return "error";
	}
}
