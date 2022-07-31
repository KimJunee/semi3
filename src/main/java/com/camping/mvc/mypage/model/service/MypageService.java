package com.camping.mvc.mypage.model.service;

import static com.camping.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.camping.mvc.community.model.vo.Community;
import com.camping.mvc.mypage.model.dao.MypageDAO;

public class MypageService {
	private MypageDAO dao = new MypageDAO();

	public List<Community> getMywrite(int userno) {
		Connection conn = getConnection();
		List<Community> list = dao.getMyWrite(conn, userno);
		return list;
	}

}


