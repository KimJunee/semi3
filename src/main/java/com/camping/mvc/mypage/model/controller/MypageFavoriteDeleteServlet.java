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
import com.camping.common.util.PageInfo;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.member.model.vo.Member;
import com.camping.mvc.mypage.model.service.MypageMyFavoriteService;
import com.camping.mvc.mypage.model.vo.MyFavorite;

@WebServlet("/mypage/DeleteFavorite")
public class MypageFavoriteDeleteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private MypageMyFavoriteService service = new MypageMyFavoriteService();

	
	@Override
	public String getServletName() {
		return "MypageFavorite";
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(); //HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
		System.out.println(session.getAttribute("loginMember"));
		Member member = (Member) session.getAttribute("loginMember");
		
		if(member == null) {
			sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
			return;
		}
		
		
		try {
			int campingNo = Integer.parseInt(req.getParameter("campingNo"));
			int result = service.deleteMyFavorite(member.getUser_no(), campingNo);
			if(result > 0 ) {
				sendCommonPage("찜 삭제", "/mypage/myfavorite", req, resp);
			}else {
				sendCommonPage("찜 삭제에 실패하였습니다.", "/mypage/myfavorite", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
}
