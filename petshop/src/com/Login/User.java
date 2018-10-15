package com.Login;

/**
 * Class of Getters and Setters to set information 
 * about the user who is logged in to allow the 
 * program to get information that is required
 */


public class User {

	private int UID;
	private String username; 
	private String password; 
	private String firstName; 
	private String lastName; 
	private boolean valid;
	

	public String getUser() {
		return username;
	}
	
	public void setUser(String nUsername) {
		username = nUsername;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String nPassword) {
		password = nPassword;
	}
	
	public String getfirstName() {
		return firstName;
	}
	
	public void setfirstName(String nFirstName) {
		firstName = nFirstName;
	}
	
	public String getlastName() {
		return lastName;
	}
	
	public void setLastName(String nLastName) {
		lastName=nLastName;
	}
	
	 public boolean isValid() { 
		 return valid; 
	}
	
	public void setValid(boolean newValid) { 
		valid = newValid; 
	} 
	
	public int getUserID() {
		return UID;
	}
	
	public void setUserID(int nUID) {
		UID=nUID;
	}
}