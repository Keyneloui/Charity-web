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
	<h3>Update Donation</h3>
	<form onsubmit="loadBooks()">
	
		<label>Request Type:</label> <input type="text" name="requestType"
			id="requestType" placeholder="Enter requestType" required  />
		<br /> <label>Enter the amount you want to add:</label> <input
			type="number" name="requestAmount" id="requestAmount"
			placeholder="Enter amount" required /> <br /> <input type="submit"
			value="Submit" class="btn btn-success">&nbsp;
		<button type="reset" class="btn btn-danger" value="clear">clear
		</button>
		<br /> <a href="index.jsp">Home</a>

		<!-- Script -->

		<script>
			function loadBooks() {
				event.preventDefault();
				var requestType = document.getElementById("requestType").value;
				
				var requestAmount = document.getElementById("requestAmount").value;
				var formData = "requestType=" + requestType 
						 + "&requestAmount=" + requestAmount;
				console.log(formData);

				var url = "http://localhost:8080/charity/UpdateRequest?"
						+ formData;
				console.log(url);
				//alert(url);
				var formData = {};
				//alert(formData);
				$.get(url, function(response) {
					console.log(response);
					console.log(response.errorMessage);
					//alert(response);
					var msg = JSON.parse(response);
					//alert(msg);

					if (msg.errorMessage != null) {
						alert("Request Type doesn't exists");
					} else {
						//alert("valid Username/Password");
						window.location.href = "index.jsp";
					}

				});

			}
		</script>

		<!-- End -->

</body>
</html>