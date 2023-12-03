<%@page import="com.sqlKomutlari.LessonAndStudent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>


<%  try {
        if (roleViews != 3) {
            response.sendRedirect("pages-error-404.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
        }

%>


<%    if (request.getMethod().equalsIgnoreCase("POST") && roleViews == 3) {
        String Message;
        int id = Integer.parseInt(request.getParameter("Id"));
        Cookie[] cookies = request.getCookies();
        int studentId = 0;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("ListStudentId")) {
                    String studentIdString = cookie.getValue();
                    studentId = Integer.parseInt(studentIdString);
                    Cookie expiredCookie = new Cookie("ListStudentId", "");
                    expiredCookie.setMaxAge(0);
                    expiredCookie.setPath("/");  

                    response.addCookie(expiredCookie);

                    break;
                }
            }
        }

        LessonAndStudent islem = new LessonAndStudent();
        Message = islem.Delete(id, studentId);
        session.setAttribute("message", Message);
        response.sendRedirect("ders-sil-admin.jsp");
    } else {
        response.sendRedirect("ders-sil-admin.jsp");
    }

%>


<%    } catch (Exception e) {
        e.printStackTrace();
    }

%>