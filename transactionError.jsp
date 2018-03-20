<!DOCTYPE html>



<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
<meta charset="ISO-8859-1">
<title>Transactions</title>
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
<header><font size ="20">Fill out the form to transfer money!</font></header>






	
	<br> 
	<br>
	<br>
	

	<form action="Transactions" method="post">
		Enter Account Number :<input type="number" maxlength="6" name = "accountnumber" required/><br>
		<br>
		Enter Amount :<input type="number" name="amount" required><br>
		<br>
		<input type="submit" value="Transfer">
		<br>
		<br>
		
 <%= request.getAttribute("message") %>   
	</form>

</body>
</html>