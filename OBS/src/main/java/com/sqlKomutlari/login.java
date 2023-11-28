/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqlKomutlari;

import com.db.MySQLVeritabaniBaglantisi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/**
 *
 * @author 90507
 */
public class Login {
    private String userrole;
    private String name;
    private String message;
    private String faculty;
    private String department;
    private int level;
    private boolean isAuthenticated = false;

    public boolean getDurum(){
        return isAuthenticated;
    }
    
    public String getUserrole() {
        return userrole;
    }
    
    public String getFaculty() {
        return faculty;
    }
    
    public String getDepartment() {
        return department;
    }
    
    public int getLevel(){
        return level;
    }
    
    public String getName() {
        return name;
    }

    public String getMessage() {
        return message;
    }
    
    public static void main(String[] args) {

    }

    public String loginRequest(String username, String password) {
        Connection conn = null;
        MySQLVeritabaniBaglantisi db = new MySQLVeritabaniBaglantisi();

        String successMessage = "";
        String errorMessage = "";
        try {
            conn = db.baglantiyiAl();

            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Kullanıcı girişi başarılı
                isAuthenticated = true;
                String userrole2 = resultSet.getString("role");
                String name2 = resultSet.getString("name");
                this.name = name2;
                this.userrole = userrole2;
                successMessage = "<div class=\"alert alert-success\">Kullanıcı Girişi Başarılı Yönlendiriliyorsunuz...</div>";
                this.message = successMessage;
                if(userrole2.equals("Öğrenci")){
                    this.department = resultSet.getString("department");
                    this.faculty = resultSet.getString("faculty");
                    this.level = resultSet.getInt("level");
                }
            } else {
                errorMessage = "<div class=\"alert alert-danger\">Kullanıcı Adı ya da Şifre Yanlış.</div>";
                this.message = errorMessage;
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "<div class=\"alert alert-danger\">Bağlantı Problemi !!</div>";
            this.message = errorMessage;
        } finally {
            db.baglantiyiKapat();
            return this.message;
                    
                     
        }
    }
}
