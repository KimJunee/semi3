package com.camping.mvc.mypage.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.community.model.service.ReviewService;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/myreservation/review")
public class MypageReservationReview extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private final ReviewService service = new ReviewService();

	@Override
	public String getServletName() {
		return "Myreservation Review";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			if(loginMember != null) {
				req.getRequestDispatcher("/views/02_Camping/campingReview.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		sendCommonPage("로그인 이후 사용할수 있습니다.", "/views/01_Main/main.jsp", req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}