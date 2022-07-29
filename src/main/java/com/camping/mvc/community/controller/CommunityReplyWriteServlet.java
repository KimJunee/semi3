package com.camping.mvc.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/board/reply")
public class CommunityReplyWriteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

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
			
		//	int communityNo
			
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 정상적으로 등록할수 없습니다. (403)", "/board/freeBoard" , req, resp);
		}
	}

}
