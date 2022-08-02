package com.camping.mvc.camping.model.service;

import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.openConnection;
import static com.camping.common.jdbc.JDBCTemplate.rollback;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.camping.common.util.PageInfo;
import com.camping.mvc.camping.model.dao.CampDetailDAO;
import com.camping.mvc.camping.model.dao.CampReviewDAO;
import com.camping.mvc.camping.model.dao.CampSiteDAO;
import com.camping.mvc.camping.model.vo.CampingVO;
import com.camping.mvc.camping.model.vo.Review;
import com.camping.mvc.mypage.model.vo.MyFavorite;

public class CampSiteService {
	
	private CampSiteDAO campDAO = new CampSiteDAO();
	private Connection conn = null;
	private CampDetailDAO detailDAO = new CampDetailDAO();
	private CampReviewDAO reviewDAO = new CampReviewDAO();

	public CampSiteService() {
		try {
			conn = openConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} return;
	}
	
	public Connection getConnection() {
		return conn;
	}
	
	public int insertCampSiteData(CampingVO camp) {
		int result = campDAO.insertCampingData(getConnection(), camp);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int getCampsiteCount(String searchWord, String addr, String[] campTypes, String[] checkBoxs) {
		Connection conn = getConnection();
		int result = campDAO.getCampsiteCount(conn, searchWord, addr, campTypes, checkBoxs);
		
		return result;
	}

	public List<CampingVO> getCampsiteList(PageInfo pageInfo, String searchWord, String addr, String[] campTypes,
			String[] checkBoxs) {
		Connection conn = getConnection();
		List<CampingVO> list = campDAO.findAll(conn, pageInfo, searchWord, addr, campTypes, checkBoxs);
		
		return list;
	}
	
	public CampingVO findCampDetailByNo(int no) {
		Connection conn = getConnection();
		CampingVO campingVO = detailDAO.findCampDetailByNo(conn, no);
		return campingVO;
		
	}
	
	public List<Review> getReviewList(int campNo) {
		Connection conn = getConnection();
		List<Review> reviewList = reviewDAO.getReviewByCampNo(conn, campNo);
		return reviewList;
	}

	public int insertCampingFavorite(int campno, int userno) {
		int result = detailDAO.insertCampingFavoriteData(getConnection(), campno, userno);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public MyFavorite findCampFavorite(int campno, int userno) {
		MyFavorite result = detailDAO.findCampingFavoriteData(getConnection(), campno, userno);
		return result;
	}

	public int DeleteCampingFavorite(int campno, int userno) {
		int result = detailDAO.DeleteCampingFavoriteData(getConnection(), campno, userno);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	

}
