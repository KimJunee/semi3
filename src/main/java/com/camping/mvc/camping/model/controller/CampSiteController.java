package com.camping.mvc.camping.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.api.CampSiteAPI;
import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.CampSiteService;
import com.camping.mvc.camping.model.vo.CampingVO;

@WebServlet("/main")
public class CampSiteController extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	CampSiteService campSiteService = new CampSiteService();
	
	public void initCampSiteData() {
//		CampSiteAPI campSiteApi = new CampSiteAPI();
		List<CampingVO> list = CampSiteAPI.callCampListByXML();
		for(CampingVO camp : list) {
			campSiteService.insertCampSiteData(camp);
		}
		System.out.println("완료");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("go Main");
//		req.getRequestDispatcher("/views/02_Camping/reservation.jsp").forward(req, resp);
		req.getRequestDispatcher("/views/01_Main/main.jsp").forward(req, resp);
		//req.getRequestDispatcher("/views/02_Camping/campingSearch.jsp").forward(req, resp);
//		req.getRequestDispatcher("/views/05_MyPage/kakaoTest.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		return "CampSiteController";
	}
	
//	public static void main(String[] args) {
//		CampSiteController controller = new CampSiteController();
//		controller.initCampSiteData();
//	}
}