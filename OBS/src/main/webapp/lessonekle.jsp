<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.sqlKomutlari.LessonSQL"%>

<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>
<%      try {
        String Message = null;
        if (request.getMethod().equalsIgnoreCase("POST") && roleViews == 3) {
            String name = request.getParameter("name").trim();
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            if (name.length() == 0) {
                Message = "İsim Boş Girilemez.";
            } else if (capacity <= 0 || capacity == 0) {
                Message = "Kapasite Değeri Geçersiz.";
            }
            else if (name.length() > 50) {
                Message = "İsim değeri 50 karakterden fazla olamaz !";
            }
            else {
                int department = Integer.parseInt(request.getParameter("department"));
                int teacher = Integer.parseInt(request.getParameter("teacher"));
                String day = request.getParameter("day");
                String hours = request.getParameter("hours");
                int level = Integer.parseInt(request.getParameter("level"));
                String classroom = request.getParameter("class");

                LessonSQL lessonsql = new LessonSQL();
                Message = lessonsql.LessonAdd(name, capacity, department, teacher, day, hours, level, classroom);
                System.out.println(Message);
            }
            session.setAttribute("message", Message);
            response.sendRedirect("lessonAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

        } else {
            response.sendRedirect("lessonAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

        }
// Veri kaydı yapılacak 
    } catch (Exception e) {
        e.printStackTrace();
        String Message = "Veri Kaydetme İşlemi Başarısız.";
        session.setAttribute("message", Message);
        response.sendRedirect("lessonAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

    }
%>