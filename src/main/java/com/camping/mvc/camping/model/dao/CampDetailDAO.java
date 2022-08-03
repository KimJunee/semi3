package com.camping.mvc.camping.model.dao;

import static com.camping.common.jdbc.JDBCTemplate.close;

import static com.camping.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.camping.mvc.camping.model.vo.CampingVO;
import com.camping.mvc.mypage.model.vo.MyFavorite;

public class CampDetailDAO {

	// 캠핑장 상세정보 가져오는 쿼리문
//	public CampingVO showCampDetail(Connection conn){
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String query = "SELECT CS_NAME, CS_ADDR1, CS_ADDR2, CS_INDUTY, CS_RESVE_CL, CS_SBRS_CL, CS_POSTBL_FCLTY, CS_HOMEPAGE, CS_LCT_CL, CS_FEATURE_NAME "
//				+ "FROM CAMP_SITE ";
//		try {
//			pstmt = conn.prepareStatement(query);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				CampingVO campingVO = new CampingVO();
//				campingVO.setCs_name(rs.getString("CS_NAME"));
//				campingVO.setCs_addr1(rs.getString("CS_ADDR1"));
//				campingVO.setCs_induty(rs.getString("CS_INDUTY"));
//				campingVO.setCs_resve_cl(rs.getString("CS_RESVE_CL"));
//				campingVO.setCs_sbrs_cl(rs.getString("CS_SBRS_CL"));
//				campingVO.setCs_postbl_fclty(rs.getString("CS_POSTBL_FCLTY"));
//				campingVO.setCs_homepage(rs.getString("CS_HOMEPAGE"));
//				return campingVO;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//			close(rs);
//		}
//		return null;
//	}

	// 캠핑장 조회하는 쿼리문
	public CampingVO findCampDetailByNo(Connection conn, int campNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CampingVO campingVO = null;
		String query = "SELECT CS_NO, CS_NAME, CS_ADDR1, CS_ADDR2, CS_INDUTY, CS_RESVE_CL, CS_SBRS_CL, CS_POSTBL_FCLTY, CS_HOMEPAGE, CS_LCT_CL, CS_FEATURE_NAME, CS_MANAGESTTUS, CS_ANIMAL_CMG, CS_RESVE_URL, CS_MAP_Y, CS_MAP_X, CS_TEL, CS_ACCOM_FEE, CS_IMAGE "
				+ "FROM CAMP_SITE " + "WHERE CS_NO = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, campNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				campingVO = new CampingVO();
				campingVO.setCs_no(rs.getInt("CS_NO"));
				campingVO.setCs_name(rs.getString("CS_NAME"));
				campingVO.setCs_addr1(rs.getString("CS_ADDR1"));
				campingVO.setCs_addr2(rs.getString("CS_ADDR2"));
				campingVO.setCs_induty(rs.getString("CS_INDUTY"));
				campingVO.setCs_resve_cl(rs.getString("CS_RESVE_CL"));
				campingVO.setCs_sbrs_cl(rs.getString("CS_SBRS_CL"));
				campingVO.setCs_postbl_fclty(rs.getString("CS_POSTBL_FCLTY"));
				campingVO.setCs_homepage(rs.getString("CS_HOMEPAGE"));
				campingVO.setCs_lct_cl(rs.getString("CS_LCT_CL"));
				campingVO.setCs_feature_name(rs.getString("CS_FEATURE_NAME"));
				campingVO.setCs_managesttus(rs.getString("CS_MANAGESTTUS"));
				campingVO.setCs_animal_cmg(rs.getString("CS_ANIMAL_CMG"));
				campingVO.setCs_resve_url(rs.getString("CS_RESVE_URL"));
				campingVO.setCs_map_y(rs.getString("CS_MAP_Y"));
				campingVO.setCs_map_x(rs.getString("CS_MAP_X"));
				campingVO.setCs_tel(rs.getString("CS_TEL"));
				campingVO.setCs_accom_fee(rs.getString("CS_ACCOM_FEE"));
				campingVO.setCs_image(rs.getString("CS_IMAGE"));
				return campingVO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

	public int insertCampingFavoriteData(Connection conn, int campno, int userno) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO LIKE_T VALUES(SEQ_LIKE_NO.NEXTVAL,?,?) ";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userno);
			pstmt.setInt(2, campno);
			
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int DeleteCampingFavoriteData(Connection conn, int campno, int userno) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM LIKE_T WHERE USER_NO = ? AND CS_NO = ?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userno);
			pstmt.setInt(2, campno);
			
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public MyFavorite findCampingFavoriteData(Connection conn, int campno, int userno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyFavorite mf = null;
		
		String query = "SELECT * FROM LIKE_T WHERE USER_NO = ? AND CS_NO = ? ";
		
		try {
			System.out.println(userno);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userno);
			pstmt.setInt(2, campno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mf = new MyFavorite();
				mf.setLike_no(rs.getInt("LIKE_NO"));
				mf.setUser_no(rs.getInt("USER_NO"));
				mf.setCs_no(rs.getInt("CS_NO"));
				System.out.println("찜이 되어있음");
				System.out.println(mf);
				return mf;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("찜이 안되어 있음!!");
		return null;
	}
	
	
	public static void main(String[] args) {
		Connection conn = getConnection();
		CampDetailDAO dao = new CampDetailDAO();
		
		CampingVO campingVO = dao.findCampDetailByNo(conn, 4);
		System.out.println(campingVO);
		
//		CampingVO campingVO = dao.showCampDetail(conn);
//		
//		System.out.println(campingVO);
		
		System.out.println("-------------------------------");

	}




}