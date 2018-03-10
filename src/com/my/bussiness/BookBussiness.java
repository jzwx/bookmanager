package com.my.bussiness;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.FileUtils;

import com.my.hibernate.Book;
import com.my.hibernate.HibernateDAO;
import com.my.util.Util;
import com.my.util.page;

public class BookBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	}
	
	public List findAllbookcategory(){
		String strsql="from Bookcategory";
		List list=mydao.find(strsql);
		return list;
	}
	
	public int add(Book book,File picpath,String picpathFileName,String realpath){
		int falg=0;
		if(picpathFileName!=null&&!picpathFileName.equals("")){
			try {
				String newpicpathfilename=Util.generateFileName(picpathFileName);
				File tagetfile=new File(realpath+"/"+newpicpathfilename);
				FileUtils.copyFile(picpath, tagetfile);
				book.setPicpath(newpicpathfilename);
				mydao.save(book);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				falg=-1;
			}
		}
		return falg;	
	}
	
	public Book preupdate(int id){
		Book book=(Book) mydao.findById(Book.class.getName(), id);
		return book;
	}
	
	public int update(Book book,File picpath,String picpathFileName,String realpath){
		int falg=0;
		String strsql="from Book where isbn=? and id!=?";
		List lstval=new ArrayList();
		lstval.add(book.getIsbn());
		lstval.add(book.getId());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			if(picpathFileName!=null&&!picpathFileName.equals(""))
			{
				try {
					File oldfile=new File(realpath+"/"+book.getPicpath());
					if(oldfile.exists()){
						oldfile.delete();
					}
					String newpicpathfilename=Util.generateFileName(picpathFileName);
					File tagetFile=new File(realpath+"/"+newpicpathfilename);
					FileUtils.copyFile(picpath, tagetFile);
					book.setPicpath(newpicpathfilename);
					mydao.update(book);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					falg=-2;
				}
				
			}else
			{
				falg=0;
				book.setPicpath(book.getPicpath());
				mydao.update(book);
			}
		}else{
			falg=-1;
		}
		return falg;
	}
	
	public int delete(int id,String realpath){
		int falg=0;
		Book book=(Book) mydao.findById(Book.class.getName(), id);
		String strsql="from Borrow where book=?";
		List lstval=new ArrayList();
		lstval.add(book);
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			File oldFile=new File(realpath+"/"+book.getPicpath());
			if(oldFile.exists()){
				oldFile.delete();
			}
			mydao.delete(book);
			falg=0;
		}else{
			falg=-1;
		}
		return falg;
	}
	
	public Book tushu(int id){
		Book book=(Book) mydao.findById(Book.class.getName(), id);
		return book;
	}
	
	public List find(Book book,Date begindate,Date enddate,float minprice,float maxprice,page mypage){
		String strsql="from Book where 1=1";
		List lstval=new ArrayList();
		if(book.getName()!=null&&!book.getName().equals("")){
			strsql=strsql+" and name like ?";
			lstval.add("%"+book.getName()+"%");
		}
		if(book.getAuthor()!=null&&!book.getAuthor().equals("")){
			strsql=strsql+" and author like ?";
			lstval.add("%"+book.getAuthor()+"%");
		}
		if(book.getPubs()!=null&&!book.getPubs().equals("")){
			strsql=strsql+" and pubs like ?";
			lstval.add("%"+book.getPubs()+"%");
		}
		if(begindate!=null&&!begindate.equals("")){
			strsql=strsql+" and pubdate>=?";
			lstval.add(begindate);
		}
		if(enddate!=null&&!enddate.equals("")){
			strsql=strsql+" and pubdate<=?";
			lstval.add(enddate);
		}
		if(minprice!=0){
			strsql=strsql+" and price>=?";
			lstval.add(minprice);
		}
		if(maxprice!=0){
			strsql=strsql+" and price<=?";
			lstval.add(maxprice);
		}
		System.out.println(strsql);
		mypage.setStrsql(strsql, lstval);
		List list=mydao.find(mypage);
		return list;
	}
	
	public List findbook(String name,String author,String pubs,String s){
		String strsql="from Book where 1=1 and state='"+s+"'";
		List lstval=new ArrayList();
		if(name!=null&&!name.equals("")){
			strsql=strsql+" and name like ?";
			lstval.add("%"+name+"%");
		}
		if(author!=null&&!author.equals("")){
			strsql=strsql+" and author like ?";
			lstval.add("%"+author+"%");
		}
		if(pubs!=null&&!pubs.equals("")){
			strsql=strsql+" and pubs like ?";
			lstval.add("%"+pubs+"%");
		}
		List list=mydao.find(strsql, lstval);
		return list;
	}
}
