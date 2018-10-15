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
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Checkout() {
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
		 * Creates a session the will request the current logged in user
		 */
		HttpSession session = request.getSession();
		User currentUser = (User) (session.getAttribute("currentSessionUser"));
		int UID = currentUser.getUserID();

		/**
		 * Grabbed from the Checkout.jsp page to allow to update the cart if the
		 * customer chooses to before they buy the item. this allows them to add up to
		 * 10 items or remove it entirly items_value[] is set up in the order of
		 * id,breed,gender,Quantity, Price
		 */
		String items_values[] = request.getParameterValues("update_items[]");

		/**
		 * Creates the Connection to the Database
		 */
		Connection myconn = Connections.conManager();
		Statement stmt;
		try {
			stmt = myconn.createStatement();

			String sql = "Select * from Customer_Cart where ID=" + UID;
			ResultSet rs = stmt.executeQuery(sql);
			int i = 0;

			/**
			 * Need to loop through all items that are current;y tied to the user's
			 * Customer's Cart to find the location of the item they would like to either
			 * update or delete
			 */
			while (rs.next()) {

				/**
				 * The quantity for each item is needed from the database to see if it is
				 * diffrent than what is required
				 */
				String Quantity = rs.getString("Quantity_B");

				/**
				 * If the quantity in items_values is equal to 0 the customer would like to
				 * delete the item from their cart
				 */
				if (Integer.parseInt(items_values[i + 3]) == 0) {

					String query3 = "Delete from Customer_Cart Where ID =? and Breed = ? and Gender =?";

					PreparedStatement pstmt = myconn.prepareStatement(query3);
					pstmt.setString(1, rs.getString("ID"));
					pstmt.setString(2, rs.getString("Breed")); // Breed
					pstmt.setString(3, rs.getString("Gender")); // Gender
					pstmt.execute();

					/**
					 * Has to add five to i to allow the array to hold the correct positions of a
					 * item
					 */
					i = i + 5;

				}

				/**
				 * If the Quantity in the items-values array is not equal to the quantity then
				 * the customer would like to change how much of a particular item is available
				 */
				else if (!Quantity.equals(items_values[i + 3])) {

					/**
					 * Will update the cart's price and quantity that is stored in the customer's
					 * cart
					 */

					String sql2 = "UPDATE Customer_Cart SET Quantity_B=?,Price=? WHERE ID =? AND Breed = ? and Gender = ?";
					String old_price = rs.getString("Price");

					float new_price = (Float.valueOf(old_price) / Float.valueOf(Quantity))
							* Float.valueOf(items_values[i + 3]);

					PreparedStatement pstmt = myconn.prepareStatement(sql2);
					pstmt.setString(1, items_values[i + 3]); // Quantity
					pstmt.setString(2, String.valueOf(new_price)); // price
					pstmt.setString(3, rs.getString("ID")); // ID
					pstmt.setString(4, rs.getString("Breed")); // Breed
					pstmt.setString(5, rs.getString("Gender")); // Gender
					pstmt.execute();
					i = i + 5;
				}
				/**
				 * If it is either not 0 or it is the same value we go to the next set of data
				 * in items_values[] by incrementing i by 5
				 */
				else {
					i = i + 5;
				}

			}
			response.sendRedirect("Checkout.jsp");
			myconn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
	
