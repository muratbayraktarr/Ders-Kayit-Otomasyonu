
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sqlKomutlari.ChangePassword" %>

<%

    try {
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String Message = null;
            String lastpassword = (String) session.getAttribute("password");
            System.out.println(lastpassword);
            String password = request.getParameter("currentPassword");
            System.out.println(password);
            
            String newpasssword1 = request.getParameter("newPassword");
            String newpasssword2 = request.getParameter("confirmNewPassword");
            if (lastpassword.equals(password)) {
                if (newpasssword1.equals(newpasssword2)) {
                    ChangePassword d1 = new ChangePassword();
                    String username = (String) session.getAttribute("username");
                    Message = d1.ChangePass(username, newpasssword1);
                    System.out.println(Message);
                    session.setAttribute("message", Message);
                    session.removeAttribute("password");
                    session.setAttribute("password", newpasssword1);
                    response.sendRedirect("sifredegis.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin
                } else {
                    Message = "Girilen şifreler aynı değil";
                    session.setAttribute("message", Message);
                    response.sendRedirect("sifredegis.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

                }
            }
            else{
                Message = "Mevcut şifrenizi yanlış girdiniz";
                session.setAttribute("message", Message);
                response.sendRedirect("sifredegis.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin
                
            }
        } else {
            response.sendRedirect("sifredegis.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("sifredegis.jsp"); // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin

    }
%>