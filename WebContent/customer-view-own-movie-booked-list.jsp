<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Movie Ticket Booking System</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Colors CSS -->
<link rel="stylesheet" href="css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="customer-side-header.jsp"></jsp:include>
	<div class="container-fluid">
		<br>
		<%
			String deleteBooking = (String) session.getAttribute("delete-movie");
			if (deleteBooking != null) {
				session.removeAttribute("delete-movie");
		%>
		<div class="alert alert-danger" id="danger">Movie booking deleted sucessfully.</div>
		<%
			}
		%>
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">My Movie Booking List</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">Movie Booking List</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Email Id</th>
										<th>Mobile No</th>
										<th>Movie Id</th>
										<th>Movie Name</th>
										<th>Movie Show Time</th>
										<th>No of Person</th>
										<th>Booking Date</th>
										<th>Final Amount</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
									int count = 0;
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmoviebooking where customer_name='" + session.getAttribute("customer_name") + "'");
									while (resultset.next()) {
										count++;
								%>
								<tbody>
									<tr class="default">
										<td><%=count%></td>
										<td><%=resultset.getString("customer_name")%></td>
										<td><%=resultset.getString("email")%></td>
										<td><%=resultset.getString("mobile")%></td>
										<td><%=resultset.getInt("movie_id")%></td>
										<td><%=resultset.getString("movie_name")%></td>
										<td><%=resultset.getString("movie_show_time")%></td>
										<td><%=resultset.getInt("no_of_Person")%></td>
										<td><%=resultset.getString("book_date")%></td>
										<td><%=resultset.getDouble("finalAmount")%> Rs/-</td>
										<td><a href="customer-delete-booking.jsp?movieId=<%=resultset.getInt("movie_id")%>&movieName=<%=resultset.getString("movie_name")%>&created_at=<%=resultset.getString("created_at")%>"  class="btn btn-warning" onclick="return confirm('Do you really want to cancel movie booking?');">Cancel Booking</a></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>