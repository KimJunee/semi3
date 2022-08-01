package com.camping.mvc.mypage.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.camping.common.util.MyHttpServlet;
import com.camping.common.util.PageInfo;
import com.camping.mvc.camping.model.service.ReservationService;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.member.model.vo.Member;
import com.camping.mvc.mypage.model.service.MypageService;

@WebServlet("/mypage/myreservation")
public class MypageReservationServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService service = new MypageService();
	private ReservationService resService = new ReservationService();
	
	@Override
	public String getServletName() {
		return "MypageReservation";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int page = 1;
		int resCount = 0;
		PageInfo pageInfo = null;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
		}
		
		try {
			List<Reservation> list = new ArrayList<Reservation>();
			Member loginMember = getSessionMember(req);
			int userno = loginMember.getUser_no();
			
			pageInfo = new PageInfo(page, 5, resCount, 5);
			//list = service.getMywrite(userno);
			list = resService.getReservationList(pageInfo, userno);
			System.out.println(list.toString());	
			req.setCharacterEncoding("UTF-8");
			req.setAttribute("list", list);
			req.setAttribute("pageInfo", pageInfo);
			req.getRequestDispatcher("/views/05_MyPage/myReservation.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}