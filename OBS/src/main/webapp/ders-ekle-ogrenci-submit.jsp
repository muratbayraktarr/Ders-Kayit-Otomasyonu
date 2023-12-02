
<%@page import="com.sqlKomutlari.LessonAndStudent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            String Message;
            String selectedOptionValue = request.getParameter("lesson");
            String[] values = selectedOptionValue.split("-");
            String lesson = values[0];
            int capacity = Integer.parseInt(values[1]);
            int max_capacity = Integer.parseInt(values[2]);
           
            if (capacity >= max_capacity) {
                Message = "Kapasite Dolu !!";

            } else {
                int user_id = (Integer) session.getAttribute("user_id");
                int lesson_id = Integer.parseInt(lesson);
                LessonAndStudent las = new LessonAndStudent();
                Message = las.Add(user_id, lesson_id);
            }

            session.setAttribute("message", Message);
            response.sendRedirect("ders-ekle-ogrenci.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

        } catch (Exception e) {
        }

    } else {
        response.sendRedirect("ders-ekle-ogrenci.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

    }
%>