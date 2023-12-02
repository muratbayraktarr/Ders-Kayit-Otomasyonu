<%@page import="com.model.Lesson"%>
<%@page import="com.sqlKomutlari.LessonSQL"%>
<%@page import="com.model.Teacher"%>
<%@page import="com.sqlKomutlari.TeacherSQL"%>
<%@page import="com.model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sqlKomutlari.DepartmentSQL"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>



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
                    <li class="breadcrumb-item"><a href="index.html">Ders İşlemleri</a></li>
                    <li class="breadcrumb-item active"><%= (String) session.getAttribute("role")%></li>
                </ol>
            </nav>
        </div><!-- End Page Title -->
               
        <% String message = (String) session.getAttribute("message"); %>
            <% if (message != null) { %>
                
                  <div class="alert alert-info alert-dismissible fade show" role="alert">
                    <i class="bi bi-info-circle me-1"></i>
                    <%= message %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
                        
                             
                    <% 
                        message = null; 
                        session.removeAttribute("message");
                    %>
                </div>
            <% } %>
        <form action="lessonekle.jsp" method="POST">
            <div class="row mb-3">
                <label for="inputText" class="col-sm-2 col-form-label">Ders Adı :</label>
                <div class="col-sm-6 d-flex">
                    <input type="text" name="name" class="form-control">

                </div>
            </div>
            <div class="row mb-3">
                <label for="inputNumber" class="col-sm-2 col-form-label">Kapasite :</label>
                <div class="col-sm-10">
                    <input type="number" name="capacity" class="form-control">
                </div>
            </div>
            
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Bölüm :</label>
                <div class="col-sm-10">
                    <select class="form-select" name="department" aria-label="Default select example">
                        <option selected disabled>Open this select menu</option>
                        <%                    
                            DepartmentSQL veriIsleme = new DepartmentSQL();
                            ArrayList<Department> veriListesiDepartment = veriIsleme.DepartmentGet();
                            for (Department veri : veriListesiDepartment) {

                               
                        %>
                        <option value="<%= veri.getId() %>"><%= veri.getName() %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Eğitmen :</label>
                <div class="col-sm-10">
                    <select class="form-select" name="teacher" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <%                    
                            TeacherSQL veriIslemeTeacher = new TeacherSQL();
                            ArrayList<Teacher> veriListesiTeacher = veriIslemeTeacher.TeacherGet();
                            for (Teacher veri : veriListesiTeacher) {

                                
                        %>
                        <option value="<%= veri.getId() %>"><%= veri.getName() %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Gün :</label>
                <div class="col-sm-10">
                    <select class="form-select" name="day" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <option value="Pazartesi">Pazartesi</option>
                        <option value="Salı">Salı</option>
                        <option value="Çarşamba">Çarşamba</option>
                        <option value="Çarşamba">Perşembe</option>
                        <option value="Çarşamba">Cuma</option>

                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Saat :</label>
                <div class="col-sm-10">
                    <select class="form-select" name ="hours" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <option value="09:00-10:00">09:00-10:00</option>
                        <option value="10:00-11:00">10:00-11:00</option>
                        <option value="11:00-12:00">11:00-12:00</option>
                        <option value="12:00-13:00">12:00-13:00</option>
                        <option value="13:00-14:00">13:00-14:00</option>
                        <option value="14:00-15:00">14:00-15:00</option>
                        <option value="15:00-16:00">15:00-16:00</option>
                        <option value="16:00-17:00">16:00-17:00</option>
                        <option value="17:00-18:00">17:00-18:00</option>                        
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Seviye :</label>
                <div class="col-sm-10">
                    <select class="form-select" name="level" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <option value="1">1. Sınıf</option>
                        <option value="2">2. Sınıf</option>
                        <option value="3">3. Sınıf</option>
                        <option value="4">4. Sınıf</option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Sınıf :</label>
                <div class="col-sm-10">
                    <select class="form-select" name="class" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <option value="A101">A101</option>
                        <option value="A102">A102</option>
                        <option value="A103">A103</option>
                        <option value="C09">C09</option>
                        <option value="C10">C10</option>
                        <option value="C02">C02</option>                 

                    </select>
                </div>
            </div>

            <button type="submit" class="btn btn-primary ms-2">Kaydet</button>
        </form>
                    <br/>
        <!-- Table with stripped rows -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Ders Adı</th>
                    <th scope="col">Kapasite</th>
                    <th scope="col">Eğitmen</th>
                    <th scope="col">Gün / Saat</th>
                    <th scope="col">Sınıf</th>
                    <th scope="col">Düzey</th>
                    <th scope="col">Bölüm</th>                   
                </tr>
            </thead>
            <tbody>
                <% 
                    LessonSQL veriCek = new LessonSQL(); 
                    ArrayList<Lesson> LessonList = veriCek.getLesson();
                    for(Lesson lesson : LessonList)
                    {
                %>
                <tr>
                    <th scope="row"><%= lesson.getId() %></th>
                    <td><%= lesson.getName()%></td>
                    <td><%= lesson.getCapacity()%>/<%= lesson.getMax_capacity() %></td>
                    <td><%= lesson.getInstructor() %></td>
                    <td><%= lesson.getDay() %> / <%= lesson.getHours() %></td>
                    <td><%= lesson.getClassroom() %></td>
                    <td><%= lesson.getLevel() %>. Sınıf</td>
                    <td><%= lesson.getDepartment() %></td>
                    
                </tr>
                <% } %>
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
