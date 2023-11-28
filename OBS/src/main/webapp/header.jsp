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
          <div class="col-lg-6">
  
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal"  style="background-color: transparent; border-color: transparent; color:black;">
          <%= (String) session.getAttribute("name") %>
          </button >
          <div class="modal fade" id="basicModal" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Basic Modal</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  öğrenci Bilgileri
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