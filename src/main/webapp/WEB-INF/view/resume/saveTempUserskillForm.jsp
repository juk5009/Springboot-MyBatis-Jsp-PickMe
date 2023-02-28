<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- main 소스 -->
    <main id="main">

      <!-- start 이력서 폼 -->

      <!-- 이력서(title) -->
      <div id="my-resumeForm-title-box-1" class="container">
        <div class="py-5 text-center">

          <h2>유저 보유 기술 작성</h2>
        </div>
      </div>

      <!-- 이력서(개인정보) -->
      <div class="my-resumeForm-content-box-1">
        <div id="my-resumeForm-content-box-2" class="container">
          <div class="col-md-7 col-lg-6 justify-content-center">

          
                <!-- 보유 기술 -->
              <div class="temp-box">
                <h4 class="mb-3">보유 기술</h4>
                <small>보유한 기술을 선택</small>
                <form id="my-userskillFrom-1" novalidate>
                  <div class="my-resumeForm-skill-box-1 d-flex">
                    <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck1">Java</label>

                    <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck2">JavaScript</label>

                    <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck3">Spring</label>

                    <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck4">Jsp</label>

                    <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck5">React</label>

                    <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck6">Flutter</label>
                  </div>
                  
                  <div class="my-resumeForm-submit-btn-1 mycol-md-12">
                    <button class="w-100 btn btn-primary btn-lg" onclick="saverUserskill()" type="button">보유기술 등록</button>
                  </div>
                </form>
                <hr class="my-4">
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


    <script>
      function saverUserskill() {
        let data = {
       
          "resumeContent": $("#resumeContent").val()
        };

        $.ajax({
          type: "post",
          url: "/saveUserskill",
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