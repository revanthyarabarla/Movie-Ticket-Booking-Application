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
				<div class="panel panel-info">
					<div class="panel-heading">My Profile</div>
					<div class="panel-body">
						<form role="form" action="EditCustomerProfile" method="post">
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where uname='"+ session.getAttribute("uname") + "'");
								while (resultset.next()) {
							%>
							<div class="form-group">
								<label>Customer Id</label> <input class="form-control"
									type="text" name="cid"
									value="<%=resultset.getString("customer_id")%>" readonly />
							</div>
							<div class="form-group">
								<label>Customer Name</label> <input class="form-control" type="text"
									name="customer_name" value="<%=resultset.getString("customer_name")%>" onkeypress="return lettersValidate(event)" readonly/>
								<br><strong>Note-</strong> <span class="label label-danger">We can not edit customer name because we set session on customer name.</span>
							</div>
							
							<div class="form-group">
								<label>Email Id</label> <input class="form-control"
									name="email" id="email" type="text"
									value="<%=resultset.getString("email")%>" required/>
							</div>
							<div class="form-group">
								<label>Mobile No</label> <input class="form-control" name="mobile" id="mobile"
									type="text" value="<%=resultset.getString("mobile_no")%>" maxlength="10" onkeypress="return numberValidate(event)" required/>
								<br>
								<strong>Important Note-</strong> <span class="label label-danger">If you want to update email id & mobile no then update it but then logout & again login your account <br> to book movie because we set the session on email id & mobile no.</span>
							</div>
							
							<div class="form-group">
								<label>User Name</label> <input class="form-control" name="uname"
									type="text" value="<%=resultset.getString("uname")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Created At</label> <input class="form-control"
									type="text" value="<%=resultset.getString("created_at")%>"
									readonly />
							</div>
							<div class="form-group">
								<label>Updated At</label> <input class="form-control"
									type="text" value="<%=resultset.getString("updated_at")%>"
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
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});
</script>
<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	}    
	    }
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	    }
</script>
<script>
	 $(document).ready(function() {
         $("#buttonValidate").click(function() {
          
             var email = $("#email").val();
             var mobile = $("#mobile").val();
            
             if (email === "" || mobile === "")
             {
                 $("#emailId").css("border-color", "red");
                 $("#mobile").css("border-color", "red");
                 alert("All fields are mendatory.");
                 return false;
             }
         });
     });                                              
</script>
</html>