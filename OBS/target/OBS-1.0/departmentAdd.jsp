<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sqlKomutlari.DepartmentSQL" %>
<%@ page import="com.model.Department" %>


<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>



<%  try {
        if (roleViews != 3) {
            response.sendRedirect("pages-error-404.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
        }

%>

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
                    <li class="breadcrumb-item"><a href="">Bölüm İşlemleri</a></li>
                    <li class="breadcrumb-item active"><%= (String) session.getAttribute("role")%></li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <% String message = (String) session.getAttribute("message"); %>
        <% if (message != null) {%>

        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <i class="bi bi-info-circle me-1"></i>
            <%= message%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>


        <%
            message = null;
            session.removeAttribute("message");
        %>

        <% } %>

        <form action="departmentekle.jsp" method="POST">

            <div class="row mb-3">
                <label for="inputText" class="col-sm-2 col-form-label">Bölüm Adı :</label>
                <div class="col-sm-6 d-flex">
                    <input type="text" name ="department_name" class="form-control" required maxlength="50">
                        <button type="submit" class="btn btn-primary ms-2">Kaydet</button>
                </div>
            </div>
        </form>

        <!-- Table with stripped rows -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>

                </tr>
            </thead>
            <tbody>
                <%
                    DepartmentSQL veriIsleme = new DepartmentSQL();
                    ArrayList<Department> veriListesiDepartment = veriIsleme.DepartmentGet();
                    int a = 0;
                    for (Department veri : veriListesiDepartment) {
                %>
                <tr> 
                    <td><%= ++a%></td>
                    <td><%= veri.getName()%></td>             
                                    </tr>
                                    <% }%>
                                    </tbody>

                                    </table>
                                    <!-- End Table with stripped rows -->

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
                                    <%

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>