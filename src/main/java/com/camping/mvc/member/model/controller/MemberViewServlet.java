package com.camping.mvc.member.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.member.model.service.MemberService;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/member/mypage")
public class MemberViewServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();

	@Override
	public String getServletName() {
		return "MemberViewServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession(); //HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
			System.out.println(session.getAttribute("loginMember"));
			Member member = (Member) session.getAttribute("loginMember");
			
			if(member == null) {
				sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
				return;
			}
			
			String user_Id = member.getUser_id();		
			
			Member memberInfo = service.findMemberById(user_Id);
			System.out.println(memberInfo);
			if(memberInfo != null) {
				req.setAttribute("member", memberInfo);
				req.getRequestDispatcher("/views/05_MyPage/myProfile.jsp").forward(req, resp); //view.jsp로 넘어감
				return;
			}
			
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/views/01_Main/main.jsp");
		}
	}
	
}
