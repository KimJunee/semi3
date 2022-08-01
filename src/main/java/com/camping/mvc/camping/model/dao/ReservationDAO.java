package com.camping.mvc.camping.model.dao;

import static com.camping.common.jdbc.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.camping.common.util.PageInfo;
import com.camping.mvc.camping.model.vo.Reservation;

public class ReservationDAO {
	
	// 예약하기
	public int insertReservation(Connection conn, Reservation resv) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO RESERVATION VALUES (SEQ_RES_NO.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, resv.getUser_no());
			pstmt.setInt(2, resv.getCs_no());
			pstmt.setInt(3, resv.getResv_headcount());
			pstmt.setString(4, resv.getResv_pay());
			pstmt.setDate(5, resv.getResv_checkin());
			pstmt.setDate(6, resv.getResv_checkout());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 예약 리스트 가져오는 메소드
	public List<Reservation> selectAllReservation(Connection conn, PageInfo pageInfo, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reservation> list = new ArrayList<Reservation>();
		
		String query = "SELECT RESV_NO, USER_NO, CS.CS_NAME, CS.CS_NO, CS_IMAGE, CS.CS_INDUTY, "
					 + "RESV_HEADCOUNT, RESV_PAY, RESV_CHECKIN, RESV_CHECKOUT "
					 + "FROM RESERVATION R "
					 + "LEFT JOIN CAMP_SITE CS ON (R.CS_NO = CS.CS_NO) "
					 + "WHERE USER_NO = ? "
					 + "ORDER BY RESV_NO";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, user_no);
			//pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservation resv = new Reservation();
				resv.setResv_no(rs.getInt("RESV_NO"));
				resv.setUser_no(rs.getInt("USER_NO"));
				resv.setCs_name(rs.getString("CS_NAME"));
				resv.setCs_no(rs.getInt("CS_NO"));
				resv.setCs_image(rs.getString("CS_IMAGE"));
				resv.setCs_induty(rs.getString("CS_INDUTY"));
				resv.setResv_headcount(rs.getInt("RESV_HEADCOUNT"));
				resv.setResv_pay(rs.getString("RESV_PAY"));
				resv.setResv_checkin(rs.getDate("RESV_CHECKIN"));
				resv.setResv_checkout(rs.getDate("RESV_CHECKOUT"));
				list.add(resv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	// 예약 상세 조회
	public Reservation ResvDetail(Connection conn, int resv_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reservation resv = null;

		String query = "SELECT RESV_CHECKIN, RESV_CHECKOUT, RESV_HEADCOUNT, "
					 + "CS_NAME, CS_ADDR1, CS_ADDR2, CS_TEL, CS_HOMEPAGE, CS_ACCOM_FEE "
					 + "FROM RESERVATION R "
					 + "LEFT JOIN CAMP_SITE CS ON (R.CS_NO=CS.CS_NO)"
					 + "WHERE R.RESV_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, resv_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resv = new Reservation();
				resv.setResv_checkin(rs.getDate("RESV_CHECKIN"));
				resv.setResv_checkout(rs.getDate("RESV_CHECKOUT"));
				resv.setResv_headcount(rs.getInt("RESV_HEADCOUNT"));
				resv.setCs_name(rs.getString("CS_NAME"));
				resv.setCs_addr1(rs.getString("CS_ADDR1"));
				resv.setCs_addr2(rs.getString("CS_ADDR2"));
				resv.setCs_tel(rs.getString("CS_TEL"));
				resv.setCs_homepage(rs.getString("CS_HOMEPAGE"));
				resv.setCs_accom_fee(rs.getString("CS_ACCOM_FEE"));
			}
		} catch (Exception e) {
			
		} finally {
			close(pstmt);
			close(rs);
		}
		return resv;
	}
	
	// 마이페이지 예약목록 페이징 - 예약 갯수
	public int getReservationCount(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM RESERVATION WHERE USER_NO = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, user_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	// 
	
	
	// 예약 수정
	public int updateReservation(Connection conn, Reservation resv) {
		PreparedStatement pstmt = null;
		String query = "UPDATE RESERVATION SET CS_NO=?, RESV_HEADCOUNT=?, RESV_CHECKIN=?, RESV_CHECKOUT=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, resv.getCs_no());
			pstmt.setInt(2, resv.getResv_headcount());
			pstmt.setDate(3, resv.getResv_checkin());
			pstmt.setDate(4, resv.getResv_checkout());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 예약 취소
	public int deleteReservation(Connection conn, Reservation resv) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM RESERVATION WHERE RESV_NO = ?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, resv.getResv_no());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}