package com.ats.jpa.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the service database table.
 * 
 */
@Entity
@NamedQuery(name="Service.findAll", query="SELECT s FROM Service s")
public class Service implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int workId;

	private int amountCharged;

	private String customerRemarks;

	private String partsReplaced;

	@Temporal(TemporalType.DATE)
	private Date visitDate;

	private String workDetails;

	//bi-directional many-to-one association to Receipt
	@ManyToOne
	@JoinColumn(name="fk_receiptno")
	private Receipt receipt;

	public Service() {
	}

	public int getWorkId() {
		return this.workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public int getAmountCharged() {
		return this.amountCharged;
	}

	public void setAmountCharged(int amountCharged) {
		this.amountCharged = amountCharged;
	}

	public String getCustomerRemarks() {
		return this.customerRemarks;
	}

	public void setCustomerRemarks(String customerRemarks) {
		this.customerRemarks = customerRemarks;
	}

	public String getPartsReplaced() {
		return this.partsReplaced;
	}

	public void setPartsReplaced(String partsReplaced) {
		this.partsReplaced = partsReplaced;
	}

	public Date getVisitDate() {
		return this.visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public String getWorkDetails() {
		return this.workDetails;
	}

	public void setWorkDetails(String workDetails) {
		this.workDetails = workDetails;
	}

	public Receipt getReceipt() {
		return this.receipt;
	}

	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}

}