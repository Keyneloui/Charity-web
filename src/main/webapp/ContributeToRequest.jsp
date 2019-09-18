<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body style="text-align: center">
	<jsp:include page="header.jsp"></jsp:include>
	<br />
	<br />
	<br />
	
	<form onsubmit="loadBooks()">
		<label>Email Id:</label> <input type="email" name="emailId"
			id="emailId" placeholder="Enter email Id" required autofocus /> <br />
		<label>Request Type:</label> <input type="text" name="requestType"
			id="requestType" placeholder="Enter requestType" required /> <br />

		<label>Amount You Want to Contribute:</label> <input type="number"
			name="requestAmount" id="requestAmount" placeholder="Enter amount"
			required /> <br /> <input type="submit" value="Submit"
			class="btn btn-success">&nbsp;
		<button type="reset" class="btn btn-danger" value="clear">clear
		</button>

		<a href="home.jsp">Home</a>
	</form>
	<script>
		function loadBooks() {
			event.preventDefault();
			//alert('entering');
			var requestType = document.getElementById("requestType").value;
			var emailId = document.getElementById("emailId").value;
			var requestAmount = document.getElementById("requestAmount").value;
			var formData = "requestType=" + requestType + "&emailId=" + emailId
					+ "&requestAmount=" + requestAmount;
			console.log(formData);
			//	alert(formData);

			var url = "http://localhost:8080/charity/ContributeRequest?"
					+ formData;
			console.log(url);
			//	alert(url);
			var formData = {};
			//	alert(formData);
			$.get(url,function(response) {

								console.log(response);
								console.log(response.errorMessage);
								var msg = JSON.parse(response);
								//	alert(msg);

								if (msg.errorMessage != null) {
									alert("Email and Request Type not found..please enter your registered email and the request type which is in our donation request");
								} else {
									//alert("valid Username/Password");
									alert("Thank You for your contribution");
									
									window.location.href = "home.jsp";
								}
							});

		}
	</script>

	<!-- End -->
</body>
</html>