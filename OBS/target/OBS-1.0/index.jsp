<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Veritabanı Kontrolü</title>
</head>
<body>

<%
    Connection conn = null;

    try {
        conn = MySQLVeritabaniBaglantisi.baglantiyiAl();
        // Veritabanı işlemlerini burada gerçekleştirin.
        if (conn != null && !conn.isClosed()) {
        out.println("Başarılı");
        }
        else {
        out.println("Bağlantı hatası: Bağlantı null veya kapalı.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("!!!!!");

    } finally {
        MySQLVeritabaniBaglantisi.baglantiyiKapat();
    }
%>

</body>
</html>