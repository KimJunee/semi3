package com.camping.mvc.mypage.model.dao;

import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.camping.common.util.PageInfo;
import com.camping.mvc.mypage.model.vo.MyFavorite;

public class MypageMyFavoriteDAO {
	
	
	// 찜한 캠핑장 객체 가져오는 쿼리문 (항상 DB commit)
	public MyFavorite findFavorite(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyFavorite myFav = null;
		
		String query = "SELECT CS_NAME, CS_ADDR1, CS_IMAGE "
				+ "        FROM LIKE_T LT  "
				+ "        INNER JOIN USER_T UT ON(LT.USER_NO = UT.USER_NO) "
				+ "        INNER JOIN CAMP_SITE CT ON(LT.CS_NO = CT.CS_NO) "
				+ "        WHERE UT.USER_NO = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				myFav = new MyFavorite();
				myFav.setCs_name(rs.getString("CS_NAME"));
				myFav.setCs_addr1(rs.getString("CS_ADDR1"));
				myFav.setCs_image(rs.getString("CS_IMAGE"));
				System.out.println("담긴 정보 : " + myFav);
				return myFav;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}
	
	// 찜한 캠핑장 리스트 가져오는 쿼리문 (마이페이지 - 찜한 캠핑장 목록 만들기)
	public List<MyFavorite> selectAllMyFavorite(Connection conn, PageInfo pageInfo, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyFavorite> list = new ArrayList<MyFavorite>();
		
		String query = "SELECT RNUM,  CS_NO, CS_NAME, CS_ADDR1, CS_IMAGE "
				+ "FROM ( "
				+ "    SELECT ROWNUM AS RNUM, CS_NO, CS_NAME, CS_ADDR1, CS_IMAGE "
				+ "    FROM ( "
				+ "        SELECT LT.CS_NO, CS_NAME, CS_ADDR1,CS_IMAGE "
				+ "        FROM LIKE_T LT  "
				+ "        INNER JOIN USER_T UT ON(LT.USER_NO = UT.USER_NO) "
				+ "        INNER JOIN CAMP_SITE CT ON(LT.CS_NO = CT.CS_NO) "
				+ "        where UT.USER_NO = ?  "
				+ "    ) "
				+ ") "
				+ "WHERE RNUM BETWEEN ? and ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;
			pstmt.setInt(count++, userNo);
			pstmt.setInt(count++, pageInfo.getStartList());
			pstmt.setInt(count++, pageInfo.getEndList());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyFavorite myFav = new MyFavorite();
				myFav.setCs_no(rs.getInt("CS_NO"));
				myFav.setCs_name(rs.getString("CS_NAME"));
				myFav.setCs_addr1(rs.getString("CS_ADDR1"));
				myFav.setCs_image(rs.getString("CS_IMAGE"));
				list.add(myFav);
				System.out.println("담긴 정보 : " + myFav);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	
//	// 찜하기 
//	public int insertMyFavorite(Connection conn, int userNo, int campNo) {
//		PreparedStatement pstmt = null;
//		String query = "INSERT INTO LIKE_T(LIKE_NO, CS_NO, USER_NO) VALUES(SEQ_LIKE_NO.NEXTVAL,?,?)";
//		int result = 0;
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, userNo);
//			pstmt.setInt(2, campNo);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
	
	
	// 찜한 캠핑장 목록 페이징 - 찜 개수
	public int getMyFavoriteCount(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM LIKE_T WHERE USER_NO = ? ";
		int result = 0; 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
				// ??
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	
	// 찜한 캠핑장 삭제하는 쿼리문 
	public int deleteFavorite(Connection conn, int userNo, int campNo) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM LIKE_T WHERE USER_NO = ? AND CS_NO = ? ";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, campNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public static void main(String[] args) {
		Connection conn = getConnection();
		MypageMyFavoriteDAO dao = new MypageMyFavoriteDAO();
		
		MyFavorite myFav = dao.findFavorite(conn, 62);
		System.out.println(myFav);
		
		int count = dao.getMyFavoriteCount(conn, 62);
		PageInfo pageInfo = new PageInfo(1, 10, count, 10);
		List<MyFavorite> list = dao.selectAllMyFavorite(conn, pageInfo, 62);
		
		System.out.println("---------------------------------------------");
		for(MyFavorite f : list)
			System.out.println(f.toString());
		System.out.println("---------------------------------------------");
		
		
		
		// 찜 삭제 
		// 사용자번호, 캠핑장
		int result = dao.deleteFavorite(conn, 62, 3100);
		System.out.println("찜 삭제 결과 : " + result);
		if(result > 0) {
			System.out.println("찜 삭제 성공");
		} else {
			System.out.println("찜 삭제 실패");
		}
		try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 찜 추가
//		int result = dao.insertMyFavorite(conn, 2,1);
//		System.out.println("찜 추가 결과 : " + result);
		
		
	}
	
	

}
