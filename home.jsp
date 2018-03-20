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
<link rel="stylesheet" type="text/css" href="home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<%
String userName = null;
String fname = null;
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
stmt.setString(1, userName);

ResultSet rs=stmt.executeQuery();

if(rs.next())  {
    fname=new String(rs.getString(1));
    }
}
catch(Exception e){ 
  System.out.println(e);
 }  
%>  

<form>
<h3>Hello <%= fname %>, You have logged in! Choose from one of the links below</h3><br>

        <A HREF="statement.jsp" style="text-decoration:none" class="A">Display Bank Statement</a>
        <br><br>
        
        <A HREF="transaction.jsp" style="text-decoration:none" class="A">Transactions</a>
        <br><br>
 </form>     
</body>
</html>