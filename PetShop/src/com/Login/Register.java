package com.Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.Connection.Connections;

/**
 *This class will register the user to the data base 
 * which will allow them to make "purchases"
 * in the pet store
 */

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection myconn = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		/**
		 * Requests the infromation form the Login screen to allow the user to make a
		 * account
		 */
		boolean rFields = true;
		String message ="";
		
		String uName = request.getParameter("UserName");
		if (uName.equals("")) {
			rFields = false;
			message = "Missing User Name " + message;
		}
		String password = request.getParameter("Password");
		if (password.equals("")) {
			rFields = false;
			message = "Missing Password "+ message;

		}
		String fName = request.getParameter("First Name");
		if (fName.equals("")) {
			rFields = false;
			message = "Missing First Name "+ message;

		}
		String lName = request.getParameter("Last Name");
		if (lName.equals("")) {
			rFields = false;
			message = "Missing Last Name "+ message;
		}

		String Email = request.getParameter("email");
		if (Email.equals("") || Email.indexOf('@') == -1) {
			rFields = false;
			message = "Missing or Incorrect Email "+ message;

		}

		if (rFields == false) {
			JOptionPane.showMessageDialog(null, message);
			response.sendRedirect("Login.jsp");

		} else {
			try {

				myconn = Connections.conManager();

				String query1 = "Select * from User where User_Name='" + uName + "' or Email='" + Email + "'";
				Statement stmt = myconn.createStatement();
				ResultSet rs = stmt.executeQuery(query1);
				boolean check = rs.next();
				if (check == true) {
					JOptionPane.showMessageDialog(null, "Username or Email already exists");
					response.sendRedirect("Login.jsp");
				} else {

					String query = "INSERT into User(User_Name, Password,First,Last,Email)" + "values(?,?,?,?,?)";

					PreparedStatement pstmt = myconn.prepareStatement(query);

					pstmt.setString(1, uName);
					pstmt.setString(2, password);
					pstmt.setString(3, fName);
					pstmt.setString(4, lName);
					pstmt.setString(5, Email);

					int i = pstmt.executeUpdate();
					if (i == 1) {
						JOptionPane.showMessageDialog(null, "Thank you for Registering! Please Login Now!");
						response.sendRedirect("Login.jsp");
					} else {
						JOptionPane.showMessageDialog(null, "Unable to Register");
					}
					myconn.close();
				}
			} catch (SQLException sqle) {
				// TODO Auto-generated catch block
				sqle.printStackTrace();
			}
		}
	}
}