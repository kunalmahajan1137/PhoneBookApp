<%-- 
    Document   : register
    Created on : 20 Mar, 2025, 6:35:31 PM
    Author     : ktmah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>

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
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success"> Registration Page</h4>
                            <%
                            String successMsg = (String) session.getAttribute("successMsg");
                            String errorMsg = (String) session.getAttribute("errorMsg");
                            %>
                            <% if (successMsg != null) { %>
                            <p class="text-success text-center"><%= successMsg %></p>
                            <% session.removeAttribute("successMsg");
                                } %>
                            <% if (errorMsg != null) { %>
                            <p class="text-danger text-center"><%= errorMsg %></p>
                            <%  session.removeAttribute("errorMsg");
                                } %>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputName1">Enter Name</label>
                                    <input type="text" class="form-control" id="exampleInputName" name="name" aria-describedby="NamelHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" >
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                </div>
                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 50px;">
            <%@include file="component/footer.jsp" %>
        </div>
    </body>
</html>
