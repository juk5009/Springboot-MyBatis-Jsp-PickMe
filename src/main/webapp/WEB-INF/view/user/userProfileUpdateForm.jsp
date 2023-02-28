<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="my-profile-body">
            <div class="container my-3 my-profile">
                <h2 class="text-center my-profile-h2">유저 프로필 사진 변경 페이지</h2>
                
                <form action="/user/userProfileUpdate" method="post" enctype="multipart/form-data">
                    <div class="form-group my-profile-form-group">
                        <img src="${user.userProfile == null ? '/images/profile.jfif' : user.userProfile}"
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

        <script>
            //ajax
            function updateImage() {
                let profileForm = $("#profileForm")[0];
                let formData = new FormData(profileForm);

                $.ajax({
                    type: "put",
                    url: "/user/userProfileUpdate",
                    data: formData,
                    contentType: false, //필수 : x-www-form-urlencoded 파싱되는 것을 방지
                    processData: false, //필수 : contentType을 false로 줬을 때 QueryString 자동설정됨 ,해제
                    enctype: "multipart/form-data",
                    dataType: "json" //default : 응답의 mime 타입으로 유추함
                }).done((res) => { // 20x일때
                    alert(res.msg);
                    location.href = "/";
                }).fail((err) => { // 40x, 50x 일때
                    alert(err.responseJSON.msg);
                });
            }

            function chooseImage(obj) {
                //console.log(obj);
                //console.log(obj.files);
                let f = obj.files[0];

                if (!f.type.match("image.*")) {
                    alert("이미지를 등록해야 합니다.");
                    return;
                }

                let reader = new FileReader();
                reader.readAsDataURL(f);

                // 콜스택이 다 비워지고, 이벤트 루프로 가서 readAsDataURL 이벤트가 끝나면 콜백시켜주는 함수
                reader.onload = function (e) {
                    console.log(e);
                    console.log(e.target.result);
                    $("#imagePreview").attr("src", e.target.result);
                }
            }
        </script>

        <%@ include file="../layout/footer.jsp" %>