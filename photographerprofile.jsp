
<!DOCTYPE html>
<html language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Merienda&display=swap" rel="stylesheet">
	

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="photographerprofile.css">
	
	<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAc1JY8X9Nh6exJDfBDUxPTQnVvKij16UA&callback=initMap&libraries=&v=weekly"
				defer>
	</script>
</head>

<body>
<%@page import="java.util.*"%>
	<%@page import=" java.io.IOException"%>
	<%@page import="java.io.InputStream"%>
	<%@page import="java.io.PrintWriter"%>
	<%@page import=" java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.ResultSet"%>
	<header class="container-fluid">
	<%
	String email="";
	String firstname="";
	String phonenumber="";
	String studioname="";
	//String description="";
	String location="";
	try{
		email=request.getParameter("email");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
		PreparedStatement ps=con.prepareStatement("select * from photographerdetails where email=?");
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			firstname=rs.getString("firstname");
			phonenumber=rs.getString("phonenumber");
			studioname=rs.getString("studioname");
			//description=rs.getString("description");
			location=rs.getString("city");
			
		}
	}catch(Exception e)
	{
		System.out.println(e);
	}
	%>
		<nav id="navb"class="navbar navbar-expand-lg navbar-light bg-dark">
				<a class="navbar-brand text-light" href="#">SHUTTER</a>
				
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
						<ul class="navbar-nav">
							
							<li class="nav-item active">
							<a class="nav-link text-light" href="#">Notification <span class="sr-only">(current)</span></a>
							</li>
							
							<li class="nav-item">
							<a class="nav-link text-light" href="rent.jsp">Add Rent</a>
							</li>
							
							<li class="nav-item">
							<a class="nav-link text-light" href="rent1.jsp">Buy Rent</a>
							</li>
							
							<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										Account
									</a>						
									<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item" href="#">My Profile</a>
										<a class="dropdown-item" href="#">History</a>
										<a class="dropdown-item" href="#">Logout</a>
									</div>
							</li>
						</ul>
				</div>
		  </nav>

		<img id="backprofile" src="backprofile.jpg" class="img-fluid" alt="...">

		<div class="row row-cols-1 row-cols-md-2">
			<div id="profbanner" class="col mb-4">
			  <div class="card">
				<img src="pexels.jpg" class="rounded-circle" alt="...">
				<div id="bio" class="card-body">
				  <h5 class="card-title text-center"><%out.println(studioname); %></h5>
				  <div class="card-text text-center">
					  <p><%out.println(firstname);%></p>
					  <p><%out.println(phonenumber); %></p>
					  <p><%out.println(email); %></p>
					  <p><%out.println(location); %></p>
					</div>
				</div>
			  </div>
			</div>
		</div>
	</header>

	<section class="container-fluid">
		<div class="heading">
			<p class="stroke"></p>
			<h2>Portfolio</h2>
			<h6>My work</h6>
		</div>

		<div id="row" class="row">
			<div id="col" class="col">
				<img src="first.jpg" class="rounded" alt="...">
				<img src="ARCHITECTURAL.jpg" class="rounded" alt="...">
				<img src="1612014965083.jpg" class="rounded" alt="...">
				<img src="landscapechihuahua.jpg" class="rounded" alt="...">
				<img src="ngsversion.jpg" class="rounded" alt="...">
				<img src="architecturalphotography.jpg" class="rounded" alt="...">
				<img src="Duomo.jpg" class="rounded" alt="...">
				<img src="flowers.jpg" class="rounded" alt="...">
			</div>
		</div>
	</section>

	<article class="container-fluid">
		<!-- leftisde -->
		<div class="about">
			<p class="stroke1"></p>
			<h2>About me</h2>
		</div>
		
		<div class="row">
			<div class="col">
				<p id="description">Once photography enters your bloodstream, it is like a disease</p>
			</div>

			<!-- Map -->
				<div class="row">
					<div class="col">
						<div class="shadow-lg" id="map"></div>
						<script type="text/javascript">
								function initMap() {
										map = new google.maps.Map(document.getElementById("map"), {
											zoom: 8,
											center: { lat: -34.397, lng: 150.644 },  
											// latitude value and longitude value
										});

										var marker=new google.maps.Marker({
											position: {lat: -34.397, lng: 150.644},
											map: map,
										});
								}
						</script>
					</div>
				</div>
			<!-- rightside -->
			<div id="rside" class="col-xl-4">
				<h3>Equipement</h3>
					<ul>
						<li><b>Photo Camera:</b>Model name</li>
						<li><b>Lens:</b>measurement</li>
					</ul>
				<h3>Product Service</h3>
					<ul>
						<li>CD/DVD</li>
						<li>Photobook</li>
					</ul>
				<h3>Payment option</h3>
					<ul>
						<li>Bank transfer</li>
						<li>Cash</li>
						<li>Debit Card</li>
					</ul>
			</div>
		</div>
	</article>

	<footer class="container-fluid">
		<div class="row">
			<div class="col">
				<h4 class="text-center">&copy; Copyright 2021 by Team_16</h4>
				<p class="text-center">BookaPhotographer</p>
			</div>
		</div>
	</footer>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>