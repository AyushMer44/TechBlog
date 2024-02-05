<%@page import="java.sql.*" %>
<%@ page import="com.techBlogHelper.ConnectionProvider" %>

<html>
<head>

<%-- BOOTSTRAP CSS--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/myStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%--    Here,we are using clip art...--%>
    <style>
        .banner-background{
            clip-path: polygon(50% 2%, 100% 0, 99% 43%, 100% 100%, 71% 92%, 30% 92%, 0 100%, 2% 43%, 0 0);
        }
    </style>
</head>
<body>
<%--navbar--%>
    <%@include file="NAVBAR.jsp"%>

<%--banner--%>
     <div class="container-fluid p-0 m-0">

        <div class="jumbotron primary-background text-white banner-background">
            <div class="container">
                <h3 class="display-3">Welcome to Tech Blog...</h3>
                <p>Welcome to technical blog...A programming language is a system of notation for writing computer programs. The source code for a simple computer program written in the C programming language.</p>
                <p>A language usually has at least one implementation in the form of a compiler or interpreter, allowing programs written in the language to be executed.</p>

                <a href="Registration_Page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-coffee"></span> Start here!</a>
                <a href="Login_Page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle"></span> Login!</a>
            </div>

        </div>
    </div>

<%--cards--%>
<%--Container fluid use 100% display while Conainer uses 70% only.It leaves 15% from both sides...
--%>
    <div class="container">
        <div class="row mb-2">
<%--            One row contains 12 grids...So here we give 4 grids to 3 columns....--%>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <%--            One row contains 12 grids...So here we give 4 grids to 3 columns....--%>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--JAVA SCRIPT--%>
<%--JQuery CDN--%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<%--BOOT STRAP--%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="JS/myJS.js" type="text/javascript"></script>
<%--<script>--%>
<%--    $(document).ready(function (){--%>
<%--        alert("Document Loaded")--%>
<%--    })--%>
<%--</script>--%>
</body>
</html>

