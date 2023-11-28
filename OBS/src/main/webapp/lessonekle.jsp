 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.sqlKomutlari.LessonSQL"%>
<% 
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String name = request.getParameter("name");
                int capacity =  Integer.parseInt(request.getParameter("capacity"));
                int department = Integer.parseInt(request.getParameter("department"));
                int teacher = Integer.parseInt(request.getParameter("teacher"));
                String day = request.getParameter("day");
                String hours = request.getParameter("hours");
                int level = Integer.parseInt(request.getParameter("level"));
                String classroom = request.getParameter("class");

                LessonSQL lessonsql = new LessonSQL();
                String Message = lessonsql.LessonAdd(name,capacity,department,teacher,day,hours,level,classroom);
                System.out.println(Message);
                response.sendRedirect("lessonAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

            }
// Veri kaydı yapılacak 
        %>