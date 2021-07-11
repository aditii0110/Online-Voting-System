<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap-modal.js"></script>
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <title>Candidate Page</title>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark navbar-dark" style="position: fixed;top: 0;width: 100%;">
  <a class="navbar-brand" href="index.jsp"> HOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" style=" border-color: transparent;">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav" style="padding-left: 900px">
        <li class="nav-item">
        <a class="nav-link" href="#cr">CR</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#tpr">TPR</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#ex">EXECUTIVE</a>
      </li>    
    </ul>
  </div>  
</nav>
        <div style="background-image: url('img/bgd6.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: 100% 100%;" id="cr">
            <div>
            <h1 style="font-family:Garamond;font-size: 80px;margin-left: 280px;color: wheat;margin-top: 30px;padding-top: 40px" >CR CANDIDATES</h1>
            </div>
            <div class="container">
                <div class="row">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi", "root", "");
                            String sql = "select * from users where Post='CR' ";
                            PreparedStatement smt = con.prepareStatement(sql);
                            ResultSet rs = smt.executeQuery();
                            int i = 1;
                while (rs.next()) {%>
       
             
                 <div class="card text-center col col-md-3 h-50 w-50" style="width: 28rem;border-radius: 50%;margin-right: 30px;margin-left: 50px;margin-bottom: 10px;background-color: white">
  <img src="<%=rs.getString("image")%>" class="card-img-top rounded-circle" alt="..." width="150px" height="250px" style="padding-top: 1px;padding-left: 10px;padding-right: 10px">
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("Name")%></h5>
    <p class="card-text">Proficient in <%=rs.getString("Skills")%></p>
    <button type="button" class="btn btn-dark" role="button" data-toggle="modal" data-target="#Modal-vert-center-demo1">
        <strong>PROCLAIMATION</strong>
</button>
  </div>

 
    

    <div class="modal fade" id="Modal-vert-center-demo1" tabindex="-1" role="dialog" aria-labelledby="Modal-vert-center-demo-label" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document" >
      <div class="modal-content" style="background-image: radial-gradient(circle at 31.7% -18.3%, #dcffff 0, #c8ffff 10%, #b4ffff 20%, #a3ffff 30%, #96fff7 40%, #8bece6 50%, #83d1d2 60%, #7ebabf 70%, #7aa7ae 80%, #76979f 90%, #738b93 100%);">
      <div class="modal-header">
        <h5 class="modal-title" id="Modal-vert-center-demo-label"><%=rs.getString("Name")%> proclaims:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
          
        "I will raise the barriers of the college and accomplish new heights for the college"
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
 </div>
      
    
      


        <%}
                con.close();
            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        %>
                    
                </div>
            </div>
        </div>
        
        <!--TPR-->
        <div style="background-image: url('img/bgd7.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: 100% 100%;" id="tpr">
            <div>
                <h1 style="font-family:Garamond;font-size: 80px;margin-left: 300px;color: gray;padding-top: 40px" >TPR &nbsp; CANDIDATES</h1>
            </div>
            <div class="container">
              <div class="row">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi", "root", "");
                            String sql = "select * from users where Post='TPR' ";
                            PreparedStatement smt = con.prepareStatement(sql);
                            ResultSet rs = smt.executeQuery();
                            int i = 1;
                while (rs.next()) {%>
       
             
                 <div class="card text-center col col-md-3 h-50 w-50" style="width: 28rem;border-radius: 50%;margin-right: 30px;margin-left: 50px;margin-bottom: 10px;background-color: gray">
  <img src="<%=rs.getString("image")%>" class="card-img-top rounded-circle" alt="..." width="150px" height="250px" style="padding-top: 1px;padding-left: 10px;padding-right: 10px">
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("Name")%></h5>
    <p class="card-text">Proficient in <%=rs.getString("Skills")%></p>
    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#Modal-vert-center-demo2">
  PROCLAIMATION
</button>
  </div>

 
    

    <div class="modal fade" id="Modal-vert-center-demo2" tabindex="-1" role="dialog" aria-labelledby="Modal-vert-center-demo-label" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document" >
      <div class="modal-content" style="background-image: radial-gradient(circle at 31.7% -18.3%, #dcffff 0, #c8ffff 10%, #b4ffff 20%, #a3ffff 30%, #96fff7 40%, #8bece6 50%, #83d1d2 60%, #7ebabf 70%, #7aa7ae 80%, #76979f 90%, #738b93 100%);">
      <div class="modal-header">
        <h5 class="modal-title" id="Modal-vert-center-demo-label"><%=rs.getString("Name")%> proclaims:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
          
        "I  assure that every deserving student gets placed to its full potential."
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
 </div>
      
    
      


        <%}
                con.close();
            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        %>
        </div>
        </div>    
        
        </div>
        
        <!--EXECUTIVE-->
        <div style="background-image: url('img/bgd6.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: 100% 100%;" id="ex">
            <div>
                <h1 style="font-family:Garamond;font-size: 80px;margin-left: 120px;color: wheat;padding-top: 40px;" >EXECUTIVE &nbsp; CANDIDATES</h1>
            </div>
            <div class="container">
              <div class="row">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi", "root", "");
                            String sql = "select * from users where Post='EXCECUTIVE' ";
                            PreparedStatement smt = con.prepareStatement(sql);
                            ResultSet rs = smt.executeQuery();
                            int i = 1;
                while (rs.next()) {%>
       
             
                 <div class="card text-center col col-md-3 h-50" style="width: 50%;border-radius: 50%;margin-right: 30px;margin-left: 50px;margin-bottom: 10px;background-color: white">
  <img src="<%=rs.getString("image")%>" class="card-img-top rounded-circle" alt="..." width="150px" height="250px" style="padding-top: 1px;padding-left: 10px;padding-right: 10px">
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("Name")%></h5>
    <p class="card-text">Proficient in <%=rs.getString("Skills")%></p>
    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#Modal-vert-center-demo">
  PROCLAIMATION
</button>
  </div>

 
    

    <div class="modal fade" id="Modal-vert-center-demo" tabindex="-1" role="dialog" aria-labelledby="Modal-vert-center-demo-label" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document" >
      <div class="modal-content" style="background-image: radial-gradient(circle at 31.7% -18.3%, #dcffff 0, #c8ffff 10%, #b4ffff 20%, #a3ffff 30%, #96fff7 40%, #8bece6 50%, #83d1d2 60%, #7ebabf 70%, #7aa7ae 80%, #76979f 90%, #738b93 100%);">
      <div class="modal-header">
        <h5 class="modal-title" id="Modal-vert-center-demo-label"><%=rs.getString("Name")%> proclaims:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
         
        "I will maintain the discipline and decorum of the department."
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
 </div>
      
    
      


        <%}
                con.close();
            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        %>
        </div>
        </div>    
        
                
        </div>
           
    </body>
</html>