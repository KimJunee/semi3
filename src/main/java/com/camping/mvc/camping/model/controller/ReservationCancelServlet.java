package com.camping.mvc.camping.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.ReservationService;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.member.model.vo.Member;

// 예약 취소하는 서블릿
@WebServlet("/reservation/cancel")
public class ReservationCancelServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private final ReservationService service = new ReservationService();

	@Override
	public String getServletName() {
		return "Reservation Cancel!!";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		System.out.println(session.getAttribute("loginMember"));
		Member member = (Member) session.getAttribute("loginMember");
		
		if(member == null) {
			sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
			return;
		}
		
		try {
			Member loginMember = getSessionMember(req);
			int resv_no = Integer.parseInt(req.getParameter("resvno"));
			System.out.println(resv_no);
			Reservation reservation = service.findReservationByNo(resv_no);
			
			System.out.println(reservation.toString());	
			
			// 인코딩
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			
			// 취소.....
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}