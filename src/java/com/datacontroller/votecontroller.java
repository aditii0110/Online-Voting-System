/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datacontroller;

import com.databeans.voting;
import com.datadao.votingdao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 1234
 */
public class votecontroller extends HttpServlet {

    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          int Cid = Integer.parseInt(request.getParameter("Cid"));
            int Vschno = Integer.parseInt(request.getParameter("Vschno")); 
            String post=request.getParameter("post");
                    
                     System.out.println("Reached");
            
            
            
           voting vb = new voting();
            vb.setVschno(Vschno);
            vb.setCid(Cid);
            vb.setPost(post);
            votingdao vd = new votingdao();
           if(vd.vote(vb))
                response.sendRedirect("voterhome.jsp");
       
    }

    

}
