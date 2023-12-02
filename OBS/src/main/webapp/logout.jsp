<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    try {
        session.removeAttribute("role");
        session.removeAttribute("name");
        session.removeAttribute("username");
        session.removeAttribute("department");
        response.sendRedirect("pages-login.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("pages-login.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

    }

%>
