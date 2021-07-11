<%-- 
    Document   : adminvoter
    Created on : Mar 30, 2021, 1:06:11 AM
    Author     : Aditi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
 
    if(request.getParameter("submit")!=null)
    {
        String ScholarNo = request.getParameter("sno");
        String StudentName = request.getParameter("sname");
        String PhoneNo = request.getParameter("pno");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/Kucchbhi","root","");
        pst = con.prepareStatement("insert into voter(ScholarNo,Name,PhoneNo)values(?,?,?)");
        pst.setString(1, ScholarNo);
        pst.setString(2, StudentName);
        pst.setString(3, PhoneNo);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Added");     
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
    <body style=" background-image: url('img/bg2.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;">
        <h1 style="padding-left: 570px;color:wheat ">VOTERS' LIST</h1>
        </br>
        <div class="row">
            <div class="col-sm-3">
                <form  method="POST" action="#" > 
                    
                    <div alight="left" style="color: wheat">
                        <label class="form-label">SCHOLAR N0</label>
                        <input type="text" class="form-control" placeholder="Scholar No" name="sno" id="sno" required >
                     </div>
                         
                    <div alight="left" style="color: wheat">
                        <label class="form-label">STUDENT NAME</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required >
                     </div>
                         
                     <div alight="left" style="color: wheat">
                        <label class="form-label">PHONE NO</label>
                        <input type="text" class="form-control" placeholder="Phone No" name="pno" id="pno" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="SUBMIT" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="RESET" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            <div class="col-sm-9">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-dark" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>SCHOLAR NO.</th>
                                    <th>VOTER NAME</th>
                                    <th>PHONE NO.</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                             </tr>  
                             
                             <%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kucchbhi","root","");
                                
                                  String query = "select * from voter";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String Id = rs.getString("Id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("ScholarNo") %></td>
                                 <td><%=rs.getString("Name") %></td>
                                 <td><%=rs.getString("PhoneNo") %></td>
                                 <td><button><a href="adminvoterupdate.jsp?Id=<%=Id%>">Edit</a></button></td>
                                 <td><button><a href="adminvoterdelete.jsp?Id=<%=Id%>">Delete</a></button></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>
 
            </div>  
        </div>
 
    </body>
</html>
