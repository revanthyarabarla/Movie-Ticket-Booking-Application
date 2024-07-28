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
				<h4 class="header-line">My Profile</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="images/my-profile.jpg"
					style="width: 600px; height: 400px;">
			</div>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<%
					String success = (String) session.getAttribute("profile-update");
					if (success != null) {
					session.removeAttribute("profile-update");
				%>
				<div class="alert alert-success" id="success">Your profile updated successfully.</div>
				<%
					}
				%>
				<div class="panel panel-danger">
					<div class="panel-heading">My Profile</div>
					<div class="panel-body">
						<form role="form" action="EditAdminProfile" method="post">
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where uname='"+ session.getAttribute("uname") + "'");
								while (resultset.next()) {
							%>
							<div class="form-group">
								<label>Admin Id</label> <input class="form-control"
									type="text" name="aid"
									value="<%=resultset.getString("id")%>" readonly />
							</div>
							<div class="form-group">
								<label>User Name</label> <input class="form-control" type="text"
									name="uname" value="<%=resultset.getString("uname")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Password</label> <input class="form-control" name="upass"
									type="password" value="<%=resultset.getString("upass")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Email Id</label> <input class="form-control"
									name="email" id="email" type="text"
									value="<%=resultset.getString("email")%>" />
							</div>
							<div class="form-group">
								<label>Created At</label> <input class="form-control"
									type="text" value="<%=resultset.getString("added_date")%>"
									readonly />
							</div>
							<button type="submit" class="btn btn-info" id="buttonValidate">Update
								Profile</button>
							<%
								}
							%>
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
							var email = $("#email").val();
							
							if (email === "") {
								$("#email").css("border-color", "red");
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
</script>
</html>