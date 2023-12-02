/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import com.model.Department;
import com.model.Teacher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ByMazarat
 */
public class TeacherSQL {
    
    public String TeacherGetId(int id){
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String name = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM users WHERE user_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, id);

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                try {
                    name = resultSet.getString("name");
                    
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

        return name;

    }
    
    
    public ArrayList<Teacher> TeacherGet() {
        ArrayList<Teacher> veriListesi = new ArrayList<Teacher>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM users WHERE role LIKE ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, "Öğretmen");

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                try {
                    int id = resultSet.getInt("user_id");
                    String name = resultSet.getString("name");
                    Teacher teacher = new Teacher(id,name);
                    veriListesi.add(teacher);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            conn = veritabaniBaglantisi.baglantiyiKapat();
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

        return veriListesi;

    }
}
