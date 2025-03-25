/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author ktmah
 */
public class Contact {
    private int id;
    private String name;
    private String email;
    private String phoneno;
    private int userId;

    public Contact(){
        super();
    }

    /**
     *
     * @param name
     * @param email
     * @param phoneno
     * @param userId
     */
    public Contact(String name, String email, String phoneno, int userId){
        
        super();
        this.name = name;
        this.email = email;
        this.phoneno = phoneno;
        this.userId = userId;
        
    }
    
    public int getId(){
        return id;
    }
    public int setId(int id){
        this.id = id;
        return 0;
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
    public String getPhoneno(){
        return phoneno;
    }
    public String setPhoneno(String phoneno){
        this.phoneno = phoneno;
        return null;
    }
    public int getUserId(){
        return userId;
    }
    public int setUserId(int userId){
        this.userId = userId;
        return 0;
    }
}
