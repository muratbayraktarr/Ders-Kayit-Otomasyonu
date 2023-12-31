<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page import="com.sqlKomutlari.Login" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="kullanicitipi.jsp" %>

<%  try {
        if (roleViews != 0) {
            response.sendRedirect("index.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
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
                                        <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                        <p class="text-center small">Enter your username & password to login</p>
                                    </div>

                                    <form action="" method="POST" class="row g-3 needs-validation" novalidate>

                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Username</label>
                                            <div class="input-group has-validation">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                <input type="text" name="username" class="form-control" id="yourUsername" required  maxlength="50">
                                                    <div class="invalid-feedback">Please enter your username.</div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Password</label>
                                            <input type="password" name="password" class="form-control" id="yourPassword" required  maxlength="255">
                                                <div class="invalid-feedback">Please enter your password!</div>
                                        </div>


                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Login</button>
                                        </div>

                                    </form>
                                    <br/>
                                    <%
                                        if (request.getMethod().equalsIgnoreCase("POST")) {
                                            String username = request.getParameter("username");
                                            String password = request.getParameter("password");

                                            Login login = new Login();
                                            String message = login.loginRequest(username, password);

                                            if (login.getDurum()) {
                                                session.setAttribute("user_id", login.getId());
                                                session.setAttribute("username", username);
                                                session.setAttribute("name", login.getName());
                                                session.setAttribute("role", login.getUserrole());
                                                session.setAttribute("password", password);
                                                Cookie roleCookie = new Cookie("role", login.getUserrole());
                                                roleCookie.setMaxAge(3600);
                                                response.addCookie(roleCookie);

                                                System.out.println(login.getName());
                                                System.out.println(login.getUserrole());
                                                if (login.getUserrole().equals("Öğrenci")) {
                                                    session.setAttribute("department", login.getDepartment());
                                                    session.setAttribute("level", login.getLevel());
                                                }
                                    %> 
                                    <div class="alert alert-success bg-success text-light border-0 alert-dismissible fade show" role="alert">
                                        Girişiniz başarılı, yönlendiriliyorsunuz...
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                    <script>
                                        setTimeout(function () {
                                            window.location.href = "index.jsp";// Yönlendirilmek istediğiniz sayfanın adını buraya yazın
                                        }, 1000); // 1 saniye (1000 milisaniye) sonra yönlendirme yapacak
                                    </script>
                                    
                                    <!--burada else gelecek-->
                                    
                                    <%
                                            }
                                            else{
                                            %> 
                                                <div class="alert alert-danger bg-danger text-light border-0 alert-dismissible fade show" role="alert">
                                                    Kullanıcı Adı ya da Şifre Yanlış.
                                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                            <%
                                            }
                                        }
                                    %>

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

<%
    } catch (Exception e) {
        e.printStackTrace();
    }

%>