package com.my.bussiness;

import java.awt.image.RescaleOp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.my.hibernate.Borrow;
import com.my.hibernate.Fine;
import com.my.hibernate.HibernateDAO;
import com.my.util.page;

public class FineBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	} 
	public List findByRid(Integer rid){
		List flist=new ArrayList();
		String strsql="select br,(datediff(curdate(),borrowdate)-reader.readercategory.maxperiod)*br.reader.readercategory.fineperday from Borrow as br where reader.id=? and returndate is null and datediff(curdate(),borrowdate)>reader.readercategory.maxperiod";
		List lstval=new ArrayList();
		lstval.add(rid);
		List list=mydao.find(strsql, lstval);
		System.out.println(list.size());
		Iterator it=list.iterator();
		while(it.hasNext()){
			Object res[]=(Object[]) it.next();
			System.out.println(res[0]+" "+res[1]);
			Fine f=new Fine();
			f.setBorrow((Borrow) res[0]);
			f.setFinenumber((Float) res[1]);
			flist.add(f);
		}
		return flist;
	}
	
	public void fineadd(Fine fine){
		mydao.fineadd(fine);
	}
}
