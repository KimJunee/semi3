package com.camping.mvc.camping.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.CampSiteService;
import com.camping.mvc.camping.model.service.ReservationService;
import com.camping.mvc.camping.model.vo.CampingVO;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.camping.model.vo.Review;
import com.camping.mvc.member.model.vo.Member;

// 검색한 캠핑장 상세정보를 예약하는 곳으로 보내주는 서블릿
@WebServlet("/camping/reservation")
public class CampingReservationServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

	private CampSiteService service = new CampSiteService();
	
	@Override
	public String getServletName() {
		return "go Reservation Page";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			Member loginMember = getSessionMember(req); //로그인 멤버 땡겨옴
			int campNo = Integer.parseInt(req.getParameter("campingNo"));
			if(loginMember != null) { //세션에서 가져온 로그인정보가 있으면
				// 정상 - 예약으로 이동
				CampingVO campingVO = service.findCampDetailByNo(campNo);
				System.out.println(campingVO);
				
				req.setAttribute("campingVO", campingVO);
				req.getRequestDispatcher("/views/02_Camping/reservation.jsp").forward(req, resp);
			}else { //없으면 - 로그인 실패
				sendCommonPage("로그인 이후 사용할수 있습니다.", "/camping/Detail?campingNo="+campNo, req, resp); //캠핑상세로 이동
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}