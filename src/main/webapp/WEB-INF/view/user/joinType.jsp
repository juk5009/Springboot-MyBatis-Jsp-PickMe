<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
    <div class="my-JoinType-body">
        <section class="my-joinType-split">
            <div class="screen">
                <div class="card">
                    <div class="imgBx">
                        <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn-icons-png.flaticon.com%2F512%2F732%2F732455.png&type=a340"
                            alt="">
                    </div>
                    <h2>개인</h2>
                    <a href="/userJoinForm" class="btn btn-1" data-contentClass="content1">회원가입</a>
                </div>
            </div>
            <div class="screen">
                <div class="card">
                    <div class="imgBx">
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMzFfNDMg%2FMDAxNjEyMTAwNzg1MjU4.3XUETg7cwq6Lqeoei4QbJxkxhLy4YO_PxATtPE28kgcg.sajCNrrObMStPSzpT6Ly_sUjJc7nuGWu73pyTEltrCAg.PNG.mydaringjjin%2F%25BF%25C0%25C7%25C1%25B6%25F3%25C0%25CE.png&type=a340"
                            alt="">
                    </div>
                    <h2>기업</h2>
                    <a href="/companyJoinForm" class="btn btn-2" data-contentClass="content2">회원가입</a>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {

                $('.btn').on('click', function () {
                    var contentToShow = $(this).attr('data-contentClass');
                    $('.' + contentToShow).css({
                        opacity: 1,
                        visibility: 'visible'
                    });
                });

                $('.btn').blur(function () {
                    var contentToHide = $(this).attr('data-contentClass');
                    $('.' + contentToHide).css({
                        opacity: 0,
                        visibility: 'hidden'
                    });
                });
            });
        </script>
    </div>

       

        <%@ include file="../layout/footer.jsp" %>