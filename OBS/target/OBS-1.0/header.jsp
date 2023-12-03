<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="index.jsp" class="logo d-flex align-items-center">
            <img src="assets/img/logo.png" alt="">
                <span class="d-none d-lg-block">OBS</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->


    <nav class="header-nav ms-auto">
        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal"  style="background-color: transparent; border-color: transparent; color:black;">
                        <%= (String) session.getAttribute("name")%>
                    </button >
                    <div class="modal fade" id="basicModal" tabindex="-1" data-bs-backdrop="false">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"><%= (String) session.getAttribute("role")%> Bilgileri</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <% try {


                                    %>
                                    <h1><%= (String) session.getAttribute("name")%></h1>
                                    <% String role23 = (String) session.getAttribute("role"); %>
                                    <% if (role23.equals("Öğrenci")) {%>
                                    <h2><%= (String) session.getAttribute("department")%></h2>                                             
                                    <h4><%= (String) session.getAttribute("level")%>. Sınıf</h4>
                                    <% } %>
                                    <%
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <a href="logout.jsp"><button type="button" class="btn btn-danger" data-bs-dismiss="modal">Çıkış Yap</button></a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </nav><!-- End Icons Navigation -->

</header>
