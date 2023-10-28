<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Yeni Kullanıcı Kayıt Ekranı</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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
                                       
                                    <%
                                        Connection conn = null;
                                        String successMessage = "";
                                        String errorMessage = "";
                                        if (request.getMethod().equalsIgnoreCase("POST")) {
        

                                        
                                        try {
                                            conn = MySQLVeritabaniBaglantisi.baglantiyiAl();
                                            // Veritabanı işlemlerini burada gerçekleştirin.
                                            if (conn != null && !conn.isClosed()) {
                                                System.out.println("Başarılı");
                                                String name = request.getParameter("name");
                                                String username = request.getParameter("username");
                                                String email = request.getParameter("email");
                                                String password = request.getParameter("password");
                                                String userrole = request.getParameter("userrole");

                                                String insertSQL = "INSERT INTO users (AdSoyad, KullaniciAdi, EPosta, Parola, KullaniciTipi) VALUES (?, ?, ?, ?, ?)";

                                                PreparedStatement statement = conn.prepareStatement(insertSQL);
                                                statement.setString(1, name);
                                                statement.setString(2, username);
                                                statement.setString(3, email);
                                                statement.setString(4, password);
                                                statement.setString(5, userrole);
                                                int rowsInserted=0;
                                                
                                                try
                                                {
                                                    rowsInserted = statement.executeUpdate();
                                                    System.out.println(rowsInserted);
                                                }
                                                catch (Exception e) 
                                                {
                                                    rowsInserted=0;
                                                }
                                                
                                                if (rowsInserted > 0) {
                                                    successMessage = "<div class=\"alert alert-success\">Veri Başarıyla Kaydedildi.</div>";
                                                    out.println(successMessage);
                                                } else {
                                                    errorMessage = "<div class=\"alert alert-danger\">Kaydetme işlemi başarısız.</div>";
                                                    out.println(errorMessage);
                                                    
                                                }
                                            }
                                            else {
                                                errorMessage = "<div class=\"alert alert-danger\">Bağlantı hatası: Bağlantı null veya kapalı.</div>";
                                                out.println(errorMessage);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                            errorMessage = "<div class=\"alert alert-danger\">Veritabanına kaydetme sırasında bir hata oluştu.</div>";
                                            out.println(errorMessage);

                                        } finally {
                                            MySQLVeritabaniBaglantisi.baglantiyiKapat();
                                        }
                                        }
                                    %>
                                    
                                        <a href="page-register.jsp" >
                                            <button class="btn login-form__btn submit w-100">Yeni Kullanıcı Kayıt Et</button>
                                        </a>
                                   

                                    </div>
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





