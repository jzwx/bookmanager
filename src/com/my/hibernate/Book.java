package com.my.hibernate;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */

public class Book implements java.io.Serializable {

	// Fields

	private Integer id;
	private Bookcategory bookcategory;
	private String name;
	private String author;
	private String pubs;
	private Date pubdate;
	private Float price;
	private String isbn;
	private String state;
	private String picpath;
	private String remark;
	private Set borrows = new HashSet(0);

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(Bookcategory bookcategory, String name, String author,
			String pubs, Date pubdate, Float price, String isbn, String state,
			String picpath, String remark, Set borrows) {
		this.bookcategory = bookcategory;
		this.name = name;
		this.author = author;
		this.pubs = pubs;
		this.pubdate = pubdate;
		this.price = price;
		this.isbn = isbn;
		this.state = state;
		this.picpath = picpath;
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

	public Bookcategory getBookcategory() {
		return this.bookcategory;
	}

	public void setBookcategory(Bookcategory bookcategory) {
		this.bookcategory = bookcategory;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPubs() {
		return this.pubs;
	}

	public void setPubs(String pubs) {
		this.pubs = pubs;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPicpath() {
		return this.picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
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