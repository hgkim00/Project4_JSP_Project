<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <link rel="stylesheet" href="member.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="container d-flex flex-column min-vh-100">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/HGU-Emblem-eng2.png" height="42px" width="42px" class="bi me-2" />
            <span class="fs-4">한동 회원 등록</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a href="#" onclick="history.back()" class="nav-link px-2 text-muted">홈페이지로 돌아가기</a></li>
        </ul>
    </header>
    <form action="registerMember.jsp" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="exampleInputTitle" class="form-label">이름</label>
            <input type="text" class="form-control" id="exampleInputTitle" name="uname">
        </div>
        <div class="mb-3">
            <label for="photo" class="form-label">프로필사진</label>
            <input type="file" class="form-control" id="photo" name="photo">
        </div>
        <div class="mb-3">
            <label class="form-label">성별</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" id="flexRadioDefault1" value="남자" name="gender" checked>
                <label class="form-check-label" for="flexRadioDefault1">
                    남자
                </label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio"  id="flexRadioDefault2" value="여자" name="gender" >
                <label class="form-check-label" for="flexRadioDefault2">
                    여자
                </label>
            </div>
        </div>
        <div class="mb-3">
            <label for="email1" class="form-label">이메일 주소</label>
            <input type="email" class="form-control" id="email1" aria-describedby="emailHelp" name="email">
            <div id="emailHelp" class="form-text">한동 계정 입력을 권고드립니다</div>
        </div>
        <div class="mb-3">
            <label for="inputBirth" class="form-label">생년월일</label>
            <input type="date" class="form-control" id="inputBirth" placeholder="date input" min="1990-01-01" max="2022-01-01" name="birth">
        </div>
        <div class="mb-3">
            <label for="inputPhone" class="form-label">전화번호</label>
            <input type="tel" class="form-control" id="inputPhone" placeholder="010-1234-5678" pattern="[0-9]{3,4}-[0-9]{4,5}-[0-9]{4,5}" maxlength="13" name="phone">
        </div>
        <div class="mb-3">
            <label for="dataList" class="form-label">전공학부</label>
            <input class="form-control" list="datalistOptions" id="dataList" name="major" placeholder="전공학부를 검색...">
            <datalist id="datalistOptions">
                <option value="글로벌리더십학부"></option>
                <option value="국제어문학부"></option>
                <option value="경영경제학부"></option>
                <option value="법학부"></option>
                <option value="커뮤니케이션학부"></option>
                <option value="전산전자공학부"></option>
            </datalist>
        </div>
        <div class="mb-3">
            <label for="inputTextarea" class="form-label">자기소개글</label>
            <textarea class="form-control" id="inputTextarea" rows="5" name="intro"></textarea>
        </div>
        <div class="mb-3">
            <button class="w-100 btn btn-success" type="submit">한동 회원으로 등록하기</button>
            <a href="members.jsp">View All Records</a></td>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/898d58b2d3.js"></script>
</body>
</html>