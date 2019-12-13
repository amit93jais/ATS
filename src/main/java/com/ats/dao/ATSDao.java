package com.ats.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import com.ats.dao.DBUtils.ResultType;
import com.ats.model.Customer;
import com.ats.model.Receipt;
import com.ats.model.Service;
import com.ats.service.SearchService;
import com.ats.service.Utils;

public class ATSDao {

	static SearchService ss = new SearchService();
	
	SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");

	public int saveCustomer( Customer customer) {
		int result =0;
		com.ats.jpa.model.Customer jcustomer = BeanMapper.maptoObj(customer, com.ats.jpa.model.Customer.class);
		jcustomer = DBUtils.persistAndReturn(jcustomer);
		if( !Utils.isEmpty(jcustomer.getCustomerId())){
		customer.setCustomerId(jcustomer.getCustomerId());
		result = 1;
		}
		return result;
	}
	
	public int deleteCustomer(int customerId) {
		return DBUtils.delete(com.ats.jpa.model.Customer.class, customerId );
	}
	
	public int deleteReceiptDetails(int receiptNo) {
		return DBUtils.delete(com.ats.jpa.model.Receipt.class, receiptNo );
	}
	
	public int deleteVisitDetails(int workId) {
		return DBUtils.delete(com.ats.jpa.model.Service.class, workId );
	}
	
	public int addReceipt(Receipt receipt, int customerId) {
		int result = 0;
		Customer customer = getDetailsForCustomer(customerId);

		if (Utils.isEmpty(customer.getReceipts())) {
			customer.setReceipts(new ArrayList<>());
		}
		customer.getReceipts().add(receipt);
		receipt.setCustomer(customer);
		com.ats.jpa.model.Customer jcustomer = BeanMapper.maptoObj(customer, com.ats.jpa.model.Customer.class);
		result = DBUtils.merge(jcustomer);
		return result;
	}

	
	public int addService(Service service, int customerId, int receiptNo) {
		int result = 0;
		Customer customer = getDetailsForCustomer(customerId);

		for (Receipt receipt : customer.getReceipts()) {
			if (receipt.getReceiptNo() == receiptNo) {

				if (Utils.isEmpty(receipt.getServices())) {
					receipt.setServices(new ArrayList<>());
				}
				receipt.getServices().add(service);
				service.setReceipt(receipt);
				com.ats.jpa.model.Customer jcustomer = BeanMapper.maptoObj(customer, com.ats.jpa.model.Customer.class);
				result = DBUtils.merge(jcustomer);
				return result;
			}
		}
		return result;

	}
	

	@SuppressWarnings("unchecked")
	public List<Customer> getRecord(Customer customer) {
		List<Customer> customers = null;
		try {
			String queryString = ss.getQueryString(customer);
			Query query = null;

			/** This method is called only when Search is based on date */

			if (!Utils.isEmpty(customer.getReceipts())
					&& !Utils.isEmpty(customer.getReceipts().get(0).getContractFrom())
					&& !Utils.isEmpty(customer.getReceipts().get(0).getConractTo())) {

				Date start = customer.getReceipts().get(0).getContractFrom();
				Date end = customer.getReceipts().get(0).getConractTo();
				query = getQuery(queryString, start, end);
			}

			customers = (List<Customer>) DBUtils.executeQuery(queryString, ResultType.LIST, Customer.class, query);

			//Context.setCustomers(customers);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return customers;
	}

	private Query getQuery(String queryString, Date start, Date end) {
		EntityManager em = DBUtils.getEM();
		Query query = em.createQuery(queryString).setParameter("start", start, TemporalType.DATE).setParameter("end",
				end, TemporalType.DATE);
		return query;
	}

	public Customer getDetailsForCustomer(int customerId) {
		String queryString = ss.getQueryStringByCustomerId( customerId );
		Customer customer = DBUtils.executeQuery(queryString, ResultType.SINGLE, Customer.class );
		//dateFormatter( customer );
		return customer;
	}
	

	public static void main(String[] args) throws ParseException {
		ATSDao dao = new ATSDao();
		Customer customer = dao.getDetailsForCustomer(1804);
		for(Receipt r: customer.getReceipts()){
			System.out.println(r.getContractFrom());	
			System.out.println(r.getConractTo());
		}
	}

	


}
