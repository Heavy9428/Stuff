import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
		HttpSession session = request.getSession();
		String items_values[] = request.getParameterValues("update_items[]");

		User currentUser = (User) (session.getAttribute("currentSessionUser"));
		int UID = currentUser.getUserID();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Connection myconn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/PetShop?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago",
					"Trebingm", "Ultima383");
			// five items per entry...... id,breed,gender,Quantity, Price

			Statement stmt = myconn.createStatement();
			String sql = "Select * from Customer_Cart where ID=" + UID;
			ResultSet rs = stmt.executeQuery(sql);
			int i = 0;

			// loopes through the dbs
			while (rs.next()) {

				// gets the current Quantity from the DBS
				String Quantity = rs.getString("Quantity_B");

				if (Integer.parseInt(items_values[i + 3]) == 0) {

					String query3 = "Delete from Customer_Cart Where ID =? and Breed = ? and Gender =?";

					PreparedStatement pstmt = myconn.prepareStatement(query3);
					pstmt.setString(1, rs.getString("ID"));
					pstmt.setString(2, rs.getString("Breed")); // Breed
					pstmt.setString(3, rs.getString("Gender")); // Gender
					pstmt.execute();
					i = i + 5;

				} 
				else if (!Quantity.equals(items_values[i + 3])) {
					
					
						String sql2 = "UPDATE Customer_Cart SET Quantity_B=?,Price=? WHERE ID =? AND Breed = ? and Gender = ?";
						String old_price = rs.getString("Price");

						// takes the original price and multiplies it by the new Quantity
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
				else {
					i=i+5;
				}

			}
			response.sendRedirect("Checkout.jsp");
		}

		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
