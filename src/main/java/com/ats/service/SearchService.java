package com.ats.service;


import com.ats.model.Customer;

public class SearchService {
	
	public String getQueryString( Customer customer ){
		StringBuffer query = new StringBuffer( "SELECT distinct c FROM Customer c" );
		
		boolean patch = false;
		
		if( !Utils.isEmpty( customer.getReceipts() ) ){
			query.append(" JOIN c.receipts r");
		}
		
		if( !Utils.isEmpty( customer.getCustomerId() ) ){
			getQueryPatch( patch, query );
			query.append( "c.customerId =" + customer.getCustomerId() );
			patch = true;
		}

		if( !Utils.isEmpty( customer.getName() ) ){
			getQueryPatch( patch, query );
			query.append( "c.name like '%" + customer.getName() + "%'" );
			patch = true;
		}
		if( !Utils.isEmpty( customer.getCardNo() ) ){
			getQueryPatch( patch, query );
			query.append( "c.cardNo = " + customer.getCardNo() );
			patch = true;
		}
		if( !Utils.isEmpty( customer.getMobile1() ) ){
			getQueryPatch( patch, query );
			query.append( "c.mobile1 = "  + customer.getMobile1() + "or c.mobile2 = "+ customer.getMobile1()  );
			patch = true;
		}
		
		if( !Utils.isEmpty( customer.getMobile2() ) ){
			getQueryPatch( patch, query );
			query.append( "c.mobile1 = "  + customer.getMobile1() + "or c.mobile2 = "+ customer.getMobile1()  );
			patch = true;
		}

		if( !Utils.isEmpty( customer.getAddress() ) ){
			getQueryPatch( patch, query );
			query.append( "c.address like '%"  + customer.getAddress() + "%'" );
			patch = true;
		}
		if( !Utils.isEmpty( customer.getProductName() )  ){
			getQueryPatch( patch, query );
			query.append( "c.productName = '"  + customer.getProductName()+"'" );
			patch = true;
		}
		if( !Utils.isEmpty( customer.getProductModel() ) ){
			getQueryPatch( patch, query );
			query.append( "c.productModel = '"  + customer.getProductModel()+"'" );
			patch = true;
		}
		if( !Utils.isEmpty( customer.getReceipts() ) && !Utils.isEmpty( customer.getReceipts().get(0).getConractType() ) ){
			getQueryPatch( patch, query );
			query.append( "r.conractType = '"  + customer.getReceipts().get(0).getConractType() +"'" );
			patch = true;
		}
		if( !Utils.isEmpty( customer.getReceipts() ) 
				&& !Utils.isEmpty( customer.getReceipts().get(0).getContractFrom() )
				&& !Utils.isEmpty( customer.getReceipts().get(0).getConractTo() )
				){
			getQueryPatch( patch, query );
			query.append( "r.contractFrom <= :start and r.conractTo >= :end" );
			patch = true;
		}
		return query.toString();
	}
	
	private void getQueryPatch( boolean patch, StringBuffer query ){
		if( patch )
			query.append( " and " );
		else{
			query.append( " Where " );
		}
	}

	public String getQueryStringByCustomerId(int customerId) {
		String query =  "SELECT c FROM Customer c where c.customerId="+customerId ;
		return query;
	}
}
