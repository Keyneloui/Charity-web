<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<title>REVATURE CHARITY TRUST</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<script type="text/javascript">
		function login() {
			alert("Logged successfully");
			window.location.href = "index.jsp";

		}
	</script>
	<form onsubmit="register()">
		<label>Email:</label> <input type="email" name="email_id"
			id="email_id" placeholder="Enter Email" required /> <br /> <label>Password:</label>
		<input type="password" name="password" id="password"
			placeholder="Enter Password" required /> <br /> <input
			type="submit" value="Submit" class="btn btn-success">
		<button type="reset" class="btn btn-danger" value="clear">clear
		</button>
		<br />
	</form>
	<script>
		function register() {
			//alert('register');
			event.preventDefault();

			var email_id = document.getElementById("email_id").value;
			var password = document.getElementById("password").value;

			var formData = "email_id=" + email_id + "&password=" + password;
			console.log(formData);
			//alert(formData);
			var url = "http://localhost:8080/charity/AdminLogin?" + formData;
			console.log(url);
			//alert(url);
			var formData = {};
			$.get(url, function(response) {
				console.log(response);
				if (response == null || response == "null") {
					alert("Invalid Username/Password");
				} else {
					window.location.href = "index.jsp";
				}
			});
		}
	</script>
</body>
</html>