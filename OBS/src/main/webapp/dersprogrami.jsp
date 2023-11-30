<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file ="kullanicitipi.jsp" %>
<%@ include file="sessioncontrol.jsp" %>


<!DOCTYPE html>
<html>
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
          <li class="breadcrumb-item active"><%= (String) session.getAttribute("role") %></li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    <table class="table table-bordered border-primary" name = "DersProgrami">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Ders</th>
                    <th scope="col">Dersi Veren</th>
                    <th scope="col">Derslik</th>
                    <th scope="col">Ders Saati</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>28</td>
                    <td>2016-05-25</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>35</td>
                    <td>2014-12-05</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Ashleigh Langosh</td>
                    <td>Finance</td>
                    <td>45</td>
                    <td>2011-08-12</td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td>Angus Grady</td>
                    <td>HR</td>
                    <td>34</td>
                    <td>2012-06-11</td>
                  </tr>
                  <tr>
                    <th scope="row">5</th>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>47</td>
                    <td>2011-04-19</td>
                  </tr>
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

