<%-- 
    Document   : userlogin
    Created on : 1 Apr, 2021, 1:17:53 AM
    Author     : 1234
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/logincss.css">
        <script type="text/javascript" src="assets/js/userjs.js"></script>
         <script type="text/javascript" src="assets/js/jquery.js"></script>
         <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            
            function validateForm(){
            
                pass=document.getElementById("pass").value;
                cpass =document.getElementById("cpass").value;
             
               
              
              
               if(pass!=cpass)
                {
                    document.getElementById("s1").innerHTML="Password and confirm password doesn't matched";
                    return false;
                }
                              
            }
            
           
            
            
           
 
           </script>
        <title>JSP Page</title>
    </head>
    <body>
       <div class="container" id="container">
      <div class="form-container sign-up-container">
        <form>
         
          <input type="text" placeholder="Name" />
          <input type="email" placeholder="Email" />
          <input type="password" placeholder="Password" />
          <button onclick="return false;">Sign Up</button>
        </form>
      </div>
      <div class="form-container sign-in-container">
        <form action="Controller?op=login" method="post" class="form">
            <input type="hidden" name="req" value="login"/>
          <h1>Sign In</h1>
          
          
          <input type="text" placeholder="ScholarNo"  name="ScholarNo"/>
          
          <input type="password" placeholder="Password" name="Password" />
          <a href="#">Forgot your password?</a>
          <button type="submit"  value="Submit">Sign In</button>
          
          <%-- <button onclick="return false;">Sign In</button 
<input type="submit" class="ghost" value="Submit "> --%>
        </form>
      </div>
      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1>Welcome Back!</h1>
            <p>Please login with your personal info</p>
            <button class="ghost" id="signIn">Sign In</button>
          </div>
          <div class="overlay-panel overlay-right">
            <h1>Not registered yet?</h1>
            <h2> register here</h2>
            
          <form action="Controller?op=add" method="post" class="form" onsubmit="return validateForm()">
            <input type="hidden" name="req" value="add"/>
         
          <input type="text" placeholder="Name" name="Name" required="required"/>
          <input type="text" placeholder="Mobile no." id="PhoneNo" name="PhoneNo" required="required"/>
          <input type="number" placeholder="Scholar no." name="ScholarNo" id="ScholarNo" required="required" />
          <span id="s4" style="color:black "  ></span>
          
          <input type="password" placeholder="Password" id="pass" name="Password" required="required" onfocus="s1.innerHTML='';" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>
          <input type="password" placeholder="Confirm Password" name="cpass" id="cpass" required="required" onfocus="s1.innerHTML='';" />
          <span id="s1" style="color:black "  ></span>
         <button type="submit"  value="Submit">Sign Up</button>
          
        </form>.
          
          </div>
        </div>
      </div>
    </div>
       <script type="text/javascript">
           
           
         
        $("#ScholarNo").blur(function(){
           
            xml = new XMLHttpRequest();
            xml.open("GET", "Controller?op=checkid&ScholarNo="+$(this).val()+"&PhoneNo="+$("#PhoneNo").val(),true);
            xml.send();
            
            xml.onreadystatechange = function(){
                if(this.readyState==4 && this.status==200){
                    result = this.responseText;
                    
                    
       
                    $("#s4").html(result);
                }
            };
        });
        
        
        </script>

    </body>
</html>
