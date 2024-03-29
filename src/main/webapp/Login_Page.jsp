<%@ page import="com.techBlogEntites.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/myStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login Page</title>
</head>
<body>
<%--Navbar--%>
<%@include file="NAVBAR.jsp"%>
<main class="d-flex align-items-center primary-background " style="height:80vh">
    <div class="container">
        <div class="row">
<%--            offset-md-4 se humne column ko 4 grid shift kr diya h...--%>
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <span class="fa fa-user-circle"> LOGIN</span>
                    </div>

                    <%
                        Message m = (Message) session.getAttribute("msg");
                        if(m != null){
                            %>

                    <div class="alert <%= m.getCssClass()%>" role="alert">
                        <%= m.getContent()%>
                    </div>

                    <%
                            session.removeAttribute("msg");
                        }
                    %>

                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <br>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
                    </div>

                    <div class="card-footer">

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

</body>
</html>
