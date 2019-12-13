package com.ats.service;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import com.ats.dao.DBUtils;
import com.ats.dao.DBUtils.ResultType;
import com.ats.model.Customer;
import com.ats.model.Receipt;

public class ContractExpiredService {
	@SuppressWarnings("unchecked")
	
	public List<Customer> getCustomerWhoseContractExpired(){
		/*String queryString = "Select distinct c From Customer c JOIN c.receipts r "
				+ "where r.conractTo < :start group by c.customerId";*/
		
		String queryString = "Select distinct c From Customer c JOIN c.receipts r "
				+ "where (Select max(r1.conractTo) from c.receipts r1 group by c.customerId)"
				+ " < :start group by c.customerId";
		
		EntityManager em = DBUtils.getEM();
		Query query = em.createQuery(queryString).setParameter("start", new Date(), TemporalType.DATE);
		List<Customer> customers = (List<Customer>) DBUtils.executeQuery(queryString, ResultType.LIST, Customer.class, query);
		return customers;
	}
	
	public static void main(String[] args) {
		ContractExpiredService sd = new ContractExpiredService();
		List<Customer> customers = sd.getCustomerWhoseContractExpired();
		for(Customer cust: customers){
			
			for(Receipt r: cust.getReceipts()){
				System.out.println("CustomerId "+ cust.getCustomerId() + " RceiptNo. "+r.getReceiptNo());	
			}
		}
		
	}
	
}
