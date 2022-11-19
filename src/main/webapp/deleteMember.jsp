<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.bean.MemberVO" %>
<%@ page import="com.member.dao.MemberDAO" %>
<%@ page import="com.member.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberDAO memberDAO = new MemberDAO();
		// 업로드한 photo 파일 삭제
		String fileName = memberDAO.getPhotoFileName(id);
		if (fileName != null) FileUpload.deleteFile(request, fileName);

		MemberVO u = new MemberVO();
		u.setSid(id);
		memberDAO.deleteMember(u);
	}
	response.sendRedirect("members.jsp");
%>