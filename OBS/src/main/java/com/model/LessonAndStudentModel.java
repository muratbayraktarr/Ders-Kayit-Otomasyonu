/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author ByMazarat
 */
public class LessonAndStudentModel {
    private int id;
    private int studentId;
    private int lessonId;
    private String StudentName;
    private String CourseName;

    public LessonAndStudentModel(int studentId, int lessonId, String StudentName, String CourseName, int id) {
        this.id = id;
        this.studentId = studentId;
        this.lessonId = lessonId;
        this.StudentName = StudentName;
        this.CourseName = CourseName;
    }

    public int getId() {
        return id;
    }
    
    public int getStudentId() {
        return studentId;
    }

    public int getLessonId() {
        return lessonId;
    }

    public String getStudentName() {
        return StudentName;
    }

    public String getCourseName() {
        return CourseName;
    }
    
}
