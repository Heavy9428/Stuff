package com.Reg;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reg
 */
@WebServlet("/Reg")
public class Reg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Reg() {
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
		doGet(request, response);
		String uName = request.getParameter("UserName");
		String password = request.getParameter("Password");
		String fName = request.getParameter("First Name");
		String lName = request.getParameter("Last Name");
		String Email = request.getParameter("email");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection myconn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/PetShop?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago",
					"Trebingm", "Ultima383");

			String query = "INSERT into User(User_Name, Password,First,Last,Email)" + "values(?,?,?,?,?)";

			PreparedStatement pstmt = myconn.prepareStatement(query);

			pstmt.setString(1, uName);
			pstmt.setString(2, password);
			pstmt.setString(3, fName);
			pstmt.setString(4, lName);
			pstmt.setString(5, Email);

			int i = pstmt.executeUpdate();
			if (i == 1) {
				// HttpSession session = request.getSession();
				response.sendRedirect("Login.jsp");
				myconn.close();
			} else {

			}

		} catch (SQLException sqle) {
			// TODO Auto-generated catch block
			sqle.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
