/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import com.model.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ByMazarat
 */
public class StudentListSQL {
     public ArrayList<Student> StudentGet() {
        ArrayList<Student> veriListesi = new ArrayList<Student>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM users WHERE role LIKE ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, "Öğrenci");
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                try {
                    int id = resultSet.getInt("user_id");
                    String name = resultSet.getString("name");
                    String username = resultSet.getString("username");
                    String password= resultSet.getString("password");
                    String role= resultSet.getString("role");
                    String faculty = resultSet.getString("faculty");
                    String department = resultSet.getString("department");
                    int level = resultSet.getInt("level");
                    
                    Student student = new Student(id, name, username, password, role, faculty, department, level);
                    veriListesi.add(student);
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
}
