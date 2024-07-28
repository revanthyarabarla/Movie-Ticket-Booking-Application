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

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body class="host_version">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="bootstrap-touch-slider"
		class="carousel bs-slider fade  control-round indicators-line"
		data-ride="carousel" data-pause="hover" data-interval="false">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#bootstrap-touch-slider" data-slide-to="0"
				class="active"></li>
			<li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
			<li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div id="home" class="first-section"
					style="background-image: url('images/1.jpg');">
					<div class="container">
						<div class="row">
							<div class="col-md-12 col-sm-12 text-center">
								<div class="big-tagline">
									<h2 data-animation="animated zoomInRight">
										<strong>Movie Ticket Booking System</strong>
									</h2>
								</div>
							</div>
						</div>
						<!-- end row -->
					</div>
					<!-- end container -->
				</div>
				<!-- end section -->
			</div>
			<div class="item">
				<div id="home" class="first-section"
					style="background-image: url('images/2.png');">
					<div class="container">
						<div class="row">
							<div class="col-md-12 col-sm-12 text-center">
								<div class="big-tagline">
									<h2 data-animation="animated zoomInRight">
										<strong>Movie Ticket Booking System</strong>
									</h2>
								</div>
							</div>
						</div>
						<!-- end row -->
					</div>
					<!-- end container -->
				</div>
				<!-- end section -->
			</div>
			<div class="item">
				<div id="home" class="first-section"
					style="background-image: url('images/3.JPG');">
					<div class="container">
						<div class="row">
							<div class="col-md-12 col-sm-12 text-center">
								<div class="big-tagline">
									<h2 data-animation="animated zoomInRight">
										<strong>Movie Ticket Booking System</strong>
									</h2>
								</div>
							</div>
						</div>
						<!-- end row -->
					</div>
					<!-- end container -->
				</div>
				<!-- end section -->
			</div>
			<!-- Left Control -->
			<a class="left carousel-control" href="#bootstrap-touch-slider"
				role="button" data-slide="prev"> <span class="fa fa-angle-left"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a>

			<!-- Right Control -->
			<a class="right carousel-control" href="#bootstrap-touch-slider"
				role="button" data-slide="next"> <span class="fa fa-angle-right"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div id="overviews" class="section wb">
		<div class="container">
			<div class="section-title row text-center">
				<div class="col-md-8 col-md-offset-2">
					<h3>Let us Movies</h3>
				</div>
			</div>
			
			<div class="row">
				<%
					ResultSet retriveMovie = DatabaseConnection.getResultFromSqlQuery("select * from tblmovie limit 24");
					while (retriveMovie.next()) {
				%>
				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="panel panel-info" style="height: 850px;">
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
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end section -->

	<!-- end section -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- end copyrights -->

	<a href="#" id="scroll-to-top" class="dmtop global-radius"><i
		class="fa fa-angle-up"></i></a>

	<!-- ALL JS FILES -->
	<script src="js/all.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/custom.js"></script>

</body>
</html>