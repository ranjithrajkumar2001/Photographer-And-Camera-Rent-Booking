<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Merienda&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="Stylesheet" type="text/css" href="enquiry.css">
    
	
</head>
<style>
	    .clear{
	border:0;
	outline:0;
	width:100%;
	}
    </style>
<body>
	<%@page import="java.util.*"%>
	<%@page import=" java.io.IOException"%>
	<%@page import="java.io.InputStream"%>
	<%@page import="java.io.PrintWriter"%>
	<%@page import=" java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.ResultSet"%>
	<%	String loc=request.getParameter("location");
	String cat=request.getParameter("category");
	String fname="";
	String add="";
	//System.out.println(loc);
	//HttpSession ses=request.getSession();
	//System.out.println(loc);
	String contact=""; %>
	<header>
		<nav id="navb"class="navbar navbar-expand-lg navbar-light bg-dark">
			<a class="navbar-brand text-light" href="#">SHUTTER</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			  <span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
					<ul class="navbar-nav">
						
						<li class="nav-item active">
						<a class="nav-link text-light" href="#">Home <span class="sr-only">(current)</span></a>
						</li>
						
						<li class="nav-item">
						<a class="nav-link text-light" href="#">About</a>
						</li>
						<li class="nav-item">
						<a href="rentbuy.jsp"class="nav-link text-light" href="#">Rent</a>
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
		
		  <div class="searchbar">
		  	
				<form id="categories" method="POST" action="photographerprofile2.jsp">
					<div class="form-row">
							<div class="form-group col-md-4">
								<select id="inputState" class="form-control">
								<option selected><% out.println(loc);%></option>
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
							</div>
					  </div>
					 
					  <div id="box2" class="form-row">
							<div class="form-group col-md-4">
								<select id="inputState" class="form-control">
								<option selected><% out.println(cat);%></option>
									<%
									try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
									PreparedStatement ps2=con2.prepareStatement("select * from backup");
									ResultSet rs2=ps2.executeQuery();
									
									while(rs2.next())
									{
										out.println("<option value='"+rs2.getString("category")+"'>"+rs2.getString("category")+"</option>");
									}
									}
									catch(Exception e)
									{
										System.out.println(e);
									}
									%>
								</select>
							</div>
				  	</div>
				  		

						<button type="submit" class="btn btn-primary">Search</button>
				</form>
		  </div>
	</header>
	
	<aside class="container-fluid">

		<div id="border" class="card border-light mb-3 shadow-sm" style="max-width: 18rem;">
		  <div id="icon-text"class="card-header text-center"><i class="bi bi-funnel-fill text-md"></i>Filter</div>
			  <div class="card-body">
			    <div class="card-text">
					<form>
						<p>Categories</p>
						<div class="dropdown-divider"></div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
							<label class="form-check-label" for="defaultCheck1">
							  low Price
							</label>
						  </div>
						  
						  <div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
							<label class="form-check-label" for="defaultCheck1">
							  Package
							</label>
						  </div>
						  
						  <div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
							<label class="form-check-label" for="defaultCheck1">
							  Photoshoot
							</label>
						  </div>
					</form>
			    </div>
			   </div>
		</div>
	</aside>
	<form id="cardGeneration" method="post" action="photographerprofile.jsp">
	<section id="section" class="container">
		<h3>Best <%out.println(cat); %> photographers in <%out.println(loc); %></h3>
		<div id="divider1" class="dropdown-divider"></div>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
				</li>

				<!-- <li class="nav-item" role="presentation">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
				</li>

				<li class="nav-item" role="presentation">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
				</li> -->
		  </ul>
		  									<%

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
		PreparedStatement ps=con.prepareStatement("select * from photographerdetails where city=?");
		ps.setString(1,loc);
		ResultSet rs=ps.executeQuery();
		//System.out.println(ps);
		int count=0;
		while(rs.next())
		{
			if(count==0){
			out.println("<form  action='photographerprofile.jsp' method='post' class='tab-content' id='myTabContent'>");
			out.println("<div class='tab-pane fade show active' id='home' role='tabpanel' aria-labelledby='home-tab'>");
			out.println("<div class='card-body'>");
			out.println("<input name='studioname'  class='text-left clear' readonly value='"+rs.getString("studioname")+"'/><br>");
			out.println("<div class='dropdown-divider'></div>");
			out.println("<div class='card-text'>");
			out.println("<input name='firstname'  class='text-center clear' readonly value='"+rs.getString("firstname")+"'/><br>");
			out.println("<input name='address1'  class='text-center clear' readonly  value='"+rs.getString("address1")+"'/><br>");
			out.println("<input name='email'  class='text-center clear' readonly  value='"+rs.getString("email")+"'/><br>");
			out.println("<input name='phonenumber'  class='text-center clear' readonly  value='"+rs.getString("phonenumber")+"'/><br>");
			out.println("<img src='bird.jpg' class='rounded-circle' alt='...' width='150px' height='150px'>");
			out.println("<img src='wedding1.jpg' class='img-thumbnail' alt=''...''>");
			out.println("<img src='model1.jpg' class='img-thumbnail' alt=''...''>");
			out.println("<img src='baby1.jpg' class='img-thumbnail' alt=''...''>");
			out.println("<img src='birthday1.jpg' class='img-thumbnail' alt=''...''>");
			out.println("</div>");
			out.println("<input type='submit' class='btn btn-primary' value='VIEW'/>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
			out.println("</form>");
			}
			else if(count==1)
			{
				out.println("<form  action='photographerprofile.jsp' method='post' class='tab-content' id='myTabContent'>");
					out.println("<div class='tab-pane fade show active' id='home' role='tabpanel' aria-labelledby='home-tab'>");
					out.println("<div class='card-body'>");
					out.println("<input name='studioname'  class='text-left clear' readonly value='"+rs.getString("firstname")+"'/><br>");
					out.println("<div class='dropdown-divider'></div>");
					out.println("<div class='card-text'>");
					out.println("<input name='firstname'  class='text-center clear' readonly value='"+rs.getString("firstname")+"'/><br>");
					out.println("<input name='address1'  class='text-center clear' readonly  value='"+rs.getString("address1")+"'/><br>");
					out.println("<input name='email' class='text-center clear' readonly  value='"+rs.getString("email")+"'/><br>");
					out.println("<input name='phonenumber'  class='text-center clear' readonly  value='"+rs.getString("phonenumber")+"'/><br>");
					out.println("<img src='bird.jpg' class='rounded-circle' alt='...' width='150px' height='150px'>");
					out.println("<img src='wedding2.jpg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='model2.jpeg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='birthday2.jpg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='postwedding1.jpg' class='img-thumbnail' alt=''...''>");
					out.println("</div>");
					out.println("<input type='submit' class='btn btn-primary' value='VIEW'/>");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
					out.println("</form>");
			}
			else if(count==2)
			{
				out.println("<form  action='photographerprofile.jsp' method='post' class='tab-content' id='myTabContent'>");
					out.println("<div class='tab-pane fade show active' id='home' role='tabpanel' aria-labelledby='home-tab'>");
					out.println("<div class='card-body'>");
					out.println("<input name='studioname'  class='text-center clear' readonly value='"+rs.getString("firstname")+"'/><br>");
					out.println("<div class='dropdown-divider'></div>");
					out.println("<div class='card-text'>");
					out.println("<input name='firstname'  class='text-center clear' readonly value='"+rs.getString("firstname")+"'/><br>");
					out.println("<input name='address1'  class='text-center clear' readonly  value='"+rs.getString("address1")+"'/><br>");
					out.println("<input name='email'  class='text-center clear' readonly  value='"+rs.getString("email")+"'/><br>");
					out.println("<input name='phonenumber'  class='text-center clear' readonly  value='"+rs.getString("phonenumber")+"'/><br>");
					out.println("<img src='bird.jpg' class='rounded-circle' alt='...' width='150px' height='150px'>");
					out.println("<img src='wedding3.jpg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='baby2.jpg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='model3.jpeg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='birthday3.jpg' class='img-thumbnail' alt=''...''>");
					out.println("</div>");
					out.println("<input type='submit' class='btn btn-primary' value='VIEW'/>");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
					out.println("</form>");
			}
			else if(count==3)
			{
				out.println("<form  action='photographerprofile.jsp' method='post' class='tab-content' id='myTabContent'>");
					out.println("<div class='tab-pane fade show active' id='home' role='tabpanel' aria-labelledby='home-tab'>");
					out.println("<div class='card-body'>");
					out.println("<input name='studioname'  class='text-left clear' readonly value='"+rs.getString("firstname")+"'/><br>");
					out.println("<div class='dropdown-divider'></div>");
					out.println("<div class='card-text'>");
					out.println("<input name='firstname'  class='text-center clear' readonly  value='"+rs.getString("firstname")+"'/><br>");
					out.println("<input name='address1'  class='text-center clear' readonly  value='"+rs.getString("address1")+"'/><br>");
					out.println("<input name='email'  class='text-center clear' readonly  value='"+rs.getString("email")+"'/><br>");
					out.println("<input name='phonenumber'  class='text-center clear' readonly  value='"+rs.getString("phonenumber")+"'/><br>");
					out.println("<img src='bird.jpg' class='rounded-circle' alt='...' width='150px' height='150px'>");
					out.println("<img src='wedding4.jpg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='postwedding2.jpg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='model4.jpeg' class='img-thumbnail' alt=''...''>");
					out.println("<img src='birthday4.jpg' class='img-thumbnail' alt=''...''>");
					out.println("</div>");
					out.println("<input type='submit' class='btn btn-primary' value='VIEW'/>");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
					out.println("</form>");
					}
			++count;
		}
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/enquiry.jsp");
		rd.forward(request,response);
		con.close();	
	}
	catch(Exception e){
		System.out.print(e);
	}
	%>	
					<!-- <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
					<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div> -->
				</form>
	</section>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>