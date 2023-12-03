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
          <li class="breadcrumb-item"><a href="index.jsp">Anasayfa</a></li>
          <li class="breadcrumb-item active"><%= (String) session.getAttribute("role") %></li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                     
                </div>

                <div class="card-body">
                  <h5 class="card-title">Aktif Akademik Dönem Bilgileri </h5>

                  <div class="d-flex align-items-center">    
                    <div class="ps-3">
                      <h6>2023-2024 </h6>
                      <span class="text-success small pt-1 fw-bold">Güz Dönemi</span> <span class="text-muted small pt-2 ps-1"></span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                     
                </div>

                <div class="card-body">
                  <h5 class="card-title">Danışman Bilgileri</h5>

                  <div class="d-flex align-items-center">
                    
                    <div class="ps-3">
                      <h6>Serdar Müldür</h6>
                      <span class="text-success small pt-1 fw-bold">Ahmet Anıl Müngen</span> 

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->
            <% if(roleViews == 1){%>
            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">

               <% 
                    DepartmentSQL d1 = new DepartmentSQL();
                    String departmentName = d1.DepartmentGetId((Integer) session.getAttribute("department"));
               %>
                <div class="card-body">
                  <h5 class="card-title"><%= departmentName %></h5>

                  <div class="d-flex align-items-center">
                    
                    <div class="ps-3">
                      <h6 style="font-size: 160%;"><%= (Integer) session.getAttribute("level") %>. Sınıf</h6>

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->
            <% } %>
          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

             <% 
                // Session'dan veri okuma
                    role = (String) session.getAttribute("role");
                    out.println("<h1>Session'dan Okunan Kullanıcı Rolü " + role + "</h1>");
            %>

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

  
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