<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-applyUserList-box">
                <h1>지원자페이지</h1>
                <div class="my-applyUserList-box">
                    <h1>지원자 정보</h1>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="phone">번호</label>
                        <input type="text" class="form-control" id="phone" placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="email">메일</label>
                        <input type="text" class="form-control" id="email" placeholder="">
                    </div>
                    <button type="button" class="btn btn-outline-warning  ">지원자 상세보기</button>
                </div>
                <div class="my-applyUserList-box">
                    <h1>지원자 이력서 </h1>
                    <ul>
                        <li>이력서 </li>
                       
                    </ul>
                    <div class="my-applyUserList-button-group">
                        <button type="button" class="btn btn-outline-warning">삭제하기</button>
                    </div>
                </div>

            </div>
        </div>





        <%@ include file="../layout/footer.jsp" %>