=<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="register.css">
</head>
<style>
.form-control {
	background-color: ghostwhite;
	color: solid #000000;
	outline: none;
	outline-style: none;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: solid #000000 1px;
	padding: 3px 10px;
}

.form-control:focus {
	background-color: transparent;
}

}
#form-row {
	font-family: Monaco;
}

.container {
	background-color: rgba(255, 255, 255, 0);
}

.jumbotron {
	background-color: thistle;
}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
	class="tit" href="#">canvera</a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
	data-target="#navbarSupportedContent"
	aria-controls="navbarSupportedContent" aria-expanded="false"
	aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
<a class="log" href="#">logout</a> </nav>
<body>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.*"%>
	<%@page import=" java.io.IOException"%>
	<%@page import="java.io.InputStream"%>
	<%@page import="java.io.PrintWriter"%>
	<%@page import=" java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.ResultSet"%>
	<div class="container">
		<div class="jumbotron">
			<form id="form" method="post" action="photographerservlet" enctype="multipart/form-data" >
				<h3 style="font-family: Helvetica; text-align: center">Business
					details</h3>
				<br> <br>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="first name">First name</label> 
						<input type="text" class="form-control" id="inputfirst" placeholder="First name" name="firstname">
					</div>
					<div class="form-group col-md-6">
						<label for="last name">Last name</label> <input type="text"
							class="form-control" id="inputlast" placeholder="Last name" name="lastname">
					</div>
					<div class="form-group col-md-6">
						<label for="inputEmail4">Email</label> <input type="email"
							class="form-control" id="inputEmail4" placeholder="Email" name="email">
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Password</label> <input
							type="password" class="form-control" id="inputPassword4" name="password"
							placeholder="e-mail Password">
					</div>
				</div>
				<div class="form-group">
					<label for="inputnumber">Mobile number</label> <input type="text" minlength="10" maxlength="10"
						class="form-control" id="mobile" placeholder="123467890" name="phonenumber">
				</div>
				<div class="form-group">
					<input onclick="hiddenIt(this,'studioaddress')" type="radio" name="job_type"
						id="freelance" name="acctype" value="freelance"> <label
						onclick="hiddenIt(this,'studioaddress')" for="freelance">Freelancer</label>&nbsp;&nbsp;&nbsp;
					<input onclick="display(this,'studioaddress')" type="radio" name="job_type"
						id="studio" name="acctype" value="studio"> <label
						onclick="display(this,'studioaddress')" for="studio">Studio</label><br>
				</div>

				<div class="form-group">
					<label for="inputAddress">Home Address</label> <input type="text"
						class="form-control" id="inputAddress" placeholder="1234 Main St" name="address1">
				</div>
				<div id="studioaddress">
					<div class="form-group">
						<label for="studioName">Studio Name</label> <input type="text"
							class="form-control" id="studioName" placeholder="studio name" name="studioname">
					</div>
					<div class="form-group">
						<label for="inputAddress2">Studio Address</label> <input
							type="text" class="form-control" id="inputAddress2"
							placeholder="studio" name="address2">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputcity">City</label> <select id="inputcity"
							class="form-control" name="city">
							<option selected>Choose...</option>
							<option value="" disabled selected>Search by Location</option>
							<%
									try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
									PreparedStatement ps1=con1.prepareStatement("select * from backup");
									ResultSet rs1=ps1.executeQuery();
									
									while(rs1.next())
									{
										out.println("<option value='"+rs1.getString("city")+"'>"+rs1.getString("city")+"</option>");
									}
									con1.close();
									}
									catch(Exception e)
									{
										System.out.println(e);
									}
									%>
						</select>
					</div>
					<div class="form-group col-md-4">
						<label for="inputState">State</label> <select id="inputState"
							class="form-control" name="state">
							<option selected>Choose...</option>
							<option><%out.println("Tamilnadu"); %></option>
						</select>
					</div>
					<div class="form-group col-md-2">
						<label for="inputZip">Zip</label> <input type="text"
							class="form-control" id="inputZip" name="pincode">
					</div>
				</div>
				<div class="form-group">
					<label for="inputproof">Business proof</label> <input type="file"
						class="form-control" id="inputproof" name="proof">
					<h5>(Aadhar card,pan card,passport or license)</h5>
				</div>
				<div class="form-group">
					<label for="inputlink">website</label> <input type="hyperlink"
						class="form-control" id="inputlink" name="website">
				</div>
				<div class="form-group">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="gridCheck" name="agree">
						<label class="form-check-label" for="gridCheck">
							&nbsp;&nbsp;&nbsp;&nbsp;Agree to continue </label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Sign in</button>
			</form>
		</div>
	</div>
</body>
<script>
	function display(r, m) {
		if (r.checked) {
			document.getElementById(m).style.display = "block";
		} else {
			document.getElementById(m).style.display = "none";
		}
	}
	function hiddenIt(r, m) {
		if (!(r.checked)) {
			document.getElementById(m).style.display = "block";
		} else {
			document.getElementById(m).style.display = "none";
		}
	}
</script>
</html>