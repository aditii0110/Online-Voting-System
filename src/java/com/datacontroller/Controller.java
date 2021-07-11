/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datacontroller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.databeans.*;
import com.datadao.*;
import database.dbconnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;


public class Controller extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String op = request.getParameter("op");

              if( op.equals("checkid"))
        {
            
             System.out.println("yha aaya");
           
             int schno = Integer.parseInt(request.getParameter("ScholarNo"));
           String  phoneno = request.getParameter("PhoneNo"); 
             voterbean vb = new voterbean();
             vb.setScholarNo(schno);
             vb.setPhoneNo(phoneno);
            voterdao vd = new voterdao();
            
            if(vd.checkidStudent(vb)){
                if(vd.checkidVoter(vb))
                    out.println("<font color='black'><b>sorry! this userid has already been registered</b></font>");              
            else
               out.println("<font color='blue'><b>Userid Is Available</b></font>");  
            }
            else {
                out.println("<font color='red'>No record found as student</font>");
            }
                             
              
            
            System.out.println("yha bhi aaya");
            
              
        }    
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String op = request.getParameter("op");

        if (op != null && op.equals("add")) {
            String name = request.getParameter("Name");
            int schno = Integer.parseInt(request.getParameter("ScholarNo"));
            String  phoneno = request.getParameter("PhoneNo"); 
            //int phoneno = Integer.parseInt(request.getParameter("PhoneNo")); 
            String  password = request.getParameter("Password");
            
            
           voterbean vb = new voterbean();
            vb.setName(name);
            vb.setScholarNo(schno);
            vb.setPhoneNo(phoneno);
            vb.setPassword(password);
            voterdao vd = new voterdao();
           if(vd.add(vb))
                response.sendRedirect("userlogin.jsp");
            }
        
                
        
       else if(op!=null && op.equals("logout")){
            //session.setAttribute("user", null); 
            HttpSession session=request.getSession();
            session.removeAttribute("voter");
        }
         else if (op.equals("login")){
        System.out.println("One ..."+request.getParameter("ScholarNo"));
            int schno = Integer.parseInt(request.getParameter("ScholarNo"));
        String password = request.getParameter("Password");
            
             voterbean lb = new voterbean(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.
 
        lb.setScholarNo(schno); //setting the username and password through the loginBean object then only you can get it in future.
         lb.setPassword(password);
             
             voterdao ld = new voterdao();
              RequestDispatcher rdd =null;
             if(ld.checkuser(lb))
             {
                 voterbean voter = ld.getByScholarNo(lb.getScholarNo());
                  
                 
                   HttpSession session=request.getSession();
                   session.setAttribute("voter", voter);
                                 
                   System.out.println("voter scholar no :"+ voter.getScholarNo());
                   
                   //cookies
                   
                  /*  String rem = request.getParameter("remember");
                    if(rem!=null && rem.equals("remember")){
                         Cookie c1 = new Cookie("user_email", email);
                         Cookie c2 = new Cookie("user_pwd", pwd);
                         c1.setMaxAge(60*60); //for one hour
                         c2.setMaxAge(60*60); //for one hour
                         response.addCookie(c1);
                         response.addCookie(c2);
                    }
                  */
                    rdd = request.getRequestDispatcher("voterhome.jsp");
                  
                   rdd.forward(request, response);
                   
                   
             }
             else{
                    out.println("<h2><font color='white'>Sorry! Userid or password is incorrect </br> <center> Try again </center> </font></h2>");
                rdd= request.getRequestDispatcher("userlogin.jsp");
                rdd.include(request, response);
                }
         }
              else if (op.equals("vote")){
        
           
            int Cid = Integer.parseInt(request.getParameter("id"));
            int Vschno = Integer.parseInt(request.getParameter("ScholarNo")); 
            
            
            
           voting vb = new voting();
            vb.setVschno(Vschno);
            vb.setCid(Cid);
            HttpSession session=request.getSession();
                   session.setAttribute("vb", vb);
            votingdao vd = new votingdao();
           if(vd.vote(vb))
               
                response.sendRedirect("userlogin.jsp");
            }
        
              
              
       else if(op!= null && op.equals("checkScholarNo"))
        {
             int schno = Integer.parseInt(request.getParameter("ScholarNo"));
           
        try{
        Connection con = dbconnection.getConnection();
        if(con!=null)
            
        {
            
            String sql =" select * from voter where ScholarNo=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, schno);
            
            ResultSet rs = smt.executeQuery();
            if(rs.next())
            {
                out.println("<font color='black'><b>sorry! this user has already been registered</b></font>");   
            }
            else 
            {
                     out.println("<font color='black'><b>this user has not been registered</b></font>");   
           
            }
            
            con.close();
        }
        else System.out.println("con is null");
        }catch(Exception e)
        {
            System.out.println("checkscholarno error :" + e.getMessage());
        }
        
             
     
              /*voterbean rb = new  voterbean();
              rb.setScholarNo(schno);
              
             
             voterdao rd = new voterdao(); */
             
            /*if(rd.checkScholarNo(rb))
                          
            else
               out.println("<font color='black'><b>Id Available</b></font>");  
*/              
              
        }
              
        /*int schno = Integer.parseInt(request.getParameter("ScholarNo"));
        String password = request.getParameter("Password");
 
        loginbean lb = new loginbean(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.
 
        lb.setScholarNo(schno); //setting the username and password through the loginBean object then only you can get it in future.
         lb.setPassword(password);
 
        logindao ld = new logindao(); //creating object for LoginDao. This class contains main logic of the application.
 
        String userValidate = ld.authenticateUser(lb); //Calling authenticateUser function
 
        if(userValidate.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
         {
            voterbean voter = new voterbean();
                    voter.setName(lb.getString("Name"));
                    voter.setScholarNo(ld.getString("ScholarNo"));
                    voter.setUserid(rs.getString("userid"));
                   voter.setPassword(rs.getString("password"));
                    voter.setGender(rs.getString("gender"));
                    voter.setHobbies(rs.getString("hobbies"));
                    voter.setImage(rs.getString("image"));
                   
                    HttpSession session=request.getSession();
                    session.setAttribute("user", user);
                    rd = request.getRequestDispatcher("Dashboard.jsp");
             request.setAttribute("ScholarNo", schno); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
             request.getRequestDispatcher("/voterhome.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
         }
         else
         {
             request.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
             request.getRequestDispatcher("/login.jsp").forward(request, response);//forwarding the request
         }
             */
    
         /*
       else if (op.equals("login"))
        {
            String userid=request.getParameter("ScholarNo");
            String password=request.getParameter("Password");
            try{
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javatraining","root","");
              String sql= "select * from users where  userid=? and password=?";
              PreparedStatement smt = con.prepareStatement(sql);
              smt.setString(1, userid);
             smt.setString(2, password);
                ResultSet rs = smt.executeQuery();
              // con.close(); 
              
               try{
           Class.forName("com.mysql.jdbc.Driver") ;
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javatraining","root","");
           String sql = "select * from users where userid=? and password=?";
           PreparedStatement smt = con.prepareStatement(sql);
           smt.setString(1, username);
           smt.setString(2, password);
           ResultSet rs = smt.executeQuery();
           if(rs.next()){
               response.sendRedirect("welcome.jsp?name="+rs.getString("name"));
           }
           else{
               out.println("<h2><font color='red'>Invalid id or password</font></h2>");
           }
        }catch(Exception e){
            System.out.println("Error " +e.getMessage());
        } 
              // smt.close();
                RequestDispatcher rd =null;
                if (rs.next()){
                    rd = request.getRequestDispatcher("dashboard.jsp?name="+ rs.getString("name"));
                    rd.forward(request, response);
                }
                else{
                    out.println("<h2><font color='red'>Sorry! Userid or password is incorrect </font></h2>");
                rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
                }
            }catch(Exception e){
                System.out.println("Error "+e.getMessage());
            }
*/
        }
    }

  

