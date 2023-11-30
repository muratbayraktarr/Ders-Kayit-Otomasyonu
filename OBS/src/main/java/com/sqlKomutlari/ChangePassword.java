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

/**
 *
 * @author ByMazarat
 */
public class ChangePassword {
    String Message;
    public String ChangePass(String username, String NewPassword) {
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM users WHERE username LIKE ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                try {                 
                    statement = null;
                    String updatePasswordQuery = "UPDATE users SET password=? WHERE username=?";
                    statement = conn.prepareStatement(updatePasswordQuery);                    
                    statement.setString(1, NewPassword);
                    statement.setString(2, username);
                    int rowsAffected = statement.executeUpdate();
                    if(rowsAffected == 1){
                        Message = "Şifreniz Başarıyla Değiştirildi !";
                    }
                    else if(rowsAffected == 0){
                        Message = "Şifreniz Değiştirilmedi !";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    Message = "Şifreniz Değiştirilirken Bir Hata Oluştu !";
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            Message = "SQL hatası oluştu";

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
                Message = "Bağlantı kapatılamadı";
            }
        }
        return Message;
    }
}
