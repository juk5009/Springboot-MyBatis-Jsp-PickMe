<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-applyUserList-box">
                <h1>지원자 이력서 목록</h1>

                <div class="my-applyUserList-table">
                    <table class="table table-hover w-outo">
                        <thead>
                            <tr>
                                <th scope="col">공고번호</th>
                                <th scope="col">지원자 이름</th>
                                <th scope="col">경력</th>
                                <th scope="col">학력</th>
                                <th scope="col">상세보기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${applyUserList}" var="userList">
                                <c:if test="${userList.companyId == comPrincipal.id}">
                                    <tr>
                                        <td>${userList.noticeId}</td>
                                        <td>${userList.resumeUsername}</td>
                                        <td>${userList.resumeCareer}</td>
                                        <td>${userList.resumeGrade}</td>
                                        <td><a href="/apply/${userList.resumeId}"><button>이력서</button></a></td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>


            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">이력서 상세보기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <main id="main">

                            <!-- start 이력서 폼 -->

                            <!-- 이력서(title) -->
                            <div id="my-resumeForm-title-box-1" class="container">
                                <div class="py-5 text-center">

                                    <h2>이력서 상세보기</h2>
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
                                                    <div>${resumeDto.resumeUsername}</div>

                                                </div>

                                                <!-- 개인정보(생년월일) -->
                                                <div class="col-sm-6">
                                                    <label for="firstName" class="form-label">생년월일</label>
                                                    <div>${resumeDto.resumeBirth}</div>
                                                </div>

                                                <!-- 개인정보(전화번호) -->
                                                <div class="col-12">
                                                    <label for="user-phoneNumber" class="form-label">전화번호</label>
                                                    <div>${resumeDto.resumePhoneNumber}</div>
                                                </div>

                                                <!-- 개인정보(email) -->
                                                <div class="col-12">
                                                    <label for="user-email" class="form-label">Email </label>
                                                    <div>${resumeDto.resumeEmail}</div>
                                                </div>

                                                <!-- 개인정보(주소) -->
                                                <div class="col-12">
                                                    <label for="user-address" class="form-label">주소</label>
                                                    <div>${resumeDto.resumeAddress}</div>
                                                </div>

                                                <!-- 개인정보(희망근무지역?) -->
                                                <div class="col-sm-6">
                                                    <label for="user-local" class="form-label">희망근무지역</label>
                                                    <div>${resumeDto.resumeLocation}</div>
                                                </div>

                                                <!-- 개인정보(학력) -->
                                                <div class="col-sm-6">
                                                    <label for="user-grade" class="form-label">학력</label>
                                                    <div>${resumeDto.resumeCareer}</div>
                                                </div>

                                                <!-- 개인정보(학력) -->
                                                <div class="col-sm-6">
                                                    <label for="user-grade" class="form-label">학력</label>
                                                    <div>${resumeDto.resumeGrade}</div>
                                                </div>


                                                <hr class="my-2"> <!-- 구분선 -->

                                                <!-- 자기소개서 -->
                                                <div class="container my-8">
                                                    <div>
                                                        <h4 class="mb-3 ">자기소개</h4>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <div>${resumeDto.resumeContent}</div>
                                                    </div>
                                                </div>

                                                <hr class="my-2"> <!-- 구분선 -->

                                                <!-- 보유 기술 -->
                                                <h4 class="mb-3">보유 기술</h4>

                                                <div class="my-resumeForm-skill-box-1 d-flex" ">
                <span class=" badge text-bg-success" style="margin-right: 10px">Java</span>
                                                    <span class="badge text-bg-success"
                                                        style="margin-right: 10px">JavaScript</span>
                                                    <span class="badge text-bg-success"
                                                        style="margin-right: 10px">Spring</span>
                                                </div>
                                                <hr class="my-4">
                                            </div>

                                            <div class="mb-3">
                                                <button type="button" class="btn btn-danger">합격</button>
                                                <button type="button" class="btn btn-danger">불합격</button>
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


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>



        <%@ include file="../layout/footer.jsp" %>