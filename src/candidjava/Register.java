package candidjava;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Register() {
        super();

    }

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			
			String name = request.getParameter("user");
			String password = request.getParameter("password");
			String repassword = request.getParameter("repassword");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String email = request.getParameter("email");
			String accountnumber = request.getParameter("accountnumber");
			String type = request.getParameter("type");
			
			if (repassword != null && !repassword.equals(password)) {
				
				String message = "Passwords don't match";
				request.setAttribute("message", message);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("RegisterAfterError.jsp");
				dispatcher.forward(request, response);
				return;
				
	           
	        }
	    
			
		
			String sql = "insert into users(first_name,last_name,username,password,email) values(?,?,?,?,?)"; 
			String sql2 = "insert into bank(username,account_number,type) values(?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root","");
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ps.setString(3, name);
			ps.setString(4, password);
			ps.setString(5, email);
			ps.executeUpdate();			
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1,  name);
			ps2.setString(2, accountnumber);
			ps2.setString(3, type);
			ps2.executeUpdate();
			
			
			String message = "You have successfuly registered! Please log in to your account";
			request.setAttribute("message", message);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginAfterRegister.jsp");
			dispatcher.forward(request, response);
			
	       
			
		
			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
