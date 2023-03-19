<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-applyUserList-box">
                <h1>지원자 이력서 목록</h1>

                <div class="my-applyUserList-table container">
                    <table class="table table-hover w-outo justify-content-center">
                        <thead>
                            <tr>
                                <th scope="col">공고번호</th>
                                <th scope="col">지원자 이름</th>
                                <th scope="col">경력</th>
                                <th scope="col">학력</th>
                                <th scope="col">이력서</th>
                            </tr>
                        </thead>
                        <tbody >
                            <c:forEach items="${applyUserList}" var="userList">
                                <c:if test="${userList.companyId == comPrincipal.id}">
                                    <tr>
                                        <td class="px-4 pt-3 ">${userList.noticeId}</td>
                                        <td class="px-3 pt-3">${userList.resumeUsername}</td>
                                        <td class="pt-3 justify-content-center">${userList.resumeCareer}</td>
                                        <td class="pt-3 justify-content-center">${userList.resumeGrade}</td>
                                        <td><button class="my-applyUserList-btn btn" type="button" onclick="applyUserList(${userList.resumeId})">상세보기</button></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

<script>
      function applyUserList(id) {

          location.href = "/apply/" + id
   
      }
    </script>

        <%@ include file="../layout/footer.jsp" %>