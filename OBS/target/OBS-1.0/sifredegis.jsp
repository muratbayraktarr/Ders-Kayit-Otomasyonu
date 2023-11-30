<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="kullanicitipi.jsp" %>
<%@ include file="sessioncontrol.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%@ include file="sidebar.jsp" %>
        <br><br><br>
    <div class="container mt-5" name = "sifreDegistir">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Şifre Değiştirme</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="sifredegis2.jsp">
                            <div class="form-group">
                                <label for="currentPassword">Mevcut Şifre:</label>
                                <input type="password" class="form-control" name="currentPassword" required>
                            </div>

                            <div class="form-group">
                                <label for="newPassword">Yeni Şifre:</label>
                                <input type="password" class="form-control" name="newPassword" required>
                            </div>

                            <div class="form-group">
                                <label for="confirmNewPassword">Yeni Şifre (Tekrar):</label>
                                <input type="password" class="form-control" name="confirmNewPassword" required>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary btn-block">Şifreyi Değiştir</button>
                        </form>
                    </div>

                    <%-- Şifre değiştirme sonuçlarını göstermek için bölüm --%>
                    <div class="card-footer">
                        <% String message = (String) session.getAttribute("message"); %>
                        <% if (message != null) {%>

                        <div class="alert alert-info alert-dismissible fade show" role="alert">
                            <i class="bi bi-info-circle me-1"></i>
                            <%= message%>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>


                        <%
                            message = null;
                            session.removeAttribute("message");
                        %>

                        <% }%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS ve Popper.js -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.umd.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
