<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="rent.css">
 
</head>
<style>
.container {background-color: rgba(255, 255, 255, 0);}
.jumbotron {background-color: rgb(186, 186, 186);}
.card{background-color: rgba(255, 255, 255, 0); border:none;}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="tit1" href="#">SHUTTER</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
    <input type="hidden" >
    <!--  <button>
    <a type="hidden" class="search">search</a>
    </button>-->
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
	
<form method="post" action="rentbuyresponse.jsp">
<div class="form-group col-md-4">
<%

								String location=request.getParameter("loc");
        						System.out.println(location);
								String modelname,studioname,email,address,price,description,proof,phonenumber,techdetails;%>
		                        <label for="inputlocation">Location</label>
		                        <select id="inputlocation" class="form-control" name="loc">
                            <option selected><%out.println(location);%></option>
                             <%
									try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
									PreparedStatement ps2=con2.prepareStatement("select * from backup");
									ResultSet rs2=ps2.executeQuery();
									
									while(rs2.next())
									{
										out.println("<option value='"+rs2.getString("city")+"'>"+rs2.getString("city")+"</option>");
									}
									}
									catch(Exception e)
									{
										System.out.println(e);
									}
									%>
                            
                        </select>

 
 
  </div>
<br>

<div>
   
<button class="btn btn-primary" type="submit">Search</button>
</div>
  </form>


<br>
<br>
	<%
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
			PreparedStatement ps=con.prepareStatement("select * from rent where location=?");
			ps.setString(1, location);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				modelname=rs.getString("modelname");
				studioname=rs.getString("studioname");
				email=rs.getString("email");
				address=rs.getString("address");
				price=rs.getString("price");
				techdetails=rs.getString("technical_details");
				phonenumber=rs.getString("phonenumber");
			    out.println("<div class='container'>");
		        out.println("<div class='jumbotron'>");
		        out.println("<form id=form method='post' action='orderrent.jsp'>");
		        out.println("<br>");
		        HttpSession ses=request.getSession();
		        ses.setAttribute("loc",location);
		        out.println("<div class='card'>");
				out.println("<img src='https://www.adorama.com/alc/wp-content/uploads/2017/06/dslr-camera-1.jpg' alt='cam' style='width:90%'>");
				out.println("</div>");
				out.println("<div class='form-row'>");
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for=''>Model name</label>");
				out.println("<input type='text' class='form-control' id='inputmodelname' value='"+modelname+"' name='modelname' readonly>");
				out.println("</div>");  
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for=''>studio name</label>");
				out.println("<input type='text' class='form-control' id='inputstudioname' value='"+studioname+"' name='studioname' readonly>");
				out.println("</div>");  
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for='inputprice'>price</label>");
				out.println("<input type='text' class='form-control' id='inputprice' value='"+price+"' name='price' readonly>");
				out.println("</div>");
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for='inputAddress'>Email</label>");
				out.println("<input type='text' class='form-control' id='inputEmail' value='"+email+"' name='email' readonly>");
				out.println("</div>");
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for='inputAddress'>Phone Number</label>");
				out.println("<input type='text' class='form-control' id='inputphonenumber' value='"+phonenumber+"' name='phonenumber' readonly>");
				out.println("</div>");
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for='inputdate'>date</label>");
				out.println("<input type='date' class='form-control' id='inputdate' name='date'>");
				out.println("</div>");
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for='inputAddress'>Address</label>");
				out.println("<textarea class='form-control' id='inputAddress' rows='4' cols='50' name='address' readonly>");
				out.println(address);
				out.println("</textarea>");
				out.println("</div>");
				out.println("<div class='form-group col-md-6'>");
				out.println("<label for='inputdesc'>Technical details</label>");
				out.println("<textarea class='form-control' id='inputTechdetails'rows='4' cols='50' name='tdetails' readonly>");	
				out.println(techdetails);
				out.println("</textarea>");
				out.println("</div>");
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<div class='buttonedit'>");
				out.println("<div class='d-grid gap-2 d-md-flex justify-content-md-end'>");
				out.println("<button class='btn btn-primary' type='submit'>Book now</button>");
				out.println("</div>");
				out.println("</div>");
				out.println("</form>");
				out.println("</div>");
				out.println("</div>");
				out.println("</div>");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>

    


</body>
</html>