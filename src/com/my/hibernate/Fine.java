package com.my.hibernate;

/**
 * Fine entity. @author MyEclipse Persistence Tools
 */

public class Fine implements java.io.Serializable {

	// Fields

	private Integer id;
	private Borrow borrow;
	private Userinfo userinfo;
	private Float finenumber;
	private String remark;

	// Constructors

	/** default constructor */
	public Fine() {
	}

	/** full constructor */
	public Fine(Borrow borrow, Userinfo userinfo, Float finenumber,
			String remark) {
		this.borrow = borrow;
		this.userinfo = userinfo;
		this.finenumber = finenumber;
		this.remark = remark;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Borrow getBorrow() {
		return this.borrow;
	}

	public void setBorrow(Borrow borrow) {
		this.borrow = borrow;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Float getFinenumber() {
		return this.finenumber;
	}

	public void setFinenumber(Float finenumber) {
		this.finenumber = finenumber;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}