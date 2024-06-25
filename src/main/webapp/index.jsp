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
                <p>Welcome to technical blog...</p>
                <p>A website that provides high-quality, engaging, and helpful content about technology to attract readers. Tech blogs can cover a wide range of topics, such as software development, hardware reviews, cybersecurity, artificial intelligence, programming languages, and industry trends. They can also include reviews, tutorials, and news about the latest IT trends, software, and gadgets.</p>
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
                        <p class="card-text">Java is a high-level, class-based, object-oriented programming language. It is a general-purpose programming language intended to let programmers write once, run anywhere.</p>
                        <button onclick="message()" class="btn primary-background text-white">Read more...</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Python Programming</h5>
                        <p class="card-text">Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically typed and garbage-collected</p>
                        <button onclick="message()" class="btn primary-background text-white">Read more...</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Spring Boot</h5>
                        <p class="card-text">Spring Boot is an open-source Java framework used for programming standalone, production-grade Spring-based applications with minimal effort.</p>
                        <button onclick="message()" class="btn primary-background text-white">Read more...</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <%--            One row contains 12 grids...So here we give 4 grids to 3 columns....--%>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">React</h5>
                        <p class="card-text">React (also known as React.js or ReactJS) is a free and open-source front-end JavaScript library for building user interfaces based on components. It is maintained by Meta (formerly Facebook) and a community of individual developers and companies.</p>
                        <button onclick="message()" class="btn primary-background text-white">Read more...</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">MySql</h5>
                        <p class="card-text">MySQL is an open-source relational database management system (RDBMS).SQL is a language that programmers use to create, modify and extract data from the relational database, as well as control user access to the database.</p>
                        <button onclick="message()" class="btn primary-background text-white">Read more...</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Hibernate</h5>
                        <p class="card-text">Hibernate ORM (or simply Hibernate) is an object–relational mapping[2]: §1.2.2, [12]  tool for the Java programming language. It provides a framework for mapping an object-oriented domain model to a relational database.</p>
                        <button onclick="message()" class="btn primary-background text-white">Read more...</button>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%--<script>--%>
<%--    $(document).ready(function (){--%>
<%--        alert("Document Loaded")--%>
<%--    })--%>
<%--</script>--%>
<script>
    function message(){
        swal({
            title: "Please Login First !",
            icon: "warning",
            button: "OK",
        });
    }
</script>
</body>
</html>

