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
	<div class="container"><br>
		<div class="row">
			<div id="exampl">
		<br>
		<center>
			<table border="2" cellspacing="2" cellpadding="2" width="30%" height="100%">
				<tr>
					<td colspan="8"><strong><center>Your Movie Ticket</center></strong></td>
				</tr>
				<%
					int isRepeat = 0;
					int srNo = 0;
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmoviebooking where customer_name='" + session.getAttribute("customer_name") + "' and finalAmount='"+session.getAttribute("finalAmount")+"'");
					if (resultset.next()) {
						srNo++;
				%>
				<tr>
					<th colspan="4">Customer Name</th>
					<td colspan="4"><%=resultset.getString("customer_name")%></td>
				</tr>
				<tr>
					<th colspan="4">Email Id</th>
					<td colspan="4"><%=resultset.getString("email")%></td>
				</tr>
				<tr>
					<th colspan="4">Mobile No</th>
					<td colspan="4"><%=resultset.getString("mobile")%></td>
				</tr>
				<tr>
					<th colspan="4">Movie Name</th>
					<td colspan="4"><font color="green"><%=resultset.getString("movie_name")%></font></td>
				</tr>
				<tr>
					<th colspan="4">No of Person</th>
					<td colspan="4"><%=resultset.getString("no_of_Person")%></td>
				</tr>
				<tr>
					<th colspan="4">Movie Show Time</th>
					<td colspan="4"><%=resultset.getString("movie_show_time")%></td>
				</tr>
				<tr>
					<th colspan="4">Final Amount</th>
					<td colspan="4"><font color="green"><%=resultset.getString("finalAmount")%>&nbsp;Rs.</font></td>
				</tr>

				<%
					}
				%>
			</table>
		</center><br>
		<center>
			<i class="fa fa-print fa-2x" aria-hidden="true"
				OnClick="CallPrint(this.value)"></i>
			<div class="checkout-left">
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a href="customer-dashboard.jsp"><span
						class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Go
						To Home</a>
				</div>
		</center>
	</div>
	<script>
		function CallPrint(strid) {
			var prtContent = document.getElementById("exampl");
			var WinPrint = window.open('', '','left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
			WinPrint.document.write(prtContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
			WinPrint.close();
		}
	</script>
		</div>
	</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>