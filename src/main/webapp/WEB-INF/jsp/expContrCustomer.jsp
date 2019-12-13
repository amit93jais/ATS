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
<title>Insert title here</title>
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
    padding: 12px;
}

 th{
    border: 2px solid #dddddd;
    text-align: left;
    padding: 15px;
}

#searchResultTable{
float: right; 
margin-left:80px; 
margin-top:10px;
width: 95%;"
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
    margin-left:70px;
    margin-top: 50px;
    cursor: pointer;
    width:78%;
    height:40px;
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
 <div id="searchResultTable">
		      <h1>Customer Result</h1>
<table>
  <tr>
                    <th>Card No</th>
					<th>Customer Name</th>
					<th>Contact Person</th>
					<th>Address</th>
					<th>Mobile1</th>
					<th>Mobile2</th>
					<th>Telephone</th>
					<th>E-mail</th>
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
				<td>${customer.mobile2}</td>
				<td>${customer.telephone}</td>
				<td>${customer.email}</td>
				<td>
				  <spring:url value="/work/${customer.customerId}" var="workUrl" />

				  <button class="btn btn-info" id="detailsButton" 
                                          onclick="location.href='${workUrl}'">All Details</button>
                   </td>
                  <td>
				  <spring:url value="/delete/${customer.customerId}" var="deleteUrl" />

				  <button class="btn btn-info" id="detailsButton" onclick="deleteCustomer( ${customer.customerId} )"
                                          onclick="location.href='${deleteUrl}'">Delete</button>
                   </td>
               </tr> 
			</c:forEach>
   </table>
       </div>  
       <div id="customerTable">
  <spring:url value="/home" var="homeUrl" />
	<button class="btn btn-info" id="button" onclick="location.href='${homeUrl}'">Go to Home Page</button>
  </div>
  
  <script>
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