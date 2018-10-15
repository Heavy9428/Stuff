<%--This is the first screen the User will see it will allow them to log in, Register and select a specific item the store sells --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<title>Welcome to the Online Pet Shop</title>
	</head>
	
	<body>
	
		<div class="w3-container w3-border-bottom w3-margin">
			<h1>Java Pet Store</h1>
			<div class="w3-right-align"><a href = "http://localhost:8080/petshop/Account.jsp">Account|</a>
			<a href = "https://localhost:8080/petshop/Cart.jsp">|Cart|</a>
			<a href = "https://localhost:8080/petshop/Login.jsp">Login</a>
			</div>
		</div>
	
		<div class="w3-container w3-padding-16">
	
			<div class="w3-quarter w3-container w3-border w3-border-green">
				<a href="http://localhost:8080/petshop/Animals.jsp?value=Birds">Birds</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Cats">Cats</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Dogs">Dogs</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Fish">Fish</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Reptiles">Reptiles</a>
			</div>
	
	
		
	
				Are you a returning customer or are you a new customer?
			
				<div class=" w3-container w3-border w3-border-blue w3-center w3-cell">
					<form action="Login" method="post">
						Sign In? <br />
						<div class="w3-center-align">
							UserName:<input type="text" name="name">
						</div>
						<br />
						<div class="w3-center-align">
							Password: <input type="password" name="password">
						</div>
						<br /> <input type="submit" value="Login">
					</form>
				</div>
	
				
				<div class=" w3-container w3-border w3-border-blue w3-center w3-cell">
					<form action="Register" method="post">
						Register? <br />
						<div class="w3-center-align">
							UserName: &nbsp <input type="text" name="UserName">
						</div>
						<br />
						<div class="w3-center-align">
							Password:&nbsp &nbsp <input type="text" name="Password">
						</div>
						<br />
						<div class="w3-center-align">
							First Name: <input type="text" name="First Name">
						</div>
						<br />
						<div class="w3-center-align">
							Last Name: <input type="text" name="Last Name">
						</div>
						<br />
						<div class="w3-center-align">
							Email: &nbsp &nbsp &nbsp &nbsp<input type="text" name="email">
						</div>
						<br /> <input type="submit" value="Register">
					</form>
				</div>
			</div>
	<div class="w3-container w3-teal">
			
			  <p>The Java Pet Store Demo is a fictional sample application based on the Java BluePrints by Sun Microsystems used as Java training for the eCommerce division at the Exchange</p>
			</div> 
	
	</body>
</html>