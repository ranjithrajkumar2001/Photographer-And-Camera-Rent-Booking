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
    <link rel="Stylesheet" type="text/css" href="signin.css">
</head>
<body>

<section class="container-fluid">
		<div class="row">
			<div class="col">
				<div id="top" class="jumbotron jumbotron shadow">
					<img id="sideimg" src="signin.jpg" class="img-fluid">
                           
                            <nav id="navbar">	
                                <ul class="nav justify-content-end">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="link1" aria-current="page" href="#">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="link3" href="logpage.jsp ">Log in</a>
                                    </li>
                                </ul>
                            </nav>
                            <h1 class="sign">Sign up</h1>
                            
                            
                            <form id="registerform" method="post" action="signinservlet">
                            
                                <div id="fname" class="form-row">
                                    <div class="col">
                                        <label for="formGroupExampleInput">First name</label>
                                        <input type="text" class="form-control" placeholder="First name" name="fname">
                                    </div>
                                    
                                    <div id="lname" class="col">
                                        <label for="formGroupExampleInput">Last name</label>
                                        <input type="text" class="form-control" placeholder="Last name" name="lname">
                                    </div>
                                  </div>

                                <div class="form-row">
                                  <div class="form-group col-md-6">
                                    <label for="inputEmail4">Email</label>
                                    <input type="email" class="form-control" id="inputEmail4" name="email">
                                  </div>

                                  <div class="form-group col-md-6">
                                    <label for="inputPassword4">Password</label>
                                    <input type="password" class="form-control" id="inputPassword4" name="password">
                                  </div>
                                </div>

                                <div class="form-group">
                                  <label for="inputAddress">Address</label>
                                  <input id="address" type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="address">
                                </div>

                                  <div id="dropdown" class="form-group col-md-4">
                                    <label for="inputState">Account type</label>
                                    <select id="inputState" class="form-control" name="type">
                                      <option selected>Personal</option>
                                      <option>Creator</option>
                                    </select>
                                  </div>
                                <button type="submit" class="btn btn-primary">Sign in</button>
                              </form>

				</div>
		</div>		
	</div>
</section>
</body>
</html>