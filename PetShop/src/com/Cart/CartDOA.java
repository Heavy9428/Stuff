package com.Cart;

import java.sql.Connection;
import java.sql.ResultSet;

import com.Login.Connections;


public class CartDOA {
	static Connection myconn = null;
	static ResultSet rs = null;
	
	public static void Test() {
		try {
			myconn = Connections.conManager();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
