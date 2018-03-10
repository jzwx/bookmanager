package com.my.hibernate;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Borrow entity. @author MyEclipse Persistence Tools
 */

public class Borrow implements java.io.Serializable {

	// Fields

	private Integer id;
	private Reader reader;
	private Book book;
	private Date borrowdate;
	private Date returndate;
	private String remark;
	private Set fines = new HashSet(0);

	// Constructors

	/** default constructor */
	public Borrow() {
	}

	/** full constructor */
	public Borrow(Reader reader, Book book, Date borrowdate, Date returndate,
			String remark, Set fines) {
		this.reader = reader;
		this.book = book;
		this.borrowdate = borrowdate;
		this.returndate = returndate;
		this.remark = remark;
		this.fines = fines;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Reader getReader() {
		return this.reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Date getBorrowdate() {
		return this.borrowdate;
	}

	public void setBorrowdate(Date borrowdate) {
		this.borrowdate = borrowdate;
	}

	public Date getReturndate() {
		return this.returndate;
	}

	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set getFines() {
		return this.fines;
	}

	public void setFines(Set fines) {
		this.fines = fines;
	}

}