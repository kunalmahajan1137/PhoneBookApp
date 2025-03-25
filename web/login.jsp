<%-- 
    Document   : register
    Created on : 20 Mar, 2025, 6:35:31 PM
    Author     : ktmah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp" %>
    </head>
    <body style="background-color: #dfede3;" >
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="tect-center text-success"> Login Page</h4>
                            <%
                            String invalidMsg = (String) session.getAttribute("invalidMsg");
                            if (invalidMsg != null) { 
                            %>
                                <p class="text-center text-danger"><%= invalidMsg %></p>
                            <%
                                session.removeAttribute("invalidMsg");  // Optional: Remove after displaying
                            } 
                            %>
                             <%
                            String logMsg = (String) session.getAttribute("logMsg");
                            if (logMsg != null) { 
                            %>
                                <p class="text-center text-success"><%= logMsg %></p>
                            <%
                                session.removeAttribute("logMsg");  // Optional: Remove after displaying
                            } 
                            %>

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" >
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="password" >
                                </div>
                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 135px;">
            <%@include file="component/footer.jsp" %>
        </div>
    </body>
</html>
