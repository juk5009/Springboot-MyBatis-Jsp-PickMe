<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-mypage">
                <br>

                <h1>추천기업 목록</h1>
                <br>
                <div class="my-mypage d-inline-flex row mb-3">
                    <select class="form-select d-flex mx-3" id="resumeGrade" name="resumeGrade" required
                        onchange="updateResumeList(this.value)">
                        <option value="">이력서를 선택해주세요</option>
                        <option value="1">1번 이력서</option>
                        <option value="2">2번 이력서</option>
                        <option value="3">3번 이력서</option>
                    </select>
                </div>
                <hr>
                <br>


                <div class="my-mypage">
                    <div class="my-mypage px-2">
                        <c:forEach items="${userSkillMatch}" var="userSkillMatch">
                            <div class="d-flex container">
                                <div class="d-flex">
                                    <img src="${userSkillMatch.companyProfile}" style="width: 200px; height: 200px;">
                                </div>

                                <div class="my-mypage-box container">
                                    <div class="my-skillmatch-box-2 d-flex" style="justify-content: space-between;">
                                        <div class="mx-5">
                                            <h1>${userSkillMatch.noticeTitle}</h1>
                                        </div>
                                        <div>
                                            <button onclick="noticeDetailForm(${userSkillMatch.id})" type="button" class="btn"
                                                style="background-color:#7CC98A; color: #fff;">상세보기</button>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="d-flex mx-5" style="font-size: x-large;">회사명&nbsp;| &nbsp;<p
                                            style="color: #4BB58F;">
                                            ${userSkillMatch.noticeCompanyname}</p>
                                    </div>
                                    <div class="d-flex mx-5">
                                        <div style="margin-right: 5px;">지원자 요구 기술</div>

                                        <ul id="item${userSkillMatch.id}">
                                            <c:forEach items="${userSkillMatch.skill}" var="comSkill">
                                                <c:choose>
                                                    <c:when test="${comSkill.color == 'Y'}">
                                                        <span class="badge rounded-pill text-bg-success"
                                                            style="font-weight: 10px;">${comSkill.companyskillName}
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge rounded-pill text"
                                                            style="font-weight: 10px; background-color:#c0c0c0 ;">${comSkill.companyskillName}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
        <script>

            function updateResumeList(sel) {
                window.location.href = "/user/userSkillMatchForm?resumeId=" + sel;
            }
        </script>

        <script>
            function noticeDetailForm(id) {
                location.href = "/notice/" + id;
            }
        </script>


        <%@ include file="../layout/footer.jsp" %>