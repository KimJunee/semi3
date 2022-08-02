package com.camping.mvc.mypage.model.service;

import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import static com.camping.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.camping.common.util.PageInfo;
import com.camping.mvc.mypage.model.dao.MypageMyFavoriteDAO;
import com.camping.mvc.mypage.model.vo.MyFavorite;

public class MypageMyFavoriteService {
	private MypageMyFavoriteDAO dao = new MypageMyFavoriteDAO();
	
	public List<MyFavorite> getMyFavoriteList(PageInfo pageInfo, int userNo){
		Connection conn = getConnection();
		List<MyFavorite> list = dao.findFavorite(conn, pageInfo, userNo);
		close(conn);
		return list;
	}
	
	
	// 찜한 캠핑장 DB 저장
	public int saveMyFavorite(int campNo, int userNo) {
		Connection conn = getConnection();
		int result = 0; 
		
		result = dao.insertMyFavorite(conn, campNo, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	// 찜한 캠핑장 삭제 
	public int deleteMyFavorite(int userNo, int campNo) {
		Connection conn = getConnection();
		int result = dao.deleteFavorite(conn, userNo, campNo);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
