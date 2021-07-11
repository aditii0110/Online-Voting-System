<%-- 
    Document   : index
    Created on : 08-Apr-2021, 16:49:34
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="fusioncharts.*"%>
<%@page import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
 
<html lang="en">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/fusioncharts.js"></script>


<script type="text/javascript" src=_"\${pageContext.request.contextPath}/js/themes/fusioncharts.theme.fusion.js"_></script>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>Voting Stats</title>
<!--

TemplateMo 548 Training Studio

https://templatemo.com/tm-548-training-studio

-->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    

    </head>
    
    <body style="background-color:#1a242f">
    
    <!-- ***** Preloader Start ***** -->
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
      <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->

    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** Features Item Start ***** -->
    <section class="section" id="features">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading">
                       
                        <h1  > <font color="white">Voting Statistics CR</font></h1>
                        
         <a valign="left" href="voterhome.jsp" class="btn btn-light">HOME</a>
          <a valign="left" href="StatisticsTPR.jsp" class="btn btn-light">TPR</a>
           <a valign="left" href="StatisticsEX.jsp" class="btn btn-light">EXECUTIVE</a>
   
                        <br/>
                                              


                       
                        
                    </div>
                    
                </div>
                <div class="col-lg-6">
                    <h2><i ><font color="white">CLASS REPRESENTATIVE</font></i></h2>
                 <div id =  "chart" > </div>
                  
<%
    Map<String, String> chartConfig = new HashMap<String, String>();
    chartConfig.put("caption", "Votes Obtained");
    chartConfig.put("subCaption", "for the post CR ");
    chartConfig.put("xAxisName", "Candidates(ID)");
    chartConfig.put("yAxisName", "Number of Votes");
    chartConfig.put("numberSuffix", "v");
    chartConfig.put("theme", "fusion");
    StringBuilder jsonData = new StringBuilder();
    // json data to use as chart     data source
    jsonData.append("{'chart':{");
    for(Map.Entry conf:chartConfig.entrySet())
    {
        jsonData.append("'" + conf.getKey()+"':'"+conf.getValue() + "',");
    }
    jsonData.replace(jsonData.length() - 1, jsonData.length() ,"},");
%>
  
<%
    Map<String, Integer> dataValuePair = new HashMap<String, Integer>();
     
                try {
                    int votecr;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = dbconnection.getConnection();
                                String sql = "SELECT ID,COUNT(ID),post FROM manivoting GROUP BY ID having post='CR'";
                                PreparedStatement smt = con.prepareStatement(sql);
                                
                                ResultSet rs = smt.executeQuery();
                                
                                
                                int i = 1;
                                while (rs.next()) {
    dataValuePair.put(rs.getString(1), rs.getInt(2));
     }
    StringBuilder data = new StringBuilder();
    // build data object from label-value pair
    data.append("'data':[");
    for(Map.Entry pair:dataValuePair.entrySet())
    {
        data.append("{'label':'" + pair.getKey() + "','value':'" + pair.getValue() +"'},");
    }
    data.replace(data.length() - 1, data.length(),"]");
    jsonData.append(data.toString());
    jsonData.append("}");
    
FusionCharts firstChart = new FusionCharts(
                "column2d",
                "first_chart",
                "700",
                "400",
                "chart",
                "json",
                jsonData.toString()
            );
             
            
%>   
 <%=firstChart.render() %>               
             
                   <%  con.close();
                            } catch (Exception e) {
                                System.out.println("Error " + e.getMessage());
                            }
                       %>
                </div>
                <div  class="col-md-2">
                    
             
                </div>
                <div  class="col-md-4">
                    
                    <h3><font color="white">Post : CR</font></h3>
                    
             
                </div>
                
                
            </div>
        </div>
    </section>
    
    <!-- ***** Contact Us Area Ends ***** -->
    
    <!-- ***** Footer Start ***** -->
  
    
    

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/mixitup.js"></script> 
    <script src="assets/js/accordions.js"></script>
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

  </body>
</html>