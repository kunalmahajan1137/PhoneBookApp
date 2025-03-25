<%-- 
    Document   : index
    Created on : 20 Mar, 2025, 6:34:20 PM
    Author     : ktmah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp" %>
        <style type="text/css">
            .back-img{
                background: url("img/phoneHands.jpg");
                width: 100%;
                height: 81vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid back-img text-center text-danger">
            <h1>Welcome to PhoneBook App</h1>
        </div>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
