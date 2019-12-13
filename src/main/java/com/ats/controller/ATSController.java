package com.ats.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ats.dao.ATSDao;
import com.ats.model.Customer;
import com.ats.service.ContractExpiredService;

@RestController
public class ATSController {

	ATSDao dao = new ATSDao();
	   
	@InitBinder
	public void initBinder( WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
	
	@RequestMapping("/search")
	public ModelAndView getSearchRecipeFormHome(HttpServletRequest request, HttpServletResponse response ) {
		
		ModelAndView mav = new ModelAndView("search");
		    mav.addObject("customer", new Customer());
		    return mav;
	}
   
   @RequestMapping(value = "/searchRecord", method = { RequestMethod.POST, RequestMethod.GET })
   public ModelAndView getRecord( HttpServletRequest request, HttpServletResponse response,
		   @ModelAttribute("customer") Customer customer, BindingResult bindingResult ) throws IOException{
	   
	   List<Customer> customers = dao.getRecord( customer );
	   
	   ModelAndView mav = new ModelAndView("search");
	   mav.addObject("customers", customers );
	   mav.addObject("msg", "show" );
	  
	   return mav;
   }
	
	/*
	 * Returns the add customer Form View (Use-case 1).
	 */
	@RequestMapping("/customer")
	public ModelAndView getCustRecipeFormHome(HttpServletRequest request, HttpServletResponse response ) {
		
		ModelAndView mav = new ModelAndView("customer");
		    mav.addObject("customer", new Customer());
		    return mav;
	}
	
	   @RequestMapping(value = "/addCustomer", method = { RequestMethod.POST, RequestMethod.GET } )
	   public ModelAndView addCustomer( HttpServletRequest request, HttpServletResponse response,
			   @ModelAttribute("customer") Customer customer, BindingResult bindingResult ) throws IOException{
		   
		   customer.getReceipts().get(0).setCustomer(customer);
		  
		   int result = dao.saveCustomer( customer );
		   if(result == 1){
			   return new ModelAndView("success", "customer", customer);
	      }
		   return new ModelAndView("Failure", "customer", customer);
	   }
	   
	   
	   @RequestMapping(value = "/addReceipt/{customerId}", method = { RequestMethod.POST, RequestMethod.GET } ) 
	   public ModelAndView addReceiptForCustomer( HttpServletRequest request, HttpServletResponse response,
			   @ModelAttribute("customer") Customer customer, @PathVariable("customerId") int customerId, BindingResult bindingResult ) throws IOException{
		 
		   int result = dao.addReceipt( customer.getReceipts().get(0), customerId );
		  
		   if(result == 1){
			   return new ModelAndView("success", "customer", customer );
	      }
		   else
		   return new ModelAndView("failure", "FAIL", "FAIL");
	   }
	   
	   @RequestMapping(value = "/addWork/{customerId}/{receiptNo}", method=RequestMethod.POST )
	   public ModelAndView AddWork(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("customerId") int customerId, @PathVariable("receiptNo") int receiptNo,
			@ModelAttribute("customer") Customer customer ) {

		int result = dao.addService( customer.getReceipts().get(0).getServices().get(0),customerId, receiptNo );

		 if(result == 1){
			 return new ModelAndView("success", "customer", customer );
	      }
		   else
		   return new ModelAndView("failure", "FAIL", "FAIL");
	}
	   
	   
	   @RequestMapping(value = "/work/{customerId}", method=RequestMethod.GET )
	   public ModelAndView getDetails(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("customerId") int customerId, @ModelAttribute("customer") Customer cust) {
		 
		Customer customer = dao.getDetailsForCustomer( customerId );
		ModelAndView mav = new ModelAndView("work");
		mav.addObject("customer", customer);
		
		//This method will give the latest receipt number for the customer.
		//So the visit can be added against latest receipt number.
		int latestReceiptNo = getLatestReceiptNumberForCustomer(customer);
		mav.addObject("latestReceiptNo", latestReceiptNo);
		return mav;
	}
	   
	   private int getLatestReceiptNumberForCustomer(Customer customer) {
		return customer.getReceipts().get(customer.getReceipts().size()-1).getReceiptNo();
	}

	@RequestMapping(value = "/delete/{customerId}", method=RequestMethod.GET )
	   public ModelAndView deleteCustomer(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("customerId") int customerId, @ModelAttribute("customer") Customer cust) {

		int result = dao.deleteCustomer( customerId );

		ModelAndView mav = new ModelAndView("search");
		mav.addObject("result", result );
		return mav;
	}
	   
	   @RequestMapping(value = "/delete/receipt/{receiptNo}", method=RequestMethod.GET )
	   public ModelAndView deleteReceiptDetails(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("receiptNo") int receiptNo, @ModelAttribute("customer") Customer cust) {

		int result = dao.deleteReceiptDetails( receiptNo );

		ModelAndView mav = new ModelAndView("work");
		mav.addObject("result", result );
		return mav;
	}
	   
	   @RequestMapping(value = "/delete/visit/{workId}", method=RequestMethod.GET )
	   public ModelAndView deleteVisitDetails(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("workId") int workId, @ModelAttribute("customer") Customer cust) {

		int result = dao.deleteVisitDetails( workId );

		ModelAndView mav = new ModelAndView("work");
		mav.addObject("result", result );
		return mav;
	}
	   
	   @RequestMapping(value = "/expiredContract", method = { RequestMethod.POST, RequestMethod.GET } ) 
	   public ModelAndView ExpiredCustomer(HttpServletRequest request, HttpServletResponse response ) {

		ContractExpiredService expService  =new ContractExpiredService();
		List<Customer> customers = expService.getCustomerWhoseContractExpired();
		ModelAndView mav = new ModelAndView("expContrCustomer");
		mav.addObject("customers", customers);

		return mav;
	}
	   
}
