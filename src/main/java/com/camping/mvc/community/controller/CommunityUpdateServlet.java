package com.camping.mvc.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.community.model.service.CommunityService;
import com.camping.mvc.community.model.vo.Community;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/board/update")
public class CommunityUpdateServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private CommunityService service = new CommunityService();

	@Override
	public String getServletName() {
		return "CommunityUpdateServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cono = Integer.parseInt(req.getParameter("communityNo"));
		Community community = service.findBoardByNo(cono, false);
		
		req.setAttribute("community", community);
		req.getRequestDispatcher("/views/04_Community/freeBoardUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			Member loginMember = getSessionMember(req);
			if(loginMember == null || loginMember.getUser_id().equals(req.getParameter("writer"))){
				sendCommonPage("잘못된 접근입니다.", "/board/freeBoard", req, resp);
				return;
			}
			
			Community community = service.findBoardByNo(Integer.parseInt(req.getParameter("communityNo")), false);
			if(community.getWriter_id().equals(loginMember.getUser_id()) == false){
				sendCommonPage("잘못된 접근입니다.", "/board/freeBoard", req, resp);
				return;
			}
			
			community.setCo_no(Integer.parseInt(req.getParameter("communityNo")));
			community.setCo_title(req.getParameter("title"));
			community.setCo_content(req.getParameter("content"));
			
			int result = service.save(community);
			System.out.println(community.toString());
			System.out.println(result);
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 업데이트 되었습니다.", "/board/freeBoard", req, resp);
			}else {
				sendCommonPage("업데이트 할 수 없습니다.", "/board/freeBoard", req, resp);				
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("게시글을 수정할 수 없습니다.", "/board/freeBoard", req, resp);
		}
	}

}
