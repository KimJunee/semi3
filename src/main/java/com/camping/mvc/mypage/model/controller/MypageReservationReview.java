package com.camping.mvc.mypage.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.ReservationService;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.community.model.service.ReviewService;
import com.camping.mvc.member.model.vo.Member;

// 예약상세에서 후기 작성할 때 보내주는 서블릿
@WebServlet("/myreservation/review")
public class MypageReservationReview extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private final ReviewService service = new ReviewService();
	private final ReservationService resService = new ReservationService();

	@Override
	public String getServletName() {
		return "Myreservation Review";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			int resvNo = Integer.parseInt(req.getParameter("resvno"));
			if(loginMember != null) {
				Reservation reservation = resService.findReservationByNo(resvNo);
				req.setAttribute("reservation", reservation);
				req.getRequestDispatcher("/views/02_Camping/campingReview.jsp").forward(req, resp);
				return;
			}else {
				sendCommonPage("로그인 이후 사용할수 있습니다.", "/views/01_Main/main.jsp", req, resp);
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