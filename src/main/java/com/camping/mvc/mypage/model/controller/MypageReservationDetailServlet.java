package com.camping.mvc.mypage.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.ReservationService;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/mypage/myreservationDetail")
public class MypageReservationDetailServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private ReservationService Service = new ReservationService();

	@Override
	public String getServletName() {
		return "MypageReservationDetail";
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
			List<Reservation> list = new ArrayList<Reservation>();
			Member loginMember = getSessionMember(req);
			int resv_no = Integer.parseInt(req.getParameter("resvno"));

			Reservation reservation = Service.findReservationByNo(resv_no);
			
			//list = service.getMywrite(userno);
			System.out.println(list.toString());	
			req.setCharacterEncoding("UTF-8");
			req.setAttribute("list", list);
			req.setAttribute("reservation", reservation);
			req.getRequestDispatcher("/views/05_MyPage/myReservationDetail.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}