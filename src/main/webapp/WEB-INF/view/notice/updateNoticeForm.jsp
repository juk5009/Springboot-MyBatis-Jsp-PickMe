<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- main 소스 -->
    <main id="main">

      <!-- start 공고 작성 start -->

      <!-- 공고작성(title) -->
      <div id="my-saveNoticeForm-title-box-1" class="container">
        <div class="py-5 text-center">

          <h2>공고 수정</h2>
        </div>
      </div>

      <!-- 공고작성(공고정보) -->
      <div class="my-saveNoticeForm-content-box-1">
        <div id="my-saveNoticeForm-content-box-2" class="container">
          <div class="col-md-7 col-lg-6 justify-content-center">
            <h4 class="mb-3 ">공고 정보</h4>
            <form id="my-saveNoticeForm-content-form-1" >

              <div class="row g-3">

                <!-- 공고정보(제목) -->
                <div class="col-12">
                  <label for="my-saveNoticeForm-title" class="form-label">공고제목</label>
                  <div class="input-group has-validation">
                    <input type="text" class="form-control" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}" placeholder="제목을 입력해주세요"
                      required>
                  </div>
                </div>

                <!-- 공고정보(제목) -->
                <div class="col-12">
                  <label for="my-saveNoticeForm-noticeNoticename" class="form-label">기업명</label>
                  <div class="input-group has-validation">
                    <input type="text" class="form-control" name="noticeCompanyname" id="noticeCompanyname" value="${notice.noticeCompanyname}" placeholder="기업명을 입력해주세요"
                      required>
                  </div>
                </div>


                <!-- 공고정보(경력) -->
                <div class="col-sm-6">
                  <label for="my-saveNoticeForm-career" class="form-label">경력</label>
                  <input type="text" class="form-control" name="noticeCareer" id="noticeCareer" placeholder="ex) 신입" value="${notice.noticeCareer}" required>

                </div>

                <!-- 공고정보(급여) -->
                <div class="col-sm-6">
                  <label for="my-saveNoticeForm-pay"  class="form-label">급여</label>
                  <input type="text" class="form-control" name="noticePay" id="noticePay" placeholder="ex) 3000만원" value="${notice.noticePay}"
                    required>
                </div>


                <!-- 공고정보(근무형태) -->
                <div class="col-12">
                  <label for="my-saveNoticeForm-employtype" class="form-label">근무형태 </label>
                  <input type="text" class="form-control" name="noticeEmploytype" id="noticeEmploytype" value="${notice.noticeEmploytype}" placeholder="ex) 정규직">
                </div>                

                <div class="col-sm-6">
                  <label for="my-saveNoticeForm-grade"  class="form-label">근무지역</label>
                  <select class="form-select" value="" name="noticeLocation" id="noticeLocation" value="${notice.noticeLocation}" required>
                    <option value="">지역을 선택해주세요.</option>
                    <option>서울</option>
                    <option>부산</option>
                    <option>대전</option>
                    <option>대구</option>
                    <option>광주</option>
                    <option>인천</option>
                  </select>
                </div>


                <!-- 공고정보(학력) -->
                <div class="col-sm-6">
                  <label for="my-saveNoticeForm-grade"  class="form-label">학력</label>
                  <select class="form-select" value="" name="noticeGrade" id="noticeGrade" value="${notice.noticeGrade}" required>
                    <option value="">학력을 선택해주세요.</option>
                    <option>고등학교졸업</option>
                    <option>전문학사</option>
                    <option>학사</option>
                    <option>석사</option>
                  </select>
                </div>


                <hr class="my-2"> <!-- 구분선 -->

                <!-- 공고 상세 작성 -->
                <div class="my-saveNoticeForm-summernote container my-3">
                  <form class="mb-1">
                    <div>
                      <h4 class="mb-3 ">공고 상세 작성</h4>
                      <small>사진 첨부 or 직접 작성</small>
                    </div>
                    <br>
                    <div class="form-group">
                      <textarea class="form-control summernote" rows="5" name="noticeContent" id="noticeContent" value="${notice.noticeContent}" ></textarea>
                    </div>

                  </form>
                </div>

                <hr class="my-2"> <!-- 구분선 -->

                <!-- 보유 기술 -->
                <h4 class="mb-3">지원자 요구 기술</h4>
                <small>요구하는 기술을 선택</small>

                <div class="my-saveNoticeForm-skill-box-1 d-flex">
                  <input type="checkbox" class="btn-check" id="btncheck1" name="companyskillName" value="Java"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck1">Java</label>

                  <input type="checkbox" class="btn-check" id="btncheck2" name="companyskillName" value="JavaScript"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck2">JavaScript</label>

                  <input type="checkbox" class="btn-check" id="btncheck3" name="companyskillName" value="Spring"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck3">Spring</label>

                  <input type="checkbox" class="btn-check" id="btncheck4" name="companyskillName" value="Jsp" autocomplete="off">
                  <label class="btn btn-outline-primary"  for="btncheck4">Jsp</label>

                  <input type="checkbox" class="btn-check" id="btncheck5" name="companyskillName" value="React"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck5">React</label>

                  <input type="checkbox" class="btn-check" id="btncheck6" name="companyskillName" value="Flutter"
                    autocomplete="off">
                  <label class="btn btn-outline-primary" for="btncheck6">Flutter</label>
                </div>
                <hr class="my-4">
              </div>

              <!-- 공고작성 등록 버튼  -->

              <div class="my-saveNoticeForm-submit-btn-1 mycol-md-12">
                <button class="w-100 btn btn-lg" style="background-color:#7CC98A; color: #fff;" onclick="updateById(${notice.id})" type="button">공고 수정</button>
              </div>

            </form>
          </div>
        </div>
      </div>
      <!-- End 공고작성 폼  -->

    </main><!-- End #main -->
    <br>
    <br>

    <!-- 공고작성 스크립트 -->

    <script>
      function updateById(id) {

      var checkedValues2 = [];

      $('input:checkbox[name=companyskillName]:checked').each(function (index) {
        checkedValues2.push($(this).val());
      });
     
      console.log(checkedValues2);
      let checkBoxValue =checkedValues2.join();

        let data = {         
          "noticeCompanyname": $("#noticeCompanyname").val(),
          "noticeTitle": $("#noticeTitle").val(),
          "noticeCareer": $("#noticeCareer").val(),
          "noticePay": $("#noticePay").val(),
          "noticeEmploytype": $("#noticeEmploytype").val(),
          "noticeGrade": $("#noticeGrade").val(),
          "noticeLocation": $("#noticeLocation").val(),
          "noticeContent": $("#noticeContent").val(),
          "companyskillList": checkBoxValue
        };

        $.ajax({
          type: "put",
          url: "/notice/" + id,
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

    <script>
            
            function updateImage() {
                let profileForm = $("#profileForm")[0];
                let formData = new FormData(profileForm);

                $.ajax({
                    type: "put",
                    url: "/user/profileUpdate",
                    data: formData,
                    contentType: false, 
                    processData: false, 
                    enctype: "multipart/form-data",
                    dataType: "json" 
                }).done((res) => { 
                    alert(res.msg);
                    location.href = "";
                }).fail((err) => { 
                    alert(err.responseJSON.msg);
                });
            }

            function chooseImage(obj) {
                
                let f = obj.files[0];

                if (!f.type.match("image.*")) {
                    alert("이미지를 등록해야 합니다.");
                    return;
                }

                let reader = new FileReader();
                reader.readAsDataURL(f);

                
                reader.onload = function (e) {
                    console.log(e);
                    console.log(e.target.result);
                    $("#imagePreview").attr("src", e.target.result);
                }
            }
        </script>
    <!-- 공고작성 스크립트 끝 -->

    <%@ include file="../layout/footer.jsp" %>