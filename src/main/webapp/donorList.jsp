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
		        content += "<td>" + dr.email + "</td>";
		        content += "</tr>";
		    }
		    console.log(content); 
		    
		    document.getElementById("tbody").innerHTML =  content;
		});
}
</script>
</head>
<body>
	<h3>Donor List</h3>
	<form onsubmit="loadBooks()"></form>
	<div class="container-fluid">
		<div class="row">
			<div class="col">

				<table border="1" class="table table-condensed" id="tbl">
					<thead>
						<tr>

							<th>Name</th>
							<th>Email-Id</th>
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
	<a href="addrequest.jsp">Add Request</a>
	<br />

</body>
</html>