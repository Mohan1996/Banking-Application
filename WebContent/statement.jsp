<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Statement</title>
</head>
<body>


<b><font color="black" size ="15"><A HREF="home.jsp" style="text-decoration:none" class="A">Home Page</a></font></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

<b><font color="black" size = "15"><A HREF="transaction.jsp" style="text-decoration:none" class="A">Transfer Money</a></font></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

<b><font color="black" size = "15"><A HREF="login.jsp" style="text-decoration:none" class="A">Logout</a></font></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;


<br><br><br><br>
<%
String userName = null;
String fname = null; 
String savings = null;
String lname = null;

Cookie[] cookies = request.getCookies();
if (cookies !=null)
{
	for(Cookie cookie: cookies) {
		if(cookie.getName().equals("username")) userName = cookie.getValue();
		
	}
}
if(userName == null) response.sendRedirect("loginAfterError.jsp");


try{  
	
	
Class.forName("com.mysql.jdbc.Driver");  

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root",""); 

PreparedStatement stmt=con.prepareStatement("SELECT first_name FROM users WHERE username = ?;");
PreparedStatement stmt2=con.prepareStatement("SELECT savings FROM bank WHERE username = ?;");
PreparedStatement stmt3=con.prepareStatement("SELECT last_name FROM users WHERE username = ?;");

stmt.setString(1, userName);
stmt2.setString(1, userName);
stmt3.setString(1, userName);

ResultSet rs=stmt.executeQuery();
ResultSet rs2=stmt2.executeQuery();
ResultSet rs3=stmt3.executeQuery();

if(rs.next())  {
    fname=new String(rs.getString(1));
    }

if(rs2.next()) {
	savings = new String(rs2.getString(1));
  }

if(rs3.next()) {
	lname = new String(rs3.getString(1));
  }
}
catch(Exception e){ 
  System.out.println(e);
 }  





%> 
<table style="width:100%">
  <tr>
    <th>User</th>
    <th>Name</th> 
    <th>Savings</th>
  </tr>
  <tr>
    <td><%=userName %></td>
    <td><%=fname %> <%=lname %></td> 
    <td><%=savings %></td>
  </tr>
</table>
</body>
</html>