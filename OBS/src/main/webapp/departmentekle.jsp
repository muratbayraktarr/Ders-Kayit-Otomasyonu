<%@page import="com.sqlKomutlari.DepartmentSQL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>



<% // Veri kaydı yapılacak
    
    try {       
        if (request.getMethod().equalsIgnoreCase("POST") && roleViews == 3) {
            String name = request.getParameter("department_name").trim();
            String Message = null;
            if (name.length() == 0) {
                Message = "Bölüm Adı Boş Girilemez.";
                session.setAttribute("message", Message);
                response.sendRedirect("departmentAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

            } else if(name.length() > 50){
                Message = "Maksimum 50 karakter girebilirsiniz.";
                session.setAttribute("message", Message);
                response.sendRedirect("departmentAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

            }
    
            else {
                DepartmentSQL d1 = new DepartmentSQL();

                Message = d1.DepartmentAdd(name);
                System.out.println(Message);
                session.setAttribute("message", Message);
                response.sendRedirect("departmentAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }


%>