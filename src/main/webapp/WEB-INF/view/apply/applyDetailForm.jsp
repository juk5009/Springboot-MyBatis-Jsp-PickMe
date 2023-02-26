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
    <div class="my-resumeForm-content-box-1" >
      <div id="my-resumeForm-content-box-2 " class="container">
        <div class="border border-primary col-md-7 col-lg-6 justify-content-center">
          <h4 class="mb-3 ">개인정보</h4>

          <form id="my-resumeForm-content-form-1" novalidate>
            
            <div class="row g-3">
              
              <!-- 개인정보(이름) -->
              <div class="col-sm-6">
                <label for="firstName" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" placeholder="홍길동" value="" readonly>
    
              </div>
              
              <!-- 개인정보(생년월일) -->
              <div class="col-sm-6">
                <label for="firstName" class="form-label">생년월일</label>
                <input type="text" class="form-control" id="age" placeholder="1991-03-01" value="" readonly>
              </div>
            
            
            <!-- 개인정보(전화번호) -->
            <div class="col-12">
              <label for="user-phoneNumber" class="form-label">전화번호</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="user-phoneNumber" placeholder="010-1234-5678" readonly>
              </div>
            </div>
            
            <!-- 개인정보(email) -->
            <div class="col-12">
              <label for="user-email" class="form-label">Email </label>
              <input type="email" class="form-control" id="user-email" placeholder="ssar1234@example.com">
            </div>
            
            <!-- 개인정보(주소) -->
            <div class="col-12">
              <label for="user-address" class="form-label">주소</label>
              <input type="text" class="form-control" id="user-address" placeholder="서울특별시 성동구 연무장 15길 11 " readonly>
            </div>
            
            <!-- 개인정보(희망근무지역?) -->
            <div class="col-sm-6">
              <label for="user-local" class="form-label">희망근무지역</label>
              <input type="text" class="form-control" id="user-address" placeholder="부산" readonly>
            
            </div>
            
            <!-- 개인정보(학력) -->
            <div class="col-sm-6">
              <label for="user-grade" class="form-label">학력</label>
              <input type="text" class="form-control" id="user-address" placeholder="학사" readonly>
            </div>
            
            <!-- 개인정보(성별) -->
            <label for="user-sex" class="form-label">성별</label>

            <div class="my-3 d-flex">
              <div class="my-resumeForm-sex-male-box-1 form-check">
                <input id="user-sex-male" type="radio" class="form-radio-input" default="on" required
                checked>&nbsp;&nbsp;
                <label class="form-radio-label" for="user-sex-male">남</label>
              </div>
              <div class="my-resumeForm-sex-female-box-1 form-check">
                <input id="user-sex-female" type="radio" class="form-radio-input" required>&nbsp;&nbsp;
                <label class="form-radio-label" for="user-sex-female">여</label>
              </div>
            </div>
              
               <hr class="my-2"> <!-- 구분선 -->
              
              <!-- 자기소개서 -->
              <div class="container my-8">
                  <div>
                    <h4 class="mb-3 ">자기소개서</h4>
                  </div>
                  <br>
                  <div class="form-group">
                    <textarea name="content" style="width: 480px;" id = "content">자기소개 (성장배경, 직장경력, 사회경험 등)
                      저는 올해 초등학교 6학년인 남자아이와 4학년인 여자아이를 자녀로 두고 있는 42살의 14년차 전업주부 OOO입니다.
                      
                      미국인과 결혼하신 이모 덕에 어려서부터 영어에 대한 관심이 많았고 영어공부도 좋아했습니다. 관련해서 더 깊이있게 공부하고 싶었지만 고3 시절 가정형편이 좋지 못한 사정으로 대학진학을 통한 공부의 꿈을 미루고 바로 취직을 하게 됐습니다. 이후 전업주부가 되기 전까지는 백화점에서 5년간 근무하며 판매왕, 친절왕으로 여러 번 뽑혔을 정도로 제 성격은 매사에 끈기가 있고 적극적이며, 주위 사람에게 친절한 편입니다.
                      
                      하루 대부분의 시간을 주로 남편과 아이들을 위해 사용하지만 평일 낮 시간, 주말시간을 활용해 틈틈이 새로운 일을 배우고 자기계발을 하려고 노력합니다. 이 결과 작년에는 앙금플라워자격증, 올해에는 네일아트자격증을 취득하였습니다. 아주 대단한 자격증도 아니고 당장 어떤 가게를 차릴 것도 아니지만 무언가 새로운 일에 도전하고 성취감을 느끼는 걸 즐깁니다.
                      
                      학업계획 (지원동기 및 학업계획, 졸업 후 계획 등)
                      14년간 아내로서 엄마로서 최선을 다해 열심히 살아오면서도 항상 배움, 그중에서도 체계적인 학습에 대한 아쉬움이 있었습니다. 또한 주부이지만 성장하는 아이들에게 멋진 엄마의 모습을 보여주고 싶습니다.
                      
                      제 환경이나 상황이 한 번에 긴 시간을 공부하기는 어렵겠지만 낮에는 아이들과 함께 공부하고, 아이들이 잠든 후 밤 시간을 이용해 짬짬이 공부하려고 합니다. 또한 주말에는 사이버외대에서 진행하는 특강이나 모임에도 적극적으로 참석해서 다른 학생들과 함께 공부하고, 쉽지는 않겠지만 해외 문화탐방과 같은 문화체험도 참가해 보고 싶습니다.
                      
                      사이버외대를 졸업한 후에 여건이 된다면 대학원에도 진학해 보고 싶습니다. 학부과정에서 키운 언어에 대한 실력과 전문성을 바탕으로 대학원에서는 효과적으로 영어를 가르칠 수 있는 교육법(교수법)에 대해 공부할 계획입니다. 또한 향후 가능하다면 어린이, 학생을 대상으로 영어를 가르치는 봉사활동도 해보고 싶습니다.
                      
                      원어민 교수님을 포함한 외국인과 거리낌 없이 소통하고 즐길 수 있는 가까운 미래 제 모습을 상상하며 열심히 하겠습니다.</textarea>
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

        <%@ include file="../layout/footer.jsp" %>