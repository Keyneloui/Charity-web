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
<body>

<h2>Register For New User</h2>

<script type="text/javascript">
function login()
{
alert("Registered successfully");
window.location.href = "login.jsp";
}
</script>
<form onsubmit="register()">
<label>Donor Id:</label>
<input type="text" name="donor_id" id="donor_id" placeholder="Enter donor_id" required autofocus />
<br/>
<label>Name:</label>
<input type="text" name="Name" id="name" placeholder="Enter Name"required  />
<br/>
<label>Email:</label>
<input type="email" name="email" id="email" placeholder="Enter Email"required  />
<br/>
<label>Password:</label>
<input type="password" name="password" id="password" placeholder="Enter Password" required />
<br/>
<button type="submit">Submit</button>

<br/>
Existing User ? <a href="login.jsp">Login</a> <br/>

<a href="index.jsp">Home</a>
</form>
<script>
function register()
{
  event.preventDefault();     
  var donor_id = document.getElementById("donor_id").value;
  var name=document.getElementById("name").value;
  var email_id=document.getElementById("email").value;
  var password=document.getElementById("password").value;
  
  
  var formData = "donor_id=" + donor_id+ "&name="+name+"&email_id="+email_id+"&password="+password;
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