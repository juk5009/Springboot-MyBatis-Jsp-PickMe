<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-mypage-box">
                <h1>마이페이지</h1>
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
            dataType: "json" // default : 응답의 mime 타입으로 유추함
        }).done((res) => { // 20X 일때
            alert(res.msg);
            location.href = "/";
        }).fail((err) => { // 40X, 50X 일때
            alert(err.responseJSON.msg);
        });
    }
</script>




        <%@ include file="../layout/footer.jsp" %>