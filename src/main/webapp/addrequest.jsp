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
	<h3>Add Donation</h3>
    <form onsubmit="loadBooks()">
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
		<br/>
	<input type="submit" value="Submit"
			class="btn btn-success" >
	<script>
		//loadBooks();
	</script>


	<a href="index.jsp">Home</a>

	<!-- Script -->

	<script>
		function loadBooks() {
			var requestType = document.getElementById("requestType").value;
			var requestId = document.getElementById("requestId").value;
			var requestAmount = document.getElementById("requestAmount").value;
			var formData = "requestType=" + requestType + "&requestId="
					+ requestId + "&requestAmount=" + requestAmount;
			console.log(formData);

			var url = "http://localhost:8080/charity/AddRequest?"+formData;
			console.log(url);
			  var formData = {};
			  $.get(url, function(response){
			          console.log(response);
			  });
			
		}
	</script>

	<!-- End -->
</body>


</html>