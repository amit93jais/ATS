package com.ats.service;

import com.ats.dao.DBUtils;
import com.ats.dao.DBUtils.ResultType;
import com.ats.model.Customer;
import com.ats.model.Receipt;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TemporalType;

public class ServiceDue {

	@SuppressWarnings("unchecked")
	public List<Customer> getCustomerForService(){
		Date start = get6MonthBeforeDateFromToday();
		String queryString1 = "Select distinct c From Customer c JOIN c.receipts r JOIN r.services s group by c.customerId "
				+ "having MAX(s.visitDate) <= :start";
		
		EntityManager em = DBUtils.getEM();
		Query query = em.createQuery(queryString1).setParameter("start", start, TemporalType.DATE);
		List<Customer> customers1 = (List<Customer>) DBUtils.executeQuery(queryString1, ResultType.LIST, Customer.class, query);
		if(customers1.size() > 0)
		System.out.println("Customer1: "+customers1.get(0).getCustomerId() + " Size: "+customers1.size());
		String queryString2 = "Select distinct c from Customer c JOIN c.receipts r WHERE r.services IS EMPTY group by c.customerId";
		List<Customer> customers2 = (List<Customer>) DBUtils.executeQuery(queryString2, ResultType.LIST, Customer.class);
		if(customers2.size() > 0)
		System.out.println("Customer2: "+customers2.get(0).getCustomerId() + " Size: "+customers2.size());
		
		List<Customer> customers = mergeCustomers( customers1, customers2 );
		
		return customers;
		
	}
	
	private List<Customer> mergeCustomers(List<Customer> customers1, List<Customer> customers2) {
		List<Integer> customer1IdList = new ArrayList<>();
		for( Customer cust1: customers1 ){
			customer1IdList.add( cust1.getCustomerId());
		}
		
		for( Customer cust2: customers2 ){
			if( !customer1IdList.contains( cust2.getCustomerId() ) )
				customers1.add( cust2 );
		}
		return customers1;
	}

	private static Date get6MonthBeforeDateFromToday(){
		Date date = new Date();
		System.out.println(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.MONTH, (cal.get(Calendar.MONTH)-6));
		date = cal.getTime();
		System.out.println(date);
		return date;
	}
	
	public static void main(String[] args) {
		ServiceDue sd = new ServiceDue();
		
		//List<Customer> customers = sd.getCustomerForService();
	
		Date start = get6MonthBeforeDateFromToday();
		String queryString1 = "Select distinct c From Customer c JOIN c.receipts r JOIN r.services s group by c.customerId "
				+ "having MAX(s.visitDate) <= :start";
		
		EntityManager em = DBUtils.getEM();
		Query query = em.createQuery(queryString1).setParameter("start", start, TemporalType.DATE);
		List<Customer> customers1 = (List<Customer>) DBUtils.executeQuery(queryString1, ResultType.LIST, Customer.class, query);
		for(Customer cust: customers1){
			
			for(Receipt r: cust.getReceipts()){
				System.out.println("CustomerId "+ cust.getCustomerId() + " RceiptNo. "+r.getReceiptNo());	
			}
		}
		
	}
}
