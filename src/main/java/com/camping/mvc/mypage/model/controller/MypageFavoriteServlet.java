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

@WebServlet("/mypage/myfavorite")
public class MypageFavoriteServlet extends MyHttpServlet{
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
		int page = 1;
		int favCount = 0;
		PageInfo pageInfo = null;
		
		if(member == null) {
			sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
			return;
		}
		
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
		}
		
		try {
			System.out.println(page);
			List<MyFavorite> list = new ArrayList<MyFavorite>();
			Member loginMember = getSessionMember(req);
			int userNo = loginMember.getUser_no();
			
			favCount = service.getMyFavoriteCount(userNo);
			System.out.println(favCount);
					
			pageInfo = new PageInfo(page, 9, favCount, 9);
			list = service.getMyFavoriteList(pageInfo, userNo);
			System.out.println(list.toString());	

			req.setCharacterEncoding("UTF-8");
			req.setAttribute("list", list);
			req.setAttribute("pageInfo", pageInfo);
			req.getRequestDispatcher("/views/05_MyPage/myFavoriteCamping.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
}
