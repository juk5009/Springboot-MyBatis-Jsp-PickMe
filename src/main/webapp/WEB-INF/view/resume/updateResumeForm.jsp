<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- main 소스 -->
    <main id="main">

      <!-- start 이력서 폼 -->

      <!-- 이력서(title) -->
      <div id="my-resumeForm-title-box-1" class="container">
        <div class="py-5 text-center">

          <h2>이력서 수정</h2>
        </div>
      </div>

      <!-- 이력서(개인정보) -->
      <div class="my-resumeForm-content-box-1">
        <div id="my-resumeForm-content-box-2" class="container">
          <div class="col-md-7 col-lg-6 justify-content-center">
            <h4 class="mb-3 ">개인정보</h4>

            <form id="my-resumeForm-content-form-1">
              <div class="row g-3">

                <!-- 개인정보(이름) -->
                <div class="col-sm-6">
                  <label for="firstName" class="form-label">이름</label>
                  <input type="text" class="form-control" id="resumeUsername" name="resumeUsername" placeholder="ex) 홍길동"
                    value="${resume.resumeUsername}"  required>

                </div>

                <!-- 개인정보(생년월일) -->
                <div class="col-sm-6">
                  <label for="firstName" class="form-label">생년월일</label>
                  <input type="text" class="form-control" id="resumeBirth" name="resumeBirth"
                    placeholder="ex) 1991-03-01" value="${resume.resumeBirth}" required>
                </div>


                <!-- 개인정보(전화번호) -->
                <div class="col-12">
                  <label for="user-phoneNumber" class="form-label">전화번호</label>
                  <div class="input-group has-validation">
                    <input type="text" class="form-control" id="resumePhoneNumber" name="resumePhoneNumber"
                      placeholder="ex) 010-1234-5678" value="${resume.resumePhoneNumber}" required>
                  </div>
                </div>

                <!-- 개인정보(email) -->
                <div class="col-12">
                  <label for="user-email" class="form-label">Email </label>
                  <input type="email" class="form-control" id="resumeEmail" name="resumeEmail"
                    placeholder="ex) ssar1234@example.com" value="${resume.resumeEmail}">
                </div>

                <!-- 개인정보(주소) -->
                <div class="col-12">
                  <label for="user-address" class="form-label">주소</label>
                  <input type="text" class="form-control" id="resumeAddress" name="resumeAddress"
                    placeholder="ex) 서울특별시 성동구 연무장 15길 11 " value="${resume.resumeAddress}" required>
                </div>

                <!-- 개인정보(희망근무지역?) -->
                <div class="col-sm-6">
                  <label for="user-local" class="form-label">희망근무지역?</label>
                  <select class="form-select" id="resumeLocation" name="resumeLocation" value="${resume.resumeLocation}" required>
                    <option value="">희망근무지역을 선택해주세요</option>
                    <option>서울</option>
                    <option>부산</option>
                    <option>대전</option>
                    <option>대구</option>
                    <option>광주</option>
                    <option>인천</option>
                  </select>
                </div>

                <!-- 개인정보(학력) -->
                <div class="col-sm-6">
                  <label for="user-grade" class="form-label">학력</label>
                  <select class="form-select" id="resumeGrade" name="resumeGrade" value="${resume.resumeGrade}" required>
                    <option value="">학력을 선택해주세요</option>
                    <option>전문학사</option>
                    <option>학사</option>
                    <option>석사</option>
                  </select>
                </div>

                <!-- 공고정보(경력) -->
                <div class="col-sm-6">
                  <label for="my-saveNoticeForm-career" class="form-label">경력</label>
                  <input type="text" class="form-control" name="resumeCareer" id="resumeCareer" value="${resume.resumeCareer}" placeholder="ex) 신입" value="" required>

                </div>

                <!-- 개인정보(성별) 보류 -->
                <label for="user-sex" class="form-label">성별</label>

                <div class="my-3 d-flex">
                  <div class="my-resumeForm-sex-male-box-1 form-check">
                    <input id="resumeSex" name="resumeSex" type="radio" value="${resume.resumeSex}" class="form-radio-input" default="on" required
                      checked>&nbsp;&nbsp;
                    <label class="form-radio-label" for="user-sex-male">남</label>
                  </div>
                  <div class="my-resumeForm-sex-female-box-1 form-check">
                    <input id="resumeSex" name="resumeSex" type="radio" value="${resume.resumeSex}" class="form-radio-input" required>&nbsp;&nbsp;
                    <label class="form-radio-label" for="user-sex-female">여</label>
                  </div>
                </div>

                <%-- <div class="col-sm-6">
                  <label for="my-saveNoticeForm-grade"  class="form-label">성별</label>
                  <select class="form-select" value="" name="resumeSex" id="resumeSex" value="${resume.resumeSex}" required>
                    <option value="">성별을 선택해주세요.</option>
                    <option>남</option>
                    <option>여</option>
                    
                  </select>
                </div> --%>

                <hr class="my-2"> <!-- 구분선 -->

                <!-- 자기소개서 -->
                <div class="my-resumeForm-summernote container my-3">
                  <form class="mb-1">
                    <div>
                      <h4 class="mb-3 ">자기소개서</h4>
                      <small>사진 첨부 or 직접 작성</small>
                    </div>
                    <br>
                    <div class="form-group">
                      <textarea class="form-control summernote" rows="5" name="resumeContent"
                        id="resumeContent" value="${resume.resumeContent}"></textarea>
                    </div>

                  </form>
                </div>

                <hr class="my-2"> <!-- 구분선 -->

                <!-- 보유 기술 -->
                <h4 class="mb-3">보유 기술</h4>
                <small>보유한 기술을 선택</small>

                <div class="my-resumeForm-skill-box-1 d-flex">
                  <input type="checkbox" class="btn-check" id="btncheck1" name="userskillName" value="Java"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck1">Java</label>

                  <input type="checkbox" class="btn-check" id="btncheck2" name="userskillName" value="JavaScript"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck2">JavaScript</label>

                  <input type="checkbox" class="btn-check" id="btncheck3" name="userskillName" value="Spring"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck3">Spring</label>

                  <input type="checkbox" class="btn-check" id="btncheck4" name="userskillName" value="Jsp" autocomplete="off">
                  <label class="btn btn-outline-primary"  for="btncheck4">Jsp</label>

                  <input type="checkbox" class="btn-check" id="btncheck5" name="userskillName" value="React"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck5">React</label>

                  <input type="checkbox" class="btn-check" id="btncheck6" name="userskillName" value="Flutter"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck6">Flutter</label>
                </div>
                <hr class="my-4">
              </div>

              <!-- 이력서 등록 버튼  -->

              <div class="my-resumeForm-btn-1 mycol-md-12">
                <button class="w-100 btn btn-primary btn-lg" onclick="updateById(${resume.id})" type="button">이력서 수정</button>
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

 <script>
      function updateById(id) {

        var checkedValues = [];

      $('input:checkbox[name=userskillName]:checked').each(function (index) {
        checkedValues.push($(this).val());
      });
     
      console.log(checkedValues);
      let checkBoxValue =checkedValues.join();
        
        let data = {
          "resumeUsername": $("#resumeUsername").val(),
          "resumeBirth": $("#resumeBirth").val(),
          "resumeEmail": $("#resumeEmail").val(),
          "resumeAddress": $("#resumeAddress").val(),
          "resumeLocation": $("#resumeLocation").val(),
          "resumeCareer": $("#resumeCareer").val(),
          "resumeGrade": $("#resumeGrade").val(),
          "resumePhoneNumber": $("#resumePhoneNumber").val(),
          "resumeSex": $("input[name='resumeSex']:checked").val(),
          "resumeContent": $("#resumeContent").val(),
          "userskillList": checkBoxValue
        };

        $.ajax({
          type: "put",
          url: "/resume/" + id,
          data: JSON.stringify(data),
          contentType: "application/json; charset=utf-8",
          dataType: "json"
        }).done((res) => { // 20X 일때
          alert(res.msg);
          location.href = "/";
        }).fail((err) => {
          alert(err.responseJSON.msg);
        });
      }
    </script>


    <script>
      $('.summernote').summernote({
        tabsize: 2,
        height: 400
      });
    </script>
    <!-- 이력서 스크립트 끝 -->

    <%@ include file="../layout/footer.jsp" %>