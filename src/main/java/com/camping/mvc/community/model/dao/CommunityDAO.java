package com.camping.mvc.community.model.dao;

import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import static com.camping.common.jdbc.JDBCTemplate.close;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.camping.common.util.PageInfo;
import com.camping.mvc.community.model.vo.Community;
import com.camping.mvc.community.model.vo.Reply;

public class CommunityDAO {
	
	// 총 게시글 갯수
		public int getCommunityCount(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT COUNT(*) FROM COMMU_BOARD";
			int result = 0;
			try {
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return result;
		}
		
		
		//게시글 목록 조회(페이징) -일반 게시판 리스트
		public List<Community> findAll(Connection conn, PageInfo pageInfo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Community> list = new ArrayList<Community>();
			String query = "SELECT RNUM, CO_NO,CO_TITLE,USER_ID,CO_REGIST, CO_HIT "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, CO_NO,CO_TITLE,USER_ID,CO_REGIST, CO_HIT "
					+ "    FROM ( "
					+ "        SELECT CB.CO_NO,CB.CO_TITLE,UT.USER_ID,CB.CO_REGIST, CB.CO_HIT "
					+ "        FROM COMMU_BOARD CB JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO) "
					+ "         ORDER BY CB.CO_NO "
					+ "    ) "
					+ ") "
					+ "WHERE RNUM BETWEEN ? and ?";
		
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, pageInfo.getStartList());//시작번호
				pstmt.setInt(2, pageInfo.getEndList());//끝번호
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Community community = new Community();
					community.setRowNum(rs.getInt("RNUM"));
					community.setCo_no(rs.getInt("CO_NO"));
					community.setCo_title(rs.getString("CO_TITLE"));
					community.setWriter_id(rs.getString("USER_ID"));
					community.setCo_regist(rs.getDate("CO_REGIST"));
					community.setCo_hit(rs.getInt("CO_HIT"));
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
		
		
		// 게시물의 갯수를 가져오는 쿼리
		public int getCommunityCount(Connection conn, Map<String, String> searchMap) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT  COUNT(*) "
					+ "FROM COMMU_BOARD CB "
					+ "JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO) "
					+ "WHERE 1=1 ";
			
			//key부분
			if (searchMap.containsKey("USERID")) {
				query += "AND UT.USER_ID LIKE ? ";
			}
			if (searchMap.containsKey("COTITLE")) {
				query += "AND CB.CO_TITLE LIKE ? ";
			}
			if (searchMap.containsKey("COCONTENT")) {
				query += "AND CO_CONTENT LIKE ? ";
			}

			//value부분
			int result = 0;
			try {
				
				pstmt = conn.prepareStatement(query);
				int count = 1;

				if (searchMap.containsKey("USERID")) {
					pstmt.setString(count++, "%" + searchMap.get("USERID") + "%");
				}
				if (searchMap.containsKey("COTITLE")) {
					pstmt.setString(count++, "%" + searchMap.get("COTITLE") + "%");
				}
				if (searchMap.containsKey("COCONTENT")) {
					pstmt.setString(count++, "%" + searchMap.get("COCONTENT") + "%");
				}
				
				
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			System.out.println("point1");
			return result;
		}
		
		
		// 검색한 게시물의 리스트를 가져오는 메소드
		public List<Community> findAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Community> list = new ArrayList<Community>();
			String queryBefore = "SELECT RNUM, CO_NO,USER_ID, CO_TITLE,CO_CONTENT,CO_REGIST,CO_HIT "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM,CO_NO,USER_ID, CO_TITLE,CO_CONTENT,CO_REGIST,CO_HIT "
					+ "    FROM ( "
					+ "        SELECT  CB.CO_NO,UT.USER_ID, CB.CO_TITLE,CB.CO_CONTENT,CB.CO_REGIST,CB.CO_HIT "
					+ "        FROM COMMU_BOARD CB JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO) "
					+ "        WHERE 1 = 1 ";

			
			String queryAfter = "        ORDER BY  CB.CO_NO DESC "+ "    ) "+ ") "+ "WHERE RNUM BETWEEN ? and ?";

			//key부분
			if (searchMap.containsKey("USERID")) {
				queryBefore += "AND UT.USER_ID LIKE ? ";
			}
			if (searchMap.containsKey("COTITLE")) {
				queryBefore += "AND CB.CO_TITLE LIKE ? ";
			}
			if (searchMap.containsKey("COCONTENT")) {
				queryBefore += "AND CB.CO_CONTENT LIKE ? ";
			}

			String query = queryBefore + queryAfter;

			//value부분
			try {
				pstmt = conn.prepareStatement(query);

				int count = 1;
				if (searchMap.containsKey("USERID")) {
					pstmt.setString(count++, "%" + searchMap.get("USERID") + "%");
				}
				if (searchMap.containsKey("COTITLE")) {
					pstmt.setString(count++, "%" + searchMap.get("COTITLE") + "%");
				}
				if (searchMap.containsKey("COCONTENT")) {
					pstmt.setString(count++, "%" + searchMap.get("COCONTENT") + "%");
				}

				pstmt.setInt(count++, pageInfo.getStartList());
				pstmt.setInt(count++, pageInfo.getEndList());

				rs = pstmt.executeQuery();
				while (rs.next()) {
					Community community = new Community();
					community.setRowNum(rs.getInt("RNUM"));
					community.setCo_no(rs.getInt("CO_NO"));
					community.setWriter_id(rs.getString("USER_ID"));
					community.setCo_title(rs.getString("CO_TITLE"));
					community.setCo_content(rs.getString("CO_CONTENT"));
					community.setCo_regist(rs.getDate("CO_REGIST"));
					community.setCo_hit(rs.getInt("CO_HIT"));
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
		
		
		// 글쓰기 기능
		public int insertBoard(Connection conn, Community community) {
			PreparedStatement pstmt = null;
			String query = "INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,?,?,?,DEFAULT,DEFAULT)";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, community.getUser_no());
				pstmt.setString(2, community.getCo_title());
				pstmt.setString(3, community.getCo_content());

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		
		
		// 상세 게시글을 조회 
		public Community findBoardByNo(Connection conn, int communityNo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Community community = null;
	
			String query = "SELECT  CB.CO_NO, UT.USER_ID, CB.CO_TITLE, CB.CO_CONTENT, CB.CO_REGIST, CB.CO_HIT "
					+ "FROM COMMU_BOARD CB "
					+ "JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO) "
					+ "WHERE CB.CO_NO=?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, communityNo);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					community = new Community();
					community.setCo_no(rs.getInt("CO_NO"));
					community.setWriter_id(rs.getString("USER_ID"));
					community.setCo_title(rs.getString("CO_TITLE"));
					community.setCo_content(rs.getString("CO_CONTENT"));
					community.setCo_regist(rs.getDate("CO_REGIST"));
					community.setCo_hit(rs.getInt("CO_HIT"));
					community.setReplies(getRepliesByNO(conn,communityNo));//리플 가져와서 넘겨주는코드(이거없으면 댓글작성 안뜸)
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return community;
		}
		
		
		// 게시글 조회수 올려주는 쿼리
		public int updateReadCount(Connection conn, Community community) {
			PreparedStatement pstmt = null;
			String query = "UPDATE COMMU_BOARD SET CO_HIT=? WHERE CO_NO=?";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, community.getCo_hit() + 1);
				pstmt.setInt(2, community.getCo_no());

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		
		// 게시글 삭제를 위한 쿼리
		public int deleteCommunity(Connection conn, int communityNo) {
			PreparedStatement pstmt = null;
			String query = "DELETE COMMU_BOARD  WHERE CO_NO=?";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, communityNo);

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;

		}
		
		
		// 게시글 수정
		public int updateBoard(Connection conn, Community community) {
			PreparedStatement pstmt = null;
			String query = "UPDATE COMMU_BOARD SET CO_TITLE=?,CO_CONTENT='? WHERE CO_NO=?";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, community.getCo_title());
				pstmt.setString(2, community.getCo_content());
				pstmt.setInt(3, community.getCo_no());
				

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		
		//리플 가져오는 메소드
		private List<Reply> getRepliesByNO(Connection conn, int communityNo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Reply> list = new ArrayList<Reply>();
			String query = "SELECT R.REP_NO, R.CO_NO,R.REP_CONTENT, UT.USER_ID, R.REP_REGIST "
					+ "FROM REPLY R "
					+ "JOIN USER_T UT  ON(R.USER_NO = UT.USER_NO) "
					+ "WHERE  R.CO_NO= ? "
					+ "ORDER BY R.REP_NO DESC ";

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, communityNo);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Reply reply = new Reply();
					reply.setRep_no(rs.getInt("REP_NO"));
					reply.setCo_no(rs.getInt("CO_NO"));
					reply.setRep_content(rs.getString("REP_CONTENT"));
					reply.setWriter_id(rs.getString("USER_ID"));
					reply.setRep_regist(rs.getDate("REP_REGIST"));
					list.add(reply);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return list;
		}
		
		// 리플 쓰기 기능
		public int insertReply(Connection conn, Reply reply) {
			PreparedStatement pstmt = null;
			String query = "INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL,?, DEFAULT,?, ?)";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, reply.getRep_content());
				pstmt.setInt(2, reply.getUser_no());
				pstmt.setInt(3, reply.getCo_no());

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		// 리플 삭제 기능
		public int deleteReply(Connection conn, int replyNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "DELETE REPLY  WHERE REP_NO=?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, replyNo);
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		
		
		
//==============================================================================
		



public static void main(String[] args) {
	Connection conn = getConnection();
	CommunityDAO dao = new CommunityDAO();
	
	//총게시글 갯수
	int count = dao.getCommunityCount(conn);
	System.out.println("게시물 갯수 : " + count);
	System.out.println("--------------------------------------------");


	// 게시글 목록 조회(페이징) -일반 게시판 리스트
	//currentPage 현재 페이지
	//pageLimit 한 페이지에 보여질 페이지의 수 
	//listCount 전체 리스트의 수 
	//listLimit 한 페이지에 표시될 리스트의 수
	PageInfo info = new PageInfo(1, 10, count, 10);
	List<Community> list = dao.findAll(conn, info);
	for (Community c : list) {
		System.out.println(c.toString());
	}
	System.out.println("--------------------------------------------\n");


	// 게시물 갯수- (검색하기)
	Map<String, String> searchMap = new HashMap<String, String>();
//	searchMap.put("USERID", "dummy1");
	searchMap.put("COTITLE", "캠핑");
//	searchMap.put("COCONTENT", "폭죽");
	count = dao.getCommunityCount(conn, searchMap);
	System.out.println("게시물 갯수 : " + count);
	System.out.println("--------------------------------------------");
	
	
	// 일반 게시판 리스트 - 탐색
	info = new PageInfo(1, 10, count, 10);
	list = dao.findAll(conn, info, searchMap);
	for (Community c : list) {
		System.out.println(c.toString());
	}
	System.out.println("--------------------------------------------\n");
	
	
	// 일반 게시판 글쓰기
	Community community = new Community();
	community.setUser_no(1);
	community.setCo_title("자바 작성_게시글 제목");
	community.setCo_content("자바 작성_게시글 내용");

	int result = dao.insertBoard(conn, community);
	System.out.println("글올리기 결과 : " + result);
	System.out.println("--------------------------------------------\n");
	
	// 게시물 갯수
	count = dao.getCommunityCount(conn);
	System.out.println("게시물 갯수 : " + count);
	System.out.println("--------------------------------------------");

	// 일반 게시판 리스트
	info = new PageInfo(1, 10, count, 10);
	list = dao.findAll(conn, info);
	for (Community c : list) {
		System.out.println(c.toString());
	}
	System.out.println("--------------------------------------------\n");
	
	
	
	
	
	
	
	
	

	}
	
	
}
