<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
try {
    String userRole = (String) session.getAttribute("userrole");

    if (userRole != null && ((userRole.equals("Öğretmen") || userRole.equals("Öğrenci")))) {
    response.sendRedirect("index.jsp");
%>
<!-- Bu kısımda sayfanızın görüntülenmesi gereken HTML kodları olmalıdır -->
<%
    } else {
         // Kullanıcı yetkilendirilmemişse, login sayfasına yönlendirin
    }
} catch (Exception e) {
    // Hata durumunda burada hatayı işleyebilirsiniz, örneğin loglayabilir veya uygun bir hata sayfasına yönlendirebilirsiniz.
    e.printStackTrace(); // Hata mesajını konsola yazdırabilirsiniz
    response.sendRedirect("pages-login.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
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
                                                <input type="text" name="username" class="form-control" id="yourUsername" required>
                                                    <div class="invalid-feedback">Please enter your username.</div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Password</label>
                                            <input type="password" name="password" class="form-control" id="yourPassword" required>
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

                                                Connection conn = null;
                                                boolean isAuthenticated = false;
                                                String successMessage = "";
                                                String errorMessage = "";
                                                try {
                                                    conn = MySQLVeritabaniBaglantisi.baglantiyiAl();

                                                    String sql = "SELECT KullaniciTipi,AdSoyad FROM users WHERE KullaniciAdi = ? AND Parola = ?";
                                                    PreparedStatement statement = conn.prepareStatement(sql);
                                                    statement.setString(1, username);
                                                    statement.setString(2, password);

                                                    ResultSet resultSet = statement.executeQuery();

                                                    if (resultSet.next()) {
                                                        // Kullanıcı girişi başarılı
                                                        isAuthenticated = true;
                                                        String userrole = resultSet.getString("KullaniciTipi");
                                                        String name = resultSet.getString("AdSoyad");
                                                        session.setAttribute("username", username);
                                                        session.setAttribute("name", name);
                                                        session.setAttribute("userrole", userrole);
                                                        successMessage = "<div class=\"alert alert-success\">Kullanıcı Girişi Başarılı Yönlendiriliyorsunuz...</div>";
                                                        out.println(successMessage);
                                    
                                                    }else{
                                                        errorMessage = "<div class=\"alert alert-danger\">Kullanıcı Adı ya da Şifre Yanlış.</div>";
                                                        out.println(errorMessage);
                                                    }
                                                }
                                                catch (Exception e) {
                                                    e.printStackTrace();
                                                    errorMessage = "<div class=\"alert alert-danger\">Bağlantı Problemi !!</div>";
                                                    out.println(errorMessage);
                                                } finally {
                                
                                                    MySQLVeritabaniBaglantisi.baglantiyiKapat();
                                                    %>
                                                        <script>
                                                            setTimeout(function () {

                                                                window.location.href = "index.jsp"; // Yönlendirilmek istediğiniz sayfanın adını buraya yazın
                                                            }, 3000); // 3 saniye (3000 milisaniye) sonra yönlendirme yapacak
                                                        </script>
                                                    
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