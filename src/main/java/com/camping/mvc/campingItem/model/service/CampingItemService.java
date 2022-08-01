package com.camping.mvc.campingItem.model.service;

import static com.camping.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.camping.common.util.PageInfo;
import com.camping.mvc.campingItem.model.dao.CampingItemDAO;
import com.camping.mvc.campingItem.model.vo.CampingItemVO;

public class CampingItemService {
	private CampingItemDAO dao = new CampingItemDAO();
	
	public int insertCampItem(CampingItemVO campItem) {
		Connection conn = getConnection();
		int result = dao.insertCampingItem(conn, campItem);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int getSearchCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getSearchCount(conn, searchMap);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public List<CampingItemVO> getCampItemList(PageInfo pageInfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<CampingItemVO> list = dao.findAll(conn, pageInfo, searchMap);
		return list;
	}
	
	public List<CampingItemVO> getCampItemSearch(String searchValue){
		Connection conn = getConnection();
		List<CampingItemVO> list = dao.findAll(conn, searchValue);
		return list;
	}

}
