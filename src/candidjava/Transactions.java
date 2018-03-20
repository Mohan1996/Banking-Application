package candidjava;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Transactions
 */
@WebServlet("/Transactions")
public class Transactions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Transactions() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = null;
		String savingsBeingTransferred = null;
		String savingsToTransferTo = null;
		String newBalanceOfTarget = null;
		String newBalanceOfUser = null;
		
		Cookie[] cookies = request.getCookies();
		if (cookies !=null)
		{
			for(Cookie cookie: cookies) {
				if(cookie.getName().equals("username")) userName = cookie.getValue();
				
			}
		}

		if(userName == null) response.sendRedirect("loginAfterError.jsp");
		
		
		String accountNumber=request.getParameter("accountnumber");
		String amount=request.getParameter("amount");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", ""); // gets a new connection
 
		PreparedStatement ps = c.prepareStatement("SELECT savings FROM bank WHERE username = ?;");
		
		PreparedStatement ps2 = c.prepareStatement("SELECT savings FROM bank where account_number = ?;");
		
		ps.setString(1, userName);
		
		ps2.setString(1, accountNumber);
	 
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())  {
		    savingsBeingTransferred=new String(rs.getString(1));
	
		    }
		
		int savingsValueOfUser= Integer.parseInt(savingsBeingTransferred);
		int amountValue= Integer.parseInt(amount);
		
		if (amountValue <= 0)
		{
			String message = "Please input an amount higher then 0";
			request.setAttribute("message", message);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("transactionError.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		if (amountValue > savingsValueOfUser)
		{
			String message = "Your savings isn't enough to cover this amount transfer";
			request.setAttribute("message", message);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("transactionError.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		ResultSet rs2 = ps2.executeQuery();
		
		if(rs2.next()) {
			savingsToTransferTo=new String(rs2.getString(1));	
		}
		
		else {
			String message = "Invalid account number";
			request.setAttribute("message", message);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("transactionError.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		int savingsBeingTransferredTo = Integer.parseInt(savingsToTransferTo);
		
		savingsBeingTransferredTo = amountValue + savingsBeingTransferredTo;
		
		savingsValueOfUser = savingsValueOfUser - amountValue;
		
		newBalanceOfTarget = Integer.toString(savingsBeingTransferredTo);

		 
		newBalanceOfUser = Integer.toString(savingsValueOfUser);

		
		
		PreparedStatement ps3 = c.prepareStatement("UPDATE bank set savings = ? WHERE username = '"+userName+"'");
		
		ps3.setInt(1, savingsValueOfUser);
				
		ps3.executeUpdate();
		
		PreparedStatement ps4 = c.prepareStatement("UPDATE bank set savings = ? WHERE account_number = ?");
		
	
		int acnNumber = Integer.parseInt(accountNumber);
		
        ps4.setInt(1, savingsBeingTransferredTo);
		
		ps4.setInt(2, acnNumber);
		
		ps4.executeUpdate();
		

		
		String message = "The money has been transferred! New Bank Balance is: " + savingsValueOfUser;
		request.setAttribute("message", message);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("transactionSuccess.jsp");
		dispatcher.forward(request, response);
		return;
		
	
	
        }catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
		
		
		
		
