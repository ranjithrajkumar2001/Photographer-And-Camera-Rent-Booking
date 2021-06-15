<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Merienda&display=swap" rel="stylesheet">
	

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="orderrent.css">

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
	<%HttpSession ses=request.getSession();
	String location=String.valueOf(ses.getAttribute("loc"));
	System.out.println(location);
	String studioname=request.getParameter("studioname");
	String price=request.getParameter("price");
	String model=request.getParameter("modelname");
	String date=request.getParameter("date");
	System.out.println(model);
         %>                   
    <header class="container-fluid">
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
                        <a class="nav-link text-light" href="#">Features</a>
                        </li>
                        
                        <li class="nav-item">
                        <a class="nav-link text-light" href="#">Pricing</a>
                        </li>
                        
                        <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dropdown link
                                </a>						
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                        </li>
                    </ul>
            </div>      
    </header>
    <section id="card" class="jumbotron shadow-sm">
    	<h1>Details</h1>
        <form method="post" action="orderrentservlet">
        		<% HttpSession ses3=request.getSession();
        		ses3.setAttribute("date",date);%>
                    <div class="form-group">
                    <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Name" name="name">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" id="inputAddress" placeholder="address" name="address">
                    </div>

                    <div class="form-group">
                        <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" placeholder="Email" name="email">
                        </div>
                    <div class="form-row">
                            <label class="label3" for="location">Location</label>
                            <select id="location" class="form-control col-md-3 col-lg-3" readonly name="location">
                                <option><%out.println(location); %></option>
                            </select>
                            
                            <label class="label4" for="studio">Studio</label>
                            <select id="category" class="form-control col-md-3 col-lg-3" readonly placeholder="Select Studio" name="studioname">
                                <option><%out.println(studioname);%></option>
                            </select>
                    </div>

                    <div class="form-row">
                    	<label class="label5" for="category">Duration</label>
                            <input type="number" class="form-control col-md-3 col-lg-3" id="duration"  placeholder="Number of days" name="duration">
                        
                        <label class="label6" for="price">Price </label>
                            <input type="text" class="form-control col-md-3 col-lg-3"readonly  id="price" value=<%out.println(price); %> placeholder="Price per day" name="price">
                    </div>
				
                    
                    <div class="form-row">
            
                   		<label class="label7" for="phoneno">Phone</label>
                       	<input type="number" class="form-control" id="phoneno" placeholder="phonenumber" name="phonenumber">
                        
                        <label class="label8" for="model">Model</label>
                        <select id="model" class="form-control col-md-3 col-lg-3"  name="modelname" readonly >
                        <option><%out.println(model); %></option>
                        </select>
                    </div>
                    
                    <div class="form-row">
                        <div class="col-2">
                            <button type="submit" class="btn btn-primary">Next</button>
                        </div>
                    </div>
                </form>
    </section>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

</body>
</html>