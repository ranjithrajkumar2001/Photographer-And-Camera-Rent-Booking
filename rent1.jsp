<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <link rel="stylesheet" href="rent1.css">
</head>
<style>
.container {background-color: rgba(255, 255, 255, 0);}
.jumbotron {background-color: lightGrey;}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="tit" href="#">shutter</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="log"href="#">logout</a>
  </nav>
<body>
	<%@page import="java.util.*"%>
	<%@page import=" java.io.IOException"%>
	<%@page import="java.io.InputStream"%>
	<%@page import="java.io.PrintWriter"%>
	<%@page import=" java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.util.Set"%>
	<%@page import="java.util.HashSet"%>
	<%@page import="java.util.Random"%>
	<%HttpSession ses=request.getSession();
		String location=String.valueOf(ses.getAttribute("location")); %>
	<div class=container>
	<div class=jumbotron>
	<form id=form method="post" action="rent1servlet" enctype="multipart/form-data" >
				        <div class="form-group">
                        <label for="inputloc">Location</label>
                        <select id="inputloc" class="form-control" name="loc" style=" width: 250px;">
                            <option value=<%=location %> selected><%out.println(location); %></option>
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
		  		<div class="form-group">
                    <label for="inputproof">proof</label>
                    <input type="file" class="form-control" id="inputproof" name="proof" style=" width: 250px;">
                    <h5>(aadhar card,pan card,passport or licesnse)</h5>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			    <button class="btn btn-primary" type="submit">next</button>
				</div>
    </form>
    </div>
    </div>
</body>
</html>