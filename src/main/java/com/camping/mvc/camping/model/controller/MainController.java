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
import com.camping.mvc.camping.model.vo.Review;

@WebServlet("/main")
public class MainController extends MyHttpServlet {
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
		
		List<Review> reviewList = campSiteService.selectReviewByRegist();
		req.setAttribute("reviewList", reviewList);
		req.getRequestDispatcher("/views/01_Main/main.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		return "MainController";
	}

}