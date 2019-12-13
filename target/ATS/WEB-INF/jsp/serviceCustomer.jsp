<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    padding: 10px;
}

 th{
    border: 3px solid #dddddd;
    text-align: left;
    padding: 12px;
}

input, select {
    width: 100%;
    padding: 5px 10px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

#customerTable{
float: left; 
padding-left:30px;
margin-left:20px; 
margin-top:3px; 
width: 90%;
}

#receiptTable{
float: left; 
margin-left: 50px; 
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
    margin-left: 2px;
    margin-top: 20px;
    cursor: pointer;
    width:100px;
    height:40px;
}


</style>
</head>
<body>
<div id="customerTable">
    <h1>Customer Details</h1>
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
					<th>Details</th>
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
				<td>
				  <spring:url value="/work/${customer.customerId}" var="workUrl" />

				  <button class="btn btn-info" id="detailsButton" 
                                          onclick="location.href='${workUrl}'">All Details</button>
                   </td>
             </tr> 
   </table>
</div>

</body>
</html>