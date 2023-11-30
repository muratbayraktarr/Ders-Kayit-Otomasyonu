/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

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
    private String faculty;
    private String department;
    private int level;

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

    public String getFaculty() {
        return faculty;
    }

    public String getDepartment() {
        return department;
    }

    public int getLevel() {
        return level;
    }

    public Student(int id, String name, String username, String password, String role, String faculty, String department, int level) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.role = role;
        this.faculty = faculty;
        this.department = department;
        this.level = level;
    }

}
