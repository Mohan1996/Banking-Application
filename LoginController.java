package candidjava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		// Connect to mysql and verify username password
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", ""); // gets a new connection
 
		PreparedStatement ps = c.prepareStatement("select username,password from users where username=? and password=?");
		ps.setString(1, username);
		ps.setString(2, password);
 
		ResultSet rs = ps.executeQuery();
 
		while (rs.next()) {			
			Cookie userCookie = new Cookie("username", username);
			userCookie.setMaxAge(30*60*60);
			response.addCookie(userCookie);
			response.sendRedirect("home.jsp");
			return;
			

		}
		String message = "Invalid username or password";
		request.setAttribute("message", message);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("loginAfterError.jsp");
		dispatcher.forward(request, response);
		return;
		
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}

}
