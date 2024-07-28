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
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="images/do-payment.jpg" style="width: 600px;">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-info">
					<div class="panel-body">
						<form action="customer-booked-movie-and-bill-process.jsp" method="post">
						<div class="form-group">
							<label>Payment Details</label> <img src="images/mastercard.jpg"
								style="color: red; width: 50px;"></i>&nbsp;<strong>[Dummy Payment Gateway]</strong>
						</div>
						<div class="form-group">
							<label>Total Amount Paid</label> <input class="form-control"
								type="text" name="totalAmount" value="<%=session.getAttribute("finalAmount") %>" readonly />
						</div>
						<div class="form-group">
							<label>Debit Card Holder Name</label> <input class="form-control"
								type="text" name="dholderName"
								placeholder="Debit Card Holder Name" />
						</div>
						<div class="form-group">
							<label>Debit Card Number</label> <input class="form-control"
								type="text" name="cardNumber" id="cardNumber"
								placeholder="Debit Card Number" />
						</div>
						<div class="row">
							<div class="col-md-4 col-xs-12" id="expiration-date">
								<label>Expiration Month</label> <select class="form-control"
									name="emonth">
									<option value="January">January</option>
									<option value="February">February</option>
									<option value="March">March</option>
									<option value="April">April</option>
									<option value="May">May</option>
									<option value="June">June</option>
									<option value="July">July</option>
									<option value="August">August</option>
									<option value="September">September</option>
									<option value="October">October</option>
									<option value="November">November</option>
									<option value="December">December</option>
								</select>
							</div>
							<div class="col-md-4 col-xs-12">
								<label>Expiration Year</label> <select class="form-control"
									name="eyear">
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
									<option value="2024">2024</option>
									<option value="2025">2025</option>
								</select>
							</div>
							<div class="col-md-4 col-xs-12">
								<label>CVV</label> <input class="form-control" type="text"
									name="cvv" id="cvv" required onblur="check(); return false;"
									placeholder="CVV Number"><span id="message"></span>
							</div>
						</div><br>
						<div class="form-group">
							<input type="submit" class="btn btn-warning"
								value="Payment & Book">
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
	function check() {
		var cvv = document.getElementById('cvv');
		var message = document.getElementById('message');
		var goodColor = "#0C6";
		var badColor = "#FF9B37";

		if (cvv.value.length != 3) {
			message.style.color = badColor;
			message.innerHTML = "Wrong cvv number, please enter 3 digits cvv number."
		} else if (cvv.value.length == 3) {
			message.style.color = goodColor;
			message.innerHTML = "CVV number is right, please proceed."
		}
	}
</script>
<script src="assets/js/jquery.payform.min.js" charset="utf-8"></script>
<script src="assets/js/script.js"></script>
</html>