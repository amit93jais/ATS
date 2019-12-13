package com.ats.service;

import java.util.List;

import com.ats.model.Customer;

public class Context {
 private static List<Customer> customers;

public static List<Customer> getCustomers() {
	return customers;
}

public static void setCustomers(List<Customer> customers) {
	Context.customers = customers;
}

 
}
