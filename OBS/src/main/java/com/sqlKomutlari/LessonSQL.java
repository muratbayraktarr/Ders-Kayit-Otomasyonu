
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
    public ArrayList<Lesson> getLesson(){
        ArrayList<Lesson> veriListesi = new ArrayList<Lesson>();
        MySQLVeritabaniBaglantisi veritabaniBaglantisi = new MySQLVeritabaniBaglantisi();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        PreparedStatement statement2 = null;
        ResultSet resultSet2 = null;
        try {
            conn = veritabaniBaglantisi.baglantiyiAl();
            String sql = "SELECT * FROM courses";
            statement = conn.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                try {
                    int id = resultSet.getInt("course_id");
                    String name = resultSet.getString("course_name");
                    int capacity = resultSet.getInt("capacity");
                    int max_capacity = resultSet.getInt("max_capacity");
                    int department_id = resultSet.getInt("department_id");
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
                    while(resultSet2.next()){
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
                    while(resultSet2.next()){
                        try {
                            department = resultSet2.getString("department_name");                            
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    System.out.println("Lessondaki veriler kaydedildi");
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
                veritabaniBaglantisi.baglantiyiKapat();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Bağlantı kapatılamadı");
            }
        }
        return veriListesi;
    }
    public static void main(String[] args) {
        LessonSQL veriCek = new LessonSQL(); 
        ArrayList<Lesson> LessonList = veriCek.getLesson();
        for(Lesson lesson : LessonList)
        {
            System.out.println(lesson.getName());
        }
    }
}
