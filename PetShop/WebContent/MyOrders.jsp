<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.Connection.Connections"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Orders</title>
</head>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<body>
	<div class="w3-container w3-border-bottom w3-margin">
		<h1>Java Pet Store</h1>
		<div class="w3-right-align">
			<a href="http://localhost:8080/PetShop/Account.jsp">Account|</a> <a
				href="http://localhost:8080/PetShop/Checkout.jsp">|Cart|</a> <a
				href="http://localhost:8080/PetShop/Logout.jsp">Log Out</a>
		</div>
	</div>

	<div class="w3-container">

		<div class="w3-quarter w3-container w3-border w3-border-green">
			<a href="http://localhost:8080/PetShop/Animals.jsp?value=Birds">Birds</a>
			<br /> <a
				href="http://localhost:8080/PetShop/Animals.jsp?value=Cats">Cats</a>
			<br /> <a
				href="http://localhost:8080/PetShop/Animals.jsp?value=Dogs">Dogs</a>
			<br /> <a
				href="http://localhost:8080/PetShop/Animals.jsp?value=Fish">Fish</a>
			<br /> <a
				href="http://localhost:8080/PetShop/Animals.jsp?value=Reptiles">Reptiles</a>
		</div>
	
	<div class="w3-threequarter w3-border w3-border-red">
	<table align = "center" cellpadding="6" cellspacing ="5">
		<tr>
			<td><b>Gender</b></td>
			<td><b>Breed</b></td>
			<td><b>Quantity</b></td>
			<td><b>Price</b></td>
		</tr>

		<%
			String value = (String) request.getParameter("value");

			Connection myconn = Connections.conManager();
			String sql = "Select * from Order_ID where Order_iD =" + value;
			Statement stmt = myconn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				
		%>

		<tr>
			<td><%=rs.getString("Gender")%></td>
			<td><%=rs.getString("Breed").replace("_"," ")%></td>
			<td><%=rs.getString("Quantity")%></td>
			<td><%="$" + rs.getString("Price")%></td>
		</tr>
	

	<%
		}
			myconn.close();
	%>
</table>
</div>
</div>
<div class="w3-container w3-teal">

		<p>The Java Pet Store Demo is a fictional sample application based
			on the Java BluePrints by Sun Microsystems used as Java training for
			the eCommerce division at the Exchange</p>
	</div>
</body>
</html>


