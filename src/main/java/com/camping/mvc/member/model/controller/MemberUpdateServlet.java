package com.camping.mvc.member.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.member.model.service.MemberService;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/member/update") //view.jsp에 /member/update에서 날라옴
public class MemberUpdateServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();
	
	@Override
	public String getServletName() {
		return "MemberUpdateServlet";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			
			if(loginMember == null) {
				sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
				return;
			}
			
			Member newMember = new Member();
			req.setCharacterEncoding("UTF-8");
			newMember.setUser_no(loginMember.getUser_no());
			newMember.setUser_id(loginMember.getUser_id());
			newMember.setUser_name(req.getParameter("name"));
			newMember.setUser_birth(req.getParameter("date"));
			newMember.setUser_email(req.getParameter("email"));
			newMember.setUser_phone(req.getParameter("phone"));
		
				
			if(loginMember.getUser_id().equals(newMember.getUser_id()) == false) {
				sendCommonPage("잘못된 아이디 입니다.", "/views/01_Main/main.jsp", req, resp);
				return;
			}
			
			int result = service.save(newMember);
			
			if(result > 0) { // 업데이트 성공
				newMember = service.findMemberById(newMember.getUser_id());
				setSessionMember(req, newMember);
				sendCommonPage("회원정보 수정하였습니다.", "/member/mypage", req, resp);
			} else {
				sendCommonPage("오류로 회원정보를 수정할수 없습니다.", "/member/mypage", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("인자가 잘못되었습니다.", "/member/mypage", req, resp);
		}
	}

}
