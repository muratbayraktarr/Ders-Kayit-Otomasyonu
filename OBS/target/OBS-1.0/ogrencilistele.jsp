<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.sqlKomutlari.StudentListSQL"%>
<%@page import="com.model.Student"%>


<%@ include file ="kullanicitipi.jsp" %>
<%@ include file="sessioncontrol.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="head.jsp" %>
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
            <h1>Öğrenci Bilgi</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Anasayfa</a></li>
                    <li class="breadcrumb-item active"><%= (String) session.getAttribute("role")%></li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <div class="card-body">
            <h5 class="card-title">Default List Group</h5>
            <%
                StudentListSQL veriIsleme = new StudentListSQL();
                ArrayList<Student> veriListesiStudent = veriIsleme.StudentGet();
                int a = 0;
            %>
            <!-- Default List group -->

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">İsim Soyisim</th>
                        <th scope="col">Fakülte</th>
                        <th scope="col">Bölüm</th>
                        <th scope="col">Sınıf</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Student veri : veriListesiStudent) {%>                
                    <tr>
                        <th scope="row"><%= ++a %></th>
                        <td><%= veri.getName()%></td>
                        <td><%= veri.getFaculty()%></td>
                        <td><%= veri.getDepartment()%></td>
                        <td><%= veri.getLevel()%></td>
                    </tr>                   
                    <% }%>
                </tbody>
            </table>    
            
        </div>
        <!-- Bootstrap JS ve Popper.js -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
