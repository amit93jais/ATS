package com.ats.model;

import java.util.Date;

public class Service {
	private int workId;

	private int amountCharged;

	private String customerRemarks;

	private String partsReplaced;

	private Date visitDate;

	private String workDetails;

	private Receipt receipt;

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public int getAmountCharged() {
		return amountCharged;
	}

	public void setAmountCharged(int amountCharged) {
		this.amountCharged = amountCharged;
	}

	public String getCustomerRemarks() {
		return customerRemarks;
	}

	public void setCustomerRemarks(String customerRemarks) {
		this.customerRemarks = customerRemarks;
	}

	public String getPartsReplaced() {
		return partsReplaced;
	}

	public void setPartsReplaced(String partsReplaced) {
		this.partsReplaced = partsReplaced;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public String getWorkDetails() {
		return workDetails;
	}

	public void setWorkDetails(String workDetails) {
		this.workDetails = workDetails;
	}

	public Receipt getReceipt() {
		return receipt;
	}

	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}
	
	
}
