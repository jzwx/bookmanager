package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;

import com.my.hibernate.Bookcategory;
import com.my.hibernate.HibernateDAO;
import com.my.hibernate.Userinfo;
import com.my.util.page;

public class BookcategoryBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	}
	
	public int delete(int id){
		int falg=0;
		String strsql="from Book where bookcategory=?";
		Bookcategory bc=(Bookcategory) mydao.findById(Bookcategory.class.getName(), id);
		List lstval=new ArrayList();
		lstval.add(bc);
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			mydao.delete(bc);
			falg=0;
		}else{
			falg=-1;
		}
		return falg;
		
	}
	
	public Bookcategory preupdate(int id){
		Bookcategory bc=(Bookcategory) mydao.findById(Bookcategory.class.getName(), id);
		return bc;
	}
	
	public int update(Bookcategory bc){
		int falg=0;
		String strsql="from Bookcategory where name=? and id!=?";
		List lstval=new ArrayList();
		lstval.add(bc.getName());
		lstval.add(bc.getId());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			falg=0;
			mydao.update(bc);
		}else{
			falg=-1;
		}
		return falg;
	}
	
	public int add(Bookcategory bc){
		int falg=0;
		String strsql="from Bookcategory where name=?";
		List lstval=new ArrayList();
		lstval.add(bc.getName());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			mydao.save(bc);
			falg=0;
		}else{
			falg=-1;
		}
		return falg;
	}
//	public static void main(String args[]){
//		BookcategoryBussiness m=new BookcategoryBussiness();
//		List list=m.findAll();
//		System.out.println(list.size());
//	}
}
