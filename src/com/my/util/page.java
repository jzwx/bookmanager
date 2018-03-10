package com.my.util;

import java.util.List;

import com.my.hibernate.HibernateDAO;

public class page {
	private String strsql;
	private List lstval;
	private int recordnum;
	private HibernateDAO mydao=new HibernateDAO();
	private int pagesize=2;//每页显示的记录数
	private int pagenum;//总页数
	private int currentpage=1;//当前页
	private int currentrecord;//当前记录数
	private String pagename;
	private String resultname;
	private String lstname;
	
	
	public String getPagename() {
		return pagename;
	}
	public void setPagename(String pagename) {
		this.pagename = pagename;
	}
	public String getResultname() {
		return resultname;
	}
	public void setResultname(String resultname) {
		this.resultname = resultname;
	}
	public String getLstname() {
		return lstname;
	}
	public void setLstname(String lstname) {
		this.lstname = lstname;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		if(recordnum%pagesize==0){
			this.setPagenum(recordnum/pagesize);
		}else{
			this.setPagenum(recordnum/pagesize+1);
		}
		this.pagesize = pagesize;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		if(currentpage<=0){
			currentpage=1;
		}
		if(currentpage>pagenum){
			currentpage=pagenum;
		}
		this.setCurrentrecord((currentpage-1)*pagesize);
		this.currentpage = currentpage;
	}
	public int getCurrentrecord() {
		return currentrecord;
	}
	public void setCurrentrecord(int currentrecord) {
		this.currentrecord = currentrecord;
	}
	public String getStrsql() {
		return strsql;
	}
	public void setStrsql(String strsql) {
		//this.strsql = strsql;
		this.setStrsql(strsql, null);
	}
	
	public void setStrsql(String strsql,List lstval) {
		String strsqlcount="select count(*)"+strsql.substring(strsql.indexOf("from"),strsql.length());//找到书的总页数
		System.out.println(strsqlcount);
		if(lstval==null||lstval.isEmpty()){
			List list=mydao.find(strsqlcount);
			this.setRecordnum(Integer.parseInt(list.get(0).toString()));
		}else{
			List list=mydao.find(strsqlcount, lstval);
			this.setRecordnum(Integer.parseInt(list.get(0).toString()));
		}
		this.setLstval(lstval);
		this.strsql = strsql;
	}
	
	public List getLstval() {
		return lstval;
	}
	public void setLstval(List lstval) {
		this.lstval = lstval;
	}
	
	public int getRecordnum() {
		return recordnum;
	}
	public void setRecordnum(int recordnum) {
		if(recordnum%pagesize==0){
			this.setPagenum(recordnum/pagesize);
		}else{
			this.setPagenum(recordnum/pagesize+1);
		}
		this.recordnum = recordnum;
	}
	
	public String getToolBar(){
		StringBuffer strtool=new StringBuffer();
		strtool.append("<form action='page' method='post' >");
		strtool.append("共"+this.getPagenum()+"页&nbsp;&nbsp;");
		strtool.append("第"+this.getCurrentpage()+"页&nbsp;&nbsp;");
		strtool.append("共"+this.getRecordnum()+"条记录&nbsp;&nbsp;");
		strtool.append("<input type='hidden' name='currentpage' value='"+this.getCurrentpage()+"' />");
		strtool.append("<input type='hidden' name='pagename' value='"+this.getPagename()+"' />");
		if(this.getCurrentpage()==1){
			strtool.append("<input type='button' value='首页' disabled/>");
			strtool.append("<input type='button' value='上一页' disabled/>");
		}else{
			strtool.append("<input type='button' value='首页' onclick='this.form.currentpage.value=1;this.form.submit();'/>");
			strtool.append("<input type='button' value='上一页' onclick='this.form.currentpage.value=eval(this.form.currentpage.value)-1;this.form.submit();'/>");
		}
		if(this.getCurrentpage()==this.getPagenum()){
			strtool.append("<input type='button' value='下一页' disabled/>");
			strtool.append("<input type='button' value='末页' disabled/>");
		}else{
			strtool.append("<input type='button' value='下一页' onclick='this.form.currentpage.value=eval(this.form.currentpage.value)+1;this.form.submit();'/>");
			strtool.append("<input type='button' value='末页' onclick='this.form.currentpage.value="+this.getPagenum()+";this.form.submit();'/>");
		}
		strtool.append("<input type='text' name='jumppage' size='5'/>");
		strtool.append("<input type='button' value='跳转' onclick='this.form.currentpage.value=this.form.jumppage.value;this.form.submit();'/>");
		strtool.append("</form>");
		return strtool.toString();
	}
	
	public static void main(String args[]){
		page mypage=new page();
		mypage.setStrsql("from Book");
		mypage.setCurrentpage(4);
		System.out.println(mypage.getRecordnum());
		System.out.println(mypage.getToolBar());
	}
}
