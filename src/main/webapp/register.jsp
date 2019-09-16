<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<title>REVATURE CHARITY TRUST</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body style="text-align:center">

	<jsp:include page="header.jsp"></jsp:include>
	<h2>Register For New User</h2>

	<script type="text/javascript">
function login()
{
alert("Registered successfully");
window.location.href = "home.jsp";
}
</script>
	<form onsubmit="register()">
		<label>Name:</label> <input type="text" name="Name" id="name"
			placeholder="Enter Name" required autofocus /> <br /> <label>Email:</label>
		<input type="email" name="email" id="email" placeholder="Enter Email"
			required /> <br /> <label>Password:</label> <input type="password"
			name="pass"src/main/webapp/register.jsp"word" id="password" placeholder="Enter Password" required />
		<br /> <br /> <input type="submit" value="Submit"
			class="btn btn-success" onclick=login()>
		<button type="reset" class="btn btn-danger" value="clear">clear
		</button>
		<br /> Existing User ? <a href="donorlog.jsp">Login</a> <br />


	</form>
	<script>
function register()
{
  event.preventDefault();     
  var name=document.getElementById("name").value;
  var email_id=document.getElementById("email").value;
  var password=document.getElementById("password").value;
  
  
  var formData =  "name="+name+"&email_id="+email_id+"&password="+password;
  console.log(formData);
  var url="http://localhost:8080/charity/RegisterServlet?"+formData;
  console.log(url);
  var formData = {};
  $.get(url, function(response){
          console.log(response);
  });
}
</script>
</body>
</html>