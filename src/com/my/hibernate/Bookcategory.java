package com.my.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Bookcategory entity. @author MyEclipse Persistence Tools
 */

public class Bookcategory implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String remark;
	private Set books = new HashSet(0);

	// Constructors

	/** default constructor */
	public Bookcategory() {
	}

	/** full constructor */
	public Bookcategory(String name, String remark, Set books) {
		this.name = name;
		this.remark = remark;
		this.books = books;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set getBooks() {
		return this.books;
	}

	public void setBooks(Set books) {
		this.books = books;
	}

}