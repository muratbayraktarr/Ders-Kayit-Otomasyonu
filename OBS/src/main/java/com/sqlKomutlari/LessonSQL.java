/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author ByMazarat
 */
public class LessonSQL {
    public String LessonAdd(String name, int max_capacity, int department_id, int instructor_id, String day, String hours, int level,String classroom) {
        MySQLVeritabaniBaglantisi db = new MySQLVeritabaniBaglantisi();
        String Message = "";
        Connection conn = null;
        try {
            conn = db.baglantiyiAl();
            if (conn != null) {
                System.out.println("Başarılı");

                String insertSQL = "INSERT INTO courses (course_name,max_capacity,department_id,instructor_id,day,hours,level,class) VALUES (?,?,?,?,?,?,?,?)";

                PreparedStatement statement = conn.prepareStatement(insertSQL);
                statement.setString(1, name);
                statement.setInt(2, max_capacity);
                statement.setInt(3, department_id);
                statement.setInt(4, instructor_id);
                statement.setString(5, day);
                statement.setString(6, hours);
                statement.setInt(7, level);
                statement.setString(8, classroom);

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
                    
                } else {
                    Message = "Kaydetme işlemi başarısız.";
                }
            } else {
                Message = "Bağlantı hatası: Bağlantı null veya kapalı.";
                
            }
        } catch (Exception e) {
            e.printStackTrace();
            Message = "Veritabanına kaydetme sırasında bir hata oluştu.";
            
        } finally {
            conn = db.baglantiyiKapat();
            return Message;
        }
    }
}
