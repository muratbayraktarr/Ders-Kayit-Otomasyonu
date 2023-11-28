<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
try {
    String userRole = (String) session.getAttribute("role");

    if (userRole != null && ((userRole.equals("Admin") || (userRole.equals("Öğretmen") || userRole.equals("Öğrenci"))))) {
        
    } else {
        System.out.println("Yetkisiz oldugunuzdan yönlendiriliyorsunuz..");
        response.sendRedirect("pages-login.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin
    }
} catch (Exception e) {
    // Hata durumunda burada hatayı işleyebilirsiniz, örneğin loglayabilir veya uygun bir hata sayfasına yönlendirebilirsiniz.
    e.printStackTrace(); // Hata mesajını konsola yazdırabilirsiniz
    response.sendRedirect("pages-login.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
}
%>
