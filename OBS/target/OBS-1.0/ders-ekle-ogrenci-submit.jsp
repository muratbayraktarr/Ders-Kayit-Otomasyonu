
<%@page import="com.model.Lesson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sqlKomutlari.LessonSQL"%>
<%@page import="com.sqlKomutlari.LessonAndStudent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>


<%  try {
        if (roleViews != 1) {
            response.sendRedirect("pages-error-404.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
        }

%>

<%
    if (request.getMethod().equalsIgnoreCase("POST") && roleViews == 1) {
        try {
            String Message = null;
            String selectedOptionValue = request.getParameter("lesson");
            String[] values = selectedOptionValue.split("-");
            String lesson = values[0];
            int capacity = Integer.parseInt(values[1]);
            int max_capacity = Integer.parseInt(values[2]);
            int a=0;
            LessonSQL lesson1 = new LessonSQL();
            ArrayList<Lesson> LessonList2 = lesson1.getLesson();
            
            for(Lesson l : LessonList2){
                if(l.getId() == Integer.parseInt(lesson)){
                    if(l.getDepartment_id() == (Integer) session.getAttribute("department") && l.getCapacity() == capacity && l.getMax_capacity() == max_capacity){
                        a=1;
                        break;
                    }
                    else{
                        Message = "F12 yi çok sevdiğinin farkındayım fakat ben de seviyorum :) ";
                    }
                }
                else{
                     Message = "F12 yi çok sevdiğinin farkındayım fakat ben de seviyorum :) ";
                }
            }
            
            if(a==1){
            if (capacity >= max_capacity) {
                Message = "Kapasite Dolu !!";

            } else {
                int user_id = (Integer) session.getAttribute("user_id");
                int lesson_id = Integer.parseInt(lesson);
                LessonAndStudent las = new LessonAndStudent();
                Message = las.Add(user_id, lesson_id);
            }

            session.setAttribute("message", Message);
            response.sendRedirect("ders-ekle-ogrenci.jsp"); 
            }
            else{
                session.setAttribute("message", Message);
                response.sendRedirect("ders-ekle-ogrenci.jsp"); 
            }
        } catch (Exception e) {
        e.printStackTrace();
        }

    } else {
        response.sendRedirect("ders-ekle-ogrenci.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

    }
%>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }

%>