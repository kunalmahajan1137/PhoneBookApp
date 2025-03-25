/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ktmah
 */
public class DbConnect {
    private static Connection conn;
    public static Connection getConn(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook","root","");
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
}
