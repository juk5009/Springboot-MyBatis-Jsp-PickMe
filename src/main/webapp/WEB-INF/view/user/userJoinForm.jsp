<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>

    <div class="my-joinForm-body">
        <div class="my-joinForm">
            <div class="my-joinForm-h1">
                <h1>개인 회원가입</h1>
            </div>
            <form action="/userJoin" method="post" class="my-joinForm-form">
                <div>
                    <input type="text" name="userName" placeholder="아이디" class="my-joinForm-id">
                </div>
                <div>
                    <input type="password" name="userPassword" placeholder="비밀번호" class="my-joinForm-id">
                </div>
                <div>
                    <input type="email" name="userEmail" placeholder="이메일" class="my-joinForm-id">
                </div>
                <input type="submit" value="J O I N" class="my-joinForm-btn">
            </form>
        </div>
    </div>
            

        </body>

        </html>
        <%@ include file="../layout/footer.jsp" %>