package com.camping.mvc.camping.model.service;

import static com.camping.common.jdbc.JDBCTemplate.openConnection;
import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.rollback;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import com.camping.mvc.camping.model.dao.CampSiteDAO;
import com.camping.mvc.camping.model.vo.CampingVO;

public class CampSiteService {
	
	private CampSiteDAO campDAO = new CampSiteDAO();
	private Connection conn = null;
	
	public CampSiteService() {
		try {
			conn = openConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
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
}