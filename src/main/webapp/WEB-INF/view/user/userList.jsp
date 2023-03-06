<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>


    <main id="main">

      

      <!-- ======= userList 공고 목록 ======= -->
      <section id="featured-services" class="featured-services">
        <div class="container" data-aos="fade-up">
          <div class="row">

            <c:forEach items="${userList}" var="userList">
              <div class="col-md-6 col-lg-3 mb-5">
                <div class="card" data-aos="fade-up" data-aos-delay="200">
                  <img src="${userList.userProfile}" class="card-img-top" style="object-fit: cover; height: 55%;" alt=" lg">
                  <a href="/resume/${userList.id}">
                    <div class="card-body">
                      <h5 class="card-title description" style="font-size: 24px;">${userList.resumeUsername}</h5><br>
                      <p class="card-text description">${userList.resumeCareer}</p>
                      <p class="card-text description">${userList.resumeGrade}</p>
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