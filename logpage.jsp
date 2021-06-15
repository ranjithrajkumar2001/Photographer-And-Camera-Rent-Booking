<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="Stylesheet" type="text/css" href="booton2.css">
</head>

<body>
	<section class="container-fluid">
			<div class="row">
				<div class="col">
					<div id="top" class="jumbotron jumbotron shadow">	
						<nav>	
								<ul class="nav justify-content-end">
									<li class="nav-item">
										<a class="nav-link active" id="link1" aria-current="page" href="#">About</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="link3" href="signin.jsp">Sign up</a>
									</li>
								</ul>
						</nav>
								<img id="profilepic" src="profile.jpg" class="img-fluid">
								<!--<button  id="signup" class="btn btn-dark">Sign up</button>
								-->
								<form id="login" method="post" action="logpageservlet">
									<div class="form-group">
									<label for="exampleInputEmail1">Email address</label>
									<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
									</div>
									<div class="form-group">
									<label for="exampleInputPassword1">Password</label>
									<input type="password" class="form-control" id="exampleInputPassword1" name="password">
									</div>
									<button type="submit" class="btn btn-primary">Log in</button>
								</form>

								<img id=sideimg src="pexels.jpg"class="img-fluid">
							</div>		
					</div>
				</div>		
</section>
</body>
</html>