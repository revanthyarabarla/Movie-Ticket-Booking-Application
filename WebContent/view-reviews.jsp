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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

</head>
<body class="host_version">
	<jsp:include page="header.jsp"></jsp:include><br>
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h3 class="header-line">View Reviews</h3>
			</div>
		</div>
		<div class="row">
			
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<%
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblreview");
							while (resultset.next()) {
						%>
						<div class="form-group">
							<label>User Name : </label> <font color="orange"><%=resultset.getString("user")%></font>
						</div>
						<div class="form-group">
							<label>Movie Name : </label> <font color="orange"><%=resultset.getString("movie_name")%></font>
						</div>
						<div class="form-group">
							<label>Feedback : </label>
							<%=resultset.getString("content")%>
						</div>
						<div class="form-group">
							<label>Feedback Date : </label>
							<%=resultset.getString("created_at")%>
						</div>
						<div class="form-row">
							<div class="rateyo" id="rating"
								data-rateyo-rating="<%=resultset.getString("ratings")%>"
								data-rateyo-num-stars="5" data-rateyo-score="3" readonly></div>
							<input type="hidden" name="rating" readonly>
						</div>
						<hr>
						<%
							}
						%>
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
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
	$(function() {
		$(".rateyo").rateYo().on(
				"rateyo.change",
				function(e, data) {
					var rating = data.rating;
					$(this).parent().find('.score').text(
							'score :' + $(this).attr('data-rateyo-score'));
					$(this).parent().find('.result').text('rating :' + rating);
					$(this).parent().find('input[name=rating]').val(rating); //add rating value to input field
				});
	});
</script>
</html>