<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import ="com.Login.User"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%> 
<%@page import = "java.sql.Statement"%> 
<%@page import = "java.sql.Connection"%> 
<%@page import = "java.sql.PreparedStatement"%>
<%@page import= "javax.servlet.http.HttpSession" %>
<%@page import="com.Connection.Connections" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Checkout</title>
</head>
	<body>
			<div class="w3-container w3-border-bottom w3-margin">
			<h1>Java Pet Store</h1>
			<div class="w3-right-align">
				<a href="http://localhost:8080/PetShop/Account.jsp">Account|</a> 
				<a href="http://localhost:8080/PetShop/Checkout.jsp">|Cart|</a> 
				<a href="http://localhost:8080/PetShop/Logout.jsp">Log Out</a>
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
				
				<div class = "w3-half w3-border w3-border-blue w3-margin">
				
				<%
				
				/**
				* Outputs the information of the customer's cart
				* Which contains the total price and the contents of  
				* the user's specific ID 
				*/
				
					float total_price = 0;
					User currentUser = (User) (session.getAttribute("currentSessionUser"));
					int UID = currentUser.getUserID();

					Connection myconn = Connections.conManager();
					Statement stmt = myconn.createStatement();
					String sql = "Select * from Customer_Cart where ID=" + UID;

					ResultSet rs = stmt.executeQuery(sql);

					
					/**
					* Will loop through the database to output the 
					* information to the screen. It also holds a hidden
					* value array called update_items[] that will allow
					* Checkout.java to update the quantity or remove the item
					* from the database.
					*/
					while (rs.next()) {
				%>
				
					<form method="post" action = "Checkout">
					
					<input type ="hidden" value = <%=rs.getString("ID")%> name = "update_items[]">
					
						<b><%=rs.getString("Gender")%></b>
						<input type ="hidden" value = <%=rs.getString("Gender")%> name = "update_items[]">
							
						<b><%=rs.getString("Breed").replace("_"," ")%></b> 
						<input type ="hidden" value = <%=rs.getString("Breed")%> name = "update_items[]">
							
						<select name="update_items[]">
						<option><%=rs.getString("Quantity_B")%></option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option value = "0"> Remove </option>
						</select>
						
						
						
						<b>$<%=rs.getString("Price")%></b>
						<input type ="hidden" value = <%=rs.getString("Price")%> name = "update_items[]">							
						<br>
				<%
					total_price = Float.valueOf(rs.getString("Price")) + total_price;

					}
				%>

				<input type = "submit" value = "Update">
				
					<b>Total: $<%=total_price%></b>
					</form>
					<a href="http://localhost:8080/PetShop/Order.jsp">Checkout</a>
					
				
				</div>
			</div>
				<div class="w3-container w3-teal">
			
			  <p>The Java Pet Store Demo is a fictional sample application based on the Java BluePrints by Sun Microsystems used as Java training for the eCommerce division at the Exchange</p>
			</div> 
	</body>
</html>