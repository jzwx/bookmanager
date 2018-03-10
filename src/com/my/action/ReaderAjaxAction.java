package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.ReaderBussiness;
import com.my.hibernate.Reader;
import com.opensymphony.xwork2.ActionSupport;

public class ReaderAjaxAction extends ActionSupport {
	private Reader reader;
	private ReaderBussiness mybussiness=new ReaderBussiness();
	private String jsonreader;
	public String getJsonreader() {
		return jsonreader;
	}


	public void setJsonreader(String jsonreader) {
		this.jsonreader = jsonreader;
	}
	
	public String search() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		String txtname=request.getParameter("name");
		String textdepartment=request.getParameter("textdepartment");
		txtname=new String(txtname.getBytes("iso-8859-1"),"gbk");
		textdepartment=new String(textdepartment.getBytes("iso-8859-1"),"gbk");
		System.out.println(txtname+" "+textdepartment);
		List list=mybussiness.find(txtname,textdepartment);
		System.out.println(list.size());
		StringBuffer strbuffer=new StringBuffer();
		strbuffer.append("{");
		strbuffer.append("rs:[");
		for(int i=0;i<list.size();i++){
			if(i==0){
				strbuffer.append("{");
			}else{
				strbuffer.append(",{");
			}
			Reader r=(Reader) list.get(i);
			strbuffer.append("id:"+r.getId());
			strbuffer.append(",name:'"+r.getName()+"'");
			strbuffer.append(",sex:'"+r.getSex()+"'");
			strbuffer.append(",phone:'"+r.getPhone()+"'");
			strbuffer.append(",department:'"+r.getDepartment()+"'");
			strbuffer.append(",rc:'"+r.getReadercategory().getName()+"'");
			strbuffer.append(",remark:'"+r.getRemark()+"'");
			strbuffer.append("}");
		}
		strbuffer.append("]");
		strbuffer.append("}");
		System.out.println(strbuffer);
		this.setJsonreader(strbuffer.toString());
		return "borrow";
	}
}
