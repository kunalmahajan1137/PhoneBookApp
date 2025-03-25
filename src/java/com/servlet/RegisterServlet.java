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
public class RegisterServlet extends HttpServlet {

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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User u = new User(name, email, password);
        UserDAO dao = new UserDAO(DbConnect.getConn());
        dao.userRegister(u);
        boolean f = dao.userRegister(u);
        
        HttpSession session = request.getSession();
        if(f){
            session.setAttribute("successMsg", "User Register Sucessfully...");
            response.sendRedirect("register.jsp");
        }
        else{
            session.setAttribute("errorMsg", "Something wrong on server...");
            response.sendRedirect("register.jsp");
        }
    }
}
    

