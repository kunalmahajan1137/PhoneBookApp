package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditContactServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        String cidParam = request.getParameter("cid");
        if (cidParam == null || cidParam.trim().isEmpty()) {
            session.setAttribute("failedMsg", "Invalid contact ID.");
            response.sendRedirect("viewContact.jsp");
            return;
        }

        int cid;
        try {
            cid = Integer.parseInt(cidParam);
        } catch (NumberFormatException e) {
            session.setAttribute("failedMsg", "Invalid contact ID format.");
            response.sendRedirect("viewContact.jsp");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");

        Contact c = new Contact();
        c.setId(cid);
        c.setName(name);
        c.setEmail(email);
        c.setPhoneno(phoneno);

        ContactDAO dao = new ContactDAO(DbConnect.getConn());
        boolean updated = dao.updateContact(c);

        if (updated) {
            session.setAttribute("successMsg", "Contact updated successfully.");
            response.sendRedirect("viewContact.jsp");
        } else {
            session.setAttribute("failedMsg", "Failed to update contact.");
            response.sendRedirect("editContact.jsp?cid=" + cid);
        }
    }

}
