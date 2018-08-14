<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import ="com.Login.User"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%> 
<%@page import = "java.sql.Statement"%> 
<%@page import = "java.sql.Connection"%> 
<%@page import = "java.sql.PreparedStatement"%>
<%@page import= "javax.servlet.http.HttpSession" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Checkout</title>
</head>
<body>
		<div class="w3-container w3-teal">
		  <h1>Header</h1>
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
			
			<div class = "w3-half w3-border w3-border-blue">
			<a href="http://localhost:8080/PetShop/Order.jsp">Checkout</a>
			<%
			float total_price = 0;
			User currentUser=(User)(session.getAttribute("currentSessionUser"));
			int UID = currentUser.getUserID();
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PetShop?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago","Trebingm", "Ultima383");
				Statement stmt = myconn.createStatement();
				String sql = "Select * from Customer_Cart where ID=" + UID;
				ResultSet rs=stmt.executeQuery(sql);
				
				while(rs.next()){%>
				<form method="post" action = "Checkout">
				
				<input type ="hidden" value = <%=rs.getString("ID")%> name = "update_items[]">
				
					<b><%=rs.getString("Gender")%></b>
					<input type ="hidden" value = <%=rs.getString("Gender")%> name = "update_items[]">
						
					<b><%=rs.getString("Breed")%></b> 
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
				<%total_price = Float.valueOf(rs.getString("Price"))+total_price;
				
				
				}%>
				
				<input type = "submit" value = "Update">
				<b>Total: $<%=total_price%></b>
				</form>
				
			
			<%}
			catch(ClassNotFoundException e){
					 e.printStackTrace();
			}%>
			
			</div>
			</div>
			<div class="w3-container w3-teal">
		
		  <p>Footer information goes here</p>
		</div> 
</body>
</html>