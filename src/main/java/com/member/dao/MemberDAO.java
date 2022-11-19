package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.member.bean.MemberVO;
import com.member.common.JDBCUtil;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String MEMBER_INSERT = "insert into MEMBER (uname, photo, gender, email, birth, phone, major, intro) values (?,?,?,?,?,?,?,?)";
	private final String MEMBER_UPDATE = "update MEMBER set uname=?, photo=?, gender=?, email=?, birth=?, phone=?, major=?, intro=? where sid=?";
	private final String MEMBER_DELETE = "delete from MEMBER  where sid=?";
	private final String MEMBER_GET = "select * from MEMBER  where sid=?";
	private final String MEMBER_LIST = "select * from MEMBER order by sid desc";

	public int insertMember(MemberVO vo) {
		System.out.println("===> JDBC로 insertMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_INSERT);
			stmt.setString(1, vo.getUname());
			stmt.setString(2, vo.getPhoto());
			stmt.setString(3, vo.getGender());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getBirth());
			stmt.setString(6, vo.getPhone());
			stmt.setString(7, vo.getMajor());
			stmt.setString(8, vo.getIntro());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteMember(MemberVO vo) {
		System.out.println("===> JDBC로 deleteMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_DELETE);
			stmt.setInt(1, vo.getSid());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int updateMember(MemberVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			System.out.println(vo.getSid());
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_UPDATE);
			stmt.setString(1, vo.getUname());
			stmt.setString(2, vo.getPhoto());
			stmt.setString(3, vo.getGender());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getBirth());
			stmt.setString(6, vo.getPhone());
			stmt.setString(7, vo.getMajor());
			stmt.setString(8, vo.getIntro());
			stmt.setInt(9, vo.getSid());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public MemberVO getMember(int sid) {
		MemberVO one = new MemberVO();
		System.out.println("===> JDBC로 getMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setUname(rs.getString("uname"));
				one.setPhoto(rs.getString("photo"));
				one.setGender(rs.getString("gender"));
				one.setEmail(rs.getString("email"));
				one.setBirth(rs.getString("birth"));
				one.setPhone(rs.getString("phone"));
				one.setMajor(rs.getString("major"));
				one.setIntro(rs.getString("intro"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<MemberVO> getMemberList(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		System.out.println("===> JDBC로 getMemberList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUname(rs.getString("uname"));
				one.setPhoto(rs.getString("photo"));
				one.setGender(rs.getString("gender"));
				one.setEmail(rs.getString("email"));
				one.setBirth(rs.getString("birth"));
				one.setPhone(rs.getString("phone"));
				one.setMajor(rs.getString("major"));
				one.setIntro(rs.getString("intro"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	public String getPhotoFileName(int sid) {
		String fileName = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				fileName = rs.getString("photo");
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("===> JDBC로 getPhotoFileName() 기능 처리");
		return fileName;
	}
}
