/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datadao;
import com.databeans.loginbean;
import database.dbconnection;
import java.sql.*;
import java.util.ArrayList;

    public class logindao {
     public String authenticateUser(loginbean loginbean)
     {
         Integer schno = loginbean.getScholarNo(); //Assign user entered values to temporary variables.
         String password = loginbean.getPassword();
         try
         {
             Connection con = dbconnection.getConnection();
             String sql = "select ScholarNo,Password from voter";
                PreparedStatement smt = con.prepareStatement(sql);
                ResultSet rs = smt.executeQuery();
                //Fetch database connection object
              //Statement is used to write queries. Read more about it.
              //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
 
             while(rs.next()) // Until next row is present otherwise it return false
             {
              Integer schnoDB = Integer.parseInt(rs.getString("ScholarNo")); //fetch the values present in database
             String passwordDB = rs.getString("Password");
 
               if(schno.equals(schnoDB) && password.equals(passwordDB))
               {
                  return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
             }
         }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
             return "Invalid user credentials"; // Return appropriate message in case of failure
         }
     
     
     }


