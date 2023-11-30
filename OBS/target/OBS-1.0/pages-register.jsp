<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
                                        <h5 class="card-title text-center pb-0 fs-4">Yeni Kullanıcı Kayıt Et</h5>
                                    </div>

                                    <form action="user-register.jsp" method="POST" class="row g-3 needs-validation" novalidate>
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
                                            <div class="col-12">
                                                <div class="col-12" id="userRole">
                                                    <label for="userRole" class="col-sm-10 col-form-label">Kullanıcı Tipi</label>
                                                    <select class="form-select" name="userrole" aria-label="Default select example" required onchange="handleUserRoleChange()">
                                                        <option selected disabled>Kullanıcı Tipi Seçiniz</option>
                                                        <option value="Öğrenci">Öğrenci</option>
                                                        <option value="Öğretmen">Öğretmen</option>
                                                        <option value="Admin">Admin</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-12" id="additionalInputs" style="display:none;">
                                                <br>
                                                <input type="text" name="bolum" class="form-control" id="yourInput1" required/><br>
                                                <input type="text" name="level" class="form-control" id="yourInput2" required/>
                                            </div>
                                            <br>
                                            <div class="col-12">
                                                <button class="btn btn-primary w-100" disabled type="submit">Create Account</button>
                                            </div>

                                    </form>
                                    <script>
                                        // Kullanıcı tipi seçildiğinde çağrılacak fonksiyon
                                        function handleUserRoleChange() {
                                            var userRoleSelect = document.querySelector("select[name='userrole']");
                                            var createAccountButton = document.querySelector("button[type='submit']");
                                            var additionalInputs = document.getElementById("additionalInputs");

                                            if (userRoleSelect.value === "Öğrenci") {
                                                createAccountButton.removeAttribute("disabled");
                                                additionalInputs.style.display = "block";
                                            } else {
                                                additionalInputs.style.display = "none";
                                                
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