package com.camping.mvc.member.model.dao;


import static com.camping.common.jdbc.JDBCTemplate.*;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.camping.mvc.member.model.vo.Member;

public class MemberDAO {
	
	
	//아이디를 찾는 메소드
	public Member findMemberById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM USER_T WHERE USER_ID= ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Member m = new Member();
				int count = 1;
				m.setUser_no(rs.getInt(count++));
				m.setUser_id(rs.getString(count++));
				m.setUser_pw(rs.getString(count++));
				m.setUser_name(rs.getString(count++));
				m.setUser_phone(rs.getString(count++));
				m.setUser_email(rs.getString(count++));
				m.setUser_birth(rs.getString(count++));
				return m;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}
	
	//로그인메소드
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO USER_T VALUES(SEQ_UNO.NEXTVAL,?,?,?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, member.getUser_pw());
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, member.getUser_phone());
			pstmt.setString(5, member.getUser_email());
			pstmt.setString(6, member.getUser_birth());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//회원정보 변경 메소드
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		String query = "UPDATE USER_T SET USER_NAME=?, USER_PHONE=?, USER_EMAIL=?, USER_BIRTH=? WHERE USER_NO=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUser_name());
			pstmt.setString(2, member.getUser_phone());
			pstmt.setString(3, member.getUser_email());
			pstmt.setString(4, member.getUser_birth());
			pstmt.setInt(5, member.getUser_no());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 탈퇴하기
	public int deleteMember(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM USER_T WHERE USER_NO= ?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 패스워드 변경
	public int updatePassword(Connection conn, int no, String password) {
		PreparedStatement pstmt = null;
		String query = "UPDATE USER_T SET USER_PW=? WHERE USER_NO=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, password); 
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

//	public static void main(String[] args) {
//		Connection conn = getConnection();
//		MemberDAO dao = new MemberDAO();
//		
//		// 조회하기
//		Member member = dao.findMemberById(conn, "admin");
//		System.out.println(member.toString().replace(",",",\n"));
//
//		// 회원가입
//		Member member2 = new Member();
//		member2.setId("test12");
//		member2.setPassword("1234");
//		member2.setName("최길동");
//		member2.setPhone("010-1323-2222");
//		member2.setEmail("test@email.com");
//		member2.setBirth("1987-12-25");
//		int result = dao.insertMember(conn, member2);
//		Member member3 = null;
//		if(result == 1) {
//			System.out.println("성공");
//			member3 = dao.findMemberById(conn, "test12");
//			System.out.println(member3.toString().replace(",",",\n"));
//		}else {
//			System.out.println("실패");
//		}
//		
//		// 업데이트
//		member3.setBirth("1991-04-23");
//		member3.setPhone("010-4312-1414");
//		member3.setName("김종국");
//		result = dao.updateMember(conn, member3);
//		if(result == 1) {
//			System.out.println("업데이트 성공");
//			member3 = dao.findMemberById(conn, "test12");
//			System.out.println(member3.toString().replace(",",",\n"));
//		}else {
//			System.out.println("업데이트 실패");
//		}
//		
//		// 패스워드 변경
//		result = dao.updatePassword(conn, member3.getNo(), "4321");
//		System.out.println("패스워드 결과 : " + result );
//		if(result == 1) {
//			System.out.println("패스워드 업데이트 성공");
//			member3 = dao.findMemberById(conn, "test12");
//			System.out.println(member3.toString().replace(",",",\n"));
//		}else {
//			System.out.println("패스워드 업데이트 실패");
//		}
//		
//		// 회원탈퇴
//		result = dao.deleteMember(conn, member3.getNo(), "N");
//		System.out.println("탈퇴 결과 : " + result );
//		if(result == 1) {
//			System.out.println("탈퇴 업데이트 성공");
//			member3 = dao.findMemberById(conn, "test12");
//			System.out.println(member3);
//		}else {
//			System.out.println("탈퇴 업데이트 실패");
//		}
//	}
}


















