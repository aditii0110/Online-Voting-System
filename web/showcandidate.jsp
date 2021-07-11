<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <script src="assets/js/bootstrap.min.js" type="text/js"></script>
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <style>
      .sliderImg{
          width:100%;
          height:200px;
      }
  </style>
  <script type="text/javascript">
      function confirmDelete(){
          if (!confirm("The Record will be Deleted Permanently <br> Want to Proceed ?"))
                return false;
      }
      </script>
    </head>
    <body style=" background-image: url('img/bg5.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: 100% 100%;">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="adminhome.jsp">HOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      
      <li class="nav-item">
        <a class="nav-link" href="https://www.linkedin.com/feed/">VOTERS</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="https://google.com">RESULTS</a>
      </li>    
    </ul>
  </div>  
</nav>
<br>



        <div class="container">
        
            <div class="row" style="margin-bottom:30px">
                <div class="col-md-12">
                    <h1 style="color:wheat;font-family:Garamond;margin-left: 300px;font-size: 50px">LIST &nbsp; OF &nbsp; CANDIDATES</h1>
                </div>
            </div>
            
              <div class="row">
                  <div class="col-md-12" style="color:brown">
                    <table class="table table-hover table-striped table-bordered" style="color:wheat">
            <tr>
                <!--<th>Id</th>-->
                            <th>NAME</th>
                            <th>SCHOLAR NO</th>
                            <th>PHONE NO</th>
                            <!--<th>gender</th>-->
                            <th>CGPA</th>
                            <th>Post</th>
                            <th>IMAGE</th>
                            <th>OPERATIONS</th>
            </tr>
            <%  
                try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi", "root", "");
                                String sql = "select * from users";
                                PreparedStatement smt = con.prepareStatement(sql);
                                ResultSet rs = smt.executeQuery();
                                int i = 1;
                                while (rs.next()) {%>
                        <tr>
                            <!--<td><%=i++%></td>-->
                            <!--<td><%=rs.getInt("id")%></td>-->
                            <td><%=rs.getString("Name")%></td>
                            <td><%=rs.getInt("ScholarNo")%></td>
                            <td><%=rs.getString("MobileNo")%></td>
                            <td><%=rs.getString("Cgpa")%></td>
                            <td><%=rs.getString("Post")%></td>
                            <td><img src="<%=rs.getString("image")%>" style="width:50px;height: 50px;" class="rounded-circle"/></td>
                            <td> <a href="editUser.jsp?id=<%=rs.getString("id")%>" class="btn btn-success">  <i class="fa fa-pencil" aria-hidden="true"></i> </a> | <a href="candidatecontroller?op=delete&&id=<%=rs.getInt("id")%>" class="btn btn-dark" onclick="return confirmDelete();"> <i class="fa fa-trash" aria-hidden="true"></i></a> </td>
                        <a href="votecr.jsp"></a>
                        </tr>
                        <%}
                                con.close();
                            } catch (Exception e) {
                                System.out.println("Error " + e.getMessage());
                            }
                        %>
        </table>
                </div>
              </div>
        </div>
    <centre>
        <a href="candidateregister.jsp" class="btn btn-dark"> Add More Records <i class="fa fa-plus-square-o" aria-hidden="true"></i></a> 
    </centre>
    </body>
</html>