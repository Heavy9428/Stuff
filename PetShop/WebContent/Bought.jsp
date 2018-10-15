<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.Random" %>
<%@ page import = "com.Login.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<div class="w3-container w3-border-bottom w3-margin">
			<h1>Java Pet Store</h1>
			<div class="w3-right-align">
				<a href="http://localhost:8080/PetShop/Account.jsp">Account|</a> 
				<a href="http://localhost:8080/PetShop/Checkout.jsp">|Cart|</a> 
				<a href="http://localhost:8080/PetShop/Logout.jsp">Log Out</a>
			</div>
		</div>
<body>
<div class="w3-container w3-padding-16">
			<div class="w3-quarter w3-container w3-border w3-border-green">
				<a href="http://localhost:8080/PetShop/Animals.jsp?value=Birds">Birds</a>
				<br /> <a href="http://localhost:8080/PetShop/Animals.jsp?value=Cats">Cats</a>
				<br /> <a href="http://localhost:8080/PetShop/Animals.jsp?value=Dogs">Dogs</a>
				<br /> <a href="http://localhost:8080/PetShop/Animals.jsp?value=Fish">Fish</a>
				<br /> <a href="http://localhost:8080/PetShop/Animals.jsp?value=Reptiles">Reptiles</a>
			</div>
			
			Your Order is Complete
			<br/>
			<%
			request.getSession();
			
				
			%>
			Your Order Id is : <%=session.getAttribute("Order_id")%>
			
			
			
			<br/>
			Thank you for using the Java Pet Store Demo
			
			
			
			
			
			
			
			</div>
			
			
</body>
</html>