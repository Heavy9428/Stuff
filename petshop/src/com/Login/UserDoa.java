package com.Login;
import java.sql.*;
import com.Connection.Connections;
public class UserDoa {
	static Connection myconn = null;
	static ResultSet rs = null;
	
	/**
	 * Checks to see if the user is in the database
	 * If the user is it will assaign the information to the 
	 * getters and setters in User.java
	 * if not sets isValid to false.
	 */
	public static User login(User bean) {
		Statement stmt = null;
		String username = bean.getUser();
		String password = bean.getPassword();
		String query =  "Select * from User where User_Name='" + username + "' AND password='" + password + "'";
		try {
			myconn = Connections.conManager();
			stmt = myconn.createStatement();
			rs=stmt.executeQuery(query);
			boolean isTrue = rs.next();
			
			if(!isTrue) {
				bean.setValid(false);
			}
			else if(isTrue)
			{
				
				int User_ID;
				String First = rs.getString("First"); 
				String Last = rs.getString("Last");
				String S_User_ID = rs.getString("ID");
				User_ID= Integer.parseInt(S_User_ID);
				
				bean.setfirstName(First);
				bean.setLastName(Last);
				bean.setUserID(User_ID);
				bean.setValid(true);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
}