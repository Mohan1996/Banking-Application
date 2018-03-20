<head>
<link rel="stylesheet" type="text/css"href="style.css">
</head>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

</head>

<body> 


	

	<form action="LoginController" method="post">
	<div class = "container">
	    <header>Welcome to Xcel Banking!</h3></header>
		<label>Enter username :<input type="text" name="username"> </label><br>
		 <div class="help">At least 6 characters!</div>
		<label>Enter password :<input type="password" name="password"></label><br>
		<div class="help">Use upper and lowercase lettes as well</div>
		<button>Login</button>
		<br>
		
		<font size ="15"><A HREF="register.jsp" style="text-decoration:none" class="A">Not registered? Create an account</a></font>
		
    </div>

</form>
</body>
</html>