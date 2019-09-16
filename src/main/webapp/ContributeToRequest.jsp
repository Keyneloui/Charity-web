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
<body style="text-align:center">
	<jsp:include page="header.jsp"></jsp:include>
	<h3>Your Contributions</h3>
	

	<label>Request Type:</label>
	<input type="text" name="requestType" id="requestType"
		placeholder="Enter requestType" required autofocus />
	<br />
	<label>Request Id:</label>
	<input type="number" name="requestId" id="requestId"
		placeholder="Enter requestId" required />
	<br />
	<label>Request Amount:</label>
	<input type="number" name="requestAmount" id="requestAmount"
		placeholder="Enter amount" required />
	<br />
	<button onclick="loadBooks()">Submit</button>

	<a href="home.jsp">Home</a>
	<script>
		function loadBooks() {
			var requestType = document.getElementById("requestType").value;
			var requestId = document.getElementById("requestId").value;
			var requestAmount = document.getElementById("requestAmount").value;
			var formData = "requestType=" + requestType + "&requestId="
					+ requestId + "&requestAmount=" + requestAmount;
			console.log(formData);

			var url = "http://localhost:8080/charity/ContributeRequest?";
			console.log(url);
			//var formData = {};
			//$.get(url, function(response){

			//    console.log(response);
			//});

			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(JSON.stringify(this.responseText));
					console.log('status ok!');
				}
			}
			xhr.open('GET', url + formData, true);
			xhr.send();
		}
	</script>

	<!-- End -->
</body>
</html>