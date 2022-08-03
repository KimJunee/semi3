package com.camping.mvc.member.model.service;

import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import static com.camping.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.camping.mvc.member.model.dao.MemberDAO;
import com.camping.mvc.member.model.vo.Member;


public class MemberService {
	private MemberDAO dao = new MemberDAO();
	
	public Member findMemberById(String user_id) {
	Connection conn = getConnection();
	Member member = dao.findMemberById(conn, user_id);
	close(conn);
	return member;
	}
	
	//로그인
	public Member login(String user_id, String user_pw) {
		Member member = findMemberById(user_id);
		// 꼼수 기능, 향후 pw를 hash코드로 대체할건데, pw 변경이 필요함으로 admin 따로 기능구현
		if(member != null && member.getUser_id().equals("admin")) {

			return member;
		}

		if (member != null && member.getUser_pw().equals(user_pw)) {
			return member;
		} else {
			return null;
		}
	}
	
	//insert or update
	public int save(Member member) {
		int result = 0;
		Connection conn = getConnection();

		if (member.getUser_no() != 0) {
			result = dao.updateMember(conn, member); //만약getNo에  1이상의 숫자가 있다면 업데이트된다.
		} else {
			result = dao.insertMember(conn, member); //만약getNo가 0이라면 새로입력된다.
		}

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//회원 탈퇴
	public int delete(int user_no) {
		Connection conn = getConnection();
		int result = dao.deleteMember(conn, user_no);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//비밀번호 업데이트
	public int updatePassword(int user_no, String user_pw) {
		Connection conn = getConnection();
		int result = dao.updatePassword(conn, user_no, user_pw);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 중복 가입 방지용
	public boolean isDuplicated(String user_id) {
		Connection conn = getConnection();
		Member member = dao.findMemberById(conn, user_id);
		close(conn);

		if (member != null) {
			return true; // 중복됨
		} else {
			return false; // 중복되지 않음! -> 회원가입 가능
		}
	}
}
