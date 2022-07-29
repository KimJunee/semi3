package com.camping.mvc.inquiry.model.dao;

import static com.camping.common.jdbc.JDBCTemplate.close;
import static com.camping.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.camping.common.util.PageInfo;

import com.camping.mvc.inquiry.model.vo.Inquiry;
import com.camping.mvc.inquiry.model.vo.Inreply;

//문의게시판
public class InquiryDAO {
	// 총 게시글 갯수
	public int getInquiryCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM INQUIRY_BOARD";
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
			
	// 게시글 목록 조회(페이징) -일반 게시판 리스트
	public List<Inquiry> InquiryfindAll(Connection conn, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> list = new ArrayList<Inquiry>();
		String query = "SELECT RNUM, INQUIRY_NO,INQUIR_TITLE,USER_ID,INQUIR_REGIST,INQUIR_HIT "
				+ "FROM ( "
				+ "    SELECT ROWNUM AS RNUM,INQUIRY_NO,INQUIR_TITLE,USER_ID,INQUIR_REGIST,INQUIR_HIT "
				+ "    FROM ( "
				+ "        SELECT IB.INQUIRY_NO,IB.INQUIR_TITLE,UT.USER_ID,IB.INQUIR_REGIST,IB.INQUIR_HIT "
				+ "        FROM INQUIRY_BOARD IB JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO) "
				+ "         ORDER BY IB.INQUIRY_NO "
				+ "    ) "
				+ ") "
				+ "WHERE RNUM BETWEEN ? and ? ";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, pageInfo.getStartList());// 시작번호
			pstmt.setInt(2, pageInfo.getEndList());// 끝번호
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Inquiry inquiry = new Inquiry();
				inquiry.setRowNum(rs.getInt("RNUM"));
				inquiry.setInquiry_no(rs.getInt("INQUIRY_NO"));
				inquiry.setInquir_title(rs.getString("INQUIR_TITLE"));
				inquiry.setWriter_id(rs.getString("USER_ID"));
				inquiry.setInquir_regist(rs.getDate("INQUIR_REGIST"));
				inquiry.setInquir_hit(rs.getInt("INQUIR_HIT"));
				list.add(inquiry);
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
			public int getInquiryCount(Connection conn, Map<String, String> searchMap) {
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String query = "SELECT  COUNT(*) "
						+ "FROM INQUIRY_BOARD IB "
						+ "INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO) "
						+ "INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO) "
						+ "WHERE 1=1 ";
				
				//key부분
				if (searchMap.containsKey("USERID")) {
					query += "AND UT.USER_ID LIKE ? ";
				}
				if (searchMap.containsKey("INTITLE")) {
					query += "AND IB.INQUIR_TITLE LIKE ? ";
				}
				if (searchMap.containsKey("INCONTENT")) {
					query += "AND IB.INQUIR_CONTENT LIKE ? ";
				}

				//value부분
				int result = 0;
				try {
					
					pstmt = conn.prepareStatement(query);
					int count = 1;

					if (searchMap.containsKey("USERID")) {
						pstmt.setString(count++, "%" + searchMap.get("USERID") + "%");
					}
					if (searchMap.containsKey("INTITLE")) {
						pstmt.setString(count++, "%" + searchMap.get("INTITLE") + "%");
					}
					if (searchMap.containsKey("INCONTENT")) {
						pstmt.setString(count++, "%" + searchMap.get("INCONTENT") + "%");
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
				return result;
			}
	
			// 검색한 게시물의 리스트를 가져오는 메소드
			public List<Inquiry> InquiryfindAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<Inquiry> list = new ArrayList<Inquiry>();
				String queryBefore = "SELECT RNUM, INQUIRY_NO,USER_ID,CS_NAME,INQUIR_TITLE,INQUIR_CONTENT,INQUIR_REGIST,INQUIR_HIT "
						+ "FROM ( "
						+ "    SELECT ROWNUM AS RNUM,INQUIRY_NO,USER_ID,CS_NAME,INQUIR_TITLE,INQUIR_CONTENT,INQUIR_REGIST,INQUIR_HIT "
						+ "    FROM ( "
						+ "        SELECT  IB.INQUIRY_NO,UT.USER_ID,CS.CS_NAME,IB.INQUIR_TITLE,IB.INQUIR_CONTENT,IB.INQUIR_REGIST,IB.INQUIR_HIT "
						+ "        FROM INQUIRY_BOARD IB "
						+ "        INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO) "
						+ "        INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO) "
						+ "        WHERE 1 = 1 ";
				
				String queryAfter = "        ORDER BY IB.INQUIRY_NO DESC "+ "    ) "+ ") "+ "WHERE RNUM BETWEEN ? and ? ";

				//key부분
				if (searchMap.containsKey("USERID")) {
					queryBefore += "AND UT.USER_ID LIKE ? ";
				}
				if (searchMap.containsKey("INTITLE")) {
					queryBefore += "AND IB.INQUIR_TITLE LIKE ? ";
				}
				if (searchMap.containsKey("INCONTENT")) {
					queryBefore += "AND IB.INQUIR_TITLE LIKE ? ";
				}

				String query = queryBefore + queryAfter;

				//value부분
				try {
					pstmt = conn.prepareStatement(query);

					int count = 1;
					if (searchMap.containsKey("USERID")) {
						pstmt.setString(count++, "%" + searchMap.get("USERID") + "%");
					}
					if (searchMap.containsKey("INTITLE")) {
						pstmt.setString(count++, "%" + searchMap.get("INTITLE") + "%");
					}
					if (searchMap.containsKey("COCONTENT")) {
						pstmt.setString(count++, "%" + searchMap.get("INCONTENT") + "%");
					}

					pstmt.setInt(count++, pageInfo.getStartList());
					pstmt.setInt(count++, pageInfo.getEndList());

					rs = pstmt.executeQuery();
					while (rs.next()) {
						Inquiry inquiry = new Inquiry();
						inquiry.setRowNum(rs.getInt("RNUM"));
						inquiry.setInquiry_no(rs.getInt("INQUIRY_NO"));
						inquiry.setWriter_id(rs.getString("USER_ID"));
						inquiry.setCamping_name(rs.getString("CS_NAME"));
						inquiry.setInquir_title(rs.getString("INQUIR_TITLE"));
						inquiry.setInquir_content(rs.getString("INQUIR_CONTENT"));
						inquiry.setInquir_regist(rs.getDate("INQUIR_REGIST"));
						inquiry.setInquir_hit(rs.getInt("INQUIR_HIT"));
						list.add(inquiry);
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
			public int insertInquiry(Connection conn, Inquiry inquiry) {
				PreparedStatement pstmt = null;
				String query = "INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT)";
				int result = 0;

				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, inquiry.getUser_no());
					pstmt.setInt(2, inquiry.getCs_no());
					pstmt.setString(3, inquiry.getInquir_title());
					pstmt.setString(4, inquiry.getInquir_content());

					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				return result;
			}
			
			// 상세 게시글을 조회 
			public Inquiry findInquiryByNo(Connection conn, int inquiryNo) {
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				Inquiry inquiry = null;
		
				String query = "SELECT IB.INQUIRY_NO,UT.USER_ID,CS.CS_NAME,IB.INQUIR_TITLE,IB.INQUIR_CONTENT,IB.INQUIR_REGIST,IB.INQUIR_HIT "
						+ "FROM INQUIRY_BOARD IB "
						+ "INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO) "
						+ "INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO) "
						+ "WHERE IB.INQUIRY_NO=? ";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, inquiryNo);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						inquiry = new Inquiry();
						inquiry.setInquiry_no(rs.getInt("INQUIRY_NO"));
						inquiry.setWriter_id(rs.getString("USER_ID"));
						inquiry.setCamping_name(rs.getString("CS_NAME"));
						inquiry.setInquir_title(rs.getString("INQUIR_TITLE"));
						inquiry.setInquir_content(rs.getString("INQUIR_CONTENT"));
						inquiry.setInquir_regist(rs.getDate("INQUIR_REGIST"));
						inquiry.setInquir_hit(rs.getInt("INQUIR_HIT"));
						inquiry.setInreplies(getinRepliesByNO(conn,inquiryNo));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
					close(rs);
				}
				return inquiry;
			}



			// 게시글 조회수 올려주는 쿼리
			public int updateInquiryReadCount(Connection conn, Inquiry inquiry) {
				PreparedStatement pstmt = null;
				String query = "UPDATE INQUIRY_BOARD SET INQUIR_HIT=? WHERE INQUIRY_NO=?";
				int result = 0;

				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, inquiry.getInquir_hit() + 1);
					pstmt.setInt(2, inquiry.getInquiry_no());

					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				return result;
			}
			
