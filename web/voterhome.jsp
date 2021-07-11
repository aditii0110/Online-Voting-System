<%-- 
    Document   : voterhome
    Created on : Apr 3, 2021, 9:50:04 AM
    Author     : Aditi
--%>
<%@page import="com.datadao.votingdao"%>
<%@page import="com.databeans.voting"%>
<%@page import="com.databeans.voterbean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css');
@media(min-width:768px) {
    body {
        margin-top: 50px;
    }
    /*html, body, #wrapper, #page-wrapper {height: 100%; overflow: hidden;}*/
}

#wrapper {
    padding-left: 0;    
}

#page-wrapper {
    width: 100%;        
    padding: 0;
    background-color: #fff;
}

@media(min-width:768px) {
    #wrapper {
        padding-left: 225px;
    }

    #page-wrapper {
        padding: 22px 10px;
    }
}

/* Top Navigation */

.top-nav {
    padding: 0 15px;
}

.top-nav>li {
    display: inline-block;
    float: left;
}

.top-nav>li>a {
    padding-top: 20px;
    padding-bottom: 20px;
    line-height: 20px;
    color: #fff;
}

.top-nav>li>a:hover,
.top-nav>li>a:focus,
.top-nav>.open>a,
.top-nav>.open>a:hover,
.top-nav>.open>a:focus {
    color: #fff;
    background-color: #1a242f;
}

.top-nav>.open>.dropdown-menu {
    float: left;
    position: absolute;
    margin-top: 0;
    /*border: 1px solid rgba(0,0,0,.15);*/
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-color: #fff;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.top-nav>.open>.dropdown-menu>li>a {
    white-space: normal;
}

/* Side Navigation */

@media(min-width:768px) {
    .side-nav {
        position: fixed;
        top: 60px;
        left: 225px;
        width: 225px;
        margin-left: -225px;
        border: none;
        border-radius: 0;
        border-top: 1px rgba(0,0,0,.5) solid;
        overflow-y: auto;
        background-color: #222;
        /*background-color: #5A6B7D;*/
        bottom: 0;
        overflow-x: hidden;
        padding-bottom: 40px;
    }

    .side-nav>li>a {
        width: 225px;
        border-bottom: 1px rgba(0,0,0,.3) solid;
    }

    .side-nav li a:hover,
    .side-nav li a:focus {
        outline: none;
        background-color: #1a242f !important;
    }
}

.side-nav>li>ul {
    padding: 0;
    border-bottom: 1px rgba(0,0,0,.3) solid;
}

.side-nav>li>ul>li>a {
    display: block;
    padding: 10px 15px 10px 38px;
    text-decoration: none;
    /*color: #999;*/
    color: #fff;    
}

.side-nav>li>ul>li>a:hover {
    color: #fff;
}

.navbar .nav > li > a > .label {
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  position: absolute;
  top: 14px;
  right: 6px;
  font-size: 10px;
  font-weight: normal;
  min-width: 15px;
  min-height: 15px;
  line-height: 1.0em;
  text-align: center;
  padding: 2px;
}

.navbar .nav > li > a:hover > .label {
  top: 10px;
}

.navbar-brand {
    padding: 5px 15px;
}
</style>  
    </head>
    <%
        String op=request.getParameter("op");
        if(op!=null && op.equals("logout")){
            //session.setAttribute("user", null); 
            session.removeAttribute("voter");
        }%>
    <body>
        <%
         voterbean voter = (voterbean)session.getAttribute("voter");
           if(voter==null){
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
           rd.forward(request,response);
           
           }
           
  voting vt = new voting();
  votingdao vd = new votingdao();
  
       vt = vd.getBySch(voter.getScholarNo());
  
System.out.println("in home page voter schlr is : " + voter.getScholarNo());
/*System.out.println("in home page vt scholar no is : " + vt.getVschno());

System.out.println("vt in home:" + vt);*/

                  boolean cr = vd.getByCR(voter.getScholarNo());
                  boolean tpr = vd.getByTPR(voter.getScholarNo());
                  boolean ex = vd.getByEX(voter.getScholarNo());
        %>
        <div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>
<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                <br>VOTESTAR
            </a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li><a href="#" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Stats"><i class="fa fa-bar-chart-o"></i>
                </a>
            </li>            
            <li class="dropdown">
                
                <li><a  href="voterhome.jsp?op=logout" >logout</a></li>
              <%--  <a class="dropdown-toggle" data-toggle="dropdown" href="#">LOGOUT --%>
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">CR</a></li>
            <li><a href="#">TPR</a></li>
            <li><a href="#">EXECUTIVE</a></li> 
            
        </ul>
                </li>
        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
         <% if(cr==false){ %>       <li>
                    <a href="votecr.jsp"><i class="fa fa-fw fa-star"></i>VOTE FOR CR </a>
                </li> 
                <% } %>
                
             <% if(tpr==false){ %>   <li>
                    <a href="votertpr.jsp"><i class="fa fa-fw fa-star"></i>VOTE FOR TPR </a>
                </li>
                 <% } %>
               <% if(ex==false){ %> <li>
                    <a href="voterex.jsp"><i class="fa fa-fw fa-star"></i>VOTE FOR EXECUTIVE </a>
                </li>
                 <% } %>
                  
                 
                <li>
                    <a href="Statistics.jsp" data-toggle="collapse" data-target="#submenu-2"><i class="fa fa-fw fa-star"></i> STATISTICS <i></i></a>
                    <ul id="submenu-2" class="collapse">
                        <li><a href="#"><i class="fa fa-angle-double-right"></i> CR 2.1</a></li>
                        <li><a href="#"><i class="fa fa-angle-double-right"></i> Executive 2.2</a></li>
                        <li><a href="#"><i class="fa fa-angle-double-right"></i> TPR 2.3</a></li>
                    </ul>
                </li>
                
                <li>
                    <li>
                    <a href="faq.jsp"><i class="fa fa-fw fa fa-question-circle"></i>FAQ </a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
    <div style="padding-left:220px; padding-top: 50px">
         <img src="img/electronic-voting-abstract-concept-illustration_335657-1876.jpg" width="700px" height="400px" style="filter:grayscale(95%)" >
       
    </div>

    <div id="page-wrapper" style="margin-top:0px;" >
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row" id="main" >
                <div class="col-sm-12 col-md-12 well" id="content" style="padding-left: 330px">
                    <h1> Welcome <%= voter.getName() %> ! </h1>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
</div><!-- /#wrapper -->

<script>
$(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $(".side-nav .collapse").on("hide.bs.collapse", function() {                   
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-right").addClass("fa-angle-down");
    });
    $('.side-nav .collapse').on("show.bs.collapse", function() {                        
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");        
    });
})    
 </script>   
    </body>
    
</html>
