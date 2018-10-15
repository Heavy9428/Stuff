package com.Login;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		/**
		 * Will try to connect to the User class and 
		 * will request the name and password parameter from the 
		 * Login.jsp file and then calls UserDoa to verify if
		 * they are able to login or not
		 */
		try {
			User user = new User();
			user.setUser(request.getParameter("name"));
			user.setPassword(request.getParameter("password"));
			user = UserDoa.login(user);
			
			
			/**
			 * Checks to see if the User flag is set to true if so 
			 * it sets the user attribute and redirects the user
			 * to the Loggedin screen if it is not 
			 * valid they are told it is incorrect and redirected to 
			 * the login screen
			 */
			if(user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser",user);
				response.sendRedirect("Loggedin.jsp");
			}
			else {
				JOptionPane.showMessageDialog(null, "Incorrect Username or Password");
				response.sendRedirect("Login.jsp");
			}
						}
		catch(Exception e) {
			e.printStackTrace();
		}
		

}
}