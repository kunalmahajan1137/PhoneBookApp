/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;
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
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       
       UserDAO dao = new UserDAO(DbConnect.getConn());
       User u = dao.loginUser(email, password);
       
       HttpSession session = request.getSession();
       
       if(u!=null){
           session.setAttribute("user", u);
           response.sendRedirect("index.jsp");
       }
       else{
           session.setAttribute("invalidMsg","Invalid Email & Password");
           response.sendRedirect("login.jsp");
       }
   }
}
