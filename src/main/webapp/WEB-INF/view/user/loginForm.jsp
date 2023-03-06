<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>


        <div class="login_Form">
            <div class="wrapper">
                <div class="title-text">
                    <div class="title login">로그인</div>
                    <div class="title signup">로그인</div>
                </div>
                <div class="form-container">
                    <div class="my-loginForm-radio">
                        <div class="slide-controls">
                            <input type="radio" name="slide" id="login" checked>
                            <input type="radio" name="slide" id="signup">
                            <label for="login" class="slide login">개인</label>
                            <label for="signup" class="slide signup">기업</label>
                            <div class="slider-tab"></div>
                        </div>
                    </div>
                    <div class="form-inner">
                        <form action="/userlogin" class="login" method="post">
                            <div class="field">
                                <input type="text" name="userName" placeholder="Id를 입력해주세요" required>
                            </div>
                            <div class="field">
                                <input type="password" name="userPassword" placeholder="Password를 입력해주세요" required>
                            </div>
                            <div class="login-btn">
                                <button type="submit" class="btn btn-lg" style="color: #fff;">로그인</button>
                            </div>
                            <br>
                            <div>아직 회원가입을 안하셨나요? <a href="/user/joinType" style="text-decoration-line: none;"><b
                                        style="color: orange">
                                        회원가입</b></a></div>
                        </form>
                        
                        <form action="/companylogin" class="signup" method="post">
                            <div class="field">
                                <input type="text" name="companyName" placeholder="Id를 입력해주세요" required>
                            </div>
                            <div class="field">
                                <input type="password" name="companyPassword" placeholder="Password를 입력해주세요" required>
                            </div>
                            <div class="login-btn">
                                <button type="submit" class="btn btn-lg" style="color: #fff;">로그인</button>
                            </div>
                            <br>
                            <div>아직 회원가입을 안하셨나요? <a href="/user/joinType" style="text-decoration-line: none;"><b
                                        style="color: orange">
                                        회원가입</b></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script>
            const loginText = document.querySelector(".title-text .login");
            const loginForm = document.querySelector("form.login");
            const loginBtn = document.querySelector("label.login");
            const signupBtn = document.querySelector("label.signup");
            const signupLink = document.querySelector("form .signup-link a");
            signupBtn.onclick = (() => {
                loginForm.style.marginLeft = "-50%";
                loginText.style.marginLeft = "-50%";
            });
            loginBtn.onclick = (() => {
                loginForm.style.marginLeft = "0%";
                loginText.style.marginLeft = "0%";
            });
            signupLink.onclick = (() => {
                signupBtn.click();
                return false;
            });

        </script>

        <%@ include file="../layout/footer.jsp" %>