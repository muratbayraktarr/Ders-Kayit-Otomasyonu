<%@page import="com.model.Lesson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sqlKomutlari.DersProgrami"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file ="kullanicitipi.jsp" %>
<%@ include file="sessioncontrol.jsp" %>

<%    try {
        if (roleViews != 1) {
            response.sendRedirect("pages-error-404.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
        }

%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <style>
            .table-container {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px; /* Adjust margin as needed */
            }

            /* Optional: Add additional styling for each table if needed */
            .table {
                /* Add your table styles here */
                margin-right: 10px; /* Adjust margin as needed */
            }
        </style>
    </head>
    <body>
        <!-- ======= Header ======= -->
        <%@ include file="header.jsp" %>

        <!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <%@ include file="sidebar.jsp" %>

        <!-- End Sidebar-->
        <!-- ======= Page Title ======= -->
    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Bölüm Ders Programı</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Anasayfa</a></li>
                    <li class="breadcrumb-item active"><%= (String) session.getAttribute("role")%></li>
                </ol>
            </nav>
        </div><!-- End Page Title -->
        <%
            DersProgrami dp = new DersProgrami();
            int department_id = ((Integer) session.getAttribute("department"));
            System.out.println(department_id);
            ArrayList<Lesson> DersProgramiListesi = dp.getBolumDersProgrami(department_id);

        %>
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr class="table table-dark">
                        <th scope="col" colspan="6">Pazartesi</th>                    
                    </tr>
                    <tr class="table table-primary">
                        <th scope="col">Saat</th>
                        <th scope="col" colspan="2" >Ders Adı</th>
                        <th scope="col" colspan="1" >Eğitmen</th>
                        <th scope="col" colspan="1" >Düzey</th>                        
                        <th scope="col" colspan="1" >Sınıf</th>
                    </tr>
                </thead>          
                <tbody>
                    <% for (Lesson lesson : DersProgramiListesi) { %>
                    <% if (lesson.getDay().equals("Pazartesi")) {%>
                    <tr>
                        <th scope="row"><%= lesson.getHours()%></th>
                        <td colspan="2"><%= lesson.getName()%></td>
                        <td colspan="1"><%= lesson.getInstructor()%></td>
                        <td colspan="1"><%= lesson.getLevel()%></td>                     
                        <td colspan="1"><%= lesson.getClassroom()%></td>                    
                    </tr>
                    <% } %>
                    <% }%>
                </tbody>   
            </table>

            <table class="table table-bordered">
                <thead>
                    <tr class="table table-dark">
                        <th scope="col" colspan="6">Salı</th>                    
                    </tr>
                    <tr class="table table-primary">
                        <th scope="col">Saat</th>
                        <th scope="col" colspan="2" >Ders Adı</th>
                        <th scope="col" colspan="1" >Eğitmen</th>
                        <th scope="col" colspan="1" >Düzey</th>                        
                        <th scope="col" colspan="1" >Sınıf</th>
                    </tr>
                </thead>          
                <tbody>
                    <% for (Lesson lesson : DersProgramiListesi) { %>
                    <% if (lesson.getDay().equals("Salı")) {%>
                    <tr>
                        <th scope="row"><%= lesson.getHours()%></th>
                        <td colspan="2"><%= lesson.getName()%></td>
                        <td colspan="1"><%= lesson.getInstructor()%></td>
                        <td colspan="1"><%= lesson.getLevel()%></td>                     
                        <td colspan="1"><%= lesson.getClassroom()%></td>                    
                    </tr>
                    <% } %>
                    <% }%>
                </tbody>   
            </table>
        </div>
        <div class="table-container">           
            <table class="table table-bordered">
                <thead>
                    <tr class="table table-dark">
                        <th scope="col" colspan="6">Çarşamba</th>                    
                    </tr>
                    <tr class="table table-primary">
                        <th scope="col">Saat</th>
                        <th scope="col" colspan="2" >Ders Adı</th>
                        <th scope="col" colspan="1" >Eğitmen</th>
                        <th scope="col" colspan="1" >Düzey</th>                        
                        <th scope="col" colspan="1" >Sınıf</th>
                    </tr>
                </thead>          
                <tbody>
                    <% for (Lesson lesson : DersProgramiListesi) { %>
                    <% if (lesson.getDay().equals("Çarşamba")) {%>
                    <tr>
                        <th scope="row"><%= lesson.getHours()%></th>
                        <td colspan="2"><%= lesson.getName()%></td>
                        <td colspan="1"><%= lesson.getInstructor()%></td>
                        <td colspan="1"><%= lesson.getLevel()%></td>                     
                        <td colspan="1"><%= lesson.getClassroom()%></td>                  
                    </tr>
                    <% } %>
                    <% }%>
                </tbody>   
            </table>

            <table class="table table-bordered">
                <thead>
                    <tr class="table table-dark">
                        <th scope="col" colspan="6">Perşembe</th>                    
                    </tr>
                    <tr class="table table-primary">
                        <th scope="col">Saat</th>
                        <th scope="col" colspan="2" >Ders Adı</th>
                        <th scope="col" colspan="1" >Eğitmen</th>
                        <th scope="col" colspan="1" >Düzey</th>                        
                        <th scope="col" colspan="1" >Sınıf</th>
                    </tr>
                </thead>          
                <tbody>
                    <% for (Lesson lesson : DersProgramiListesi) { %>
                    <% if (lesson.getDay().equals("Perşembe")) {%>
                    <tr>
                        <th scope="row"><%= lesson.getHours()%></th>
                        <td colspan="2"><%= lesson.getName()%></td>
                        <td colspan="1"><%= lesson.getInstructor()%></td>
                        <td colspan="1"><%= lesson.getLevel()%></td>                     
                        <td colspan="1"><%= lesson.getClassroom()%></td>                     
                    </tr>
                    <% } %>
                    <% }%>
                </tbody>   
            </table>
        </div>           
        <table class="table table-bordered">
            <thead>
                <tr class="table table-dark">
                    <th scope="col" colspan="6">Cuma</th>                    
                </tr>
                <tr class="table table-primary">
                    <th scope="col">Saat</th>
                    <th scope="col" colspan="2" >Ders Adı</th>
                    <th scope="col" colspan="1" >Eğitmen</th>
                    <th scope="col" colspan="1" >Düzey</th>                        
                    <th scope="col" colspan="1" >Sınıf</th>
                </tr>
            </thead>          
            <tbody>
                <% for (Lesson lesson : DersProgramiListesi) { %>
                <% if (lesson.getDay().equals("Cuma")) {%>
                <tr>
                    <th scope="row"><%= lesson.getHours()%></th>
                    <td colspan="2"><%= lesson.getName()%></td>
                    <td colspan="1"><%= lesson.getInstructor()%></td>
                    <td colspan="1"><%= lesson.getLevel()%></td>                     
                    <td colspan="1"><%= lesson.getClassroom()%></td>                     
                </tr>
                <% } %>
                <% }%>
            </tbody>   
        </table>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>

<%    } catch (Exception e) {
        e.printStackTrace();
    }
%>