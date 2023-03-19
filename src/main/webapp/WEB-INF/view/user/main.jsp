<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>


    <main id="main">

      <!-- main 슬라이드 쇼 -->

      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true"
            aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner container d-flex">
          <div class="carousel-item active">
            <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
              aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
              <rect width="100%" height="100%" fill="#777" /> -->
            <img style="width: 100%; height: 100%; justify-content: center;" src="/images/company.jpg" alt="">
            <!-- </svg> -->
            <div class="container">
              <div class="carousel-caption text-start">
                <h1 style="color:black;">원하는 기업을 Pick</h1>
                <p><a class="btn btn-lg btn-success" href="/company/companyList">더 보기</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img style="width: 100%; height: 103%; justify-content: center;" src="/images/person1.jpg" alt="">
            <div class="container">
              <div class="carousel-caption">
                <h1 style="color:black;">원하는 인재를 Pick</h1>
                <p><a class="btn btn-lg btn-success" href="/user/userList">더 보기</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
              aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
              <rect width="100%" height="100%" fill="#777" />
            </svg>
            <div class="container">
              <div class="carousel-caption text-end">
                <h1 style="color:black;">추천 기업을 Pick</h1>
                <p><a class="btn btn-lg btn-success" href="user/userSkillMatchForm">더 보기</a></p>
              </div>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>

      <!-- main 슬라이드 쇼 끝 -->

      <!-- ======= main 공고 목록 ======= -->

      <div class="container">
        <section id="featured-services" class="featured-services">
          <div class="container" data-aos="fade-up">
            <div class="row">

              <c:forEach items="${noticeMainList}" var="noticeMain">
                <div class="col-md-6 col-lg-3 mb-5">
                  <div class="card" data-aos="fade-up" data-aos-delay="200">
                    <img src="${noticeMain.companyProfile}" class="card-img-top" style="object-fit: cover; height: 55%;"
                      alt=" lg">
                    <a href="/notice/${noticeMain.id}">
                      <div class="card-body">
                        <h5 class="card-title description" style="font-size: 22px; margin-bottom: 5px;">${noticeMain.noticeCompanyname}</h5>
                        <p class="card-text description" style="font-size: 18px; margin-bottom: 5px;">${noticeMain.noticeTitle}</p>
                      </div>
                    </a>
                  </div>
                </div>
              </c:forEach>

            </div>
          </div>
      </div>
      </section>
      <!-- main 공고 목록 끝 -->


    </main><!-- End #main -->

    <%@ include file="../layout/footer.jsp" %>