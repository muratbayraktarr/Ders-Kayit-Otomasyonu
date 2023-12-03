<%@page import="com.model.Lesson"%>
<%@page import="com.sqlKomutlari.LessonSQL"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.sqlKomutlari.StudentListSQL"%>
<%@page import="com.model.Student"%>


<%@ include file ="kullanicitipi.jsp" %>
<%@ include file="sessioncontrol.jsp" %>

<%    try {
        if (roleViews == 1) {

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
            <h1>Ders Ekle</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Anasayfa</a></li>
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
    </div>
    <% } %>
    <div class="card-body">
        <div class="container">
            <h1 class="mt-5 mb-4">Ders Ekle</h1>

            <!-- Ders Ekle/Bırak Formu -->
            <form action="ders-ekle-ogrenci-submit.jsp" method="POST">
                <!-- Ders Listesi -->
                <div class="mb-3">
                    <label for="courseSelect" class="form-label">Ders Seç</label>

                    <select class="form-select" name="lesson" id="courseSelect">
                        <%
                            LessonSQL lesson = new LessonSQL();
                            ArrayList<Lesson> LessonList = lesson.getLesson();

                            for (Lesson veri : LessonList) {
                                if (veri.getLevel() == (Integer) session.getAttribute("level") && veri.getDepartment_id() == (Integer) session.getAttribute("department")) {

                        %>

                        <option value="<%= veri.getId()%>-<%= veri.getCapacity()%>-<%= veri.getMax_capacity()%>">
                            <%= veri.getName()%> - <%= veri.getCapacity()%>/<%= veri.getMax_capacity()%> - <%= veri.getInstructor()%> 

                        </option>



                        <%
                                }
                            }
                        %> 
                        <!-- Diğer dersler buraya eklenebilir -->
                    </select>


                </div>


                <!-- Gönder Butonu -->
                <button type="submit" class="btn btn-primary" ">
                    Gönder
                </button>
            </form>

        </div>



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
<%
        } else {
            response.sendRedirect("pages-error-404.jsp");

        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>