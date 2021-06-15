<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Merienda&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Faster+One&display=swap" rel="stylesheet">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <link rel="Stylesheet" type="text/css" href="dash.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
	<header>
		<nav id="navb" class="nav-wrapper black">
					<a href="#" id="lg" class="brand-logo">SHUTTER</a>
						<ul id="nav-mobile" class="right hide-on-med-and-down">
							<li><a href="#">About</a></li>
							<li><a href="#"></a></li>
							<li><a class="dropdown-trigger " href="#!" data-target="dropdown1"><i id="menu" class="material-icons valign-wrapper">dehaze</i></a></li>
						</ul>
		</nav>
		
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="#!">one</a></li>
			<li><a href="#!">two</a></li>
			<li class="divider"></li>
			<li><a href="#!">three</a></li>
		</ul>
	</header>
	
	<section class="z-depth-2">
		<div class="row">
			<div id="slimg" class="carousel carousel-slider col xl12 m12 s12 l12">
				<a class="carousel-item" href="#one!"><img id="img1" src="Vtnw7QFlDAw.jpg"></a>
				<a class="carousel-item" href="#two!"><img id="img2" src="NJsOEPUClhI.jpg"></a>
				<a class="carousel-item" href="#three!"><img id="img3" src="bWQ60cZcM.jpg"></a>
				<a class="carousel-item" href="#four!"><img id="img4" src="F5g8EEHYE.jpg"></a>
			</div>

		<form method="post" action="enquiry.jsp">
				<div id="search1" class="col m3 s3 l3 xl3">	  
					<label>Location</label>
					<select id="searchsize1"class="browser-default"  name="location">
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
									}
									catch(Exception e)
									{
										System.out.println(e);
									}
									%>
					</select>
					<i id="collection1"class=" small material-icons prefix">add_location</i>
				</div>

				<div id="search2" class="col s3 m3 l3 xl3" >	  
				<label>Category</label>
				<select id="searchsize2" class="browser-default" name="category">
						<option value="" disabled selected>Search by Category</option>
						<%
									try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
									PreparedStatement ps1=con1.prepareStatement("select * from backup");
									ResultSet rs1=ps1.executeQuery();
									
									while(rs1.next())
									{
										out.println("<option value='"+rs1.getString("category")+"'>"+rs1.getString("category")+"</option>");
									}
									}
									catch(Exception e)
									{
										System.out.println(e);
									}
									%>
				</select>
				<i id="collection1"class="material-icons prefix">collections</i>
			</div>
			<!-- <a id="searchbtn" class="waves-effect waves-light btn">Search</a> -->
			<button type="submit" id="searchbtn" class="waves-effect waves-light btn">Search</button>
	  </form>
  </div>
	</section>

	<!-- Nature -->
	<article id="falbum" class="container-fluid">
		<div class="row">
			<a class="prev waves-effect"><i class="material-icons black-text">navigate_before</i></a>
			<a class="next waves-effect"><i class="material-icons black-text">navigate_next</i></a>
			<div class="col s12 xl12">
				<h3 id="nature"><b>N</b>ature</h3>
							<div id="collect1" class="carousel carousel-slider">
								
								<div class="carousel-item" href="#one!">
										<img id="nat1" src="bird.jpg"> <!-- random image -->
										<img id="nat1" src="waterfall.jpg">
										<img id="nat1" src="sunrise.jpg">
										<img id="nat1" src="seashore.jpg">
										<img id="nat1" src="suntree.jpg">
								</div>
								<div class="carousel-item" href="#two!">
									<img id="nat1" src="bird.jpg"> <!-- random image -->
									<img id="nat1" src="waterfall.jpg">
									<img id="nat1" src="sunrise.jpg">
									<img id="nat1" src="seashore.jpg">
									<img id="nat1" src="suntree.jpg">
							</div>

							</div>
			</div>
		</div>

		<!-- wildlife -->
		<div class="row">
			<a class="prev2 waves-effect"><i class="material-icons black-text">navigate_before</i></a>
			<a class="next2 waves-effect"><i class="material-icons black-text">navigate_next</i></a>
			<div class="col s6 xl6">
				<h3 id="wildlife"><b>W</b>ildlife</h3>
				<div id="collect2" class="carousel carousel-slider center">
					<div class="carousel-item" href="#one!">
						<img id="w1" src="lion.jpg">
						<img id="w1" src="bird.jpg">
					</div>
					<div class="carousel-item" href="#two!">
						<img id="w1" src="lion.jpg">
						<img id="w1" src="bird.jpg">
					</div>
				  </div>			
			</div>

			<a class="prev3 waves-effect"><i class="material-icons black-text">navigate_before</i></a>
			<a class="next3 waves-effect"><i class="material-icons black-text">navigate_next</i></a>
			<div class="col s6 xl6">
				<h3 id="landscape"><b>L</b>andscape</h3>
				<div id="collect3" class="carousel carousel-slider center">
					<div class="carousel-item" href="#one!">
						<img id="l1" src="lion.jpg">
						<img id="l1" src="bird.jpg">
					</div>
					<div class="carousel-item" href="#two!">
						<img id="l1" src="lion.jpg">
						<img id="l1" src="bird.jpg">
					</div>
				  </div>
						
			</div>
		</div>

		<div class="row">
			<div class="col s12 xl12">
				<h3 id="architecture"><b>A</b>rchitecture</h3>
				<div id="collect4" class="carousel carousel-slider center">
					<div class="carousel-item" href="#one!">
						<img id="a1" src="lion.jpg">
					</div>
					<div class="carousel-item" href="#two!">
						<img id="a1" src="lion.jpg">
					</div>
				  </div>
						
			</div>
		</div>

		<div class="row">
			<a class="prev4 waves-effect"><i class="material-icons black-text">navigate_before</i></a>
			<a class="next4 waves-effect"><i class="material-icons black-text">navigate_next</i></a>
			<div class="col s12 xl12">
				<h3 id="wedding"><b>W</b>edding</h3>
							<div id="collect6" class="carousel carousel-slider">
								
								<div class="carousel-item" href="#one!">
										<img id="we1" src="bird.jpg"> <!-- random image -->
										<img id="we1" src="waterfall.jpg">
										<img id="we1" src="sunrise.jpg">
										<img id="we1" src="seashore.jpg">
										<img id="we1" src="suntree.jpg">
								</div>
								<div class="carousel-item" href="#two!">
									<img id="we1" src="bird.jpg"> <!-- random image -->
									<img id="we1" src="waterfall.jpg">
									<img id="we1" src="sunrise.jpg">
									<img id="we1" src="seashore.jpg">
									<img id="we1" src="suntree.jpg">
							</div>

							</div>
			</div>
		</div>
	</article>

	<footer class="container-fluid">
		<div class="row">
			<div class="col xl12">
				<h4 class="center-align">&copy; Copyright 2021 by Team_16</h4>
				<p class="center-align">BookaPhotographer</p>
			</div>
		</div>
	</footer>
	<!-- actions -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	
	  <script type="text/javascript">
			$(document).ready(function(){
				$(".dropdown-trigger").dropdown({
					hover:true,
					alignment: 'right',
				});
			
			$('#slimg').carousel({
				indicators: true
			});

			setInterval(function(){
				$('#slimg').carousel('next');
				},5000);
			});
	  </script>

	  <script type="text/javascript">
			$(document).ready(function(){
				$('#collect1').carousel({
						fullWidth: true,
						indicators: false
					});
					
					// collect1
					$('.prev').click(function() {
							$('#collect1').carousel('prev');
					});

					$('.next').click(function() {
							$('#collect1').carousel('next');
					});

					// collect2
					$('#collect2').carousel({
						fullWidth: true,
						indicators: false,
					});

					$('.prev2').click(function() {
							$('#collect2').carousel('prev');
					});

					$('.next2').click(function() {
							$('#collect2').carousel('next');
					});

					// collect3
					$('#collect3').carousel({
						fullWidth: true,
						indicators: false,
					});

					$('.prev3').click(function() {
							$('#collect3').carousel('prev');
					});

					$('.next3').click(function() {
							$('#collect3').carousel('next');
					});

					// collect4

					$('#collect4').carousel({
						fullWidth: true,
						indicators: true,
					});
					
					setInterval(function(){
						$('#collect4').carousel('next');
					},5000);
					
					// collect6
					$('#collect6').carousel({
						fullWidth: true,
						indicators: false,
					});

					$('.prev4').click(function() {
							$('#collect6').carousel('prev');
					});

					$('.next4').click(function() {
							$('#collect6').carousel('next');
					});
			});
	  </script>
</body>
</html>