<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- main 소스 -->
    <main id="main">

      <!-- start 지원자 상세보기 폼 -->

      <!-- 지원자 상세보기(title) -->
      <div class="container">
        <br>
        <div class="py-4 text-center">

          <h2>지원자 상세보기</h2>
        </div>
      </div>

      <!-- 이력서(개인정보) -->
      <div class="my-mypage container" style="padding-left: 340px;">
        <div class="my-mypage-box col-md-8 pe-5" style="padding-left: 50px; padding-top: 40px;">
          <div id="my-resumeForm-content-box-2 " class="container">
            <h4 class="mb-3">개인정보</h4>
            <hr>

            <form id="my-resumeForm-content-form-1" novalidate>

              <div class="row g-3">

                <!-- 개인정보(이름) -->
                <div class="col-sm-6 d-flex">
                  <label for="firstName" class="form-label d-flex">이름&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumeUsername}
                    </p></label>
                  <div></div>

                </div>

                <!-- 개인정보(생년월일) -->
                <div class="col-sm-6">
                  <label for="firstName" class="form-label d-flex">생년월일&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumeBirth}
                    </p></label>
                </div>

                <!-- 개인정보(전화번호) -->
                <div class="col-12">
                  <label for="user-phoneNumber" class="form-label  d-flex">전화번호&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumePhoneNumber}
                    </p></label>
                </div>

                <!-- 개인정보(email) -->
                <div class="col-12">
                  <label for="user-email" class="form-label  d-flex">Email&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumeEmail}
                    </p></label>
                </div>

                <!-- 개인정보(주소) -->
                <div class="col-12">
                  <label for="user-address" class="form-label  d-flex">주소&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumeAddress}
                    </p></label>
                </div>

                <!-- 개인정보(희망근무지역?) -->
                <div class="col-sm-6">
                  <label for="user-local" class="form-label  d-flex">희망근무지역&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumeLocation}
                    </p></label>
                </div>

                <!-- 개인정보(학력) -->
                <div class="col-sm-6">
                  <label for="user-grade" class="form-label  d-flex">경력&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumeCareer}
                    </p></label>
                </div>
                <!-- 개인정보(학력) -->
                <div class="col-sm-6">
                  <label for="user-grade" class="form-label d-flex">학력&nbsp;| &nbsp;<p style="color: #4BB58F;">
                      ${resumeDto.resumeGrade}
                    </p></label>
                </div>
                

                <hr class="my-2"> <!-- 구분선 -->

                <!-- 자기소개서 -->
                <div class="container my-8">
                  <div>
                    <h3 class="mb-2">자기소개</h3>
                  </div>
                  <br>
                  <div class="form-group">
                    <div>${resumeDto.resumeContent}</div>
                  </div>
                </div>

                <hr class="my-2"> <!-- 구분선 -->

                <!-- 보유 기술 -->
                <h4 class="mb-3">보유 기술</h4>

              
              <div class="my-resumeForm-skill-box-1 d-flex">
                  <c:forEach items="${userskillDto}" var="userskill">
                    <span class="badge text-bg-success"
                      style="margin-right: 10px; font-weight: 200;">${userskill.userskillName}</span>
                  </c:forEach>
                </div>
                <hr class="my-4">
              </div>

              <div class="my-applyDetail-btn col-lg-4 mb-3 d-flex">
                  <button type="button" class="btn btn-primary" onclick="good()">합격!</button>
                  <button type="button" class="btn btn-danger" onclick="bad()">불합격</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!-- End 이력서 폼  -->

    </main><!-- End #main -->
    <br>
    <br>

    <!-- 이력서 스크립트 -->
    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>
    <script src="form-validation.js"></script>

    <!-- 이력서 스크립트 끝 -->

    <script>
      function good() {
        alert("합격 메세지가 전송되었습니다. \uD83D\uDC4D");
      }
      function bad() {
        alert("불합격 메세지가 전송되었습니다. \uD83D\uDC4E");
      }
    </script>

    <%@ include file="../layout/footer.jsp" %>