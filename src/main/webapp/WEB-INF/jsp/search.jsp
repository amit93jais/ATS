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
<title>Search Records</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 80%;
}

  tr:nth-child(odd) {
  background-color: #D1F2EB;
}

tbody tr:nth-child(even) {
  background-color: #7FB3D5;
}

td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 6px;
}

 th{
    border: 2px solid #dddddd;
    text-align: left;
    padding: 15px;
}

input, select {
    width: 100%;
    padding: 5px 10px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}


#searchTable{
float: left;
 margin-left: 60px; 
 margin-top:2px;
 width:30%
}

#searchResultTable{
float: right; 
margin-right:10px; 
margin-top:2px;
width: 60%;"
}

#button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 8px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left: 2px;
    margin-top: 20px;
    cursor: pointer;
    width:130px;
    height:35px;
}

#btn-info{
 background-color: #4CAF50;
  width:65px;
  height:35px;
}

#detailsButton{
background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    width:70px;
    height:50px;
}

</style>


</head>
<body>
 <form action="/ATS/searchRecord" method="post" name="searchForm" onsubmit="return validateForm()">
 
<div id="searchTable">
    <h2>Search Here:</h2>
 <table >
			<tr>
				<td>Card No:</td>
				<td><input type="number" id="cardNo" name="cardNo"/></td>
			</tr>
             <tr>
				<td> Customer Name: </td>
				<td><input type="text" id="name" name="name"/></td>
			</tr>
			<tr>
				<td> Address: </td>
				 <td><input type="text" id="address" name="address" /></td>
			</tr>
						
			<tr>
				<td> Mobile No: </td>
				<td><input type="number" id="mobile1" name="mobile1"/></td>
			</tr>
						
			<tr>
				<td> Product: </td>
			     <td> 
					<select id="productName"  name="productName" >
						  <option value="">Select your option</option>
                              <option value="Aquagrand">Aquagrand</option>
                                <option value="Aquaguard">Aquaguard</option>
                              <option value="Kent Ro">Kent RO</option>
                              <option value="Zero Germs">Zero Germs</option>
                              <option value="Liv Pure">Liv Pure</option>
                         </select>
					</td>
				</tr>
			<tr>
				<td> Model: </td>
				<td> 
					<select id="brand"  name="productModel" >
						  <option value="">Select your option</option>
                              <option value="Aquaguard ME">Aquaguard ME</option>
                              <option value="Classic">Classic</option>
                              <option value="Compact">Compact</option>
                              <option value="Nova">Nova</option>
                               <option value="I Nova">I Nova</option>
                              <option value="Infinity">Infinity</option>
                               <option value="Kent UV">Kent UV</option>
                              <option value="Gold">Gold</option>
                              <option value="Enhance UV">Enhance UV</option>
                              <option value="Enhance RO">Enhance RO</option>
                               <option value="Megna UV">Megna UV</option>
                              <option value="Megna RO">Megna RO</option>
                              <option value="Classic plus">Classic plus</option>
                              <option value="Booster">Booster</option>
                              <option value="ST 2000">ST 2000</option>
                              <option value="Reviva">Reviva</option>
                         </select>
					</td>
				</tr>
				<tr>
					<td> Contract Type: </td>
					<td> 
						 <select id="conractType"  name="receipts[0].conractType">
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
				<tr></tr>
				<tr></tr>
				    <tr>
					<td> Contract To: </td>
					<td><input type="date" id="contractTo" name="receipts[0].conractTo"/></td>
				</tr> 
			
</table>
<%--  <spring:url value="/home" var="homeUrl" />
<button class="btn btn-info" id="button" onclick="location.href='${homeUrl}'">Back</button> --%>
<input type=button id="button" value="Back" onCLick="history.back()">
<input type="submit" id="button" value="Search"> 
</div>
 </form>    
     
    <c:if test="${not empty msg}">
   <div id="searchResultTable">
		      <h3>Customer Result</h3>
<table>
  <tr>
                    <th>Card No</th>
					<th>Customer Name</th>
					<th>Contact Person</th>
					<th>Address</th>
					<th>Mobile1</th>
					<!-- <th>Mobile2</th>
					<th>Telephone</th>
					<th>E-mail</th> -->
					<th>Details</th>
					<th></th>
  </tr>
  
   <c:forEach var="customer" items="${customers}">
     <tr>
				<td>${customer.cardNo}</td> 
				<td>${customer.name}</td>
				<td>${customer.contactPerson}</td>
				<td>${customer.address}</td>
				<td>${customer.mobile1}</td>
				<%-- <td>${customer.mobile2}</td>
				<td>${customer.telephone}</td>
				<td>${customer.email}</td> --%>
				<td>
				  <spring:url value="/work/${customer.customerId}" var="workUrl" />

				  <button id="btn-info" id="detailsButton" 
                                          onclick="location.href='${workUrl}'">All Details</button>
                   </td>
                   <td>
				  <spring:url value="/delete/${customer.customerId}" var="deleteUrl" />

				  <button id="btn-info" id="detailsButton" onclick="deleteCustomer( ${customer.customerId} )"
                                          onclick="location.href='${deleteUrl}'">Delete</button>
                   </td>
               </tr> 
			</c:forEach>
   </table>
       </div>  
	</c:if> 
	
	<script type="text/javascript">	

function validateForm() {
	var mobileNo1ValidateFlag = validateMobileNumber1();
	
	if( mobileNo1ValidateFlag == true ) {
		return true;
	}
	else {
		return false;
	} 
}

function validateMobileNumber1(){
	var mobile1 = document.forms["searchForm"]["mobile1"].value;
	if(mobile1 == null || mobile1 == "") {
		return true;
	}
    var mobileno = /^\d{10}$/;
    if((mobile1.match(mobileno)))
        {
      return true;
        }
      else
        {
        alert("please enter valid 10 digit mobile number");
        return false;
        }
}

function deleteCustomer( customerId ){
    //alert("Are You Sure Want to delete this customer?");
    if (window.confirm('Are You Sure Want to delete this customer?')){
    	window.location = '/ATS/delete/'+customerId; 
    }
    else{
    	return false;
    }
}

	</script>
                       
</body>
</html>