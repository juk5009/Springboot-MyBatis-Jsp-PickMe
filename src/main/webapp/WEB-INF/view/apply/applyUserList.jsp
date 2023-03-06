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
                                <th scope="col">Last</th>
                                <th scope="col">상세보기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td><button type="button" class="btn btn-primary">이력서</button></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td><button type="button" class="btn btn-primary">이력서</button></td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry the Bird</td>
                                <td>Thornton</td>
                                <td><button type="button" class="btn btn-primary">이력서</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>


            </div>
        </div>

        <%@ include file="../layout/footer.jsp" %>