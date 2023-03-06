<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-applyUserList-box">
                <h1>지원자 이력서 목록</h1>

                <div class="my-applyUserList-table">
                    <table class="table table-hover w-outo">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">지원자 이름</th>
                                <th scope="col">경력</th>
                                <th scope="col">학력</th>
                                <th scope="col">상세보기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${applyUserList}" var="userList">
                            <tr>
                                <th scope="row">${userList.id}</th>
                                <td>${userList.resumeUsername}</td>
                                <td>${userList.resumeCareer}</td>
                                <td>${userList.resumeGrade}</td>
                                <td><button type="button" class="btn btn-primary">이력서</button></td>
                            </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>


            </div>
        </div>





        <%@ include file="../layout/footer.jsp" %>