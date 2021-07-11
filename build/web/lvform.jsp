<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Live Voting Form</title>
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body style="background-image: url('img/concert.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: 100% 100%;filter: grayscale(100%)">
        <h1 style="text-align: center; font-family: Georgia;font-size: 60px;color: wheat">BE READY FOR LIVE VOTING</h1>
        <div >
        <form action="lv.jsp" style="width: 500px;height: 300px;border-style: solid;border-radius: 20px 20px 20px 20px;margin-left:  400px;margin-top: 100px;background-color: white;">
  <div class="form-group">
      <label  style="padding-left: 10px;padding-top:10px "><strong>SCHOLAR NUMBER</strong></label>
    <input type="text" class="form-control" aria-describedby="emailHelp" placeholder="SCHOLAR NO.">
    
  </div>
  <div class="form-group">
      <label for="exampleInputPassword1"  style="padding-left: 10px;padding-top:10px "><strong>NAME</strong></label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="FULL NAME">
  </div>
  
            <button type="submit" class="btn btn-dark" style="margin-left: 200px" onclick="window.location.href='lv.jsp'">Submit</button>
</form>
        </div>
    
   
</html>