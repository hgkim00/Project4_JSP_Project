<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.member.dao.MemberDAO" %>
<%@ page import="com.member.bean.MemberVO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Register Member List</title>
    <link rel="stylesheet" href="member.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
        #list tr:hover {
            background-color: #ddd;
        }

        #list {
            margin-top: auto;
            margin-bottom: auto;
        }

        tr{
            vertical-align: middle;
        }
        td{
            max-width: 150px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        td.detail:hover {
            cursor: pointer;
        }
        td.detail a {
            text-decoration: none;
            color: black;
        }
    </style>
    <script>
        function delete_ok(id) {
            const a = confirm("정말로 삭제하겠습니까?");
            if (a) location.href = 'deleteMember.jsp?id=' + id;
        }
        function deleteAll_ok() {
            alert("준비중");
        }
    </script>
</head>
<body>
<div class="container d-flex flex-column min-vh-100">
    <%
        MemberDAO memberDAO = new MemberDAO();
        List<MemberVO> list = memberDAO.getMemberList();
        request.setAttribute("list", list);
        String sid;
        MemberVO u;
    %>
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/HGU-Emblem-eng2.png" height="42px" width="42px" class="bi me-2" />
            <span class="fs-4">한동 등록인원 리스트</span>
        </a>
        <p class="mb-0">
            <a href="registerMemberForm.jsp" class="btn btn-success my-2">등록하기</a>
            <a href="javascript:deleteAll_ok()" class="btn btn-danger my-2">전체삭제</a>
        </p>
    </header>
    <div class="content">
            <table id="list" class="table">
                <thead class="table-info">
                <tr class="align-middle text-center">
                    <th scope="col">No</th>
                    <th scope="col">Id</th>
                    <th scope="col">이름</th>
                    <th scope="col">사진</th>
                    <th scope="col">성별</th>
                    <th scope="col">이메일</th>
                    <th scope="col">생년월일</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">전공학부</th>
                    <th scope="col">세부소개</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="u" varStatus="status">
                    <tr>
                        <th class="text-center" scope="row">${fn:length(list)-status.index}</th>
                        <td class="text-center">${u.getSid()}</td>
                        <td class="text-center detail">${u.getUname()}</td>
                        <td class="text-center">
                            <c:if test="${u.getPhoto() ne ''}">
                                <img src="${pageContext.request.contextPath }/upload/${u.getPhoto()}" width="100px" height="100px" class="img-thumbnail photo">
                            </c:if>
                        </td>
                        <td class="text-center ">${u.getGender()}</td>
                        <td class="text-center detail"><a href="javascript:alert('${u.getEmail()}')">${u.getEmail()}</a></td>
                        <td class="text-center ">${u.getBirth()}</td>
                        <td class="text-center ">${u.getPhone()}</td>
                        <td class="text-center">${u.getMajor()}</td>
                        <td class="text-center detail"><a href="javascript:alert('${u.getIntro()}')">${u.getIntro()}</a></td>
                        <td class="text-center"><a href="modifyMemberForm.jsp?id=${u.getSid()}"><i class="fa fa-pencil"></i></a></td>
                        <td class="text-center"><a href="javascript:delete_ok('${u.getSid()}')"><i class="fa fa-trash-o" style="color: red"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br/><a href="registerMemberForm.jsp">Register New Member</a>
    </div>
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top mt-auto">
        <p class="col-md-4 mb-0 text-muted">© 22-2 실전프로젝트1, 21900215 김현기</p>

        <a href="/"
           class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32">
                <use xlink:href="#bootstrap"></use>
            </svg>
        </a>

        <ul class="nav col-md-4 justify-content-end">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="registerMemberForm.jsp" class="nav-link px-2 text-muted">Register</a></li>
            <li class="nav-item"><a href="#" onclick="alert('준비중입니다')" class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#" onclick="alert('준비중입니다')" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#" onclick="alert('준비중입니다')" class="nav-link px-2 text-muted">About</a></li>
        </ul>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/898d58b2d3.js"></script>
</body>
</html>