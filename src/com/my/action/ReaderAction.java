package com.my.action;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.ReaderBussiness;
import com.my.hibernate.Reader;
import com.my.util.page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ReaderAction extends ActionSupport {
	private Reader reader;
	private ReaderBussiness myBussiness=new ReaderBussiness();
	
	private File photopath;
	private String photopathContentType;
	private String photopathFileName;
	
	
	public File getPhotopath() {
		return photopath;
	}
	public void setPhotopath(File photopath) {
		this.photopath = photopath;
	}
	public String getPhotopathContentType() {
		return photopathContentType;
	}
	public void setPhotopathContentType(String photopathContentType) {
		this.photopathContentType = photopathContentType;
	}
	public String getPhotopathFileName() {
		return photopathFileName;
	}
	public void setPhotopathFileName(String photopathFileName) {
		this.photopathFileName = photopathFileName;
	}
	public Reader getReader() {
		return reader;
	}
	public void setReader(Reader reader) {
		this.reader = reader;
	}
	
	public String findAll() throws Exception{
		page mypage=new page();
		mypage.setStrsql("from Reader");
		mypage.setPagename("readerpage");
		mypage.setLstname("readerlist");
		mypage.setResultname("readershow");
		ActionContext.getContext().getSession().put(mypage.getPagename(), mypage);
		List list=myBussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		return mypage.getResultname();
	}
	
	public String findAllreadercategory() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		List list=myBussiness.findAllreadercategory();
		request.setAttribute("lstlist", list);
		return "readeradd";
	}
	
	public String add() throws Exception{
//		System.out.println(photopath);
//		System.out.println(photopathContentType);
//		System.out.println(photopathFileName);
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
//		System.out.println(realpath);
		int falg=myBussiness.add(reader,photopath,photopathFileName,realpath);
		if(falg==-1){
			this.addFieldError("reader.name", "文件上传失败!");
			return findAllreadercategory();
		}else{
			return "readeraddsuccess";
		}
	}
	
	public String preupdate() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		reader=myBussiness.preupdate(id);
		List list=myBussiness.findAllreadercategory();
		request.setAttribute("lstrd", list);
		return "readerpreupdate";
	}
	
	public String update() throws Exception{
		String 	realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println(reader.getId()+" "+reader.getName()+" "+reader.getPhone());
		int falg=myBussiness.update(reader,photopath,photopathFileName,realpath);
		if(falg==-1){
			this.addFieldError("reader.name", "照片上传失败,请重新选择照片!");
			List list=myBussiness.findAllreadercategory();
			request.setAttribute("lstrd", list);
			return "readerpreupdate";
		}else{
			return "readerupdatesuccess";
		}
	}
	
	public String delete() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		int falg=myBussiness.delete(id,realpath);
		if(falg==-1){
			this.addActionError("图书借阅信息中存在该读者信息,请删除后再进行操作!");
			return findAll();
		}else{
			return "readerdeletesuccess";
		}
	}
}