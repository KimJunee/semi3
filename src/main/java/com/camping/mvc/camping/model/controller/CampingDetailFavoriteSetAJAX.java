package com.camping.mvc.camping.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.CampSiteService;

@WebServlet("/favoriteSet.do")
public class CampingDetailFavoriteSetAJAX extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	CampSiteService service = new CampSiteService();
	@Override
	public String getServletName() {
		return "CampingDetailFavoriteAJAX";
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("CampingDetailFavoriteSetAJAX 호출됨!!");
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		boolean isFavorite = Boolean.valueOf(req.getParameter("isFavorite"));
		
		System.out.println(req.getParameter("campno"));
		System.out.println(req.getParameter("userno"));
		int campno = Integer.parseInt(req.getParameter("campno"));
		int userno = Integer.parseInt(req.getParameter("userno"));
		
		
		if(isFavorite == true) {
			//찜하기
			int result = service.insertCampingFavorite(campno, userno);
			
			resp.setContentType("text/html;charset=UTF-8");
			if(result > 0) {
				resp.getWriter().append("true");//찜 완료
			}else {
				resp.getWriter().append("false");//찜 불가능
			}
		}else {
			// 찜 해제
			int result = service.DeleteCampingFavorite(campno, userno);
			resp.setContentType("text/html;charset=UTF-8");
			if(result > 0) {
				resp.getWriter().append("true");//해체완료
			}else {
				resp.getWriter().append("false");// 해제 불가능
			}
		}
		
	}

}
