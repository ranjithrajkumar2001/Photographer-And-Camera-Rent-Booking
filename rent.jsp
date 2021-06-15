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
<!--  <div class="detail">
<label for="inputfrom">From</label>
        <input type="date" class="date" id="inputfromdate" placeholder="from">
        <label for="inputto">To</label>
        <input type="date" class="date" id="inputtodate" placeholder="to">
</div>-->
<br>
    <div class="container">
        <div class="jumbotron">
        <form id=form method="post" action="rentservlet">
          <h3 style="font-family:Didot;text-align:center">Camera Details</h3>
<br>

<div class="card">
  <img src="https://www.adorama.com/alc/wp-content/uploads/2017/06/dslr-camera-1.jpg" alt="cam" style="width:90%">
     </div>

<div class="form-row">
        <div class="form-group col-md-6">
        <label for="">studio name</label>
        <input type="text" class="form-control" id="inputstudioname" placeholder="studio name" name="studioname">
        </div>  
        <div class="form-group col-md-6">
    <label for="inputprice">price</label>
   <input type="text" class="form-control" id="inputprice" placeholder="price per day" name="price">
        </div>
    
        <div class="form-group col-md-6">
    <label for="inputAddress">Location</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="location" name="location">
    </div>
     <div class="form-group col-md-6">
    <label for="inputAddress">Email</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="Email" name="email">
    </div>
    <div class="form-group col-md-6">
    <label for="inputAddress">Address</label>
        <textarea class="form-control" id="inputAddress" placeholder="Address"rows="4" cols="50" name="address">
   </textarea>
    </div>
    <div class="form-group col-md-6">
    <label for="inputdesc">Technical details</label>
        <textarea class="form-control" id="inputDescription" placeholder="technical details" rows="4" cols="50" name="tdetails">
        </textarea>
    </div>
     <div class="form-group col-md-6">
    <label for="inputAddress">Phone number</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="Phonenumber" name="phonenumber">
        
    </div>
    <div class="form-group col-md-6">
    <label for="inputAddress">Camera model</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="modelname" name="modelname">
        
    </div>
    </div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button class="btn btn-primary" type="submit">next</button>
</div>

    </form>
    </div>
    </div>
    </div>


</body>
</html>