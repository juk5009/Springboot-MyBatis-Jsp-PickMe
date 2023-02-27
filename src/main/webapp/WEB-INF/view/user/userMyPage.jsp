<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-mypage-box">
                <h1>마이페이지</h1>
                <div class="my-mypage-box">
                    <h1>회원 정보</h1>
                    <div class="form-group">
                        <label for="name">아이디</label>
                        <input type="text" class="form-control" id="name" placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="phone">비밀번호</label>
                        <input type="text" class="form-control" id="phone" placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control" id="email" placeholder="">
                    </div>
                    <button type="button" class="btn btn-outline-warning  ">회원정보수정</button>
                </div>
                <div class="my-mypage-box">
                    <h1>나의 이력서</h1>
                    <ul>
                        <li>이력서</li>
                        
                    </ul>

                    <div class="my-mypage-button-group">
                        <button type="button" class="btn btn-outline-warning">수정하기</button>
                        <button type="button" class="btn btn-outline-warning">삭제하기</button>
                    </div>
                </div>

            </div>
        </div>





        <%@ include file="../layout/footer.jsp" %>