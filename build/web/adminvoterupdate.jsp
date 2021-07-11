<%-- 
    Document   : adminvoterupdate
    Created on : Mar 30, 2021, 12:58:08 PM
    Author     : Aditi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String Id = request.getParameter("Id");
        String ScholarNo = request.getParameter("sno");
        String StudentName = request.getParameter("sname");
        String PhoneNo = request.getParameter("pno");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/voting","root","");
        pst = con.prepareStatement("update voter set ScholarNo = ?,Name =?,PhoneNo= ? where Id = ?");
        pst.setString(1, ScholarNo);
        pst.setString(2, StudentName);
        pst.setString(3, PhoneNo);
        pst.setString(4, Id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Record Updated");           
       </script>
    <%             
    }
 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        
        
    </head>
    <body>
        <h1>Student Update</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/voting","root","");
                           
                          String Id = request.getParameter("Id");
                          
                        pst = con.prepareStatement("select * from voter where Id = ?");
                       pst.setString(1, Id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Scholar No</label>
                        <input type="text" class="form-control" placeholder="Scholar No" value="<%= rs.getString("ScholarNo")%>" name="sno" id="sno" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" value="<%= rs.getString("Name")%>" id="sname" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Phone No</label>
                        <input type="text" class="form-control" placeholder="Phone No" name="pno" id="pno" value="<%= rs.getString("PhoneNo")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="adminvoter.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  
    </body>
</html>
 
