<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">
            <br/>
            <div class="my-mypage-box d-block">
                <h1>기업 마이페이지</h1>

                <div class="my-mypage d-flex">

                    <!-- 왼쪽 박스 시작 -->
                    <div class="my-mypage-box col-md-8">
                        <h2>기업 회원 정보</h2>
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
                                    style="background-color: #7CC98A;color: #fff; font-weight: 200px;">정보수정완료</button>
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
                    <ul class="my-companyMyPage-noticeListBox d-flex justify-content-between">
                        <li>대방건설 경력직 모집</li>
                        <button type="button" class="btn" style="background-color: #7CC98A;color: #fff; font-weight: 200px;">상세보기</button>
                    </ul>

                    <div class="my-companyMyPage-button-group">

                        <button type="button" class="btn" style="background-color: #7CC98A;color: #fff; font-weight: 200px;">수정하기</button>
                        <button type="button" class="btn btn-danger">삭제하기</button>
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