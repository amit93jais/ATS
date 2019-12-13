<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Work Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

 <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

 tbody tr:nth-child(odd) {
  background-color: #D1F2EB;
}

tbody tr:nth-child(even) {
  background-color: #AED6F1;
}

td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 4px;
}

 th{
    border: 3px solid #dddddd;
    text-align: left;
    padding: 8px;
}

input, select {
    width: 100%;
    padding: 2px 5px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

#customerTable{
float: left; 
margin-left:20px; 
margin-top:2px; 
width: 96%;
}

#receiptTable{
float: left; 
margin-left: 20px; 
margin-top:20px; 
width: 45%;"
}

#visitTable{
float: right; 
margin-right:20px; 
margin-top:20px; 
width: 45%;"
}

#button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left: 20px;
    margin-top: 20px;
    cursor: pointer;
    width:100%;
    height:40px;
}


</style>

</head>
<body>

<div id="customerTable">
    <h3>Customer Details</h3>
   <table>
  <tr>
                    <th>Card No</th>
					<th>Customer Name</th>
					<th>Contact Person</th>
					<th>Address</th>
					<th>Mobile1</th>
					<th>Mobile2</th>
					<th>telephone</th>
					<th>email</th>
					<th>ProductName</th>
					<th>ProductModel</th>
  </tr>
  
     <tr>
				<td>${customer.cardNo}</td> 
				<td>${customer.name}</td>
				<td>${customer.contactPerson}</td>
				<td>${customer.address}</td>
				<td>${customer.mobile1}</td>
				<td>${customer.mobile2}</td>
				<td>${customer.telephone}</td>
				<td>${customer.email}</td>
				<td>${customer.productName}</td>
				<td>${customer.productModel}</td>
             </tr> 
   </table>
</div>

   
 <div id="receiptTable"> 
  <table>
   <th> 
   <h3>Receipt Details</h3>
  </th>
   
   <th> 
                
	<div data-role="main" class="ui-content">
   <a href="#contractPopup" data-rel="popup">Add Contract</a>
    <div data-role="popup" id="contractPopup" class="ui-content">
      <form method="post" action="/ATS/addReceipt/${customer.customerId}">
        <div>
          <h3>Add New Contract information</h3>
         <table>
          <tr>
					<td> Contract Type: </td>
					<td> 
						<select id="conractType" required name="receipts[0].conractType">
						  <option value="">Select your option</option>
                              <option value="1-Year">1-Year</option>
                              <option value="2-Year">2-Year</option>
                              <option value="3-Year">3-Year</option>
                              <option value="4-Year">4-Year</option>
                         </select>
					</td>
				</tr> 
				
				    <tr>
					<td> Contract From: </td>
					<td><input type="date" id="contractFrom" name="receipts[0].contractFrom"/></td>
				</tr> 
				
				 <tr>
					<td> Contract To: </td>
					<td><input type="date" id="contractTo" name="receipts[0].conractTo"/></td>
				 </tr> 
				 
				 <tr>
					<td> Contract Amount: </td>
					<td><input type="number" id="contractTo" name="receipts[0].contractAmount"/></td>
				 </tr>
				 
				 <tr>
					<td> Remarks: </td>
					<td><input type="text" id="contractTo" name="receipts[0].remarks"/></td>
				 </tr>
   </table>				
               <!--  <input id="button" type="button" data-inline="true" value="Cancel"> -->
				<input id="button" type="submit" data-inline="true" value="Save">
      </div>
      </form>
    </div>
    </div>
  </th>
</table>  
       
       
    <table>
     <tr>
                    <th>Receipt No.</th>
					<th>Contract Type</th>
					<th>Contract From</th>
					<th>Contract To</th>
					<th>Contract Amount</th>
					<th>Remarks</th>
					<th>Delete</th>
  </tr>
	    <c:forEach var="receipt" items="${customer.receipts}">
	      <tr>
	           <td>${receipt.receiptNo}</td> 
				<td>${receipt.conractType}</td> 
				<td>
				<fmt:parseDate pattern="E MMM dd HH:mm:ss Z yyyy" value="${receipt.contractFrom}" var="contractFrom" />
				<fmt:formatDate value="${contractFrom}" pattern="dd MMM yy" />
				</td>
				<td>
				<fmt:parseDate pattern="E MMM dd HH:mm:ss Z yyyy" value="${receipt.conractTo}" var="conractTo" />
				<fmt:formatDate value="${conractTo}" pattern="dd MMM yy" />
				</td>
				<td>${receipt.contractAmount}</td>
				<td>${receipt.remarks}</td> 
				<td>
				 <spring:url value="/delete/receipt/${receipt.receiptNo}" var="deleteUrl" />
                <img src="/ATS/css/images/delete-sign.png" width="20" height="20"
				   onclick="deleteReceiptDetails(${receipt.receiptNo} )"
                                          onclick="location.href='${deleteUrl}'">
				</td>
			
             </tr> 
			</c:forEach>
	</table>
	<br>
	<br>
