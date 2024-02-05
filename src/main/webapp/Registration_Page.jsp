<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 29-12-2023
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/myStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%@include file="NAVBAR.jsp"%>
<main class="primary-background">
    <div class="container" style="height: 100vh">
        <div class="row">
            <%--            offset-md-4 se humne column ko 4 grid shift kr diya h...--%>
            <div class="col-md-6 offset-md-3">
                <div class="card" style="margin-top: 20px;">
                    <div class="card-header primary-background text-white">
                        <span class="fa fa-user-plus"> REGISTER</span>
                    </div>

                    <div class="card-body">
                        <form action="RegisterServlet" id="reg-form" method="post">
                            <div class="form-group">
                                <label for="user_name">User Name</label>
                                <input style="height: 35px" name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input style="height: 35px" name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input style="height: 35px" name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="gender">Select Gender</label>
                                <br>
                                <input type="radio" id="gender" name="gender" value="Male">Male
                                <input type="radio" id="gender1" name="gender" value="Female">Female
                            </div>

                            <div class="form-group">
                                <textarea name="about" id="" class="form-control" rows="4" placeholder="Enter something about yourself."></textarea>
                            </div>
                            <div class="form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                            </div>
                            <br>

                            <div class="container text-center" id="loader" style="display: none">
                            <span class="fa fa-refresh fa-spin fa-3x"></span>
                                <h4>Please Wait...</h4>
                            </div>

                            <button id="submit-btn" type="submit" class="btn btn-primary">Register</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<%--BOOT STRAP--%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="JS/myJS.js" type="text/javascript"></script>
<%--SWEET ALERT cdn--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<%--Implementing AJAX--%>
<script>
    $(document).ready(function(){
        console.log("Loaded...")

        $('#reg-form').on('submit',function(event){
            event.preventDefault();

            let form = new FormData(this);

            $("#submit-btn").hide();
            $("#loader").show();

            // Send register servlet...

            $.ajax({
                url:"RegisterServlet",
                type: 'POST',
                data: form,
                success: function(data,textStatus,jqXHR){
                    console.log(data)
                    $("#loader").hide();
                    $("#submit-btn").show();

                    if(data.trim() === 'Done'){
                        swal("Registered Successfully...Redirecting to login page...")
                            .then((value) => {
                                window.location = "Login_Page.jsp"
                            });
                    }
                    else{
                        swal(data);
                    }
                },
                error: function (jqXHR,textStatus,errorThrown){
                    $("#loader").hide();
                    $("#submit-btn").show();
                    swal("Something went wrong...");
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>
</body>
</html>
