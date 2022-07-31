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

	public List<Community> getMyWrite(Connection conn, int userno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Community> list = new ArrayList<Community>();
		
		String query = "SELECT U.USER_NO, C.CO_TITLE, C.CO_CONTENT "
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
	
	

}

