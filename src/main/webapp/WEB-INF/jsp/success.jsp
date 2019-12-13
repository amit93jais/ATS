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
<title>Successfully Added</title>
<style>
#button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left: 50px;
    margin-top: 50px;
    width:100%;
    height:45px;
    cursor: pointer;
}
 
</style>
</head>
<body>
<div>
<h1>Successfully Added</h1>
     <spring:url value="/home" var="homeUrl" />
     <spring:url value="/work/${customer.customerId}" var="workUrl" />

	<button class="btn btn-info" id="button" onclick="location.href='${homeUrl}'">Go to Home Page</button>
	<button class="btn btn-info" id="button" onclick="location.href='${workUrl}'">Back to Customer Details</button>
    </div>
</body>
</html>