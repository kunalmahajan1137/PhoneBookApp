/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
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
public class DeleteContactServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int cid = Integer.parseInt(request.getParameter("cid"));
        
        ContactDAO dao = new ContactDAO(DbConnect.getConn());
        boolean f = dao.deleteContactById(cid);
        
        HttpSession session = request.getSession();
        
        if(f){
            session.setAttribute("successMsg", "Contact Delete Successfully...");
            response.sendRedirect("viewContact.jsp");
        }else{
            session.setAttribute("failedMsg", "Something Wrong on Server...");
            response.sendRedirect("viewContact.jsp");
        }
    }
}
