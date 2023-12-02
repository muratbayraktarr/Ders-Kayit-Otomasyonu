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

/**
 *
 * @author ByMazarat
 */
public class LessonAndStudent {
    String Message = null;
    public String Add(int user_id, int lesson_id){
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "INSERT INTO student_courses (student_id,course_id) VALUES (?,?)";
            statement = conn.prepareStatement(sql);
            statement.setInt(1,user_id);
            statement.setInt(2,lesson_id);
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
                    statement.setInt(1,lesson_id);
                    rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        System.out.println("Capacity 1 arttırıldı");
                    }
                    else {
                        System.out.println("Capacity arttıralamadı");
                    }
                } else {
                    Message = "Kaydetme işlemi başarısız.";
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
