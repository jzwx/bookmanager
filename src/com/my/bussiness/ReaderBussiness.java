package com.my.bussiness;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.my.hibernate.HibernateDAO;
import com.my.hibernate.Reader;
import com.my.util.Util;
import com.my.util.page;

public class ReaderBussiness {
	private HibernateDAO mydao=new HibernateDAO();
	public List findAll(page mypage){
		List list=mydao.find(mypage);
		return list;
	}
	
	public List findAllreadercategory(){
		String strsql="from Readercategory";
		List list=mydao.find(strsql);
		return list;
	}
	
	public int add(Reader reader,File photopath,String photopathFileName,String realpath){
		int falg=0;
		if(photopathFileName!=null&&!photopathFileName.equals("")){
			try {
				String newfilename=Util.generateFileName(photopathFileName);
				File file=new File(realpath+"/"+newfilename);
				FileUtils.copyFile(photopath, file);
				reader.setPhotopath(newfilename);
				mydao.save(reader);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				falg=-1;
			}
		}
		return falg;
	}
	
	public Reader preupdate(int id){
		Reader reader=(Reader) mydao.findById(Reader.class.getName(), id);
		return reader;
	}
	
	public int update(Reader reader,File photopath,String photopathFileName,String realpath){
		int falg=0;
		if(photopathFileName!=null&&!photopathFileName.equals("")){
			try{
				File oldfile=new File(realpath+"/"+reader.getPhotopath());
				if(oldfile.exists()){
					oldfile.delete();
				}
				String newphotopathFileName=Util.generateFileName(photopathFileName);
				File newfile=new File(realpath+"/"+newphotopathFileName);
				FileUtils.copyFile(photopath, newfile);
				reader.setPhotopath(newphotopathFileName);
				mydao.update(reader);
			}catch(Exception e){
				e.printStackTrace();
				falg=-1;
			}
		}else{
			falg=0;
			reader.setPhotopath(reader.getPhotopath());
			mydao.update(reader);
			System.out.println(falg);
		}
		return falg;
	}
	
	public int delete(int id,String realpath){
		int falg=0;
		Reader reader=(Reader) mydao.findById(Reader.class.getName(), id);
		String strsql="from Borrow where reader=?";
		List lstval=new ArrayList();
		lstval.add(reader);
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			File oldfile=new File(realpath+"/"+reader.getPhotopath());
			if(oldfile.exists()){
				oldfile.delete();
			}
			mydao.delete(reader);
			falg=0;
		}else{
			falg=-1;
		}
		return falg;
	}
	
	public List find(String txtname,String textdepartment){
		String strsql="from Reader where 1=1";
		List lstval=new ArrayList();
		if(txtname!=null&&!txtname.equals("")){
			strsql=strsql+" and name like ?";
			lstval.add("%"+txtname+"%");
		}
		if(textdepartment!=null&&!textdepartment.equals("")){
			strsql=strsql+" and department like ?";
			lstval.add("%"+textdepartment+"%");
		}
		List list=mydao.find(strsql, lstval);
		return list;
	}
}
