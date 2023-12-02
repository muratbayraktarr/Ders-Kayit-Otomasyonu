<%@page import="com.model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sqlKomutlari.DepartmentSQL"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>

<%  try {
        if(roleViews != 3){
        response.sendRedirect("pages-error-404.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
    }    
    } catch (Exception e) {
    }
    
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ include file="head.jsp" %>
    </head>

    <body>

    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">


                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Yeni Öğrenci Kayıt Et</h5>
                                    </div>

                                    <form action="user-ogrenci-register.jsp" method="POST" class="row g-3 needs-validation" novalidate>
                                        <div class="col-12">
                                            <label for="yourName" class="form-label">İsim Soyisim</label>
                                            <input type="text" name="name" class="form-control" id="yourName" required maxlength="50">
                                                <div class="invalid-feedback">Please, enter your name!</div>
                                        </div>


                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Kullanıcı Adı</label>
                                            <div class="input-group has-validation">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                <input type="text" name="username" class="form-control" id="yourUsername" required maxlength="50">
                                                    <div class="invalid-feedback">Please choose a username.</div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Şifre</label>
                                            <input type="password" name="password" class="form-control" id="yourPassword" required maxlength="255">
                                                <div class="invalid-feedback">Please enter your password!</div>
                                        </div>

                                        
                                            
                                            <div class="col-12">
                                                <label for="department" class="form-label">Bölüm :</label>
                                                <select class="form-select" name="department" id ="department" aria-label="Default select example" onchange="handleUserRoleChange()">
                                                    <option selected disabled>Open this select menu</option>
                                                    <%
                                                        DepartmentSQL veriIsleme = new DepartmentSQL();
                                                        ArrayList<Department> veriListesiDepartment = veriIsleme.DepartmentGet();
                                                        for (Department veri : veriListesiDepartment) {


                                                    %>
                                                    <option value="<%= veri.getId()%>"><%= veri.getName()%></option>
                                                    <% }%>
                                                </select>
                                            </div>
                                        
                                                
                                        
                                                    
                                        
                                           
                                            <div class="col-12">
                                                <label  for="level" class="form-label">Seviye :</label>
                                                <select class="form-select" name="level" id="level" aria-label="Default select example" onchange="handleUserRoleChange()">
                                                    <option disabled selected>Open this select menu</option>
                                                    <option value="1">1. Sınıf</option>
                                                    <option value="2">2. Sınıf</option>
                                                    <option value="3">3. Sınıf</option>
                                                    <option value="4">4. Sınıf</option>
                                                </select>
                                            </div>
                                        

                                        <button class="btn btn-primary w-100" disabled type="submit">Create Account</button>
                                </div>

                                </form>
                                <script>
                                        // Kullanıcı tipi seçildiğinde çağrılacak fonksiyon
                                        function handleUserRoleChange() {
                                            var userDepartmentSelect = document.querySelector("select[name='department']");
                                            var userLevelSelect = document.querySelector("select[name='level']");
                                            
                                            var createAccountButton = document.querySelector("button[type='submit']");

                                            if (userDepartmentSelect.value != "Open this select menu" && userLevelSelect.value != "Open this select menu") {
                                                createAccountButton.disabled = false; // Admin veya Öğretmen seçildiğinde butonu etkinleştir
                                            } else {
                                                createAccountButton.disabled = true; // Diğer durumda butonu devre dışı bırak
                                            }
                                        }
                                    </script>
                            </div>
                        </div>


                    </div>
                </div>
        </div>

    </section>

</div>
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