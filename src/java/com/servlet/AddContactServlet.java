/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ktmah
 */
public class AddContactServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
       
        int userid = Integer.parseInt(request.getParameter("userid").trim());
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");
        
        Contact c = new Contact(name, email, phoneno,userid);
        ContactDAO dao = new ContactDAO(DbConnect.getConn());
        
        HttpSession session = request.getSession();
        boolean f = dao.saveContact(c);
        if(f){
            session.setAttribute("successMsg", "Your Contact Saved Successfully...");
            response.sendRedirect("addContact.jsp");
        }else{
            session.setAttribute("failedMsg","Something wrong on server...");
            response.sendRedirect("addContact.jsp");
        }
    }
}
