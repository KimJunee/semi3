package com.camping.mvc.camping.model.service;

import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import static com.camping.common.jdbc.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.List;
import com.camping.common.util.PageInfo;
import com.camping.mvc.camping.model.dao.ReservationDAO;
import com.camping.mvc.camping.model.vo.Reservation;

public class ReservationService {
	private ReservationDAO dao = new ReservationDAO();
	
	public List<Reservation> getReservationList(Connection conn, PageInfo pageInfo) {
		List<Reservation> list = dao.selectAllReservation(conn, pageInfo);
		close(conn);
		return list;
	}
	// 예약하기 DB 저장로직
	public int saveReservation(Reservation resv) {
		// DB랑 연결
		Connection conn = getConnection();
		// 결과값 초기화
		int result = 0;
		
		// 예약번호가 0이 아니면 - 예약 수정
		if(resv.getResv_no() != 0) {
			// 업데이트 쿼리 넣은 값을 result에 받아옴
			result = dao.updateReservation(conn, resv);
		// 예약번호가 0이면 - ReservationServlet에서 0 들어옴
		} else {
			// 테이블에 데이터 넣은 값을 result에 받아옴
			result = dao.insertReservation(conn, resv);
		}

		//영향을 받은 행(삽입, 수정, 삭제)이 있음
		if(result > 0) {
			commit(conn);
		// 영향을 받은 행(삽입, 수정, 삭제)이 없음
		} else {
			rollback(conn);
		}
		// DB 연결 닫음
		close(conn);
		// 영향을 받은 행(데이터) 반환
		return result;
	}
	// 예약취소 DB 저장로직
	public int deletReservation(Reservation resv) {
		Connection conn = getConnection();
		int result = dao.deleteReservation(conn, resv);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}