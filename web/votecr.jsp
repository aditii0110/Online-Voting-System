<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="com.databeans.voterbean"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VOTE CR</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background-image: url('img/bg7.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: 100% 100%;">
         <%
              voterbean voter = (voterbean)session.getAttribute("voter");
           if(voter==null){
            RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
           rd.forward(request,response);
           }
        %>
          <div class="container">
              <div class="row">
                  
              <h1 style="font-family: Georgia;font-size: 50px;color: wheat; margin-left: 50px;padding-bottom: 30px;padding-top: 20px"><center><font>CLASS &nbsp; REPRESENTATIVE &nbsp; CANDIDATES</font></center></h1>
                   
        <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi", "root", "");
                            String sql = "select * from users where Post='CR'";
                            PreparedStatement smt = con.prepareStatement(sql);
                            ResultSet rs = smt.executeQuery();
                            int i = 1;
        
               while (rs.next()) {%>
        
      
               <div class="card  text-center col col-md-3" style="width: 40px;margin-right:30px;margin-left: 50px;margin-bottom: 10px;background-image: radial-gradient(circle at 78.22% 1.12%, #fcfff5 0, #f6fef0 6.25%, #eefbeb 12.5%, #e4f7e6 18.75%, #d8f2e0 25%, #caeddb 31.25%, #bae7d6 37.5%, #a7e0d2 43.75%, #92d9ce 50%, #7bd1cc 56.25%, #64cacc 62.5%, #4cc4cd 68.75%, #30bdd0 75%, #00b7d3 81.25%, #00b2d7 87.5%, #00acdb 93.75%, #00a8de 100%);">
                   <form action="votecontroller" method="post">
                       <input type="hidden" name="post" value="CR"/> <input type="hidden" name="Vschno" value="<%=voter.getScholarNo()%>"/> <input type="hidden" name="Cid" value="<%=rs.getInt("id")%>"/> 
                   <centre><img align="middle" src="<%=rs.getString("image")%>" class="card-img-top rounded-circle" alt="..."  style="width:150px;height: 150px;"></centre>
                   <h6 style="margin-top: 10px;margin-bottom: -10px"  id="h6"><%=rs.getInt("id")%> </h6>
                   
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("Name")%></h5>
    <p class="card-text"><%=rs.getString("Skills")%></p>
    <p class="card-text"> <%=rs.getString("Cgpa")%></p>
    
    <div class="card-footer">
       <tr>
                                <td><input type="submit" class="btn btn-primary form-control" id="form" value="VOTE" name="submit"/></td>
                            </tr>
    </div>
  </div>
                   </form>
</div>
   
  


        <%}
                con.close();
            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        %>
  
          </div>
        </div>    
        
    </body>
</html>