package com.camping.mvc.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.community.model.service.CommunityService;
@WebServlet("/reply/delete")
public class CommunityReplyDeleteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

	private CommunityService service = new CommunityService();
	
	@Override
	public String getServletName() {
		return "CommunityReplyDelete";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			int communityNo = Integer.parseInt(req.getParameter("communityNo"));
			
			int result = service.deleteReply(replyNo);
			
			if(result > 0) {
				sendCommonPage("리플 삭제에 성공하였습니다.", "/board/view?communityNo="+communityNo, req, resp);
			}else {
				sendCommonPage("리플 삭제를 실패하였습니다. (501)", "/board/view?communityNo="+communityNo, req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 삭제할수 없습니다. (505)", "/board/freeBoard", req, resp);
		}
		
	}
	
}
