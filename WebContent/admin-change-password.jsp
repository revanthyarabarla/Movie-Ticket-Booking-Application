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
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Change Password</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="images/change_password.jpg"
					style="width: 600px; height: 300px;">
			</div>


			<div class="col-md-6 col-sm-6 col-xs-12">
				<%
					String message = (String) session.getAttribute("password-change-success");
					if (message != null) {
						session.removeAttribute("password-change-success");
				%>
				<div class='alert alert-success' id='success'>Password change
					successfully.</div>
				<%
					}
				%>
				<%
					String fail = (String) session.getAttribute("password-change-fail");
					if (fail != null) {
						session.removeAttribute("password-change-fail");
				%>
				<div class="alert alert-danger" id='danger'>Old password does
					not match..</div>
				<%
					}
				%>
				<%
					String passwordConfirm = (String) session.getAttribute("password-not-match");
					if (passwordConfirm != null) {
						session.removeAttribute("password-not-match");
				%>
				<div class="alert alert-danger" id='danger'>New password and
					confirm password does not match.</div>
				<%
					}
				%>
				<div class="panel panel-danger">
					<div class="panel-heading">Change Password</div>
					<div class="panel-body">
						<form role="form" action="AdminChangePassword" method="post">
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where uname='"+ session.getAttribute("uname") + "'");
								while (resultset.next()) {
							%>
							<div class="form-group">
								<label>Current Password</label> <input class="form-control"
									type="password" name="cpassword"
									value="<%=resultset.getString("upass")%>" readonly />
							</div>
							<div class="form-group">
								<label>New Password</label> <input class="form-control"
									type="password" name="password" id="password" placeholder="New Password"/>
							</div>
							<div class="form-group">
								<label>Confirm Password</label> <input class="form-control"
									type="password" name="confpass" id="confpass" placeholder="Confirm Password"/>
							</div>
							<button type="submit" class="btn btn-info" id="buttonValidate">Change
								Password</button>
							<%
								}
							%>
						</form>
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
<script>
	$(document).ready(
			function() {
				$("#buttonValidate").click(
						function() {
							var password = $("#password").val();
							var confpass = $("#confpass").val();
				
							if (password === "" || confpass === "") {
								$("#password").css("border-color", "red");
								$("#confpass").css("border-color", "red");	
								alert("Fields are mendatory.");
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