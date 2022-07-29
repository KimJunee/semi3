package com.camping.mvc.inquiry.model.service;

import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.camping.common.util.PageInfo;
import com.camping.mvc.inquiry.model.dao.InquiryDAO;
import com.camping.mvc.inquiry.model.vo.Inquiry;
import com.camping.mvc.inquiry.model.vo.Inreply;


public class InquiryService {
	private InquiryDAO dao = new InquiryDAO();

	
	//문의게시글 번호
	public int getInquiryCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getInquiryCount(conn, searchMap);
		close(conn);
		return result;
	}
	
	//문의게시글 리스트
	public List<Inquiry> getInquiryList(PageInfo pageinfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<Inquiry> list = dao.InquiryfindAll(conn, pageinfo, searchMap);
		close(conn);
		return list;
	}
	
	// 문의게시글 저장
	public int saveInquiry(Inquiry inquiry) {
		Connection conn = getConnection();
		int result = 0;

		if (inquiry.getInquiry_no() != 0) {
			result = dao.updateInquiry(conn, inquiry);
		} else {
			result = dao.insertInquiry(conn, inquiry);
		}
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
		//문의게시글 조회
		public Inquiry findInquiryByNo(int no, boolean hasRead) {
			Connection conn = getConnection();
			Inquiry inquiry = dao.findInquiryByNo(conn, no);
			
			// 조회수 증가 로직
			if(hasRead == true && inquiry != null) {
				int result = dao.updateInquiryReadCount(conn, inquiry);
				if(result > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			}
			
			close(conn);
			return inquiry;
		}
	
	
		//문의게시글 삭제
		public int deleteInquiry(int no) {
			Connection conn = getConnection();
			int result = dao.deleteInquiry(conn, no);
			
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
	
	
		//문의게시글 댓글 저장
		public int saveInReply(Inreply inreply) {
			Connection conn = getConnection();
			int result = dao.insertInreply(conn, inreply);
			
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
	
		//댓글 삭제
		public int deleteInReply(int inquiryNo) {
			Connection conn = getConnection();
			
			int result = dao.deleteInreply(conn, inquiryNo);
			
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
	
	
	
	
	
	
	
}
