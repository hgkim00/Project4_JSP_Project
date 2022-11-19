<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.member.dao.MemberDAO" %>
<%@ page import="com.member.bean.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Member Info</title>
    <link rel="stylesheet" href="member.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="container">
<%
    MemberDAO memberDAO = new MemberDAO();
    String sid = request.getParameter("id");
    MemberVO u = memberDAO.getMember(Integer.parseInt(sid));
    request.setAttribute("vo", u); // 이걸 왜 해주는 지? 바로 u 위에다가 해주면 되는거 아님?
%>

<h1>Edit Form</h1>
<form action="modifyMember.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="sid" value="<%=u.getSid() %>"/>
    <table>
        <tr>
            <td>User:</td>
            <td><input type="text" name="uname" value="<%= u.getUname()%>"/></td>
        </tr>
        <tr>
            <td>Photo:</td>
            <td><input type="file" name="photo" value="${vo.getPhoto()}" />
            <c:if test="${u.getPhoto() ne ''}"><img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" height="100px" width="100px" class="image-thumbnail photo"></c:if></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td><input type="text" name="gender" value="<%= u.getGender()%>"/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email" value="<%= u.getEmail()%>"/></td>
        </tr>
        <tr>
            <td>Birth:</td>
            <td><input type="date" name="birth" value="<%= u.getBirth()%>"/></td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><input type="tel" name="phone" value="<%= u.getPhone()%>"/></td>
        </tr>
        <tr>
            <td>Major:</td>
            <td><input type="text" name="major" value="<%= u.getMajor()%>"/></td>
        </tr>
        <tr>
            <td>Intro:</td>
            <td><textarea cols="50" rows="5" name="intro"><%= u.getIntro()%></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Modify Member"/>
                <input type="button" value="Cancel" onclick="history.back()"/></td>
        </tr>
    </table>
</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/898d58b2d3.js"></script>
</body>
</html>