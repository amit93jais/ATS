package com.ats.jpa.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the receipt database table.
 * 
 */
@Entity
@NamedQuery(name="Receipt.findAll", query="SELECT r FROM Receipt r")
public class Receipt implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int receiptNo;

	@Temporal(TemporalType.DATE)
	private Date conractTo;

	private String conractType;

	private int contractAmount;

	@Temporal(TemporalType.DATE)
	private Date contractFrom;

	private String remarks;

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="fk_customerId")
	private Customer customer;

	//bi-directional many-to-one association to Service
	@OneToMany(mappedBy="receipt", cascade=CascadeType.ALL)
	private List<Service> services;

	public Receipt() {
	}

	public int getReceiptNo() {
		return this.receiptNo;
	}

	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}

	public Date getConractTo() {
		return this.conractTo;
	}

	public void setConractTo(Date conractTo) {
		this.conractTo = conractTo;
	}

	public String getConractType() {
		return this.conractType;
	}

	public void setConractType(String conractType) {
		this.conractType = conractType;
	}

	public int getContractAmount() {
		return this.contractAmount;
	}

	public void setContractAmount(int contractAmount) {
		this.contractAmount = contractAmount;
	}

	public Date getContractFrom() {
		return this.contractFrom;
	}

	public void setContractFrom(Date contractFrom) {
		this.contractFrom = contractFrom;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Service> getServices() {
		return this.services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	public Service addService(Service service) {
		getServices().add(service);
		service.setReceipt(this);

		return service;
	}

	public Service removeService(Service service) {
		getServices().remove(service);
		service.setReceipt(null);

		return service;
	}

}