<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">
            <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="generator" content="Hugo 0.104.2">
            <meta name="theme-color" content="#712cf9">
            <title>PickMe main</title>

            <!-- 부트스트랩 -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

            <!-- 이력서 head 시작 -->
                
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
                
            <!-- 이력서 head 끝-->
            <!-- Template Main CSS File -->
            <link href="/css/style.css" rel="stylesheet">

        </head>

        <body>

            <!-- ======= 헤더 ======= -->
            <header id="header" class="d-flex align-items-center">
                <div class="container d-flex align-items-center">

                    <nav id="navbar" class="navbar col-lg-12 d-flex align-items-center">
                        <div id="navbar-1" class="conjustify-content-start">
                            <ul>
                                <h1>PickMe</h1>
                                <li><a class="nav-link scrollto " href="#hero">채용정보</a></li>
                                <li><a class="nav-link scrollto " href="#about">기업목록</a></li>
                                <li><a class="nav-link scrollto " href="#services">인재목록</a></li>
                                <li><a class="nav-link scrollto " href="/saveResumeForm">이력서 작성</a></li>
                            </ul>
                        </div>

                        <div id="navbar-2" class="justify-content-end">
                            <ul>
                                <li><button id="navbar-login" type="button" class="btn btn-sm"><a
                                            class="nav-link scrollto" href="/loginForm">로그인</a></button></li>
                                <li><button id="navbar-join" type="button" class="btn btn-sm"><a
                                            class="nav-link scrollto" href="/user/joinType">회원가입</a></button></li>
                                <li><a href="#contact"><img src="/images/orange22.jpg" alt="orange22" class="rounded-circle"
                                            style="height: 50px; width: 50px; border: 1px black;"></a>
                                </li>
                            </ul>
                        </div>
                    </nav><!-- .navbar -->

                </div>
            </header><!-- End 헤더 -->