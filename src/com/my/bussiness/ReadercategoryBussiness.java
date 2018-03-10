package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;

import com.my.hibernate.HibernateDAO;
import com.my.hibernate.Readercategory;
import com.my.util.page;

public class ReadercategoryBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	}
	
	public int add(Readercategory readercategory){
		int falg=0;
		String strsql="from Readercategory where name=?";
		List lstval=new ArrayList();
		lstval.add(readercategory.getName());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			mydao.save(readercategory);
			falg=0;
		}else{
			falg=-1;
		}
		return falg;
	}
	
	public Readercategory preupdate(int id){
		Readercategory readercategory=(Readercategory) mydao.findById(Readercategory.class.getName(), id);
		return readercategory;
	}
	
	public int update(Readercategory readercategory){
		int falg=0;
		String strsql="from Readercategory where name=? and id!=?";
		List lstval=new ArrayList();
		lstval.add(readercategory.getName());
		lstval.add(readercategory.getId());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			mydao.update(readercategory);
			falg=0;
		}else{
			falg=-1;
		}
		return falg;
	}
}
