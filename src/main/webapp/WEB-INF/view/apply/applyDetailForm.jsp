<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- main 소스 -->
    <main id="main">

      <!-- start 이력서 폼 -->

      <!-- 이력서(title) -->
      <div id="my-resumeForm-title-box-1" class="container">
        <div class="py-5 text-center">

          <h2>지원자 상세보기</h2>
        </div>
      </div>

      <!-- 이력서(개인정보) -->
      <div class="my-resumeForm-content-box-1">
        <div id="my-resumeForm-content-box-2 " class="container">
          <div class="border border-primary col-md-7 col-lg-6 justify-content-center">
            <h4 class="mb-3 ">개인정보</h4>

            <form id="my-resumeForm-content-form-1" novalidate>

              <div class="row g-3">

                <!-- 개인정보(이름) -->
                <div class="col-sm-6">
                  <label for="firstName" class="form-label">이름</label>
                  <input type="text" class="form-control" id="name" value="${resumeDto.resumeUsername}" readonly>

                </div>

                <!-- 개인정보(생년월일) -->
                <div class="col-sm-6">
                  <label for="firstName" class="form-label">생년월일</label>
                  <input type="text" class="form-control" id="age" value="${resumeDto.resumeBirth}" readonly>
                </div>


                <!-- 개인정보(전화번호) -->
                <div class="col-12">
                  <label for="user-phoneNumber" class="form-label">전화번호</label>
                  <div class="input-group has-validation">
                    <input type="text" class="form-control" id="user-phoneNumber" value="${resumeDto.resumePhoneNumber}"
                      readonly>
                  </div>
                </div>

                <!-- 개인정보(email) -->
                <div class="col-12">
                  <label for="user-email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="user-email" value="${resumeDto.resumeEmail}">
                </div>

                <!-- 개인정보(주소) -->
                <div class="col-12">
                  <label for="user-address" class="form-label">주소</label>
                  <input type="text" class="form-control" id="user-address" value="${resumeDto.resumeAddress}" readonly>
                </div>

                <!-- 개인정보(희망근무지역?) -->
                <div class="col-sm-6">
                  <label for="user-local" class="form-label">희망근무지역</label>
                  <input type="text" class="form-control" id="user-address" value="${resumeDto.resumeLocation}"
                    readonly>

                </div>

                <!-- 개인정보(학력) -->
                <div class="col-sm-6">
                  <label for="user-grade" class="form-label">경력</label>
                  <input type="text" class="form-control" id="user-address" value="${resumeDto.resumeCareer}" readonly>
                </div>

                <div class="col-sm-6">
                  <label for="user-grade" class="form-label">학력</label>
                  <input type="text" class="form-control" id="user-address" value="${resumeDto.resumeGrade}" readonly>
                </div>

                <hr class="my-2"> <!-- 구분선 -->

                <!-- 자기소개서 -->
                <div class="container my-8">
                  <div>
                    <h4 class="mb-3 ">자기소개서</h4>
                  </div>
                  <br>
                  <div class="form-group">
                    <textarea name="content" style="width: 480px;" id="content">
                      ${resumeDto.resumeContent}
                    </textarea>
                  </div>
                </div>

                <hr class="my-2"> <!-- 구분선 -->

                <!-- 보유 기술 -->
                <h4 class="mb-3">보유 기술</h4>

                <div class="my-resumeForm-skill-box-1 d-flex" ">
                <c:forEach items="${userskillDto}" var="userskill">
                <span class="badge text-bg-success" style="margin-right: 10px">${userskill.userskillName}</span>      
                </c:forEach>
                </div>
                <hr class="my-4">
              </div>
              <div class="my-applyDetail-btn">
                <div>
                  <button type="button" class="btn btn-success" onclick="good()">합격!</button>
                </div>
                <div>
                  <button type="button" class="btn btn-danger" onclick="bad()">불합격</button>
                </div>
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