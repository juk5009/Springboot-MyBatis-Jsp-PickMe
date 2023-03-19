<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">
            <br />
            <div class="my-mypage-box d-block">
                <h1>개인 마이페이지</h1>


                <div class="my-mypage d-flex">

                    <!-- 왼쪽 박스 시작 -->
                    <div class="my-mypage-box col-md-8">
                        <h1>개인 회원 정보</h1>
                        <div class="my-page-form-group">
                            <label for="userName">이름</label>
                            <input type="text" class="form-control" id="userName" placeholder=""
                                value="${user.userName}">
                        </div>

                        <div class="my-page-form-group">
                            <label for="userPassword">비밀번호</label>
                            <input type="text" class="form-control" id="userPassword" placeholder=""
                                value="${user.userPassword}">
                        </div>

                        <div class="my-page-form-group">
                            <label for="userEmail">이메일</label>
                            <input type="text" class="form-control" id="userEmail" placeholder=""
                                value="${user.userEmail}">
                        </div>

                        <div>
                            <button onclick="updateById(${user.id})" type="button" class="btn"
                                style="background-color: #7CC98A;color: #fff; font-weight: 200px;">정보수정완료</button>
                        </div>

                    </div>
                    <!-- 왼쪽 박스 끝 -->

                    <!-- 오른쪽 박스 시작 -->
                    <div class="my-profile col-md-4">
                        <form action="/user/userProfileUpdate" method="post" enctype="multipart/form-data">
                            <div class="my-profile-form-group">
                                <img src="${userProfile.userProfile == null ? '/images/profile.jfif' : userProfile.userProfile}"
                                    alt="Current Photo" id="imagePreview">
                            </div>
                            <div class="my-profile-form-group mb-2">
                                <input type="file" class="form-control" id="userProfile" name="userProfile"
                                    onchange="chooseImage(this)">
                            </div>
                            <button type="submit" class="btn btn-secondary">사진변경</button>
                        </form>

                    </div>
                    <!-- 오른쪽 박스 끝 -->

                </div>
            </div>

            <div class="my-mypage-box">
                <h1>나의 이력서</h1>
                <hr>
                <c:forEach items="${resumeSelectList}" var="resumeSelect">
                    <c:if test="${userPrincipal.id == resumeSelect.userId}">
                        <div class="my-mypage-box d-flex" style="justify-content: space-between;">

                            <div style="display: flex;">
                                <div>
                                    <img src="${resumeSelect.userProfile == null ? '/images/profile.jfif' : resumeSelect.userProfile}"
                                        alt="orange22" class="rounded-circle"
                                        style="height: 50px; width: 50px; border: 1px black;">
                                </div>
                                <div>
                                    <h2>${resumeSelect.resumeUsername}</h2>
                                </div>
                            </div>

                            <div>
                                <a href="/resume/${resumeSelect.id}" class="btn"
                                    style="background-color: #7CC98A;color: #fff; font-weight: 200px;">상세보기</a>
                            </div>

                        </div>


                    </c:if>
                </c:forEach>
            </div>

        </div>

        <script>
            function updateById(id) {
                let data = {
                    "userName": $("#userName").val(),
                    "userPassword": $("#userPassword").val(),
                    "userEmail": $("#userEmail").val()
                };
                console.log(data.userName);
                $.ajax({
                    type: "put",
                    url: "/user/" + id,
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done((res) => {
                    alert(res.msg);
                    location.href = "/";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
            function updateImage() {
                let profileForm = $("#profileForm")[0];
                let formData = new FormData(profileForm);

                $.ajax({
                    type: "put",
                    url: "/user/userProfileUpdate",
                    data: formData,
                    contentType: false,
                    processData: false,
                    enctype: "multipart/form-data",
                    dataType: "json"
                }).done((res) => {
                    alert(res.msg);
                    location.href = "/";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }

            function chooseImage(obj) {

                let f = obj.files[0];

                if (!f.type.match("image.*")) {
                    alert("이미지를 등록해야 합니다.");
                    return;
                }

                let reader = new FileReader();
                reader.readAsDataURL(f);


                reader.onload = function (e) {
                    console.log(e);
                    console.log(e.target.result);
                    $("#imagePreview").attr("src", e.target.result);
                }
            }
        </script>

        <%@ include file="../layout/footer.jsp" %>