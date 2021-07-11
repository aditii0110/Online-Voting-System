package com.datadao;
import com.databeans.voting;
import database.dbconnection;
import java.sql.*;
import java.util.ArrayList;
public class votingdao {
    
    
    public voting getBySch(int ScholarNo)
    {
        voting v=new voting();
         v = null;
        try{
            
                    System.out.println("in try block");
              Connection con = dbconnection.getConnection();
            if(con!=null){
                
                String sql="select * from manivoting where ScholarNo = ?";
                 PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, ScholarNo);
               
                ResultSet rs = smt.executeQuery();
                if(rs.next())
                {
                     v= new voting();
                    v.setVschno(rs.getInt("ScholarNo"));
                    v.setCid(rs.getInt("id"));
                    v.setPost(rs.getString("post"));
                   
                } else System.out.println("no record for given scholar");
                con.close();
               
            }
          
            
        }
        catch(Exception e)
        {
            System.out.println("getby schole error : " + e.getMessage());
        }
        System.out.println("status in getby scholar is: " + v);
        return v;
        
    }
   
     public boolean getByCR(int ScholarNo)
    {
        boolean status=false;
        try{
            
                    System.out.println("in try block");
              Connection con = dbconnection.getConnection();
            if(con!=null){
                
                String sql="select * from manivoting where ScholarNo = ? and post='CR'";
                 PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, ScholarNo);
               
               
                ResultSet rs = smt.executeQuery();
                if(rs.next())
                {
                    status=true;
                } else System.out.println("no record for given scholar");
                con.close();
               
            }
          
            
        }
        catch(Exception e)
        {
            System.out.println("getby schole error : " + e.getMessage());
        }
        System.out.println("status in getby cr is: " + status);
        return status;
        
    }
   public boolean getByTPR(int ScholarNo)
    {
        boolean status=false;
        try{
            
                    System.out.println("in try block");
              Connection con = dbconnection.getConnection();
            if(con!=null){
                
                String sql="select * from manivoting where ScholarNo = ? and post='TPR'";
                 PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, ScholarNo);
               
               
                ResultSet rs = smt.executeQuery();
                if(rs.next())
                {
                    status=true;
                } else System.out.println("no record for given scholar");
                con.close();
               
            }
          
            
        }
        catch(Exception e)
        {
            System.out.println("getby schole error : " + e.getMessage());
        }
        System.out.println("status in getby cr is: " + status);
        return status;
        
    }
   public boolean getByEX(int ScholarNo)
    {
        boolean status=false;
        try{
            
                    System.out.println("in try block");
              Connection con = dbconnection.getConnection();
            if(con!=null){
                
                String sql="select * from manivoting where ScholarNo = ? and post='EX'";
                 PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, ScholarNo);
               
               
                ResultSet rs = smt.executeQuery();
                if(rs.next())
                {
                    status=true;
                } else System.out.println("no record for given scholar");
                con.close();
               
            }
          
            
        }
        catch(Exception e)
        {
            System.out.println("getby schole error : " + e.getMessage());
        }
        System.out.println("status in getby cr is: " + status);
        return status;
        
    }
    
    
    public boolean vote(voting v){
        boolean status=false;
        try{
            Connection con = dbconnection.getConnection();
            if(con!=null){
                String sql = "insert into manivoting (ScholarNo,id,post) values(?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, v.getVschno());
                smt.setInt(2, v.getCid());
                smt.setString(3,v.getPost());
                
                int n= smt.executeUpdate();
                if (n!=0)
                    status=true;
                con.close();
            }
            
        }catch(Exception e){ 
            System.out.println("Insertion error : "+ e.getMessage());
        }
        
        return status;  
    }
   
   
}