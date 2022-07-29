package com.camping.mvc.community.model.service;

import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.commit;
import static com.camping.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.camping.common.util.PageInfo;
import com.camping.mvc.community.model.dao.CommunityDAO;
import com.camping.mvc.community.model.vo.Community;
import com.camping.mvc.community.model.vo.Reply;

public class CommunityService {
	private CommunityDAO dao = new CommunityDAO();
	
	
	//게시물 번호
	public int getCommunityCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getCommunityCount(conn, searchMap);
		close(conn);
		return result;
	}


	//게시물 리스트
		public List<Community> getCommunityList(PageInfo pageinfo, Map<String, String> searchMap) {
			Connection conn = getConnection();
			List<Community> list = dao.findAll(conn, pageinfo, searchMap);
			close(conn);
			return list;
		}
	
		// 게시물 저장
		public int save(Community community) {
			Connection conn = getConnection();
			int result = 0;

			if (community.getCo_no() != 0) {
				result = dao.updateBoard(conn, community);
			} else {
				result = dao.insertBoard(conn, community);
			}
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
			return result;
		}

		
		//게시글 조회
		public Community findBoardByNo(int no, boolean hasRead) {
			Connection conn = getConnection();
			Community community = dao.findBoardByNo(conn, no);
		
			// 조회수 증가 로직
			if(hasRead == true && community != null) {
				int result = dao.updateReadCount(conn, community);
				if(result > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			}
			
			close(conn);
			return community;
		}
		
		//게시글 삭제
		public int delete(int no) {
			Connection conn = getConnection();
			int result = dao.deleteCommunity(conn, no);
			
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
		
		
		//댓글 저장
		public int saveReply(Reply reply) {
			Connection conn = getConnection();
			int result = dao.insertReply(conn, reply);
			
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
		
		//댓글 삭제
		public int deleteReply(int replyNo) {
			Connection conn = getConnection();
			
			int result = dao.deleteReply(conn, replyNo);
			
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
		
		
		
		
		
		
		
		
		
		
		
		
}
