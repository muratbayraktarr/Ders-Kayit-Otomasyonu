<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html class="h-100" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Login</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
        <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
        <link href="css/style.css" rel="stylesheet">

            </head>

            <body class="h-100">

                <!--*******************
                    Preloader start
                ********************-->
            <div id="preloader">
                <div class="loader">
                    <svg class="circular" viewBox="25 25 50 50">
                    <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
                    </svg>
                </div>
            </div>
            <!--*******************
                Preloader end
            ********************-->





            <div class="login-form-bg h-100">
                <div class="container h-100">
                    <div class="row justify-content-center h-100">
                        <div class="col-xl-6">
                            <div class="form-input-content">
                                <div class="card login-form mb-0">
                                    <div class="card-body pt-5">
                                        <a class="text-center" href="index.html"> </a>
                                        <h4>Kullanıcı Giriş</h4>

                                        <form action="" class="mt-5 mb-5 login-input" method="POST" >
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Kullanıcı Adı" name="username">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" placeholder="Şifre" name="password">
                                            </div>
                                            <button class="btn login-form__btn submit w-100">Giriş Yap</button>
                                        </form>
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
                                                        %>
                                                        <script>
                                                            setTimeout(function() {
                                                                window.location.href = "user-login.jsp"; // Yönlendirilmek istediğiniz sayfanın adını buraya yazın
                                                            }, 3000); // 3 saniye (3000 milisaniye) sonra yönlendirme yapacak
                                                        </script>
                                                        <%
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
                                                    if (conn != null) {
                                                        try {
                                                            conn.close();
                                                        } catch (SQLException e) {
                                                            e.printStackTrace();
                                                        }
                                                    }
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <!--**********************************
                Scripts
            ***********************************-->
            <script src="plugins/common/common.min.js"></script>
            <script src="js/custom.min.js"></script>
            <script src="js/settings.js"></script>
            <script src="js/gleek.js"></script>
            <script src="js/styleSwitcher.js"></script>
            </body>
            </html>





