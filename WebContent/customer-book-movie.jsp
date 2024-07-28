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
	<div class="container">
		<br>
		<div class="row">
			<div class="col-md-7 col-sm-7 col-xs-12">
				<img src="images/movie-book.JPG" style="width: 600px;">
			</div>

			<%
				int movieId = Integer.parseInt(request.getParameter("movieId"));
				ResultSet retriveMovie = DatabaseConnection.getResultFromSqlQuery("select * from tblmovie where movie_id='" + movieId + "'");
				if (retriveMovie.next()) {
			%>
			<div class="col-md-5 col-sm-5 col-xs-12">
				<div class="panel panel-info" style="height: 1020px;">
					<div class="panel-body">
						<form action="CustomerBookMovie" method="post">
							<div class="form-row">
								<input type="hidden" name="movieId" value="<%=movieId%>">
								<h3>
									<font color="Crimson"><input type="text"
										name="movieName"
										value="<%=retriveMovie.getString("movie_name")%>"
										style="border: none;"></font>
								</h3>
								<div class="form-group col-md-12">
									<img
										src="uploads/<%=retriveMovie.getString("movie_image_name")%>"
										style="width: 300px; height: 350px;">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>(<%=retriveMovie.getString("movie_certificate")%>),&nbsp;<%=retriveMovie.getString("language")%>,&nbsp;<%=retriveMovie.getString("type")%></label>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Cast.:</label>
									<%=retriveMovie.getString("cast")%>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Duration.:</label>
									<%=retriveMovie.getString("duration")%>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Description.:</label>
									<%=retriveMovie.getString("description")%>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Director.:</label>
									<%=retriveMovie.getString("director")%>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Price.:</label>&nbsp;<font color="Tomato"><input
										type="text" name="moviePrice"
										value="<%=retriveMovie.getString("movie_price")%>"
										style="border: none; width: 30px;">Rs/-</font>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Booking Date.:</label>&nbsp;<input type="date"
										name="bookingDate" class="form-control" value="">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Show Time.:</label>&nbsp;<font color="Tomato"><select
										name="showTime" class="form-control">
											<option readonly>Select Time</option>
											<option>9:00 AM To 12:00 PM</option>
											<option>12:00 PM To 03:00 PM</option>
											<option>03:00 PM To 06:00 PM</option>
											<option>06:00 PM To 09:00 PM</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>No of Persons</label>&nbsp;<input type="text"
										name="noOfPerson" class="form-control"
										placeholder="No of Persons">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<input type="submit" class="btn btn-warning" value="PROCESS TO PAYMENT">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>