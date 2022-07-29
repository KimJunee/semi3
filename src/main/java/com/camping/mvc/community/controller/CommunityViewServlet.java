package com.camping.mvc.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.mvc.community.model.service.CommunityService;
import com.camping.mvc.community.model.vo.Community;

@WebServlet("/board/view")
public class CommunityViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private CommunityService service = new CommunityService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 System.out.println(req.getParameter("communityNo"));
		int communityNo = Integer.parseInt(req.getParameter("communityNo"));//파라메터 받아옴(데이터처리)

		//게시글 실제로 가져오기
		Community community = service.findBoardByNo(communityNo, true);
		//findBoardByNo로 조회해서 보면 조회수 자동으로 증가

		//예외처리 해주기
		if(community == null) {
			resp.sendRedirect(req.getContextPath() + "/");//메인으로보냄
			return;
		}
		req.setAttribute("community", community);
		req.getRequestDispatcher("/views/04_Community/freeBoardView.jsp").forward(req, resp);
	}
	

}
