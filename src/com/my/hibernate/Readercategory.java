package com.my.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Readercategory entity. @author MyEclipse Persistence Tools
 */

public class Readercategory implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer maxperiod;
	private Integer maxborrownumber;
	private Float fineperday;
	private String remark;
	private Set readers = new HashSet(0);

	// Constructors

	/** default constructor */
	public Readercategory() {
	}

	/** full constructor */
	public Readercategory(String name, Integer maxperiod,
			Integer maxborrownumber, Float fineperday, String remark,
			Set readers) {
		this.name = name;
		this.maxperiod = maxperiod;
		this.maxborrownumber = maxborrownumber;
		this.fineperday = fineperday;
		this.remark = remark;
		this.readers = readers;
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

	public Integer getMaxperiod() {
		return this.maxperiod;
	}

	public void setMaxperiod(Integer maxperiod) {
		this.maxperiod = maxperiod;
	}

	public Integer getMaxborrownumber() {
		return this.maxborrownumber;
	}

	public void setMaxborrownumber(Integer maxborrownumber) {
		this.maxborrownumber = maxborrownumber;
	}

	public Float getFineperday() {
		return this.fineperday;
	}

	public void setFineperday(Float fineperday) {
		this.fineperday = fineperday;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set getReaders() {
		return this.readers;
	}

	public void setReaders(Set readers) {
		this.readers = readers;
	}

}