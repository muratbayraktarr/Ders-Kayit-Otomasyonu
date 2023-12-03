<%@page import="com.sqlKomutlari.LessonAndStudent"%>
<%@page import="com.model.LessonAndStudentModel"%>
<%@page import="com.model.Student"%>
<%@page import="com.sqlKomutlari.StudentListSQL"%>
<%@page import="com.model.Lesson"%>
<%@page import="com.sqlKomutlari.LessonSQL"%>
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

        <form action="ders-sil-admin.jsp" method="POST">

            <div class="row mb-3">
                <label class="col-sm-12 col-form-label">Aldığı dersleri listelemek istediğiniz öğrenciyi seçiniz :</label><br>
                <div class="col-sm-10">
                    <select class="form-select" name="student" id="student" aria-label="Default select example" >
                        <option selected disabled>Open this select menu</option>
                        <%
                            StudentListSQL veriIsleme = new StudentListSQL();
                            ArrayList<Student> veriListesiStudent = veriIsleme.StudentGet();
                            for (Student veri : veriListesiStudent) {


                        %>
                        <option value="<%= veri.getId()%>"><%= veri.getName()%></option>
                        <% } %>
                    </select>
                </div>
            </div>


            <div class="row mb-3">
                <div class="col-sm-6 d-flex">
                    <button type="submit" class="btn btn-primary ms-2">Listele</button>
                </div>
            </div>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                int SelectedStudent = Integer.parseInt(request.getParameter("student"));
                LessonAndStudent veriCek = new LessonAndStudent();
                ArrayList<LessonAndStudentModel> list = veriCek.Get(SelectedStudent);
                Cookie c = new Cookie("ListStudentId",Integer.toString(list.get(0).getStudentId()) );
                response.addCookie(c);
        %>
        <h2><%=  list.get(0).getStudentName()%></h2>
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

                    int a = 0;
                    for (LessonAndStudentModel veri : list) {
                %>
                <tr> 
                    <td><%= ++a%></td>
                    <td><%= veri.getCourseName()%></td>
                    <td>
                        <form action="ders-sil-admin-submit.jsp" method="post">
                            <input type="hidden" name="LessonId" value="<%= veri.getLessonId()%>">
                                <input type="hidden" name="StudentId" value="<%= veri.getStudentId()%>">              
                                    <input type="hidden" name="Id" value="<%= veri.getId()%>">       

                                        <button type="submit" class="btn btn-danger"><i class="ri-delete-bin-6-line"></i></button>

                                        </form>
                                        </td>
                                        </tr>
                                        <% }%>
                                        </tbody>

                                        </table>
                                        <% } %>
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