package com.Cart;

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
import javax.servlet.http.HttpSession;

import com.Connection.Connections;
import com.Login.User;

/**
 * Servlet implementation class Order
 */
@WebServlet(name = "Orders", urlPatterns = { "/Orders" })
public class Orders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Orders() {
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

		Connection myconn = Connections.conManager();

		/**
		 * Due to this being a test application when the customer decides they want to
		 * purchase an item from the data base it will cleat it out of the customer cart
		 */
		try {
			HttpSession session = request.getSession();
			User currentUser = (User) (session.getAttribute("currentSessionUser"));
			int UID = currentUser.getUserID();
			String SUID = Integer.toString(UID);

			String move_from = "Select * from User LEFT JOIN Customer_Cart on User.ID=Customer_Cart.ID";
			Statement stmt = myconn.createStatement();
			stmt.executeQuery(move_from);

			ResultSet rs = stmt.executeQuery(move_from);

			String move_to = "Insert into Order_ID(ID,First,Last,Email,Order_ID,Breed,Gender,Price,Quantity)"
					+ "values(?,?,?,?,?,?,?,?,?)";
			String value = request.getParameter("Orders");
			session.setAttribute("Order_id", value);

			while (rs.next()) {

				PreparedStatement pstmt = myconn.prepareStatement(move_to);

				pstmt.setString(1, rs.getString("ID"));
				pstmt.setString(2, rs.getString("First"));
				pstmt.setString(3, rs.getString("Last"));
				pstmt.setString(4, rs.getString("Email"));
				pstmt.setString(5, value);
				pstmt.setString(6, rs.getString("Breed"));
				pstmt.setString(7, rs.getString("Gender"));
				pstmt.setString(8, rs.getString("Price"));
				pstmt.setString(9, rs.getString("Quantity_B"));
				pstmt.execute();
			}

			String query = "Delete from Customer_Cart Where ID = ?";
			PreparedStatement pstmt = myconn.prepareStatement(query);
			pstmt.setString(1, SUID);
			pstmt.execute();
			response.sendRedirect("Bought.jsp");
			myconn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				myconn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

