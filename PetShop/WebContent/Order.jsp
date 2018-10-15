<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import =  "java.util.Random" %>
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
<form action = "Orders" method ="Post">
<b>Shipping Information</b>
<br/>
First Name: <input type="text" name ="First_Name">
<br/>
Last Name: <input type="text" name="Last_Name">
<br/>
Street Address: <input type = "text" name ="address">
<br/>
City: <input type ="text" name = "City">
<br/>
State/Province:<select name ="state">
<option>TX</option>
<option>CA</option>
<option>MI</option>
</select> 
<br/>
Zip Code:<input type ="text" name = "zip">
<br/>
Telephone<input type = "text" name="number">
<br/>
Email<input type = "text" name ="Email">
<br/>

<b>Billing Information</b>
<br/>
Card Number:<input type="text" name ="card">
<br/>
Experation:<input type="text" name ="Exp">
<br/>
Security Pin:<input type ="text" name ="Pin">
<br/>

<%Random rand = new Random();
int value = rand.nextInt(10000)+1; %>

<input type = "hidden" value = <%=value%> name = "Orders">


		  <input type="submit" value="Buy">
		  </form>
		  <div class="w3-container w3-teal">
			
			  <p>The Java Pet Store Demo is a fictional sample application based on the Java BluePrints by Sun Microsystems used as Java training for the eCommerce division at the Exchange</p>
			</div> 
</body>
</html>