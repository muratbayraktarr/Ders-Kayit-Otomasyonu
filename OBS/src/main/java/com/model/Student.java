/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import com.sqlKomutlari.DepartmentSQL;

/**
 *
 * @author ByMazarat
 */
public class Student {

    private int id;
    private String name;
    private String username;
    private String password;
    private String role;
    private String department;
    private int level;
    private int departmentId;

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getDepartmentId() {
        return departmentId;
    }
 
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getDepartment() {
        return department;
    }

    public int getLevel() {
        return level;
    }

    public Student(int id, String name, String username, String password, String role, int departmentid, int level) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.role = role;
        this.departmentId = departmentid;
        this.level = level;
    }

}
