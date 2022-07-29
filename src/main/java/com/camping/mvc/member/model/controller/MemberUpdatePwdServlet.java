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

@WebServlet("/member/updatePwd")
public class MemberUpdatePwdServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();
	
	
	@Override
	public String getServletName() {
		return "MemberUpdatePwdServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			Member loginMember = (Member) session.getAttribute("loginMember");
			String newPwd = req.getParameter("password-new");
			
			if(loginMember == null ) {
				sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
				return;
			}
			
			int result = service.updatePassword(loginMember.getUser_no(), newPwd);
			
			if(result > 0) {
				sendCommonPage("비밀번호가 수정되었습니다.","/member/mypage",req,resp); //창 닫기
				return ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 예외와 비밀번호 수정이 불가능할때
		sendCommonPage("비밀번호가 수정할수 없습니다.", "/member/mypage", req, resp);
	}

	
}
