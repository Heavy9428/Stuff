<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "Orders" method ="Post">
<b>Shipping Information</b>
First Name: <input type="text" name ="First_Name">
Last Name: <input type="text" name="Last_Name">
Street Address: <input type = "text" name ="address">
City: <input type ="text" name = "City">
State/Province:<select name ="state">
<option>TX</option>
<option>CA</option>
<option>MI</option>
</select> 

Zip Code:<input type ="text" name = "zip">
Telephone<input type = "text" name="number">
Email<input type = "text" name ="Email">

<b>Billing Information</b>

Card Number:<input type="text" name ="card">
Experation:<input type="text" name ="Exp">
Security Pin:<input type ="text" name ="Pin">


		  <input type="submit" value="Buy">
		  </form>
</body>
</html>