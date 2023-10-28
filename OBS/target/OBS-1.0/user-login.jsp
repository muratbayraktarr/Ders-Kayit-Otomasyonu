<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>


<!DOCTYPE html>
<html>
<head>
    <title>Login Sonucu</title>
</head>
<body>

    <h1>Giriş başarılı, hoş geldiniz, <%= session.getAttribute("username")  %></h1>
    <p>Kullanıcı Tipi: <%= session.getAttribute("userrole") %></p><br/>
    <p>Kullanıcı Bilgisi: <%= session.getAttribute("name") %></p>

    <a href="logout.jsp">Çıkış Yap</a>

    

</body>
</html>
