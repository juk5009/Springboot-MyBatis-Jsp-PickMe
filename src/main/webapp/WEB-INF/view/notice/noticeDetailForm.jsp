<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
  <!-- main 소스 -->
  <main id="main">
    
    <!-- start 이력서 폼 -->

    <!-- 이력서(title) -->
    <div id="my-resumeForm-title-box-1" class="container">
      <div class="py-5 text-center">
        
        <h2>공고 상세보기</h2>
      </div>
    </div>

    <!-- 공고(기업정보) -->
    <div class="my-resumeForm-content-box-1" >
      <div id="my-resumeForm-content-box-2 " class="container">
        <div class="border border-primary col-md-7 col-lg-6 justify-content-center">
          <h4 class="mb-3 ">공고정보</h4>

          <form id="my-resumeForm-content-form-1" novalidate>
            
            <div class="row g-3">
              
              <!-- 공고정보(제목) -->
              <div class="col-sm-6">
                <label for="firstName" class="form-label">제목</label>
                <div>${noticeDto.noticeTitle}</div>
    
              </div>
              
              <!-- 공고정보(기업명) -->
              <div class="col-sm-6">
                <label for="noticeNoticename" class="form-label">기업명</label>
                <div>${noticeDto.noticeCompanyname}</div>
    
              </div>

              <!-- 공고정보(경력) -->
              <div class="col-sm-6">
                <label for="noticeCareer" class="form-label">경력</label>
                <div>${noticeDto.noticeCareer}</div>
              </div>
            
            <!-- 공고정보(급여) -->
            <div class="col-12">
              <label for="user-phoneNumber" class="form-label">급여</label>
                <div>${noticeDto.noticePay}</div>
            </div>

            <!-- 공고정보(근무형태) -->
            <div class="col-12">
              <label for="user-email" class="form-label">근무형태 </label>
                <div>${noticeDto.noticeEmploytype}</div>
            </div>

            <!-- 개인정보(학력) -->
            <div class="col-sm-6">
              <label for="user-grade" class="form-label">학력</label>
                <div>${noticeDto.noticeGrade}</div>
            </div>


            <!-- 공고정보(근무지역) -->
            <div class="col-12">
              <label for="user-address" class="form-label">근무지역</label>
                <div>${noticeDto.noticeLocation}</div>
            </div>                     
                      
           
              
               <hr class="my-2"> <!-- 구분선 -->
              
              <!-- 자기소개서 -->
              <div class="container my-8">
                  <div>
                    <h4 class="mb-3 ">자기소개서</h4>
                  </div>
                  <br>
                  <div class="form-group">
                    <div>${noticeDto.noticeContent}</div>
                  </div>
              </div>

              <hr class="my-2"> <!-- 구분선 -->
              
              <!-- 보유 기술 --> 
              <h4 class="mb-3">보유 기술</h4>

              <div class="my-resumeForm-skill-box-1 d-flex" ">
                <span class="badge text-bg-success" style="margin-right: 10px">Java</span>
                <span class="badge text-bg-success" style="margin-right: 10px">JavaScript</span>
                <span class="badge text-bg-success" style="margin-right: 10px">Spring</span>
              </div>
              <hr class="my-4">
            </div>

            
            <div class="mb-3">
            <a href="/notice/${noticeDto.id}/updateNoticeForm" class="btn btn-warning">수정</a>
            <button type="button" onclick="deleteById(${noticeDto.id})" class="btn btn-danger">삭제</button>
            </div>

          </form>
        </div>
      </div>
    </div>
<!-- End 공고 폼  -->

  </main><!-- End #main -->
  <br>
  <br>

<!-- 공고 스크립트 -->
  <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
  <script src="form-validation.js"></script>

  <!-- 공고 스크립트 끝 -->

  <!-- 공고 삭제 스크립트 -->
  <script>
    function deleteById(id) {
        $.ajax({
            type: "delete",
            url: "/notice/" + id,
            dataType: "json"
        }).done((res) => { // 20X 일때
            alert(res.msg);
            location.href = "/";
        }).fail((err) => { // 40X, 50X 일때
            alert(err.responseJSON.msg);
        });
    }
    </script>

    <!-- 공고 삭제 스크립트 끝 -->

        <%@ include file="../layout/footer.jsp" %>