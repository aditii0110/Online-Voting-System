/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;

public class dbconnection {
     public static Connection getConnection(){
        Connection con=null;
        try{
          
            Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi","root","");
        }catch(Exception e){
            System.out.println("Connection Error " + e.getMessage() );  
        } 
        return con;
    }
    
}
