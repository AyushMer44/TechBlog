<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 29-12-2023
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="true" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/myStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Sorry! Something went wrong...</title>
</head>
<body>
    <div class="container text-center">
        <img src="IMAGES/Error.png" class="img-fluid">
        <h3 class="display-3">Sorry! Something went wrong...</h3>
        <%= exception %>
        <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
    </div>
</body>
</html>
