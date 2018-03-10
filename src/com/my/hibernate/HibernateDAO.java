package com.my.hibernate;

import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.my.util.page;

public class HibernateDAO {
	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	
	public void save(Object transientInstance) {
		Session session=getSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			session.save(transientInstance);
			tx.commit();
		} catch (RuntimeException re) {
			if(tx!=null) tx.rollback();
			throw re;
		}finally{
			session.close();
		}
	}
	
	public List find(String strsql,List lstval){
		List list=null;
		Session session=getSession();
		try{
			Query qo=session.createQuery(strsql);
			for(int i=0;i<lstval.size();i++){
				qo.setParameter(i, lstval.get(i));
			}
			list=qo.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	
	public List find(page mypage){
		List list=null;
		Session session=getSession();
		try{
			Query qo=session.createQuery(mypage.getStrsql());
			if(mypage.getLstval()!=null&&!mypage.getLstval().isEmpty()){
				for(int i=0;i<mypage.getLstval().size();i++){
					qo.setParameter(i, mypage.getLstval().get(i));
				}
			}
			qo.setFirstResult(mypage.getCurrentrecord());
			qo.setMaxResults(mypage.getPagesize());
			list=qo.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	
	public Object findById(String classname,Integer id) {
		Object object=null;
		Session session=getSession();
		try {
			object=session.get(classname, id);
		} catch (RuntimeException re) {
			throw re;
		}finally{
			session.close();
		}
		return object;
	}
	
	public List find(String strsql){
		List list=null;
		Session session=getSession();
		try{
			Query qo=session.createQuery(strsql);
			list=qo.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public void update(Object transientInstance) {
		Session session=getSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			session.update(transientInstance);
			tx.commit();
		} catch (RuntimeException re) {
			if(tx!=null) tx.rollback();
			throw re;
		}finally{
			session.close();
		}
	}
	
	public void delete(Object transientInstance) {
		Session session=getSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			session.delete(transientInstance);
			tx.commit();
		} catch (RuntimeException re) {
			if(tx!=null) tx.rollback();
			throw re;
		}finally{
			session.close();
		}
	}
	
	public void borrowbook(Borrow borrow){
		Session session=getSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			session.save(borrow);
			Book b=(Book) session.get(Book.class.getName(), borrow.getBook().getId());
			b.setState("ря╫Х");
			session.update(b);
			tx.commit();
		} catch (RuntimeException re) {
			if(tx!=null) tx.rollback();
			throw re;
		}finally{
			session.close();
		}
	}
	
	public void returnbook(Borrow bo) {
		Session session=getSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			session.update(bo);
			Book b=(Book) session.get(Book.class.getName(), bo.getBook().getId());
			b.setState("©и╫Х");
			session.update(b);
			tx.commit();
		} catch (RuntimeException re) {
			if(tx!=null) tx.rollback();
			throw re;
		}finally{
			session.close();
		}
	}
	
	public void fineadd(Fine fine){
		Session session=getSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			session.save(fine);
			Borrow borrow=(Borrow) session.get(Borrow.class.getName(), fine.getBorrow().getReader().getId());
			borrow.setReturndate(new Date());
			session.update(borrow);
			Book book=(Book) session.get(Book.class.getName(), fine.getBorrow().getBook().getId());
			book.setState("©и╫Х");
			session.update(book);
			tx.commit();
		} catch (RuntimeException re) {
			if(tx!=null) tx.rollback();
			throw re;
		}finally{
			session.close();
		}
	}
//	public static void main(String args[]){
//		HibernateDAO mydao=new HibernateDAO();
//		Userinfo u=new Userinfo();
//		u.setUsername("bbb");
//		u.setPassword("222");
//		mydao.save(u);
//		List lstval=new ArrayList();
//		lstval.add("aaa");
//		lstval.add("111");
//		List list=mydao.find("from Userinfo where username=? and password=?", lstval);
//		if(list.isEmpty()){
//			System.out.println("error");
//		}else{
//			System.out.println("ok");
//		}
//		Userinfo u=(Userinfo) mydao.findById(Userinfo.class.getName(), 1);
//		u.setUsername("ccc");
//		u.setPassword("666");
//		mydao.update(u);
		
		//List list=mydao.find("from Userinfo");
		//System.out.println(list.size());
//	}
}
