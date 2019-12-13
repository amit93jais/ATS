/**
 * 
 */
package com.ats.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ats.model.Customer;
import com.ats.service.ContractExpiredService;
import com.ats.service.ServiceDue;

@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public ModelAndView getHomePage() {
		ServiceDue sd = new ServiceDue();
		ContractExpiredService expService  =new ContractExpiredService();
		
		List<Customer> customers = sd.getCustomerForService();
		
		List<Customer> expContractCustomers = expService.getCustomerWhoseContractExpired();
		 
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("customers", customers );
		mav.addObject("ExpContractCustomers", expContractCustomers );
		mav.addObject("length", customers.size() );
		return mav;
		
	}
	
}
