<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import ="com.Login.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Logged in</title>
	</head>
	<body>
		<div class="w3-container w3-border-bottom w3-margin">
				  <h1>Java Pet Store</h1>
		
		
				<%
				
				/**
				* This jsp is hit once the user logs in succesfully and allows
				* the user to select the types of animals the store sells
				*/
					User currentUser = (User) (session.getAttribute("currentSessionUser"));
				%>
				Welcome
				<%=currentUser.getfirstName() + "  " + currentUser.getlastName()%>
		
				<div class="w3-right-align"><a href = "http://localhost:8080/PetShop/Account.jsp">Account|</a>
				<a href = "http://localhost:8080/PetShop/Checkout.jsp">|Cart|</a>
				<a href = "http://localhost:8080/PetShop/Logout.jsp">Log Out</a>
				</div>
		</div> 
				
				
				
				
				<div class="w3-container">

					<div class="w3-quarter w3-border w3-border-red">
						<a href="http://localhost:8080/PetShop/Animals.jsp?value=Birds">Birds</a>
						<br/>
						<a href="http://localhost:8080/PetShop/Animals.jsp?value=Cats">Cats</a>
						<br/>
						<a href="http://localhost:8080/PetShop/Animals.jsp?value=Dogs">Dogs</a>
						<br/>
						<a href="http://localhost:8080/PetShop/Animals.jsp?value=Fish">Fish</a>
						<br/>
						<a href="http://localhost:8080/PetShop/Animals.jsp?value=Reptiles">Reptiles</a>
					</div>
				</div>

					<div class="w3-container w3-teal">
	
				  <p>The Java Pet Store Demo is a fictional sample application based on the Java BluePrints by Sun Microsystems used as Java training for the eCommerce division at the Exchange</p>
				</div> 
	</body>
</html>