/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import java.sql.Connection;
import java.sql.PreparedStatement;


/**
 *
 * @author 90507
 */
public class addUser {
    
    public String userAdd(String name, String username, String password, String userrole) {
        MySQLVeritabaniBaglantisi db = new MySQLVeritabaniBaglantisi();
        String Message = "";
        Connection conn = null;
        try {
            conn = db.baglantiyiAl();
            if (conn != null) {
                System.out.println("Başarılı");

                String insertSQL = "INSERT INTO users (name, username, password, role) VALUES (?, ?, ?, ?)";

                PreparedStatement statement = conn.prepareStatement(insertSQL);
                statement.setString(1, name);
                statement.setString(2, username);
                statement.setString(3, password);
                statement.setString(4, userrole);
                int rowsInserted = 0;

                try {
                    rowsInserted = statement.executeUpdate();
                    System.out.println(rowsInserted);
                } catch (Exception e) {
                    rowsInserted = 0;
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
    public static void main(String[] args) {
        String Message2 = null;
        addUser a1 = new addUser();
        Message2 = a1.userAdd("Murat Bayraktar","mazarat2002","murat123","admin");
        System.out.println(Message2);
    }
}
