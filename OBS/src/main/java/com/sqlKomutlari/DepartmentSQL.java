/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import com.model.Department;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ByMazarat
 */
public class DepartmentSQL {

    public ArrayList<Department> DepartmentGet() {
        ArrayList<Department> veriListesi = new ArrayList<Department>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM departments";
            statement = conn.prepareStatement(sql);

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                try {
                    int id = resultSet.getInt("department_id");
                    String name = resultSet.getString("department_name");
                    Department department = new Department(name, id);
                    veriListesi.add(department);
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

    public String DepartmentAdd(String name) {
        MySQLVeritabaniBaglantisi db = new MySQLVeritabaniBaglantisi();
        String Message = "";
        Connection conn = null;

        try {
            conn = db.baglantiyiAl();
            if (conn != null) {
                System.out.println("Başarılı");

                // Veritabanında aynı isimde bir kayıt var mı kontrol et
                if (!isDepartmentNameExists(conn, name)) {
                    String insertSQL = "INSERT INTO departments (department_name) VALUES (?)";
                    PreparedStatement statement = conn.prepareStatement(insertSQL);
                    statement.setString(1, name);

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
                    Message = "Bu isimde bir departman zaten var. Tekrar kaydedilemez.";
                }
            } else {
                Message = "Bağlantı hatası: Bağlantı null veya kapalı.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            Message = "Veritabanına kaydetme sırasında bir hata oluştu.";
        } finally {
             db.baglantiyiKapat(); 
        }

        return Message;
    }

    private boolean isDepartmentNameExists(Connection conn, String name) throws SQLException {
        String query = "SELECT COUNT(*) FROM departments WHERE department_name = ?";
        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, name);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    
}
