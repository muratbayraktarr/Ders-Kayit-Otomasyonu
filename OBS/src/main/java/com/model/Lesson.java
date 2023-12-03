/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author ByMazarat
 */
public class Lesson {

    private int id;
    private String name;
    private int capacity;
    private int max_capacity;
    private int department_id;
    private String department;
    private int instructor_id;
    private String instructor;
    private String day;
    private String hours;
    private int level;
    private String classroom;

    public Lesson(int id, String name, int capacity, int max_capacity, int department_id, String department, int instructor_id, String instructor, String day, String hours, int level, String classroom) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.max_capacity = max_capacity;
        this.department_id = department_id;
        this.department = department;
        this.instructor_id = instructor_id;
        this.instructor = instructor;
        this.day = day;
        this.hours = hours;
        this.level = level;
        this.classroom = classroom;
    }

    public Lesson(int id, String name, String day, String hours, String classroom) {
        this.id = id;
        this.name = name;
        this.day = day;
        this.hours = hours;
        this.classroom = classroom;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getCapacity() {
        return capacity;
    }

    public int getMax_capacity() {
        return max_capacity;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public String getDepartment() {
        return department;
    }

    public int getInstructor_id() {
        return instructor_id;
    }

    public String getInstructor() {
        return instructor;
    }

    public String getDay() {
        return day;
    }

    public String getHours() {
        return hours;
    }

    public int getLevel() {
        return level;
    }

    public String getClassroom() {
        return classroom;
    }

}
