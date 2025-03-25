<%-- 
    Document   : viewContact
    Created on : 20 Mar, 2025, 6:35:59 PM
    Author     : ktmah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.ContactDAO" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Contact" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp" %>
        <style>
            .crd-ho:hover{
                background-color: #f7f7f7;
            }
        </style>
    </head>
    <body style="background-color: #dfede3;">
        <%@include file="component/navbar.jsp" %>
        <% if(user == null){
          session.setAttribute("invalidMsg", "Login Please...");
          response.sendRedirect("login.jsp");
        }%>
        
        <%
            String successMsg = (String)session.getAttribute("successMsg");
            String failedMsg = (String)session.getAttribute("failedMsg");
            if( successMsg != null){%>
            <div class="alert alert-success text-center" role="alert">
                <%= successMsg %>
            </div>
            <%
                session.removeAttribute("successMsg");
            }
            if (failedMsg != null) {%>
                <p class="text-danger text-center"><%= failedMsg %></p>
            <%
                    session.removeAttribute("failedMsg");
                }
            
        %>
       
       
        <div class="container">
            <div class="row p-4">

                <%
                    if(user != null){
                        ContactDAO dao = new ContactDAO(DbConnect.getConn());
                        List<Contact> contact = dao.getAllContact(user.getId());

                        for(Contact c:contact){%>
                <div class="col-md-4 p-2">
                    <div class="card crd-ho">
                        <div class="card-body">
                            <h5>Name: <%= c.getName()%></h5>
                            <p>Email: <%= c.getEmail()%></p>
                            <p>Phone No:<%= c.getPhoneno()%></p>
                            <div class="text-center">
                                <a href="editContact.jsp?cid=<%= c.getId() %>" class="btn btn-success btn-sm text-white">Edit</a>
                                <a href="DeleteContactServlet?cid=<%=c.getId()%>" class="btn btn-danger btn-sm text-white">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                }
                %>
            </div>
        </div>
        <div>
            <%@include file="component/footer.jsp" %>
        </div>        
    </body>
</html>