<br>
	</div>
	
<div id="visitTable">
<table>
   <th> 
   <h2>Visit/Service Details</h2>
   </th>
   
   <th>
                
	<div data-role="main" class="ui-content">
  <a href="#visitPopup${receipt.receiptNo}" data-rel="popup" >Add Visit</a>
    <div data-role="popup" id="visitPopup${receipt.receiptNo}" class="ui-content">
      <form method="post" action="/ATS/addWork/${customer.customerId}/${latestReceiptNo}">
        <div>
          <h3>Add New Visit information</h3>
          <table>
				
				  <tr>
					<td> Visit Date: </td>
					<td><input type="date" id="visitDate" name="receipts[0].services[0].visitDate" /></td>
				</tr> 
				
				 <tr>
					<td> Work Details: </td>
					<td><input type="text" id="workDetails" name="receipts[0].services[0].workDetails"/></td>
				 </tr> 
				 
				 <tr>
					<td>Parts Replaced IF Any: </td>
					<td><input type="text" id="partsReplaced" name="receipts[0].services[0].partsReplaced"/></td>
				 </tr>
				 
				  <tr>
					<td>Amount Charged: </td>
					<td><input type="number" id="amountCharged" name="receipts[0].services[0].amountCharged"/></td>
				 </tr>
				 
				 <tr>
					<td> Remarks: </td>
					<td><input type="text" id="customerRemarks" name="receipts[0].services[0].customerRemarks"/></td>
				 </tr>
   </table>				
               <!--  <input id="button" type="button" data-inline="true" value="Cancel"> -->
				<input id="button" type="submit" data-inline="true" value="Save">
      </div>
      </form>
    </div>
    </div>
   </th>
</table>   

	<table>
     <tr>
                    <th>Visit Date</th>
					<th>Work Details</th>
					<th>Parts Replaced IF Any</th>
					<th>Receipt NO.</th>
					<th>Amount Charged</th>
					<th>Remarks</th>
					<!-- <th>Delete</th> -->
  </tr>
    <c:forEach var="receipt" items="${customer.receipts}">
	    <c:forEach var="work" items="${receipt.services}">
	      <tr>
	                <%--  <td>${work.visitDate}</td> --%>
	             <td>
				<fmt:parseDate pattern="E MMM dd HH:mm:ss Z yyyy" value="${work.visitDate}" var="visitDate" />
				<fmt:formatDate value="${visitDate}" pattern="dd MMM yy" />
				</td>
				<td>${work.workDetails}</td> 
				<td>${work.partsReplaced}</td>
				<td>${receipt.receiptNo}</td>
				<td>${work.amountCharged}</td>
				<td>${work.customerRemarks}</td> 
				<td>${work.customerRemarks}</td> 
				<td>
				 <spring:url value="/delete/visit/${work.workId}" var="deleteUrl" />
                <img SRC="/ATS/css/images/delete-sign.png" width="20" height="20"
				   onclick="deleteWorkDetails( ${work.workId} )"
                                          onclick="location.href='${deleteUrl}'">
			</td>
             </tr> 
			</c:forEach>
		</c:forEach>
	</table>
  </div> 
  <div id="customerTable">
  <spring:url value="/home" var="homeUrl" />
	<button class="btn btn-info" id="button" onclick="location.href='${homeUrl}'">Go to Home Page</button>
  </div>
  <script>
  function deleteWorkDetails( workId ){
	    if (window.confirm('Are You Sure Want to delete this customer?')){
	    	window.location = '/ATS/delete/visit/'+workId; 
	    }
	    else{
	    	return false;
	    }
	}
  
  function deleteReceiptDetails( receiptId ){
	    if (window.confirm('Are You Sure Want to delete this customer?')){
	    	window.location = '/ATS/delete/receipt/'+receiptId; 
	    }
	    else{
	    	return false;
	    }
	}

  </script>
</body>
</html>