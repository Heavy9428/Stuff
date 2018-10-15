package com.Connection;
import java.sql.*;


/**
 * Handles the Connections for the database so anychange
 * is made to just one file and not the entire program
 *
 */
public class Connections {

	static Connection myconn;
	static String DBurl;
	
	public static Connection conManager() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PetShop?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago", "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return myconn;
		
		
	}
}
