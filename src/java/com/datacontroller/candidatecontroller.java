package com.datacontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import org.apache.commons.lang.*;
import java.util.Base64;

public class candidatecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        if (op != null && op.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi", "root", "");
                String sql = "delete from users where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                int n = smt.executeUpdate();
                con.close();
                if (n > 0) {
                    response.sendRedirect("candidateregister.jsp");
                }
            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        if (op.equals("add") && op != null) {
            String uploadDirectory = "uploads";
            String Name = "", ScholarNo = "", MobileNo = "", Cgpa = "", Post = "", Skills = "", imgPath = "";

            if (ServletFileUpload.isMultipartContent(request)) {

                // configures upload settings
                DiskFileItemFactory factory = new DiskFileItemFactory();

                ServletFileUpload upload = new ServletFileUpload(factory);

                // constructs the directory path to store upload file
                String uploadPath = getServletContext().getRealPath("") + File.separator + uploadDirectory;
                // creates the directory if it does not exist
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                try {
                    // parses the request's content to extract file data
                    List formItems = upload.parseRequest(request);
                    Iterator iter = formItems.iterator();

                    // iterates over form's fields
                    while (iter.hasNext()) {
                        FileItem item = (FileItem) iter.next();
                        // processes only fields that are not form fields
                        if (!item.isFormField()) {
                            String fileName = new File(item.getName()).getName();
                            String filePath = uploadPath + File.separator + fileName;
                            File storeFile = new File(filePath);

                            // saves the file on disk
                            item.write(storeFile);
                            imgPath = uploadDirectory + "/" + fileName;
                        } else {
                            String fieldName = item.getFieldName();
                            if (fieldName.equals("Name")) {
                                Name = item.getString();
                            } else if (fieldName.equals("ScholarNo")) {
                                ScholarNo = item.getString();
                            } else if (fieldName.equals("MobileNo")) {
                                MobileNo = item.getString();
                            } else if (fieldName.equals("Cgpa")) {
                                Cgpa = item.getString();
                            } else if (fieldName.equals("Post")) {
                                Post = item.getString();
                            } else if (fieldName.equals("Skills")) {
                                Skills += item.getString() + ",";
                            }

                        }
                    }
                    //jdbc :
                    Class.forName("com.mysql.jdbc.Driver");
                    int n;
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kucchbhi", "root", "")) {
                        String sql = "insert into users(Name,ScholarNo,MobileNo,Cgpa,Post,Skills,image)values(?,?,?,?,?,?,?)";
                        PreparedStatement smt = con.prepareStatement(sql);
                        smt.setString(1, Name);
                        smt.setInt(2, Integer.parseInt(ScholarNo));
                        smt.setString(3, MobileNo);
                        smt.setString(4, Cgpa);
                        smt.setString(5, Post);
                        smt.setString(6, Skills);
                        smt.setString(7, imgPath);
                        n = smt.executeUpdate();
                    }
                    if (n > 0) {
                        response.sendRedirect("showcandidate.jsp");
                    } else {
                        out.println("<font color='red'><b> Data cannot be inserted</b></font>");
                    }

                } catch (Exception ex) {
                    out.println(ex);
                }

            }
        }
    }
}