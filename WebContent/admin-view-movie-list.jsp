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
	<div class="container"><br>
		<%
			String deleteMovie = (String) session.getAttribute("delete-movie");
			if (deleteMovie != null) {
				session.removeAttribute("delete-movie");
		%>
		<div class="alert alert-danger" id="danger">Movie deleted sucessfully.</div>
		<%
			}
		%>
		<br>
		<div class="row">
			<%
				ResultSet retriveMovie = DatabaseConnection.getResultFromSqlQuery("select * from tblmovie limit 12");
				while (retriveMovie.next()) {
			%>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="panel panel-info" style="height: 820px;">
					<div class="panel-body">
						<div class="form-row">
							<h4>
								<center>
									<font color="Crimson"><%=retriveMovie.getString("movie_name")%></font>
								</center>
							</h4>
							<div class="form-group col-md-12">
								<center>
									<img
										src="uploads/<%=retriveMovie.getString("movie_image_name")%>"
										style="width: 300px; height: 350px;">
								</center>
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
								<label>Price.:</label>&nbsp;<font color="Tomato"><%=retriveMovie.getString("movie_price")%>&nbsp;Rs/-</font>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<a
									href="admin-delete-movie.jsp?movieId=<%=retriveMovie.getInt("movie_id")%>"
									class="btn btn-primary" onclick="return confirm('Do you really want to delete movie?');">Delete Movie</a>
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
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
<script>
	$(document).ready(
			function() {
				$("#buttonValidate").click(
						function() {
							var animalName = $("#animalName").val();
							var animalType = $("#animalType").val();
							var description = $("#description").val();
							var animalPrice = $("#animalPrice").val();
							var contact = $("#contact").val();
							var file = $("#file").val();
							if (animalName === "" || animalType === ""
									|| description === "" || animalPrice === ""
									|| file === "" || contact === "") {
								$("#animalName").css("border-color", "red");
								$("#animalType").css("border-color", "red");
								$("#description").css("border-color", "red");
								$("#animalPrice").css("border-color", "red");
								$("#contact").css("border-color", "red");
								$("#file").css("border-color", "red");
								alert("All fields are mendatory.");
								return false;
							}
						});
			});
</script>
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});
</script>
</html>