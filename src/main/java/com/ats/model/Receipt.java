package com.ats.model;

import java.util.Date;
import java.util.List;

public class Receipt {
	public int getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}

	public Date getConractTo() {
		return conractTo;
	}

	public void setConractTo(Date conractTo) {
		this.conractTo = conractTo;
	}

	public String getConractType() {
		return conractType;
	}

	public void setConractType(String conractType) {
		this.conractType = conractType;
	}

	public int getContractAmount() {
		return contractAmount;
	}

	public void setContractAmount(int contractAmount) {
		this.contractAmount = contractAmount;
	}

	public Date getContractFrom() {
		return contractFrom;
	}

	public void setContractFrom(Date contractFrom) {
		this.contractFrom = contractFrom;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Service> getServices() {
		return services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	private int receiptNo;

	private Date conractTo;

	private String conractType;

	private int contractAmount;

	private Date contractFrom;

	private String remarks;

	private Customer customer;

	private List<Service> services;

	

}