			// 게시글 삭제를 위한 쿼리
			public int deleteInquiry(Connection conn, int inquiryNo) {
				PreparedStatement pstmt = null;
				String query = "DELETE INQUIRY_BOARD  WHERE INQUIRY_NO=?";
				int result = 0;

				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, inquiryNo);

					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				return result;

			}
			
			// 게시글 수정
			public int updateInquiry(Connection conn, Inquiry inquiry) {
				PreparedStatement pstmt = null;
				String query = "UPDATE INQUIRY_BOARD SET INQUIR_TITLE=?,INQUIR_CONTENT=? WHERE INQUIRY_NO=?";
				int result = 0;

				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, inquiry.getInquir_title());
					pstmt.setString(2, inquiry.getInquir_content());
					pstmt.setInt(3, inquiry.getInquiry_no());
					

					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				return result;
			}
			
			//문의글댓글가져오기
			private List<Inreply> getinRepliesByNO(Connection conn, int inquiryNo) {
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<Inreply> list = new ArrayList<Inreply>();
				String query = "SELECT INR.INR_NO,INR.INR_CONTENT,INR.INR_REGIST, UT.USER_ID, INR.INQUIRY_NO "
						+ "FROM INREPLY INR "
						+ "INNER JOIN USER_T UT  ON(INR.USER_NO = UT.USER_NO) "
						+ "WHERE  INR.INQUIRY_NO= ? "
						+ "ORDER BY  INR.INR_NO DESC ";

				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, inquiryNo);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Inreply inreply = new Inreply();
						inreply.setInr_no(rs.getInt("INR_NO"));
						inreply.setInr_content(rs.getString("INR_CONTENT"));
						inreply.setInr_regist(rs.getDate("INR_REGIST"));
						inreply.setInrwriter_id(rs.getString("USER_ID"));
						inreply.setInquiry_no(rs.getInt("INQUIRY_NO"));
						list.add(inreply);
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
			public int insertInreply(Connection conn, Inreply inreply) {
				PreparedStatement pstmt = null;
				String query = "INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL,?, DEFAULT,?,?)";
				int result = 0;

				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, inreply.getInr_content());
					pstmt.setInt(2, inreply.getUser_no());
					pstmt.setInt(3, inreply.getInquiry_no());

					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				return result;
			}

			// 리플 삭제 기능
			public int deleteInreply(Connection conn, int inquiryNo) {
				int result = 0;
				PreparedStatement pstmt = null;
				String query = "DELETE INREPLY  WHERE INR_NO=?";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, inquiryNo);
					
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
		InquiryDAO dao = new InquiryDAO();
		
		//총게시글 갯수
		int count = dao.getInquiryCount(conn);
		System.out.println("게시물 갯수 : " + count);
		System.out.println("--------------------------------------------");

		// 게시글 목록 조회(페이징) -일반 게시판 리스트
		//currentPage 현재 페이지
		//pageLimit 한 페이지에 보여질 페이지의 수 
		//listCount 전체 리스트의 수 
		//listLimit 한 페이지에 표시될 리스트의 수
		PageInfo info = new PageInfo(1, 10, count, 10);
		List<Inquiry> list = dao.InquiryfindAll(conn, info);
		for (Inquiry i : list) {
			System.out.println(i.toString());
		}
		System.out.println("--------------------------------------------\n");
		
		// 게시물 갯수- (검색하기)
		Map<String, String> searchMap = new HashMap<String, String>();
