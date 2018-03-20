
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" type="text/css"href="register.css">
<meta charset="ISO-8859-1">
<title>Registration Page</title>

</head>


<body>
<div align="center">
<form action="Register" method="post">
<header>Fill out the registeration form to create your account!</header>
<br>
<label>First Name: <input type="text" name="firstname" required/> <br> Last Name: <input type="text" name="lastname" required/></label><br>
<br>
<label>Username: <input type="text" name="user" required/> <br> Password: <input type="password" name="password" required/></label><br>
<br>
<label>Retype Password: <input type="password" name="repassword" required/> <br> Email: <input type="email" name = "email" required/></label><br>
<br>
<label>Type: <input type ="text" name="type" required/> <br> 6-Digit Account Number: <input type="number" maxlength="6" name = "accountnumber" required/></label>
<br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button>Register</button>
</form>
</div>
</body>
</html>