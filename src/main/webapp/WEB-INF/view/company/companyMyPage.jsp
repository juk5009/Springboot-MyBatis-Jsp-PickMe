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
                            <input type="text" value="${company.companyPassword}" class="form-control" id="companyPassword" name="companyPassword">
                        </div>

                        <div class=" form-group">
                            <label for="email">이메일</label>
                            <input type="text" value="${company.companyEmail}" class="form-control" id="companyEmail" name="companyEmail">
                        </div>
                        <button onclick=" updateById(${company.id})" type="button"
                            class="btn btn-outline-warning">기업정보수정</button>

                    </div>
                </form>

                <div class="my-companyMyPage-box">
                    <h1>공고 목록</h1>
                    <ul class="my-companyMyPage-noticeListBox-1">
                        <li>대방건설 경력직 모집</li>
                        <button type="button" class="btn btn-outline-warning">상세보기</button>
                    </ul>

                    <ul class="my-companyMyPage-noticeListBox-2">
                        <li>대방건설 개발자 모집</li>
                        <button type="button" class="btn btn-outline-warning">상세보기</button>
                    </ul>

                    <ul class="my-companyMyPage-noticeListBox-3">
                        <li>대방건설 영업직 모집</li>
                        <button type="button" class="btn btn-outline-warning">상세보기</button>
                    </ul>

                    <div class="my-companyMyPage-button-group">

                        <button type="button" class="btn btn-outline-warning">수정하기</button>
                        <button type="button" class="btn btn-outline-warning">삭제하기</button>
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