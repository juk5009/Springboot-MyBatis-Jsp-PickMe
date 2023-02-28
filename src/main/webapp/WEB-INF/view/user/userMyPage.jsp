<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-mypage-box">
                <h1>마이페이지</h1>
                <div class="my-profile-body">
            <div class="container my-3 my-profile">
                <h2 class="text-center my-profile-h2">유저 프로필 사진 변경 페이지</h2>
                
                <form action="/user/userProfileUpdate" method="post" enctype="multipart/form-data">
                    <div class="form-group my-profile-form-group">
                        <img src="${userProfile.userProfile == null ? '/images/profile.jfif' : userProfile.userProfile}"
                            alt="Current Photo" class="img-fluid" id="imagePreview">
                    </div>
                    <div class="form-group my-profile-form-group">
                        <input type="file" class="form-control" id="userProfile" name="userProfile"
                            onchange="chooseImage(this)">
                    </div>
                    <button type="submit" class="btn btn-secondary">사진변경</button>
                </form>
            </div>
        </div>

                <div class="my-mypage-box">
                    <h1>회원 정보</h1>
                    <div class="form-group">
                        <label for="userName">이름</label>
                        <input type="text" class="form-control" id="userName" placeholder="" value="${user.userName}">
                    </div>

                    <div class="form-group">
                        <label for="userPassword">비밀번호</label>
                        <input type="text" class="form-control" id="userPassword" placeholder="" value="${user.userPassword}">
                    </div>

                    <div class="form-group">
                        <label for="userEmail">이메일</label>
                        <input type="text" class="form-control" id="userEmail" placeholder="" value="${user.userEmail}">
                    </div>
                   <button onclick="updateById(${user.id})" type="button" class="btn btn-primary">정보수정완료</button>
                </div>
                <div class="my-mypage-box">
                    <h1>나의 이력서</h1>
                    <ul>
                        <li>이력서</li>
                    </ul>

         <c:if test="${userDto.userId == principal.id}">
                <div class="mb-3">
                 <a href="/board/${userDto.id}/updateForm" class="btn btn-warning">수정</a>
                <button onclick="deleteById(${userDto.id})" class="btn btn-danger">삭제</button>
        </div>
    </c:if>
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