<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>

function loadBooks()
{
	var url = "http://localhost:8080/charity/DonorListServlet";
		$.getJSON(url, function(response){
		    var list = response;
		    document.getElementById("tbody").innerHTML = "";
		    var content = "";
		    for(let dr of list){
		        console.log(list);
		        content += "<tr>";
		      
		        content += "<td>" + dr.name + "</td>";
		        content += "<td>" + dr.requestType + "</td>";
		        content += "<td>" + dr.amount + "</td>";
		        content += "</tr>";
		    }
		    console.log(content); 
		    
		    document.getElementById("tbody").innerHTML =  content;
		});
}
</script>
</head>
<body style="text-align: center">
	<jsp:include page="header.jsp"></jsp:include>
	<br />
	<br />
	<br />
	<h2>Donor List</h2>
	<form onsubmit="loadBooks()"></form>
	<div class="container-fluid">
		<div class="row">
			<div class="col">

				<table border="1" class="table table-condensed" id="tbl">
					<thead>
						<tr>

							<th>Name</th>
							<th>Request Type</th>
							<th>Request Amount</th>
						</tr>
					</thead>
					<tbody id="tbody">

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
loadBooks();
</script>

	<a href="index.jsp">Main Function</a>

	<br />

</body>
</html>