<!DOCTYPE html>



<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
<meta charset="ISO-8859-1">
<title>Withdraw</title>
</head>
<body>
<div id = links>
<b><font color="black" size ="15"><A HREF="home.jsp" style="text-decoration:none" class="A">Home Page</a></font></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

<b><font color="black" size = "15"><A HREF="statement.jsp" style="text-decoration:none" class="A">Display Statement</a></font></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

<b><font color="black" size = "15"><A HREF="login.jsp" style="text-decoration:none" class="A">Logout</a></font></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

</div>

<br>
<br>
<br>
<header><font size ="20">Fill out the form to withdraw money!</font></header>



	
	<br> 
	<br>
	<br>
	

	<form action="Withdraw" method="post">
		Password: <input type="password" name="password" required/><br>
		<br>
		Enter Amount :<input type="number" name="amount" required><br>
		<br>
		<input type="submit" value="Withdraw">
		<br>
		
    
	</form>

</body>
</html>