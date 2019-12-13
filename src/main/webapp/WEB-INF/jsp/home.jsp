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
<title>ATS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
 <style>
#topMostDiv {
	text-align: center;
	text-decoration: blink;
	 margin-top: 20px;
	 margin-left: 50px;
	 height: 5%;
	 font-weight: bold;
	 color: blue;
	
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
}

  tr:nth-child(odd) {
  background-color: #D1F2EB;
}

td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 5px;
}

 th{
    border: 1px solid #dddddd;
    text-align: left;
    padding: 10px;
}


#button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin-left:20px;
    margin-top: 30px;
    height: 55px;
    width:94%;
    cursor: pointer;
}
a.notif {
float:right;
margin-right:30px;
margin-top:10px;
  display: block;
  height: 100px;
  width: 100px;
  background: url('/ATS/css/images/notification-icon.jpg');
  background-size: 60px 60px;
   background-repeat: no-repeat;
  text-decoration: none;
}
.num {
 float:right;
margin-right:55px;
margin-top:0px;
 display: block;
 font-size:30px;
 background-size: contain;
 text-decoration: bold;
 color: red;
}
 
</style>

</head>
<body>

	<div id="topMostDiv">
	<a href="#notificationPopup" data-rel="popup" class="notif">
	<span class="num">${length}</span></a>
	<img src="/ATS/css/images/ATS.jpg" alt="">
	
	
    <div data-role="popup" id="notificationPopup" class="ui-content">
         <table>
          <tr>
                    <th>Card No</th>
					<th>Customer Name</th>
					<th>Address</th>
					<th>Mobile1</th>
           </tr>
           
            <c:forEach var="customer" items="${customers}">
         
        <tr>
			   <td><a href="/ATS/work/${customer.customerId}">${customer.cardNo}</a></td> 
			   <td><a href="/ATS/work/${customer.customerId}">${customer.name}</a></td>
				<td><a href="/ATS/work/${customer.customerId}">${customer.address}</a></td>
				<td><a href="/ATS/work/${customer.customerId}">${customer.mobile1}</a></td> 
         </tr> 
       <!-- </a> -->
			</c:forEach>
			
   </table>		
      </div>
    </div>
    
	
	<div>
     <spring:url value="/customer" var="customerUrl" />
     <spring:url value="/search" var="searchUrl" />
     <spring:url value="/expiredContract" var="expiredContract" />

	<button class="btn btn-info" id= "button" onclick="location.href='${customerUrl}'">Add a New Customer</button>
	<button class="btn btn-info" id= "button" onclick="location.href='${searchUrl}'">Search a Customer</button>
	<button class="btn btn-info" id= "button" onclick="location.href='${expiredContract}'">Customer Whose Contract Expired
	<span class="num">${ExpContractCustomers.size()}</span>
	</button>
    </div>
    
</body>
</html>