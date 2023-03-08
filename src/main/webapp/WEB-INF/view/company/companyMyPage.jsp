<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-companyMyPage-box">
                <h1>기업 마이페이지</h1>
                <div class="my-profile-body">
                    <div class="container my-3 my-profile">
                        <h2 class="text-center my-profile-h2">기업 프로필 사진 변경 페이지</h2>

                        <form action="/company/companyProfileUpdate" method="post" enctype="multipart/form-data">
                            <div class="form-group my-profile-form-group">
                                <img src="${companyProfile.companyProfile == null ? '/images/profile.jfif' : companyProfile.companyProfile}"
                                    alt="Current Photo" class="img-fluid" id="imagePreview">
                            </div>
                            <div class="form-group my-profile-form-group">
                                <input type="file" class="form-control" id="companyProfile" name="companyProfile"
                                    onchange="chooseImage(this)">
                            </div>
                            <button type="submit" class="btn btn-secondary">사진변경</button>
                        </form>
                    </div>
                </div>
    
                <form>
                    <div class="my-mypage-box">
                        <h1>기업 정보</h1>
                        <div class="form-group">
                            <label for="name">아이디</label>
                            <input type="text" value="${company.companyName}" class="form-control" id="companyName"
                                name="companyName">
                        </div>

                        <div class="form-group">
                            <label for="phone">비밀번호</label>
                            <input type="text" value="${company.companyPassword}" class="form-control"
                                id="companyPassword" name="companyPassword">
                        </div>

                        <div class=" form-group">
                            <label for="email">이메일</label>
                            <input type="text" value="${company.companyEmail}" class="form-control" id="companyEmail"
                                name="companyEmail">
                        </div>
                        <button onclick=" updateById(${company.id})" type="button" class="btn"
                            style="background-color:#4BB58F; color: #fff;">기업정보수정</button>

                    </div>
                </form>

                <div class="my-mypage-box">
                    <h1>공고 목록</h1>
                    <hr>
                    <c:forEach items="${noticeSelectList}" var="noticeSelect">
                        <c:if test="${comPrincipal.id == noticeSelect.companyId}">
                            <div class="my-mypage-box d-flex" style="justify-content: space-between;">

                                <div style="display: flex;">
                                    <div>
                                        <img src="${noticeSelect.companyProfile == null ? '/images/profile.jfif' : noticeSelect.companyProfile}"
                                            alt="orange22" class="rounded-circle"
                                            style="height: 50px; width: 50px; border: 1px black;">
                                    </div>
                                    <div>
                                        <h4>${noticeSelect.noticeTitle}</h4>
                                    </div>
                                </div>

                                <div>
                                    <a href="/notice/${noticeSelect.id}" class="btn" style="background-color:#4BB58F; color: #fff;">상세보기</a>
                                </div>

                            </div>


                        </c:if>
                    </c:forEach>
                </div>
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