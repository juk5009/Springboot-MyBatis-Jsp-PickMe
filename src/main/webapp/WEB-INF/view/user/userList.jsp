<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>


    <main id="main">
      <br />


      <!-- ======= userList 공고 목록 ======= -->
      <section id="featured-services" class="featured-services">
        <div class="container">

          <div class="container row " data-aos="fade-up">
            <h1>인재 목록</h1>
            <hr>
            <br>
            <br>

            <div class="my-mypage d-flex">
              <c:forEach items="${userList}" var="userList">
                <div class="col-md-6 col-lg-3 mb-5">
                  <div class="card" data-aos="fade-up" data-aos-delay="200">
                    <img src="${userList.userProfile}" class="card-img-top" style="object-fit: cover; height: 55%;"
                      alt=" lg">
                    <a href="/resume/${userList.id}">
                      <div class="card-body">
                        <p class="card-title description" style="font-size: 24px;">${userList.resumeUsername}</p><br>
                        <p class="card-text description" style="font-size: 18px;">경력 : ${userList.resumeCareer}</p>
                        <p class="card-text description" style="font-size: 18px;">학력 : ${userList.resumeGrade}</p>
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