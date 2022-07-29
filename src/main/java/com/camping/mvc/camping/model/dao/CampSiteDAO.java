package com.camping.mvc.camping.model.dao;

import static com.camping.common.jdbc.JDBCTemplate.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.camping.mvc.camping.model.vo.CampingVO;

public class CampSiteDAO {
	
	// 게시물의 갯수를 가져오는 쿼리문
		public List<CampingVO> selectAll(Connection conn) {
			List<CampingVO> list = new ArrayList<CampingVO>();
			
			try {
				String sql = "SELECT * FROM camp_site ORDER BY cs_no";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery(); 
				while(rs.next()) {
					int cnt = 1;
					int cs_no       = rs.getInt(cnt++);
					String cs_name  = rs.getString(cnt++);
					String cs_line_intro  = rs.getString(cnt++);
					String cs_intro = rs.getString(cnt++);
					String cs_allar   = rs.getString(cnt++);
					String cs_insrnc_at = rs.getString(cnt++);
					String cs_bizr_no  = rs.getString(cnt++);
					String cs_managesttus  = rs.getString(cnt++);
					String cs_feature_name  = rs.getString(cnt++);
					String cs_induty  = rs.getString(cnt++);
					String cs_lct_cl  = rs.getString(cnt++);
					String cs_do_name  = rs.getString(cnt++);
					String cs_sigungu_name  = rs.getString(cnt++);
					String cs_zipcode  = rs.getString(cnt++);
					String cs_addr1  = rs.getString(cnt++);
					String cs_addr2  = rs.getString(cnt++);
					String cs_map_x  = rs.getString(cnt++);
					String cs_map_y  = rs.getString(cnt++);
					String cs_tel  = rs.getString(cnt++);
					String cs_homepage  = rs.getString(cnt++);
					String cs_resve_url  = rs.getString(cnt++);
					String cs_resve_cl  = rs.getString(cnt++);
					int cs_manager  = rs.getInt(cnt++);
					int cs_gnrl_site  = rs.getInt(cnt++);
					int cs_auto_site  = rs.getInt(cnt++);
					int cs_glamp_site  = rs.getInt(cnt++);
					int cs_carav_site  = rs.getInt(cnt++);
					int cs_indiv_carav_site  = rs.getInt(cnt++);
					String cs_animal_cmg  = rs.getString(cnt++);
					String cs_postbl_fclty  = rs.getString(cnt++);
					String cs_sbrs_cl  = rs.getString(cnt++);
//					CampingVO cv = new CampingVO(cs_no, cs_name, cs_line_intro, cs_intro, cs_allar,
//							cs_insrnc_at, cs_bizr_no,cs_managesttus,cs_feature_name, cs_induty,
//							cs_lct_cl, cs_do_name, cs_sigungu_name, cs_zipcode,  cs_addr1,
//							 cs_addr2,  cs_map_x,  cs_map_y,  cs_tel,  cs_homepage,  cs_resve_url,
//							 cs_resve_cl,  cs_manager,  cs_gnrl_site,  cs_auto_site,  cs_glamp_site,
//							 cs_carav_site,  cs_indiv_carav_site,  cs_animal_cmg,  cs_postbl_fclty,
//							 cs_sbrs_cl);
//					list.add(cv);
				}
				pstmt.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public int insertCampingData(Connection conn, CampingVO camp) {
			try {
				String sql = "INSERT INTO camp_site VALUES (?, ? , ? , ? , ?, ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
						+ ",?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? )";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				int cnt = 1;
				pstmt.setInt           (cnt++, camp.getCs_no());
				pstmt.setString        (cnt++, camp.getCs_name());
				pstmt.setString        (cnt++, camp.getCs_line_intro());
				pstmt.setString        (cnt++, camp.getCs_intro());
				pstmt.setString        (cnt++, camp.getCs_allar());
				pstmt.setString        (cnt++, camp.getCs_insrnc_at());
				pstmt.setString        (cnt++, camp.getCs_bizr_no());
				pstmt.setString        (cnt++, camp.getCs_managesttus());
				pstmt.setString        (cnt++, camp.getCs_feature_name());
				pstmt.setString        (cnt++, camp.getCs_induty());
				pstmt.setString        (cnt++, camp.getCs_lct_cl());
				pstmt.setString        (cnt++, camp.getCs_do_name());
				pstmt.setString        (cnt++, camp.getCs_sigungu_name());
				pstmt.setString        (cnt++, camp.getCs_zipcode());
				pstmt.setString        (cnt++, camp.getCs_addr1());
				pstmt.setString        (cnt++, camp.getCs_addr2());
				pstmt.setString        (cnt++, camp.getCs_map_x());
				pstmt.setString        (cnt++, camp.getCs_map_y());
				pstmt.setString        (cnt++, camp.getCs_tel());
				pstmt.setString        (cnt++, camp.getCs_homepage());
				pstmt.setString        (cnt++, camp.getCs_resve_url());
				pstmt.setString        (cnt++, camp.getCs_resve_cl());
				pstmt.setInt           (cnt++, camp.getCs_manager());
				pstmt.setInt           (cnt++, camp.getCs_gnrl_site());
				pstmt.setInt           (cnt++, camp.getCs_auto_site());
				pstmt.setInt           (cnt++, camp.getCs_glamp_site());
				pstmt.setInt           (cnt++, camp.getCs_carav_site());
				pstmt.setInt           (cnt++, camp.getCs_indiv_carav_site());
				pstmt.setString        (cnt++, camp.getCs_animal_cmg());
				pstmt.setString        (cnt++, camp.getCs_postbl_fclty());
				pstmt.setString        (cnt++, camp.getCs_sbrs_cl());
				
				int result = pstmt.executeUpdate();
				pstmt.close();
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
	public static void main(String[] args) {
		CampSiteDAO cd = new CampSiteDAO();
		Connection conn = getConnection();
		System.out.println(cd.selectAll(conn));
	}

}