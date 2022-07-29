package com.camping.mvc.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.community.model.service.CommunityService;
import com.camping.mvc.community.model.vo.Reply;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/board/reply")
public class CommunityReplyWriteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

	private CommunityService service = new CommunityService();
	
	@Override
	public String getServletName() {
		return "CommunityReplyWrite";
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			
			if(loginMember.getUser_id().equals(req.getParameter("writer"))== false) {
				sendCommonPage("리플 등록 권한이 없습니다. (401)", "/board/freeBoard" , req, resp);
				return;
			}
			
			int communityNo = Integer.parseInt(req.getParameter("communityNo"));
			String writer = req.getParameter("writer");
			String content = req.getParameter("content");
			
			Reply reply = new Reply();
			reply.setCo_no(communityNo);
			reply.setWriter_id(writer);
			reply.setUser_no(loginMember.getUser_no());
			reply.setRep_content(content);
			
			int result = service.saveReply(reply);
			
			
			if(result > 0) {
				sendCommonPage("리플 등록에 성공하였습니다.", "/board/view?communityNo="+communityNo, req, resp);
			}else {
				sendCommonPage("리플 등록에 실패하였습니다. (402)", "/board/view?communityNo="+communityNo, req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 정상적으로 등록할수 없습니다. (403)", "/board/freeBoard" , req, resp);
		}
	}

}
