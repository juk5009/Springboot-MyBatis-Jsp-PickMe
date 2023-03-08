<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-mypage-box">

                <h1>추천기업 목록</h1>
                <div class="my-profile-body d-inline-flex flex-row mb-3">
                    <label for="user-grade" class="form-label">이력서 목록</label>
                    <select class="form-select" id="resumeGrade" name="resumeGrade" required
                        onchange="updateResumeList(this.value)">
                        <option value="">이력서를 선택해주세요</option>
                        <option value="1">1번 이력서</option>
                        <option value="2">2번 이력서</option>
                        <option value="3">3번 이력서</option>
                    </select>
                </div>


                <div class="my-mypage-box">
                    <c:forEach items="${userSkillMatch}" var="userSkillMatch">
                        <div class="container d-flex justify-content-center"
                            style="border: 1px solid; padding-top: 10px; padding-bottom: 10px;">
                            <div>
                                <img src="/images/dora.png" style="width: 200px; height: 200px;">
                            </div>

                            <div class="my-mypage-box">
                                <div class="my-skillmatch-box-2 d-flex">
                                    <div>
                                        <h1 style="margin-right: 200px;">${userSkillMatch.noticeTitle}</h1>
                                    </div>
                                    <div>
                                        <button onclick="" type="button" class="btn btn-primary">상세보기</button>
                                    </div>
                                </div>
                                <br>
                                <ul>
                                    <li>${userSkillMatch.noticeCompanyname}</li>
                                </ul>
                                <div class="d-flex">
                                    <ul style="margin-right: 5px;">
                                        <li>지원자 요구 기술</li>
                                    </ul>
                                    
                                    <ul id="item${userSkillMatch.id}">
                                    <c:forEach items="${userSkillMatch.skill}" var="comSkill">
                                    <c:choose>
                                       <c:when test="${comSkill.color == 'Y'}">
                                         <span class="badge rounded-pill text-bg-primary">${comSkill.companyskillName} </span>
                                       </c:when>
                                       <c:otherwise>
                                       <span class="badge rounded-pill text-bg-success">${comSkill.companyskillName}</span>
                                       </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <script>
    
                    function updateResumeList(sel) {
                        window.location.href = "/user/userSkillMatchForm?resumeId=" + sel;
                    }
                </script>




                <%@ include file="../layout/footer.jsp" %>