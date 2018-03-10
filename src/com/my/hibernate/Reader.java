package com.my.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Reader entity. @author MyEclipse Persistence Tools
 */

public class Reader implements java.io.Serializable {

	// Fields

	private Integer id;
	private Readercategory readercategory;
	private String name;
	private String sex;
	private String phone;
	private String department;
	private String photopath;
	private String remark;
	private Set borrows = new HashSet(0);

	// Constructors

	/** default constructor */
	public Reader() {
	}

	/** full constructor */
	public Reader(Readercategory readercategory, String name, String sex,
			String phone, String department, String photopath, String remark,
			Set borrows) {
		this.readercategory = readercategory;
		this.name = name;
		this.sex = sex;
		this.phone = phone;
		this.department = department;
		this.photopath = photopath;
		this.remark = remark;
		this.borrows = borrows;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Readercategory getReadercategory() {
		return this.readercategory;
	}

	public void setReadercategory(Readercategory readercategory) {
		this.readercategory = readercategory;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPhotopath() {
		return this.photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set getBorrows() {
		return this.borrows;
	}

	public void setBorrows(Set borrows) {
		this.borrows = borrows;
	}

}