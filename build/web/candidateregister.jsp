<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <script type="text/javascript">




            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        preview.src = e.target.result;
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            function confirmDelete() {
                if (!confirm("The Record will be Deleted Permanently <br> Want to Proceed ?"))
                    return false;


        </script>
    </head>
    <body style=" background-image: url('img/bg5.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: 100% 100%;">
         <nav class="navbar navbar-expand-md bg-dark navbar-dark" style="margin-top: -23px">
             <a class="navbar-brand" href="adminhome.jsp" style="color: wheat"> HOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav" style="padding-left: 900px">
        <li class="nav-item">
        <a class="nav-link" href="#cr" style="color: wheat">CR</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#tpr" style="color: wheat">TPR</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#ex" style="color: wheat">EXECUTIVE</a>
      </li>    
    </ul>
  </div>  
</nav>

        <h1 style="font-family:Georgia; padding-left: 290px ;color: white;font-size: 50px">CANDIDATE &nbsp; REGISTRATION</h1>
            
        <div class="container">
           
            <div class="row">
                 <div class="col-sm-3">
                     <img src="img/candidate.jpg" width="350px" height="600px" class="rounded-circle" style="position:fixed ;padding-top:100px;margin-top: -80px;margin-left: 10px ">
        </div>
                <div class="col-sm-6">

                    <centre>
                    <form action="candidatecontroller?op=add" method="post" class="col-sm-12" enctype="multipart/form-data" runat="server" style="border-style: solid; width: 650%;border-radius: 50px 50px 50px 50px;margin-left: 250px;margin-top: 30px;background-color:white"> 

                        <div class="col-md-7" style="padding-left: 200px">
                            <centre>
                            <img src="img/blank.png"id="output" width="130px" class="rounded-circle" height="130px">
                             <input type="file" name="Pic" id="Pic" accept="image/*" onchange="loadFile(event)">
                            <script>
                                    var loadFile = function (event) {
                                        var output = document.getElementById('output');
                                        output.src = URL.createObjectURL(event.target.files[0]);
                                        output.onload = function () {
                                            URL.revokeObjectURL(output.src) // free memory
                                        }
                                    };
                            </script>
                            </centre>
                            <!--<img src=""   class="rounded" style="width: 200px;height: 200px; margin-top: 30px; border:5px solid #000 "/>
                            <br/> <br/>
                            <input type="button" value="UPLOAD PICTURE" class="btn btn-primary" onclick="Pic.click();"/><br/>
                            <input type="file" name="Pic" id="Pic" onchange="readURL(this)" required="required" />-->
                        </div>
                        <centre>
                            <table class ="table" >
                            <tr style="color: darkblue">
                                <td><input type="text" name="Name" id="Name" placeholder="Candidate's Name" class="form-control" style="border: 2px solid #000" required="required" /></td>
                            </tr>
                            <tr style="color: darkblue">
                                <td><input type="number" name="ScholarNo" id="ScholarNo" placeholder="Scholar Number" class="form-control" style="border: 2px solid #000" required="required"/></td>
                            </tr>
                            <tr style="color: darkblue">
                                <td><input type="text" name="MobileNo" id="MobileNo" placeholder="Mobile Number" class="form-control" style="border: 2px solid #000" required="required"/></td>
                            </tr>
                            <tr style="color: gray">
                                <td><input type="text" name="Cgpa" id="Cgpa" placeholder="Cgpa" class="form-control" style="border: 2px solid #000" required="required"/></td>
                            </tr>

                            <tr style="color: black">
                                <td> Select Post : <span style="font-weight: bold;color:red" id="s2"></span> <br/>
                                    <input type="radio" name="Post" value="CR" id="post1"/> CR <br/>
                                    <input type="radio" name="Post" value="EXCECUTIVE" id="post2"/> EXECUTIVE <br/>
                                    <input type="radio" name="Post" value="TPR" id="post3"/> TPR <br/>
                                </td>
                            </tr>

                            <tr style="color: black">
                                <td> Select Skilles :<span style="font-weight: bold;color:red" id="s3"></span> <br/>
                                    <input type="checkbox" name="Skills" value="ML" id="skill1"/> Machine learning <br/>
                                    <input type="checkbox" name="Dkills" value="MYSQL" id="skill1"/> Internet of Things <br/>
                                    <input type="checkbox" name="Skills" value="DATASCIENCE" id="skill3"/> Full Stack Web Development <br/>
                                    <input type="checkbox" name="Skills" value="PYTHON" id="skill4"/> Blockchain <br/>
                                    <input type="checkbox" name="Skills" value="JAVASCRIPT" id="skill5"/> Cloud Computing <br/>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" class="btn btn-dark form-control" value="Register" name="submit"/></td>
                            </tr>
                        </table>
                        </centre>

                        <!--</center>-->
                    </form>
                    </centre>
                </div> 
                
                
                    <!--<a href="candidateregister.jsp" class="btn btn-primary"> Add More records <i class="fa fa-plus-square-o" aria-hidden="true"></i></a> -->

                </div>                    


            </div>
        


    </body>
</html>