<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">
            <br/>
            <div class="my-mypage-box d-block">
                <h1>기업 마이페이지</h1>

                <div class="my-mypage d-flex">

                    <!-- 왼쪽 박스 시작 -->
                    <div class="my-mypage-box col-md-8">
                        <h2>회원 정보</h2>
                            <div class="my-page-form-group">
                                <label for="name">아이디</label>
                                <input type="text" value="${company.companyName}" class="form-control" id="companyName"
                                    name="companyName">
                            </div>

                            <div class="my-page-form-group">
                                <label for="phone">비밀번호</label>
                                <input type="text" value="${company.companyPassword}" class="form-control"
                                    id="companyPassword" name="companyPassword">
                            </div>

                            <div class="my-page-form-group">
                                <label for="email">이메일</label>
                                <input type="text" value="${company.companyEmail}" class="form-control"
                                    id="companyEmail" name="companyEmail">
                            </div>

                            <div>
                                <button onclick="updateById(${company.id})" type="button" class="btn"
                                    style="background-color:#7CC98A; color: #fff;">기업정보 수정완료</button>
                            </div>
                    </div>
                    <!-- 왼쪽 박스 끝 -->

                    <!-- 오른쪽 박스 시작 -->
                    <div class="my-profile col-md-4">
                        <form action="/company/companyProfileUpdate" method="post" enctype="multipart/form-data">
                            <div class="my-profile-form-group">
                                <img src="${companyProfile.companyProfile == null ? '/images/profile.jfif' : companyProfile.companyProfile}"
                                    alt="Current Photo" class="img-fluid" id="imagePreview">
                            </div>
                            <div class="my-profile-form-group mb-2">
                                <input type="file" class="form-control" id="companyProfile" name="companyProfile"
                                    onchange="chooseImage(this)">
                            </div>
                            <button type="submit" class="btn btn-secondary">사진변경</button>
                        </form>

                    </div>
                    <!-- 오른쪽 박스 끝 -->
                </div>

            </div>
            <div>
                <div class="my-mypage-box">
                    <h2>공고 목록</h2>
                    <hr>
                    <c:forEach items="${noticeSelectList}" var="noticeSelect">
                        <c:if test="${comPrincipal.id == noticeSelect.companyId}">
                            <div class="my-mypage-box d-flex container" style="justify-content: space-between;">

                                    <div class="d-flex">
                                        <img src="${noticeSelect.companyProfile == null ? '/images/profile.jfif' : noticeSelect.companyProfile}"
                                            alt="orange22" class="rounded-circle"
                                            style="height: 50px; width: 50px; border: 1px black;">
                                        <p class="pt-2 mx-2" style="font-size: 24px;">${noticeSelect.noticeTitle}<p>
                                    </div>

                                <div class="">
                                    <a href="/notice/${noticeSelect.id}" class="btn" style="background-color:#7CC98A ; color: #fff;">상세보기</a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
            </div>
        </div>
        <script>
            function updateById(id) {
                let data = {
                    "companyName": $("#companyName").val(),
                    "companyPassword": $("#companyPassword").val(),
                    "companyEmail": $("#companyEmail").val(),
                };

                $.ajax({
                    type: "put",
                    url: "/company/" + id,
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=urf-8",
                    dataType: "json"
                }).done((res) => {
                    alert(res.msg);
                    location.href = "/";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        </script>


        <%@ include file="../layout/footer.jsp" %>