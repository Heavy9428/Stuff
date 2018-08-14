package com.Cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.Login.Connections;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session = request.getSession();
		
		String value = request.getParameter("Animals");
		
		String values[]=request.getParameterValues("items[]");
		
		
		User currentUser=(User)(session.getAttribute("currentSessionUser"));
		int UID = currentUser.getUserID();
		
		Connection myconn = Connections.conManager();
		try {
			PreparedStatement pstmt = myconn.prepareStatement("Insert into Customer_Cart values(?,?,?,?,?)");
			pstmt.setInt(1, UID);//customer id
			pstmt.setString(2, values[0]);//breed
			pstmt.setString(3, values[1]);//gender
			pstmt.setInt(4, 1);//quantity bought
			pstmt.setFloat(5, Float.parseFloat(values[2]));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		
		
		JOptionPane.showMessageDialog(null, "Item Added To Your Cart");
		response.sendRedirect("/PetShop/Animals.jsp?value="+value);	
	}
}
