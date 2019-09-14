<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REVATURE CHARITY TRUST</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<title>LOgin</title>
</head>
<body>
<script>
function login(){
    event.preventDefault();
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var role=document.getElementById("role").value;
    var formData = "email=" + email + "&password=" + password+ "&role="+role;
    console.log(formData);

    var url="http://localhost:8080/charity/LoginSevlet"+formData;
    console.log(url);
    var formData = {};
    $.get(url, function(response){
            console.log(response);
    });
}
</script>
<form onsubmit="login()">
<label>Email:</label>
<input type="email" name="email" id="email" placeholder="Enter Email"  required autofocus />
<br/>
<label>Password:</label>
<input type="password" name="password" id="password" placeholder="Enter Password" required />
<br/>
<label>Role:</label>
<select>
<option value="Admin">Admin</option>
<option value="Donor" selected>Donor</option>
</select>
<br/>
<button type="submit">Submit</button>
New User ?<a href="register.jsp">Register</a>
<br/>
<a href="index.jsp">Home</a>


</form>
</body>
</html>