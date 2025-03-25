<%-- 
    Document   : editcontact
    Created on : 21 Mar, 2025, 8:29:28 PM
    Author     : ktmah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.dao.ContactDAO" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Contact" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp" %>
    </head>
    <body style="background-color: #dfede3;">
        <%@include file="component/navbar.jsp" %>
        <% if(user == null){
         session.setAttribute("invalidMsg", "Login Please...");
         response.sendRedirect("login.jsp");
         }%>
        <div class="container-fluid">
            <div class="row p-2">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success"> Edit Contact Page</h4>
                            <%
                           String successMsg = (String) session.getAttribute("successMsg");
                           String failedMsg = (String) session.getAttribute("failedMsg");
                            %>
                            <% if (successMsg != null) { %>
                            <p class="text-success text-center"><%= successMsg %></p>
                            <% session.removeAttribute("successMsg");
                                } %>
                            <% if (failedMsg != null) { %>
                            <p class="text-danger text-center"><%= failedMsg %></p>
                            <%  session.removeAttribute("failedMsg");
                                } %>
                            <% 
                                // Get contact ID from request
                                String cidParam = request.getParameter("cid");
                                Contact c = null;

                                if (cidParam != null && !cidParam.trim().isEmpty()) {
                                    try {
                                        int cid = Integer.parseInt(cidParam);
                                        ContactDAO dao = new ContactDAO(DbConnect.getConn());
                                        c = dao.getContactById(cid);
                                    } catch (NumberFormatException e) {
                                        session.setAttribute("failedMsg", "Invalid contact ID.");
                                        response.sendRedirect("viewContact.jsp");
                                        return;
                                    }
                                } else {
                                    session.setAttribute("failedMsg", "Contact ID is missing.");
                                    response.sendRedirect("viewContact.jsp");
                                    return;
                                }

                                // If contact is not found
                                if (c == null) {
                                    session.setAttribute("failedMsg", "Contact not found.");
                                    response.sendRedirect("viewContact.jsp");
                                    return;
                                }
                            %>
                            <form action="EditContactServlet" method="post">
                                <input type="hidden" name="cid" value="<%= c.getId() %>">

                                <div class="form-group">
                                    <label for="exampleInputName1">Name</label>
                                    <input value="<%= c.getName()%>" type="text" class="form-control" id="exampleInputName" name="name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= c.getEmail()%>" type="email" class="form-control" id="exampleInputEmail1" name="email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPhone1">Phone Number</label>
                                    <input value="<%= c.getPhoneno()%>" type="tel" class="form-control" id="exampleInputphone" name="phoneno">
                                </div>

                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-success">Update Contact</button>
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
