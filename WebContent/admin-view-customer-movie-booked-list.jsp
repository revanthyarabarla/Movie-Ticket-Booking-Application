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
	<jsp:include page="admin-header.jsp"></jsp:include>
	<div class="container-fluid">
		<br>
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Customers Movie Booking List</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">Customers Movie Booking List</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Email Id</th>
										<th>Mobile No</th>
										<th>Movie Name</th>
										<th>Movie Show Time</th>
										<th>No of Person</th>
										<th>Booking Date</th>
										<th>Final Amount</th>
									</tr>
								</thead>
								<%
									int count = 0;
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmoviebooking");
									while (resultset.next()) {
										count++;
								%>
								<tbody>
									<tr class="default">
										<td><%=count%></td>
										<td><%=resultset.getString("customer_name")%></td>
										<td><%=resultset.getString("email")%></td>
										<td><%=resultset.getString("mobile")%></td>
										<td><%=resultset.getString("movie_name")%></td>
										<td><%=resultset.getString("movie_show_time")%></td>
										<td><%=resultset.getInt("no_of_Person")%></td>
										<td><%=resultset.getString("book_date")%></td>
										<td><%=resultset.getDouble("finalAmount")%> Rs/-</td>
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
		<div class="row">
			<%
				ResultSet retriveMovie = DatabaseConnection.getResultFromSqlQuery("select tblmovie.movie_image_name,tblmovie.movie_name,tblmovie.movie_certificate,tblmovie.type,tblmovie.language,tblmovie.duration,tblmovie.director,tblmovie.cast,tblmoviebooking.customer_name,tblmoviebooking.no_of_Person,tblmoviebooking.finalAmount from tblmovie,tblmoviebooking where tblmovie.movie_id=tblmoviebooking.movie_id");
				while (retriveMovie.next()) {
			%>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="panel panel-info" style="height:750px;">
					<div class="panel-body">
						<div class="form-row">
							<div class="form-group col-md-12">
								<center>
									<img
										src="uploads/<%=retriveMovie.getString(1)%>"
										style="width: 300px; height: 350px;">
								</center>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<font color="Crimson"><center><b><%=retriveMovie.getString(2)%></b></center></font>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label>Customer Name.:</label>&nbsp;<%=retriveMovie.getString(9)%>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label>No of Persons.:</label>&nbsp;<%=retriveMovie.getInt(10)%>
							</div>
						</div>
						<div class="form-row">
						
							<div class="form-group col-md-12">
								<label>(<%=retriveMovie.getString(3)%>),&nbsp;<%=retriveMovie.getString(4)%>,&nbsp;<%=retriveMovie.getString(5)%>,&nbsp;<%=retriveMovie.getString(6)%></label>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label>Director.:</label> <%=retriveMovie.getString(7)%>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label>Cast.:</label> <%=retriveMovie.getString(8)%>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label>Total Price.:</label>&nbsp;<font color="Tomato"><%=retriveMovie.getDouble(11)%>&nbsp;Rs/-</font>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
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