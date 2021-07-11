
package com.datadao;
import com.databeans.voterbean;
import database.dbconnection;
import java.sql.*;
import java.util.ArrayList;
public class voterdao {
    public boolean add(voterbean v){
        boolean status=false;
        try{
            Connection con = dbconnection.getConnection();
            if(con!=null){
                String sql = "insert into voter (Name,ScholarNo,PhoneNo,Password) values(?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, v.getName());
                smt.setInt(2, v.getScholarNo());
                smt.setString(3, v.getPhoneNo());
                smt.setString(4, v.getPassword());
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
    
    public boolean checkuser(voterbean lb)
    {
        boolean status = false;
        try{
        Connection con = dbconnection.getConnection();
        if(con!=null)
        {
            String sql =" select * from voter where ScholarNo=? and Password =?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, lb.getScholarNo());
            smt.setString(2, lb.getPassword());
           
            
            ResultSet rs = smt.executeQuery();
            if(rs.next())
            {
                status=true;
            }
            else{
            }
            
            con.close();
        }
        }catch(Exception e)
        {
            System.out.println("getby schno and pwd error :" + e.getMessage());
        }
        return status;
    }
    
    public boolean checkidVoter(voterbean lb)
    {
        boolean status = false;
        try{
        Connection con = dbconnection.getConnection();
        if(con!=null)
        {
            String sql =" select * from voter where ScholarNo=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, lb.getScholarNo());
            
           
            
            ResultSet rs = smt.executeQuery();
            if(rs.next())
            {
                status=true;
            }
            
            con.close();
        }
        }catch(Exception e)
        {
            System.out.println("checkid error :" + e.getMessage());
        }
        return status;
    }
    
    public boolean checkidStudent(voterbean lb)
    {
        boolean status = false;
        try{
        Connection con = dbconnection.getConnection();
        if(con!=null)
        {
            System.out.println("schno :" +lb.getScholarNo() +" phone  " +  lb.getPhoneNo());
            String sql =" select * from studenttable where SScholarNo=? and SPhoneNo=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, lb.getScholarNo());
            smt.setString(2, lb.getPhoneNo());
            
           
            
            ResultSet rs = smt.executeQuery();
            if(rs.next())
            {
                status=true;
            }
            
            con.close();
        }
        }catch(Exception e)
        {
            System.out.println("checkid error :" + e.getMessage());
        }
        return status;
    }
    
    public voterbean getByScholarNo(int schno)
    {
        voterbean v=null;
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
                     v= new voterbean();
               v.setScholarNo(rs.getInt("ScholarNo"));
                    v.setName(rs.getString("Name"));
                    v.setPhoneNo(rs.getString("PhoneNo"));
                    v.setPassword(rs.getString("Password"));
                   
                    
            }
            con.close();
        }
        }catch(Exception e)
        {
            System.out.println("getby rollno error :" + e.getMessage());
        }
        return v;
    }
    
    public ArrayList<voterbean> getAllRecords(){
      ArrayList<voterbean> voterList = new ArrayList() ;
        try{
            Connection con = dbconnection.getConnection();
            if(con!=null){
                String sql = "select * from voter";
                PreparedStatement smt = con.prepareStatement(sql);
                ResultSet rs = smt.executeQuery();
                while(rs.next()){
                    voterbean vv = new voterbean();
                    vv.setName(rs.getString("Name"));
                    vv.setScholarNo(rs.getInt("ScholarNo"));
                    vv.setPhoneNo(rs.getString("PhoneNo"));
                    voterList.add(vv);
                }
                
                con.close();
            }
            
        }catch(Exception e){
            System.out.println("selection error : "+ e.getMessage());
        }
        
        return voterList;
    } 
    
}
