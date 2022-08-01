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
import com.camping.mvc.community.model.vo.Community;
import com.camping.mvc.member.model.vo.Member;
import com.camping.mvc.mypage.model.service.MypageService;

@WebServlet("/mypage/mywrite")
public class MypageWriteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private MypageService service = new MypageService();
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		try {
//			List<Community> list = new ArrayList<Community>();
//			Member loginMember = getSessionMember(req);
//			int userno = loginMember.getUser_no();
//			
//			list = service.getMywrite(userno);
//			System.out.println(list.toString());	
//			req.setCharacterEncoding("UTF-8");
//			req.setAttribute("list", list);
//			req.getRequestDispatcher("/views/05_MyPage/myWrite.jsp").forward(req, resp);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		HttpSession session = req.getSession(); //HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
		System.out.println(session.getAttribute("loginMember"));
		Member member = (Member) session.getAttribute("loginMember");
		
		if(member == null) {
			sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
			return;
		}
		
		List<Community> list = new ArrayList<Community>();
		Member loginMember = getSessionMember(req);
		PageInfo pageInfo = null;
		int userno = loginMember.getUser_no();
		int writeCount = 0;
		int page = 1;
		
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		try {
			writeCount = service.getMyWriteCount(userno);
			pageInfo = new PageInfo(page, 3, writeCount, 9);
			list = service.getMywrite(userno, pageInfo);
			System.out.println(list.toString());
			req.setCharacterEncoding("UTF-8");
			req.setAttribute("list", list);
			req.setAttribute("pageInfo", pageInfo);
			req.getRequestDispatcher("/views/05_MyPage/myWrite.jsp").forward(req, resp);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	public String getServletName() {
		return "MypageWriteServlet";
	}

}

