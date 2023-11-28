<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int roleViews = 0;
    String role = null;
    try {
        role = (String) session.getAttribute("role");
        
        if (role.equals("Öğrenci")) {
            roleViews = 1;
        } else if (role.equals("Öğretmen")) {
            roleViews = 2;
        } else if (role.equals("Admin")) {
            roleViews = 3;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>