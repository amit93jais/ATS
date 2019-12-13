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
<title>Add a Customer</title>
</head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 80%;
}

 tbody tr:nth-child(odd) {
  background-color: #D1F2EB;
}

tbody tr:nth-child(even) {
  background-color: #7FB3D5;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 10px;
}

input, select {
    width: 77%;
    padding: 6px 6px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}


#customerTable{
float: left;
 margin-left: 60px; 
 margin-top:5px;
 margin-bottom:5px;
 width:45%
}

#receiptTable{
float: right;
 margin-right:60px; 
 margin-top:5px;
 width:45%;
}

#button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-right:15%;
    margin-top: 50px;
    cursor: pointer;
    width:180px;
    height:50px;
}

</style>

<body>
    <form name="customerForm" action="/ATS/addCustomer" method="post" onsubmit="return validateForm()">
    <div id="customerTable">
     <h1>Customer Details:</h1>
     
                  <table>
						<tr>
								<td> Card No: </td>
							    <td><input type="number"  required id="cardNo" name="cardNo"/></td>
						</tr>
						<tr>
								<td> Customer Name: </td>
							    <td><input type="text"  required id="name" name="name"/></td>
						</tr>
						<tr>
								<td> Contact Person: </td>
							    <td><input type="text" id="contactPerson" name="contactPerson"/></td>
						</tr>
						<tr>
								<td> Address: </td>
							    <td><input type="text" required id="address" name="address" /></td>
						</tr>
						<tr>
								<td> Telephone No: </td>
							    <td><input type="number" id="telephone" name="telephone" /></td>
						</tr>
						<tr>
								<td> Mobile 1: </td>
							    <td><input type="number" required id="mobile1" name="mobile1"/></td>
						</tr>
						<tr>
								<td> Mobile 2: </td>
							    <td><input type="number" id="mobile2" name="mobile2"/></td>
						</tr>
						<tr>
								<td> Email: </td>
							    <td><input type="email" id="email" name="email" /></td>
						</tr>
						<tr>
					<td> Product: </td>
					<td> 
						<select id="productName" required name="productName" >
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
						<select id="brand" required name="productModel" >
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
						</table>
						</div>
				
				
	<div id="receiptTable">
			<table>
			<h1>Receipt Details:</h1>
				
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
					<td><input type="date" required pattern="yyyy/MM/dd" id="contractFrom" name="receipts[0].contractFrom"/></td>
					</tr>
					<tr>
					<td> Contract To: </td>
					<td><input type="date" required id="contractTo" name="receipts[0].conractTo" /></td>
				</tr> 
				
				  <tr>
						<td> Amount: </td>
					    <td><input type="number" id="contractAmount" name="receipts[0].contractAmount"/></td>
				</tr>
				
				<tr>
						<td> Remarks: </td>
					    <td><input type="text" id="remarks" name="receipts[0].remarks"/></td>
				</tr> 
				
				</table>
			</div>
				<spring:url value="/home" var="homeUrl" />
					<input type="submit" id= "button"  value="Submit"/>				
					<input type="button" id= "button"  value="Cancel" onclick="location.href='${homeUrl}'"/>
					 
	</form>
	
	
<script type="text/javascript">	

function validateForm() {
	var mobileNo1ValidateFlag = validateMobileNumber1();
	var mobileNo2ValidateFlag = validateMobileNumber2();
	
	if( mobileNo1ValidateFlag == true & mobileNo2ValidateFlag == true ) {
		return true;
	}
	else {
		return false;
	} 
}

function validateMobileNumber1(){
	var mobile1 = document.forms["customerForm"]["mobile1"].value;
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

function validateMobileNumber2(){
	var mobile2 = document.forms["customerForm"]["mobile2"].value;
	if(mobile2 == null || mobile2 == "") {
		return true;
	}
    var mobileno = /^\d{10}$/;
    if((mobile2.match(mobileno)))
        {
      return true;
        }
      else
        {
        alert("please enter valid 10 digit mobile number");
        return false;
        }
}
	</script>
	
</body>
</html>