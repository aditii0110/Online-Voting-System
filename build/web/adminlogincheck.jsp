<%
  
 String username = request.getParameter("uname");
     String pass = request.getParameter("pass");
     
     if((username.equals("Yashi Sharma") && pass.equals("adminyashi"))||(username.equals("Aditi Mishra")&& pass.equals("adminaditi") ))
     {
         
         response.sendRedirect("adminhome.jsp");
     }
     else
     {
           out.println("Login Fail");
     }
%>