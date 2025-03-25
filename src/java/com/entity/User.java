/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author ktmah
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    
    public User(){
        super();
    }
    
    public User(String name, String email, String password){
        super();
        this.name = name;
        this.email = email;
        this.password = password;
    }
    
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    public String getName(){
        return name;
    }
    public String setName(String name){
        this.name = name;
        return null;
    }
    public String getEmail(){
        return email;
    }
    public String setEmail(String email){
        this.email = email;
        return null;
    }
    public String getPassword(){
        return password;
    }
    public String setPassword(String password){
        this.password = password;
        return null;
    }
}
