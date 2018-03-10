package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;

import com.my.hibernate.Borrow;
import com.my.hibernate.HibernateDAO;
import com.my.util.page;

public class ReturnBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	}
	
	public Borrow getBorrowById(int id){
		String strsql="from Borrow where book.id=? and returndate is null";
		List lstval=new ArrayList();
		lstval.add(id);
		List list=mydao.find(strsql, lstval);
		if(list!=null&&list.size()>0){
			return (Borrow) list.get(0);
		}else{
			return null;
		}
	}
	
	public int returnbook(Borrow borrow){
		String strsql="from Borrow where reader.id=? and datediff(curdate(),borrowdate)>reader.readercategory.maxperiod and returndate is null";
		List lstval=new ArrayList();
		lstval.add(borrow.getReader().getId());
		List list=mydao.find(strsql, lstval);
		if(!list.isEmpty()){
			return -1;	
		}else{
			mydao.returnbook(borrow);
			return 0;
		}
	}
}
