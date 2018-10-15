/**
 * This Cart.Java class is desingned to accept the parameters given from the user in the 
 * Cart.jsp file. This file also checks to see if the user has added the item previously to 
 * their cart andwill update the Quantity if it has if not it will add it to their cart.
 */

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
import javax.swing.JOptionPane;

import com.Connection.Connections;
import com.Login.User;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cart() {
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
		 * Grabs the current Session to allow to check for the User
		 */
		HttpSession session = request.getSession();
		
		/**
		 * Grabs the current user that is logged in to the Pet shop
		 */
		User currentUser = (User) (session.getAttribute("currentSessionUser"));

		
		/**
		 * Both grab the items from the Cart.jsp page and will store their respected
		 * values to be used late
		 * 
		 * value will hold the current animal so the page can be redirected back.
		 * 
		 * values[] is set up gender, breed , price 
		 */
		String value = request.getParameter("Animals");
		String values[] = request.getParameterValues("items[]");

		
		/**
		 * Checks to see if the current user is Null
		 * A customer is allowed to look at what is available in the store
		 * they just can not add it to their cart
		 * 
		 * Redirects them to the Login page 
		 */
		if (currentUser == null) {
			JOptionPane.showMessageDialog(null, "Please Register or Login before adding items to the Cart");
			response.sendRedirect("Login.jsp");
		} 
		
		/**
		 * If the User is logged in it will either 
		 * Update their cart or Add the new item to their cart
		 */
		else {
			
			/**
			 * Required to get the currentUsers ID 
			 * to ensure only their section of the 
			 * Cart DataBase is updated
			 */
			int UID = currentUser.getUserID();
			
			/**
			 * Creates the Connection with the database system
			 */
			Connection myconn = Connections.conManager();
			
			/**
			 * SQL statement to pull all records from the customer cart
			 * with the current user's id
			 */
			String Sql = "Select * from Customer_Cart Where ID =" + UID;

			

			try {
				
				
				Statement stmt = myconn.createStatement();
				ResultSet rs = stmt.executeQuery(Sql);
				Boolean con = true;
				
				/**
				 * Goes through each of the records that 
				 * was retrived from the data base and pulls the 
				 * Breed and Gender from it
				 */
				while (rs.next()) {

					String breed = rs.getString("Breed");
					String gender = rs.getString("Gender");
					
					/**
					 * If the breed and the gender are already in the 
					 * database the database needs to be updated to have another 
					 * in the Quantity section and the price altered
					 */
					if (breed.equals(values[1]) && gender.equals(values[0])) 
					{

						/**
						 * SQL statement to Update the cart's Quantity and Price for the given 
						 * pet
						 */
						String sql2 = "UPDATE Customer_Cart SET Quantity_B=?,Price=? WHERE ID =? AND Breed = ? and Gender = ?";


						/**
						 * Grabs the current Quantity and converts it to 
						 * a int to add one more to the Quantity before converting it back
						 * to a string to be added to the database
						 * 
						 * Also calculates the new price based on the new quantity and original price 
						 */
						String Quantity = rs.getString("Quantity_B");
						int Quantity_value = Integer.parseInt(Quantity) + 1;
						Quantity = String.valueOf(Quantity_value);
						String old_price = rs.getString("Price");
						float new_price = (Float.valueOf(old_price) / (Float.valueOf(Quantity) - 1))
								* Float.valueOf(Quantity);

						/**
						 * PreparedStatement to Update the items
						 * in the database 
						 */
						PreparedStatement pstmt = myconn.prepareStatement(sql2);
						pstmt.setString(1, Quantity); // Quantity
						pstmt.setString(2, String.valueOf(new_price)); // price
						pstmt.setString(3, rs.getString("ID")); // ID
						pstmt.setString(4, rs.getString("Breed")); // Breed
						pstmt.setString(5, rs.getString("Gender")); // Gender
						pstmt.execute();

						JOptionPane.showMessageDialog(null, "Item Updated in your Cart");
						
						/**
						 * If the item was updated con is set to false to 
						 * does not allow the add item to cart to run
						 */
						con = false;
						/**
						 * Breaks out of the rs loop
						 */
						break;
					}
				}
				
				/**
				 * If con is set to tru then all that is needed
				 * is to add the item to the customers cart 
				 */
				if(con==true) 
				{
					PreparedStatement pstmt = myconn.prepareStatement("Insert into Customer_Cart values(?,?,?,?,?)");
					pstmt.setInt(1, UID);// customer id
					pstmt.setString(2, values[1]);// breed
					pstmt.setString(3, values[0]);// gender
					pstmt.setInt(4, 1);// quantity bought
					pstmt.setFloat(5, Float.parseFloat(values[2]));
					pstmt.executeUpdate();
					JOptionPane.showMessageDialog(null, "Item Added To Your Cart");
				
				}
				
			} 
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
				try {
					myconn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		response.sendRedirect("/PetShop/Animals.jsp?value=" + value);
	}
}