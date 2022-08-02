package com.camping.mvc.camping.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.CampSiteService;
import com.camping.mvc.mypage.model.vo.MyFavorite;

@WebServlet("/favoriteGet.do")
public class CampingDetailFavoriteGetAJAX extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	CampSiteService service = new CampSiteService();
	@Override
	public String getServletName() {
		return "CampingDetailFavoriteAJAX";
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("CampingDetailFavoriteGetAJAX 호출됨!!");
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		System.out.println(req.getParameter("campno"));
		System.out.println(req.getParameter("userno"));
		int campno = Integer.parseInt(req.getParameter("campno"));
		int userno = Integer.parseInt(req.getParameter("userno"));
		
		// 즐겨찾기 여부 조회하기
		MyFavorite result = service.findCampFavorite(campno, userno);
		
		resp.setContentType("text/html;charset=UTF-8");
		if(result != null) {
			resp.getWriter().append("true");
		}else {
			resp.getWriter().append("false");
		}
	}

}
