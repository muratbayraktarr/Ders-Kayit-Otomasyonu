/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import com.model.Lesson;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ByMazarat
 */
public class DersProgrami {
    
     public ArrayList<Lesson> getBolumDersProgrami(int department_id) {
        ArrayList<Lesson> veriListesi = new ArrayList<Lesson>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        PreparedStatement statement2 = null;
        ResultSet resultSet2 = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM courses WHERE department_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, department_id);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                try {
                    int id = resultSet.getInt("course_id");
                    String name = resultSet.getString("course_name");
                    int capacity = resultSet.getInt("capacity");
                    int max_capacity = resultSet.getInt("max_capacity");
                    int instructor_id = resultSet.getInt("instructor_id");
                    String day = resultSet.getString("day");
                    String hours = resultSet.getString("hours");
                    int level = resultSet.getInt("level");
                    String classroom = resultSet.getString("class");
                    String department = null;
                    String instructor = null;
                    sql = "SELECT name FROM users WHERE user_id = ?";
                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, instructor_id);
                    resultSet2 = statement.executeQuery();
                    while (resultSet2.next()) {
                        try {
                            instructor = resultSet2.getString("name");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    sql = "SELECT department_name FROM departments WHERE department_id = ?";
                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, department_id);
                    resultSet2 = statement.executeQuery();
                    while (resultSet2.next()) {
                        try {
                            department = resultSet2.getString("department_name");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    Lesson lesson = new Lesson(id, name, capacity, max_capacity, department_id, department, instructor_id, instructor, day, hours, level, classroom);
                    veriListesi.add(lesson);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL hatası oluştu");
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet2 != null) {
                    resultSet2.close();
                }
                conn = veritabaniBaglantisi.baglantiyiKapat();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Bağlantı kapatılamadı");
            }
        }
        return veriListesi;
    }

    
    public ArrayList<Lesson> DersProgramiTeacherGet(int teacher_id) {
        ArrayList<Lesson> veriListesi = new ArrayList<Lesson>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM courses WHERE instructor_id = ? ORDER BY hours ASC";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, teacher_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                try {
                    int course_id = resultSet.getInt("course_id");
                    String name = resultSet.getString("course_name");
                    int capacity = resultSet.getInt("capacity");
                    int max_capacity = resultSet.getInt("max_capacity");
                    String day = resultSet.getString("day");
                    String hours = resultSet.getString("hours");
                    String classroom = resultSet.getString("class");
                    Lesson lesson = new Lesson(course_id, name,capacity,max_capacity, day, hours, classroom);
                    veriListesi.add(lesson);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL hatası oluştu");
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                veritabaniBaglantisi.baglantiyiKapat();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Bağlantı kapatılamadı");
            }
        }

        return veriListesi;
    }
    
    

    public ArrayList<Lesson> DersProgramiGet(int user_id) {
        ArrayList<Lesson> veriListesi = new ArrayList<Lesson>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        PreparedStatement statement2 = null;
        ResultSet resultSet2 = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM student_courses WHERE student_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, user_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                try {
                    int course_id = resultSet.getInt("course_id");
                    sql = "SELECT * FROM courses WHERE course_id = ? ORDER BY hours ASC";
                    statement2 = conn.prepareStatement(sql);
                    statement2.setInt(1, course_id);
                    resultSet2 = statement2.executeQuery();
                    if(resultSet2.next()){
                        try {
                            String lesson_name = resultSet2.getString("course_name");
                            String day = resultSet2.getString("day");
                            String hours = resultSet2.getString("hours");
                            String classroom = resultSet2.getString("class");
                            Lesson lesson = new Lesson(course_id, lesson_name, day, hours, classroom);
                            veriListesi.add(lesson);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL hatası oluştu");
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (resultSet2 != null) {
                    resultSet2.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (statement2 != null) {
                    statement2.close();
                }
                veritabaniBaglantisi.baglantiyiKapat();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Bağlantı kapatılamadı");
            }
        }

        return veriListesi;
    }
}
