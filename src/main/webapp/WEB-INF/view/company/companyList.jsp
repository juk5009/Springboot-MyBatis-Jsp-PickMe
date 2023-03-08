<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <div class="my-applyUserList-box">
                <h1>기업 목록 리스트</h1>

                <div class="my-applyUserList-table">
                    <table class="table table-hover w-outo">
                        <thead>
                            <tr>
                                <th scope="col">순서</th>
                                <th scope="col">기업 이름</th>
                                <th scope="col">상세보기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${companyList}" var="companyList">
                                <tr>
                                    <th scope="row">${companyList.id}</th>
                                    <td>${companyList.noticeCompanyname}</td>
                                        <td><button type="button"
                                                onclick="window.location.href = '/notice/${companyList.id}';"
                                                class="btn btn-primary">공고보기</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <%@ include file="../layout/footer.jsp" %>