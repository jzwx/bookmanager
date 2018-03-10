package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;

import com.my.hibernate.HibernateDAO;
import com.my.hibernate.Userinfo;
import com.my.util.page;

public class UserinfoBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	public int login(Userinfo user){
		int flag=0;
		List lstval=new ArrayList();
		lstval.add(user.getUsername());
		String strsql="from Userinfo where username=?";
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			flag=-2;
		}else{
			lstval.add(user.getPassword());
			strsql="from Userinfo where username=? and password=?";
			list=mydao.find(strsql, lstval);
			if(list.isEmpty()){
				flag=-1;
			}
		}
		return flag;
	}
	
	public int add(Userinfo user){
		int flag=0;
		String strsql="from Userinfo where username=?";
		List lstval=new ArrayList();
		lstval.add(user.getUsername());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			mydao.save(user);
			flag=0;
		}else{
			flag=-1;
		}
		return flag;
	}
	
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	}
	
	public void delete(int id){
		Userinfo user=new Userinfo();
		user=(Userinfo) mydao.findById(Userinfo.class.getName(), id);
		mydao.delete(user);
	}
	
	public Userinfo preupdate(int id){
		Userinfo user=new Userinfo();
		user=(Userinfo) mydao.findById(Userinfo.class.getName(), id);
		return user;
	}
	
	public int update(Userinfo user){
		int falg=0;
		String strsql="from Userinfo where username=? and id!=?";
		List lstval=new ArrayList();
		lstval.add(user.getUsername());
		lstval.add(user.getId());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			falg=0;
			mydao.update(user);
		}else{
			falg=-1;
		}
		return falg;
	}
	
	public Userinfo findByName(String username){
		String strsql="from Userinfo where username=?";
		List lstval=new ArrayList();
		lstval.add(username);
		List list=mydao.find(strsql, lstval);
		if(list!=null&&list.size()>0){
			return (Userinfo)list.get(0);
		}else{
			return null;
		}
	}
//	public static void main(String args[]){
//		Userinfo user=new Userinfo();
//		user.setUsername("ccc");
//		user.setPassword("666");
//		UserinfoBussiness mybBussiness=new UserinfoBussiness();
//		System.out.println(mybBussiness.login(user));
		
//		user=mybBussiness.preupdate(2);
//		System.out.println(user.getUsername()+" "+user.getPassword());
//	}
	
}
