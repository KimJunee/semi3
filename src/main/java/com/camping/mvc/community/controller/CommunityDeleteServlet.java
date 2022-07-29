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

//자유게시물 삭제
@WebServlet("/board/delete")
public class CommunityDeleteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

	private CommunityService service = new CommunityService();
	
	@Override
	public String getServletName() {
		return "CommunityDelete";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int communityNo = Integer.parseInt(req.getParameter("communityNo"));
			Community community =service.findBoardByNo(communityNo, false);
			int result = service.delete(communityNo);
			
			if(result >0 ) {
				req.setAttribute("msg", "게시글 삭제 성공");
				System.out.println(result);
			}else {
				req.setAttribute("msg","게시글 삭제를 실패하였습니다");
				System.out.println(result);
			}	
		} catch (Exception e) {
			req.setAttribute("msg","게시글 삭제를 실패");
		
		}
		
		
		req.setAttribute("location","/board/freeBoard");
		req.getRequestDispatcher("/views/07_common/msg.jsp").forward(req, resp);

	}

}
