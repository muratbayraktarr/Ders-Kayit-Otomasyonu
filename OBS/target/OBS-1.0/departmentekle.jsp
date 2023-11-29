
<%@page import="com.sqlKomutlari.DepartmentSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% // Veri kaydı yapılacak
    try {
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String name = request.getParameter("department_name");
            DepartmentSQL d1 = new DepartmentSQL();
            String Message = null;
            Message = d1.DepartmentAdd(name);
            System.out.println(Message);
            session.setAttribute("message", Message);
            response.sendRedirect("departmentAdd.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin
            
        }
    } catch (Exception e) {
        e.printStackTrace();
    }


%>