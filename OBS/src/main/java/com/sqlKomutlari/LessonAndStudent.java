/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import com.model.Lesson;
import com.model.LessonAndStudentModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ByMazarat
 */
public class LessonAndStudent {

    String Message = null;

    public String Delete(int id, int student_id) {
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        System.out.println(id);
        System.out.println(student_id);

        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String checkSql = "DELETE FROM student_courses WHERE id = ? and student_id = ?";
            statement = conn.prepareStatement(checkSql);
            statement.setInt(1, id);
            statement.setInt(2, student_id);

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                return "Veri başarıyla silindi.";
            } else {
                return "Belirtilen ID'ye sahip veri bulunamadı.";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL hatası oluştu");
        } finally {
            try {

                if (statement != null) {
                    statement.close();
                }

                conn = veritabaniBaglantisi.baglantiyiKapat();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Bağlantı kapatılamadı");
            }
        }
        return Message;

    }

    public ArrayList<LessonAndStudentModel> Get(int user_id) {
        ArrayList<LessonAndStudentModel> veriListesi = new ArrayList<LessonAndStudentModel>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        PreparedStatement statement2 = null;
        ResultSet resultSet2 = null;
        System.out.println("Kullanıcı İd :" + user_id);

        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM student_courses WHERE student_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, user_id);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                try {
                    int id = resultSet.getInt("id");
                    int lesson_id = resultSet.getInt("course_id");
                    System.out.println("Course Id : " + lesson_id);
                    String sql2 = "SELECT course_name FROM courses WHERE course_id = ?";
                    statement2 = conn.prepareStatement(sql2);
                    statement2.setInt(1, lesson_id);
                    resultSet2 = statement2.executeQuery();
                    String lesson_name = null;
                    if (resultSet2.next()) {
                        lesson_name = resultSet2.getString("course_name");
                        System.out.println("Lesson name atandı");

                    }
                    resultSet2 = null;
                    sql2 = "SELECT name FROM users WHERE user_id = ?";
                    statement2 = conn.prepareStatement(sql2);
                    statement2.setInt(1, user_id);
                    resultSet2 = statement2.executeQuery();
                    String user_name = null;
                    if (resultSet2.next()) {
                        user_name = resultSet2.getString("name");
                    }
                    System.out.println(lesson_name);
                    LessonAndStudentModel lessonAndStudent = new LessonAndStudentModel(user_id, lesson_id, user_name, lesson_name, id);
                    veriListesi.add(lessonAndStudent);
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

    public String Add(int user_id, int lesson_id) {
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String checkSql = "SELECT * FROM student_courses WHERE student_id = ? AND course_id = ?";
            statement = conn.prepareStatement(checkSql);
            statement.setInt(1, user_id);
            statement.setInt(2, lesson_id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Message = "Zaten bu derse kayıtlısınız.";
            } else {
                int checkLessonDepartmentId = 0;
                int checkUserDepartmentId = 0;
                int checkCapacity = 0;
                int checkMaxCapacity = 0;
                checkSql = "SELECT * FROM courses WHERE course_id = ?";
                statement = conn.prepareStatement(checkSql);
                statement.setInt(1, lesson_id);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    checkLessonDepartmentId = resultSet.getInt("department_id");
                    checkCapacity = resultSet.getInt("capacity");
                    checkMaxCapacity = resultSet.getInt("max_capacity");

                }

                checkSql = "SELECT department_id FROM users WHERE user_id = ?";
                statement = conn.prepareStatement(checkSql);
                statement.setInt(1, user_id);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    checkUserDepartmentId = resultSet.getInt("department_id");
                }
                if (checkLessonDepartmentId != checkUserDepartmentId) {
                    Message = "Başka bir bölümden ders alamazsınız !";
                } else if (checkCapacity >= checkMaxCapacity) {
                    Message = "Kapasite Dolu !";
                } else {
                    String sql = "INSERT INTO student_courses (student_id,course_id) VALUES (?,?)";
                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, user_id);
                    statement.setInt(2, lesson_id);
                    int rowsInserted = 0;
                    try {
                        rowsInserted = statement.executeUpdate();
                        System.out.println(rowsInserted);
                    } catch (SQLException e) {
                        rowsInserted = 0;
                        e.printStackTrace();
                    }

                    if (rowsInserted > 0) {
                        Message = "Veri Başarıyla Kaydedildi.";
                        rowsInserted = 0;
                        sql = "UPDATE courses SET capacity = capacity + 1 WHERE course_id = ?";
                        statement = conn.prepareStatement(sql);
                        statement.setInt(1, lesson_id);
                        rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            System.out.println("Capacity 1 arttırıldı");
                        } else {
                            System.out.println("Capacity arttıralamadı");
                        }
                    } else {
                        Message = "Kaydetme işlemi başarısız.";
                    }
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

                conn = veritabaniBaglantisi.baglantiyiKapat();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Bağlantı kapatılamadı");
            }
        }
        return Message;
    }
}