//		searchMap.put("USERID", "dummy1");
		searchMap.put("INTITLE", "테스트");
//		searchMap.put("INCONTENT", "테스트");
		count = dao.getInquiryCount(conn, searchMap);
		System.out.println("게시물 갯수 : " + count);
		System.out.println("--------------------------------------------");
		
		
		// 일반 게시판 리스트 - 탐색
		info = new PageInfo(1, 10, count, 10);
		list = dao.InquiryfindAll(conn, info, searchMap);
		for (Inquiry i : list) {
			System.out.println(i.toString());
		}
		System.out.println("--------------------------------------------\n");
	
	
		// 일반 게시판 글쓰기
		Inquiry inquiry = new Inquiry();
		inquiry.setUser_no(1);
		inquiry.setCs_no(1);
		inquiry.setInquir_title("자바 작성_문의글 제목");
		inquiry.setInquir_content("자바 작성_문의글 내용");

		int result = dao.insertInquiry(conn, inquiry);
		System.out.println("글올리기 결과 : " + result);
		System.out.println("--------------------------------------------\n");
		
		// 게시물 갯수
		count = dao.getInquiryCount(conn);
		System.out.println("게시물 갯수 : " + count);
		System.out.println("--------------------------------------------");

		// 일반 게시판 리스트
		info = new PageInfo(1, 10, count, 10);
		list = dao.InquiryfindAll(conn, info);
		for (Inquiry i : list) {
			System.out.println(i.toString());
		}
		System.out.println("--------------------------------------------\n");
		
		
		
		
	}
	

}
