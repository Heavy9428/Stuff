
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Login.User"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.Connection.Connections" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cart Page Test</title>
</head>
<body>
	<div class="w3-container w3-border-bottom w3-margin">
		<h1>Java Pet Store</h1>
		<div class="w3-right-align">
			<a href="http://localhost:8080/petshop/Account.jsp">Account|</a>
			<a href="http://localhost:8080/petshop/Checkout.jsp">|Cart|</a> 
			<a href="http://localhost:8080/petshop/Logout.jsp">Log Out</a>
		</div>
	</div>

	<div class="w3-container">


		<div class="w3-quarter w3-border w3-border-red">
			<a href="http://localhost:8080/petshop/Animals.jsp?value=Birds">Birds</a>
			<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Cats">Cats</a>
			<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Dogs">Dogs</a>
			<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Fish">Fish</a>
			<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Reptiles">Reptiles</a>
		</div>

		<div class="w3-threequarter w3-border w3-border-red">
			<%
				/**
				* Grabs the current user, if any, and check to see if they are 
				* logged in or not if the are not a message box pops up and they 
				* are redirected to the Login Screen
				*/
				User currentUser = (User) (session.getAttribute("currentSessionUser"));

				if (currentUser == null) {
					JOptionPane.showMessageDialog(null, "You are not Logged in!");
					response.sendRedirect("Login.jsp");

					/**
					* If the current user is a valid user then it will get the parameters from the 
					* href values that contains which animal you are looking at and displays them on the screen 
					*/
				} else {

					try {
						Connection myconn = Connections.conManager();

						String value = (String) request.getParameter("value");
						String animal = (String) request.getParameter("value1");
						PreparedStatement stmt = myconn.prepareStatement("Select Gender, Breed, Descri, Price From " + animal + " where Breed = ?");
						stmt.setString(1, value);

						ResultSet rs = stmt.executeQuery();
						while (rs.next()) {
							
			/**
			* Displays the containts of the database
			* also contains a form that holds the hidden value of an array
			* so that once the button add to cart is selected
			* it adds the contents to be used in the Cart.Java file
			*/
			%>
			<form action="Cart" method="post">
							<div class="w3-padding-16">
			
								<b><%=rs.getString("Gender")%></b> <input type="hidden"	value=<%=rs.getString("Gender")%> name="items[]"> 
								<b><%=rs.getString("Breed")%></b> <input type="hidden" value=<%=rs.getString("Breed")%> name="items[]"> 
								<b><%="$" + rs.getString("Price")%></b> <input type="hidden" value=<%=rs.getString("Price")%> name="items[]">
								<input type="hidden" value=<%=animal%> name="Animals"> 
								<input type="submit" value="Add to Cart" name="Add to Cart"> <br>
								<b><%=rs.getString("Descri")%></b>
							</div>
						</form>
			<%
				}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>
		</div>
		</div>
	
		<div class="w3-container w3-teal">

			<p>The Java Pet Store Demo is a fictional sample application based on the Java BluePrints by Sun Microsystems used as Java training for the eCommerce division at the Exchange</p>
		</div>
	</body>
</html>