package com.camping.mvc.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.camping.common.util.PageInfo;
import com.camping.mvc.community.model.dao.CommunityDAO;
import com.camping.mvc.community.model.vo.Community;
import static com.camping.common.jdbc.JDBCTemplate.*;

public class MypageDAO {

	public int getMyWriteCount(Connection conn, int userno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) "
				+ "FROM USER_T U "
				+ "JOIN COMMU_BOARD C ON(C.USER_NO = U.USER_NO) "
				+ "WHERE U.USER_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Community> getMyWrite(Connection conn, int userno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Community> list = new ArrayList<Community>();
		
		String query = "SELECT U.USER_NO, C.CO_NO, C.CO_TITLE, C.CO_CONTENT "
				+ "FROM COMMU_BOARD C "
				+ "JOIN USER_T U ON(C.USER_NO = U.USER_NO) "
				+ "WHERE U.USER_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Community community = new Community();
				community.setUser_no(rs.getInt("USER_NO"));
				community.setCo_no(rs.getInt("CO_NO"));
				community.setCo_title(rs.getString("CO_TITLE"));
				community.setCo_content(rs.getString("CO_CONTENT"));
				list.add(community);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public List<Community> getMyWrite(Connection conn, int userno, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Community> list = new ArrayList<Community>();
		
		String query = "SELECT RNUM, USER_NO, CO_NO, CO_TITLE, CO_CONTENT "
				+ "FROM(SELECT ROWNUM AS RNUM, U.USER_NO, C.CO_NO,C.CO_TITLE, C.CO_CONTENT "
				+ "FROM COMMU_BOARD C "
				+ "JOIN USER_T U ON(C.USER_NO = U.USER_NO) "
				+ "WHERE U.USER_NO = ? )"
				+ "WHERE RNUM BETWEEN ? AND ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userno);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Community community = new Community();
				community.setUser_no(rs.getInt("USER_NO"));
				community.setCo_no(rs.getInt("CO_NO"));
				community.setCo_title(rs.getString("CO_TITLE"));
				community.setCo_content(rs.getString("CO_CONTENT"));
				list.add(community);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public int getReservationListCount(Connection conn, int userno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT COUNT(*) FROM RESERVATION WHERE USER_NO = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userno);
			
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
}

