package com.member.common;

import com.member.bean.MemberVO;
import com.member.dao.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class FileUpload {
    public MemberVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024; // 파일 크기 15MB

        // 실제 서버에 저장되는 path를 upload로
        String realPath = request.getServletContext().getRealPath("upload");
        // 만약 저장될 경로가 없으면 생성
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MemberVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");

            one = new MemberVO();
            String sid = multipartRequest.getParameter("sid");
            if (sid!=null && !sid.equals("")) one.setSid(Integer.parseInt(sid));
            one.setUname(multipartRequest.getParameter("uname"));
            one.setGender(multipartRequest.getParameter("gender"));
            one.setEmail(multipartRequest.getParameter("email"));
            one.setBirth(multipartRequest.getParameter("birth"));
            one.setBirth(multipartRequest.getParameter("birth"));
            one.setPhone(multipartRequest.getParameter("phone"));
            one.setMajor(multipartRequest.getParameter("major"));
            one.setIntro(multipartRequest.getParameter("intro"));
            String regdate = multipartRequest.getParameter("regdate");
            if (regdate!=null && !regdate.equals("")) {
                try {
                    SimpleDateFormat format = new SimpleDateFormat();
                    one.setRegdate(format.parse(regdate));
                }
                catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            // Edit 인 경우
            if (sid != null && !sid.equals("")) {
                MemberDAO memberDAO = new MemberDAO();
                String oldFileName = memberDAO.getPhotoFileName(Integer.parseInt(sid));
                if (filename != null && oldFileName != null) FileUpload.deleteFile(request, oldFileName);
                else if (filename == null && oldFileName != null) filename = oldFileName;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String fileName) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + fileName);
        if (f.exists()) f.delete();
    }
}
