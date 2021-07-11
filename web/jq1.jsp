<%-- 
    Document   : jq1
    Created on : 23-Mar-2021, 15:48:34
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="assets/js/jquery.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <h2>Jquery Example </h2>
        
        <input type="button" id="b1" value="Button 1" class="btn btn-success"/>
        <input type="button" id="b2" value="Button 2" class="btn btn-primary"/>
        <br/>
        <p id="p1" style="width:400px;height: 200px;border-style: solid;border-width: 2px">
            
        </p>
        
        <script type="text/javascript">
     $("#b1").click(function(){
                alert('hello all');
            });
     
           
        </script>
    </body>
</html>
