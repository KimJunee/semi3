package com.camping.mvc.camping.model.dao;
import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.camping.common.util.PageInfo;
import com.camping.mvc.camping.model.vo.Review;

public class CampReviewDAO {

	// 캠핑장 리뷰 리스트 가져오는 쿼리문 
	public List<Review> getReviewByCampNo(Connection conn, int cs_no){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList<>();
		String query = "SELECT CS_NO, U.USER_NO, U.USER_ID, REV_NO, REV_TITLE, "
					 + "REV_CONTENT, REV_REGIST, REV_IMAGE, REV_IMAGE_RENAME, REV_STAR "
					 + "FROM REVIEW R, USER_T U "
					 + "WHERE R.USER_NO = U.USER_NO "
					 + "AND CS_NO = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			System.out.println(cs_no);
			pstmt.setInt(1, cs_no);
			System.out.println(rs);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review review = new Review();
				review.setCs_no(rs.getInt("CS_NO"));
				review.setUser_no(rs.getInt("USER_NO"));
				review.setUser_id(rs.getString("USER_ID"));
				review.setRev_no(rs.getInt("REV_NO"));
				review.setRev_title(rs.getString("REV_TITLE"));
				review.setRev_content(rs.getString("REV_CONTENT"));
				review.setRev_regist(rs.getDate("REV_REGIST"));
				review.setRev_image(rs.getString("REV_IMAGE"));
				review.setRev_image_rename(rs.getString("REV_IMAGE_RENAME"));
				review.setRev_star(rs.getString("REV_STAR"));
				list.add(review);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}
	
	// 캠핑장 리뷰 작성 쿼리문 - int
	public int insertReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, ?, ?, SYSDATE, ?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, review.getRev_title());
			pstmt.setString(2, review.getRev_content());
			pstmt.setString(3, review.getRev_image());
			pstmt.setString(4, review.getRev_image_rename());
			pstmt.setString(5, review.getRev_star());
			pstmt.setInt(6, review.getUser_no());
			pstmt.setInt(7, review.getCs_no());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 캠핑장 번호별 리뷰 조회 쿼리문 
	public Review findReviewByNo(Connection conn, int campNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Review review = null;
		String query = "SELECT REV_NO, REV_TITLE, REV_CONTENT, REV_REGIST, REV_STAR, USER_NO, CS_NO "
				+ "FROM REVIEW "
				+ "WHERE CS_NO = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, campNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review = new Review();
				review.setRev_title(rs.getString("REV_TITLE"));
				review.setRev_content(rs.getString("REV_CONTENT"));
				review.setRev_star(rs.getString("REV_STAR"));
				review.setUser_no(rs.getInt("USER_NO"));
				review.setCs_no(rs.getInt("CS_NO"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return review;
	}
}