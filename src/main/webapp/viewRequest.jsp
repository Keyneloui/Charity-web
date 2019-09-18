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
	//http://localhost:8080/charity/AddRequest?requestType=a&requestId=5&requestAmount=100
	//$.post ... url, form data , response ( success/failure)
	var url = "http://localhost:8080/charity/ListRequests";
		$.getJSON(url, function(response){
		    var list = response;
		    document.getElementById("tbody").innerHTML = "";
		    var content = "";
		    for(let dr of list){
		        console.log(list);
		        content += "<tr>";
		        content += "<td>" + dr.id + "</td>";
		        content += "<td>" + dr.requestType + "</td>";
		        content += "<td>" + dr.requestAmount + "</td>";
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
	<h2>Request</h2>
	
	<form onsubmit="loadBooks()"></form>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				
				<table border="1" class="table table-condensed" id="tbl">
					<thead>
						<tr>
							<th>ID</th>
							<th>RequestType</th>
							<th>RequestAmount</th>
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

	<a href="home.jsp">Main Function</a>
	<a href="ContributeToRequest.jsp">Contribute</a>
	<br />
</body>
</html>