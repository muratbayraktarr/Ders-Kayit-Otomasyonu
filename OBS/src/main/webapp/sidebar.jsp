<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%  try {


%>
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="index.jsp">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <!-- End Components Nav -->
        <% if (roleViews == 1) {%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>Öğrenci</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="ders-ekle-ogrenci.jsp">
                        <i class="bi bi-circle"></i><span>Ders Seçimi</span>
                    </a>
                </li>
                <li>
                    <a href="dersprogrami.jsp">
                        <i class="bi bi-circle"></i><span>Ders Programı</span>
                    </a>
                </li>
                <li>
                    <a href="forms-editors.html">
                        <i class="bi bi-circle"></i><span>Bölüm Ders Programı</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="sifredegis.jsp">
                        <i class="bi bi-circle"></i>
                        <span>Şifre Değiştir</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->
        <% } else if (roleViews == 2) { %>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>Öğretmen</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="forms-elements.html">
                        <i class="bi bi-circle"></i><span>Ders Seçimi</span>
                    </a>
                </li>
                <li>
                    <a href="forms-layouts.html">
                        <i class="bi bi-circle"></i><span>Ders Programı</span>
                    </a>
                </li>
                <li>
                    <a href="forms-editors.html">
                        <i class="bi bi-circle"></i><span>Bölüm Ders Programı</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="sifredegis.jsp">
                        <i class="bi bi-circle"></i>
                        <span>Şifre Değiştir</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->
        <% } else if (roleViews == 3) { %>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-gem"></i><span>Admin</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">

                <li>
                    <a href="ogrencilistele.jsp">
                        <i class="bi bi-circle"></i><span>Öğrencileri Listele</span>
                    </a>
                </li>
                <li>
                    <a href="ogretmenlerilistele.jsp">
                        <i class="bi bi-circle"></i>
                        <span>Öğretmenleri Listele</span>
                    </a>
                </li>
                <li>
                    <a href="lessonAdd.jsp">
                        <i class="bi bi-circle"></i><span>Ders İşlemleri</span>
                    </a>
                </li>
                <li>
                    <a href="ders-sil-admin.jsp">
                        <i class="bi bi-circle"></i><span>Ders Kayıt İşlemleri</span>
                    </a>
                </li>
                <li>
                    <a href="departmentAdd.jsp">
                        <i class="bi bi-circle"></i><span>Bölüm İşlemleri</span>
                    </a>
                </li

                <li>
                    <a href="pages-register.jsp">
                        <i class="bi bi-circle"></i>
                        <span>Yetkili Kayıt</span>
                    </a>
                </li>
                <li >
                    <a href="ogrenci-register.jsp">
                        <i class="bi bi-circle"></i>
                        <span>Öğrenci Kayıt</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="sifredegis.jsp">
                        <i class="bi bi-circle"></i>
                        <span>Şifre Değiştir</span>
                    </a>
                </li>

                <!-- End Register Page Nav -->
            </ul>
        </li><!-- End Icons Nav -->
        <% }%>


    </ul>

</aside>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }

%>