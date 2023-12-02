<%@ page import="java.sql.*" %>
<%@ page import="com.db.MySQLVeritabaniBaglantisi" %>
<%@ page import="com.sqlKomutlari.addUser" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="sessioncontrol.jsp" %>
<%@ include file="kullanicitipi.jsp" %>

<%  try {
        if (roleViews != 3) {
            response.sendRedirect("pages-error-404.jsp"); // Hata sayfasına yönlendirme yapabilirsiniz
        }

%>
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

                                            <%                                        String Message = null;
                                                try {

                                                    if (request.getMethod().equalsIgnoreCase("POST")) {
                                                        try {
                                                            addUser a1 = new addUser();
                                                            String name = request.getParameter("name");
                                                            String username = request.getParameter("username");
                                                            String password = request.getParameter("password");
                                                            String userrole = request.getParameter("userrole");
                                                            Message = a1.userAdd(name, username, password, userrole);
                                            %>
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                <i class="bi bi-check-circle me-1"></i>
                                                <%= Message%>
                                            </div>
                                            <%
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                            Message = "<div class=\"alert alert-danger\">Veritabanına kaydetme sırasında bir hata oluştu.</div>";
                                                        }

                                                    } else {
                                                        Message = "<div class=\"alert alert-danger\">Kaydetme işlemi başarısız.</div>";
                                                        out.println(Message);

                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                    Message = "<div class=\"alert alert-danger\">Sayfa yuklenirken bir sorun olustu.</div>";
                                                }
                                            %>

                                            <a href="pages-register.jsp" >
                                                <button class="btn btn-primary rounded-pill w-100">Yeni Kullanıcı Kayıt Et</button>
                                            </a>
                                            <br/><br/>
                                            <a href="index.jsp" >
                                                <button class="btn btn-primary rounded-pill w-100">Anasayfa</button>
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


                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                %>


