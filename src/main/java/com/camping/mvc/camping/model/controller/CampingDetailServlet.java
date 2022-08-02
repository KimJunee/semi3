package com.camping.mvc.camping.model.controller;

import java.io.IOException;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.CampSiteService;
import com.camping.mvc.camping.model.vo.*;
import com.camping.mvc.member.model.vo.Member;


@WebServlet("/camping/Detail")
public class CampingDetailServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private CampSiteService service = new CampSiteService();
	
	@Override
	public String getServletName() {
		return "CampingDetailServlet";
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(); //HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
		System.out.println(session.getAttribute("loginMember"));
		Member member = (Member) session.getAttribute("loginMember");
		
		
		
		List<Review> list = new ArrayList<>();
		int campNo = Integer.parseInt(req.getParameter("campingNo"));
		
		
		
		CampingVO campingVO = service.findCampDetailByNo(campNo);
		list  =  service.getReviewList(campNo);
		
		System.out.println(list.toString());
		System.out.println(campingVO);
		
		req.setAttribute("member", member);
		req.setAttribute("campingVO", campingVO);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/views/02_Camping/campingDetail.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}

