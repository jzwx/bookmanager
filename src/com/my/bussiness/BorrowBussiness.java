package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;
import com.my.hibernate.Borrow;
import com.my.hibernate.HibernateDAO;
import com.my.util.page;

public class BorrowBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	}
	
	public int borrowbook(Borrow borrow){
		String strsql="from Borrow where reader.id=? and datediff(curdate(),borrowdate)>reader.readercategory.maxperiod and returndate is null";
		List lstval=new ArrayList();
		lstval.add(borrow.getReader().getId());
		List list=mydao.find(strsql, lstval);
		if(!list.isEmpty()){
			return -1;
		}
		strsql="from Reader where id=? and (select count(*) from Borrow where reader.id=? and returndate is null)>=readercategory.maxborrownumber";
		List lstval2=new ArrayList();
		lstval2.add(borrow.getReader().getId());
		lstval2.add(borrow.getReader().getId());
		List list2=mydao.find(strsql, lstval2);
		if(!list2.isEmpty()){
			return -2;
		}
		mydao.borrowbook(borrow);
		return 0;
	}
}
