package com.camping.mvc.campingItem.model.dao;

import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.camping.common.util.PageInfo;
import com.camping.mvc.campingItem.model.vo.CampingItemVO;

public class CampingItemDAO {
	
	// 캠핑용품 삽입 
	public int insertCampingItem(Connection conn, CampingItemVO campItem) {
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO CAMP_ITEM VALUES"
					   + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			int cnt = 1;
			pstmt.setInt(cnt++, campItem.getCi_no());
			pstmt.setString(cnt++, campItem.getCi_title());
			pstmt.setString(cnt++, campItem.getCi_link());
			pstmt.setString(cnt++, campItem.getCi_image());
			pstmt.setString(cnt++, campItem.getCi_price());
			pstmt.setString(cnt++, campItem.getCi_mall_name());
			pstmt.setString(cnt++, campItem.getCi_product_id());
			pstmt.setString(cnt++, campItem.getCi_maker());
			pstmt.setString(cnt++, campItem.getCi_brand());
			pstmt.setString(cnt++, campItem.getCi_category3());
			pstmt.setString(cnt++, campItem.getCi_category4());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 검색 갯수
	public int getSearchCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM CAMP_ITEM WHERE 1=1 ";
		
		
		if(searchMap != null) {
			if(searchMap.containsKey("ci_title")) {
				query += "AND CI_TITLE LIKE ? ";
			}
			if(searchMap.containsKey("ci_brand")) {
				query += "AND CI_BRAND LIKE ? ";
			}
			if(searchMap.containsKey("ci_catogory3")) {
				query += "AND CI_CATEGORY3 LIKE ? ";
			}
		}
		
		int result = 0;
		try {
			if(searchMap != null) {
			pstmt = conn.prepareStatement(query);
			if(searchMap.containsKey("ci_title")) {
				pstmt.setString(1, "%" + searchMap.get("ci_title") + "%");
			}
			if(searchMap.containsKey("ci_brand")) {
				pstmt.setString(1, "%" + searchMap.get("ci_brand") + "%");
			}
			if(searchMap.containsKey("ci_category3")) {
				pstmt.setString(1, "%" + searchMap.get("ci_category3") + "%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("몇개나옴?? : " + result);
		return result;
	}
	
	// 검색 - 검색바 

	public List<CampingItemVO> findAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CampingItemVO> list = new ArrayList<>();
		
		String queryBefore = "SELECT RNUM, CI_NO, CI_TITLE, CI_LINK, CI_IMAGE, CI_PRICE, CI_BRAND, CI_CATEGORY3, CI_CATEGORY4 "
				+ "FROM (SELECT ROWNUM AS RNUM, CI_NO, CI_TITLE, CI_LINK, CI_IMAGE, CI_PRICE, CI_BRAND, CI_CATEGORY3, CI_CATEGORY4 "
				+ "        FROM CAMP_ITEM WHERE 1 = 1 ";
				
		String queryAfter = " ORDER BY CI_NO ASC) " + "WHERE RNUM BETWEEN ? AND ? ";
		if(searchMap != null) {
			
			if(searchMap.containsKey("ci_title")) {
				queryBefore += "AND CI_TITLE LIKE ? ";
			}
			if(searchMap.containsKey("ci_brand")) {
				queryBefore += "AND CI_BRAND LIKE ? ";
			}
			if(searchMap.containsKey("ci_category3")) {
				queryBefore += "AND CI_CATEGORY3 LIKE ? ";
			}
		}
		
		String query = queryBefore + queryAfter;
		
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;
			if(searchMap != null) {
				if(searchMap.containsKey("ci_title")) {
					pstmt.setString(count++, "%" + searchMap.get("ci_title") + "%");
				}
				if(searchMap.containsKey("ci_brand")) {
					pstmt.setString(count++, "%" + searchMap.get("ci_brand") + "%");
				}
				if(searchMap.containsKey("ci_category3")) {
					pstmt.setString(count++, "%" + searchMap.get("ci_catogory3") + "%");
				}
				
			}
			
			pstmt.setInt(count++, pageInfo.getStartList());
			pstmt.setInt(count++, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			System.out.println("errorpoint1");
			while(rs.next()) {
				CampingItemVO campingItem = new CampingItemVO();
				campingItem.setRowNum(rs.getInt("RNUM"));
				campingItem.setCi_no(rs.getInt("CI_NO"));
				campingItem.setCi_title(rs.getString("CI_TITLE"));
				campingItem.setCi_link(rs.getString("CI_LINK"));
				campingItem.setCi_image(rs.getString("CI_IMAGE"));
				campingItem.setCi_price(rs.getString("CI_PRICE"));
				campingItem.setCi_brand(rs.getString("CI_BRAND"));
				campingItem.setCi_category3(rs.getString("CI_CATEGORY3"));
				campingItem.setCi_category4(rs.getString("CI_CATEGORY4"));
				list.add(campingItem);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
//		System.out.println(list.toString());
		return list;
	}
	
	// 헤더 검색바/템플릿 - 타이틀로만 검색 
	public List<CampingItemVO> findAll(Connection conn, String searchValue){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CampingItemVO> list = new ArrayList<CampingItemVO>();
		
		String query = "SELECT CI_NO, CI_TITLE, CI_LINK, CI_IMAGE, CI_PRICE, CI_BRAND, CI_CATEGORY3, CI_CATEGORY4 "
					+ " FROM CAMP_ITEM WHERE CI_TITLE LIKE ? ORDER BY CI_NO ";
		try {
			pstmt = conn.prepareStatement(query);
	
				pstmt.setString(1, "%" + searchValue + "%");

			rs = pstmt.executeQuery();
			while(rs.next()) {
				CampingItemVO campingItem = new CampingItemVO();
				campingItem.setCi_no(rs.getInt("CI_NO"));
				campingItem.setCi_title(rs.getString("CI_TITLE"));
				campingItem.setCi_link(rs.getString("CI_LINK"));
				campingItem.setCi_image(rs.getString("CI_IMAGE"));
				campingItem.setCi_price(rs.getString("CI_PRICE"));
				campingItem.setCi_brand(rs.getString("CI_BRAND"));
				campingItem.setCi_category3(rs.getString("CI_CATEGORY3"));
				campingItem.setCi_category4(rs.getString("CI_CATEGORY4"));
				list.add(campingItem);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(list.toString());
		return list;
	}
	
//public static void main(String[] args) {
//	Connection conn = getConnection();
//	CampingItemDAO dao = new CampingItemDAO();
//		
//		// 탐색 갯수
//	Map<String, String> searchMap = new HashMap<String, String>();
//	searchMap.put("ci_title", "랜턴");
//		searchMap.put("ci_brand", "네이처하이크");
//		searchMap.put("ci_category3", "침낭");
//	int count = dao.getSearchCount(conn, searchMap);
//	System.out.println(count);
//	PageInfo pageInfo = new PageInfo(1, 5, count, 60);
//		
//		// 탐색리스트 
//		List<CampingItemVO> list = dao.findAll(conn, pageInfo, searchMap);
//		for(CampingItemVO camp : list) {
//			System.out.println(camp.toString());
//		}
//		
//	list = dao.findAll(conn, "랜턴");
//	for(CampingItemVO camp : list) {
//		System.out.println(camp.toString());
//	}
//		
//}

}
