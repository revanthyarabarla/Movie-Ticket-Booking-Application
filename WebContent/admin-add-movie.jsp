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
	<div class="container">
		<br>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<%
					String message = (String) session.getAttribute("addedMessage");
					if (message != null) {
					session.removeAttribute("addedMessage");
				%>
				<div class='alert alert-success' id="success">Movie added
					successfully.</div>
				<%
					}
				%>
				<%
					String alreadyExist = (String) session.getAttribute("already-exist");
					if (alreadyExist != null) {
					session.removeAttribute("already-exist");
				%>
				<div class='alert alert-danger' id="danger">Movie already added.</div>
				<%
					}
				%>
				<div class="panel panel-info">
					<div class="panel-heading">Add Movie</div>
					<div class="panel-body">
						<form role="form" action="AdminAddMovies" method="post"
							enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Movie Name</label> <input class="form-control"
										type="text" name="movieName" id="movieName" value="" placeholder="Movie Name" required/>
								</div>
								<div class="form-group col-md-6">
									<label>Certificate</label> <input class="form-control"
										name="mcertificate" type="text" value="" id="mcertificate"
										placeholder="Movie Certificate" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Movie Type</label> <select class="form-control"
										name="movieType" id="movieType" id="movieType" required>
										<option>Bollywood</option>
										<option>Tollywood</option>
										<option>Hollywood</option>
										<option>Other</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label>Movie Duration</label> <input type="text"
										class="form-control" name="mduration" value="" id="mduration"
										placeholder="Movie Duration" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Language</label> <select class="form-control"
										name="language" value="" id="language" required>
										<option>Hindi</option>
										<option>Telugu</option>
										<option>English</option>
										<option>Other</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label>Director</label> <input class="form-control"
										name="director" type="text" value="" id="director"
										placeholder="Movie Director Name" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Movie Cast</label> <input class="form-control"
										name="mcast" type="text" placeholder="Movie Cast Name" id="mcast" required/>
								</div>
								<div class="form-group col-md-6">
									<label>Price</label> <input class="form-control" name="mprice"
										type="text" value="" id="mprice" placeholder="Movie Price" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Movie Description</label> <input class="form-control"
										name="description" type="text" placeholder="Movie Description" id="description" row="5" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Movie Poster Image</label> <input class="form-control"
										name="file" type="file" value="" id="file" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="buttonValidate">Add
										Movie</button>
									||
									<button type="reset" class="btn btn-danger" id="buttonValidate">Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

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
							var movieName = $("#movieName").val();
							var mcertificate = $("#mcertificate").val();
							var movieType = $("#movieType").val();
							var mduration = $("#mduration").val();
							var language = $("#language").val();
							var director = $("#director").val();
							var mcast = $("#mcast").val();
							var mprice = $("#mprice").val();
							var description = $("#description").val();
							var file = $("#file").val();
							
							if (movieName === "" || mcertificate === ""
									|| movieType === "" || mduration === ""
									|| language === "" || director === "" || mcast === "" || mprice === "" || description === "" || file === "") {
								$("#movieName").css("border-color", "red");
								$("#mcertificate").css("border-color", "red");
								$("#movieType").css("border-color", "red");
								$("#mduration").css("border-color", "red");
								$("#language").css("border-color", "red");
								$("#director").css("border-color", "red");
								$("#mcast").css("border-color", "red");
								$("#mprice").css("border-color", "red");
								$("#description").css("border-color", "red");
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