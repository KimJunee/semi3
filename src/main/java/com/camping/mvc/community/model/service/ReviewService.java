package com.camping.mvc.community.model.service;

import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.List;
import com.camping.mvc.camping.model.dao.CampReviewDAO;
import com.camping.mvc.camping.model.vo.Review;

public class ReviewService {
	private CampReviewDAO dao = new CampReviewDAO();
	
	// 캠핑장 번호별 리뷰 조회
	public Review getReviewCount(int campNo) {
		Connection conn = getConnection();
		Review result = dao.findReviewByNo(conn, campNo);
		close(conn);
		return result;
	}
	
	// 캠핑장 리뷰 리스트
	public List<Review> getReviewList(int cs_no){
		Connection conn = getConnection();
		List<Review> list = dao.getReviewByCampNo(conn, cs_no);
		close(conn);
		return list;
	}
	
	// 캠핑장 리뷰 작성 - 리뷰 수정 안함, 없음, 안됨, 수정할 바에 삭제
	public int insertReview(Review review) {
		Connection conn = getConnection();
		int result = 0;

		result = dao.insertReview(conn, review);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}