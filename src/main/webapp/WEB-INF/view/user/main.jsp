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
        <div class="carousel-inner">
          <div class="carousel-item active">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
              aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
              <rect width="100%" height="100%" fill="#777" />
            </svg>
            <div class="container">
              <div class="carousel-caption text-start">
                <h1>Example headline.</h1>
                <p>Some representative placeholder content for the first slide of the carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
              aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
              <rect width="100%" height="100%" fill="#777" />
            </svg>
            <div class="container">
              <div class="carousel-caption">
                <h1>Another example headline.</h1>
                <p>Some representative placeholder content for the second slide of the carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
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
                <h1>One more for good measure.</h1>
                <p>Some representative placeholder content for the third slide of this carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
              </div>
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
      <!-- main 슬라이드 쇼 끝 -->

      <!-- ======= main 공고 목록 ======= -->
      <section id="featured-services" class="featured-services">
        <div class="container" data-aos="fade-up">
          <div class="row">

            <c:forEach items="${noticeMainList}" var="noticeMain">
              <div class="col-md-6 col-lg-3 mb-5">
                <div class="card" data-aos="fade-up" data-aos-delay="200">
                  <img src="/images/lg.jpg" class="card-img-top" style="object-fit: cover; height: 55%;" alt=" lg">
                  <a href="/notice/${noticeMain.id}">
                    <div class="card-body">
                      <h5 class="card-title description" style="font-size: 24px;">${noticeMain.companyName}</h5><br>
                      <p class="card-text description">${noticeMain.noticeTitle}</p>
                    </div>
                  </a>
                </div>
              </div>
            </c:forEach>

          </div>
        </div>
      </section>
      <!-- main 공고 목록 끝 -->


    </main><!-- End #main -->

    <%@ include file="../layout/footer.jsp" %>