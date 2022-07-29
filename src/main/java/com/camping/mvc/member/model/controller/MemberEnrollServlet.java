package com.camping.mvc.member.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.member.model.service.MemberService;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/member/enroll")
public class MemberEnrollServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();

	@Override
	public String getServletName() {
		return "MemberEnrollServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Member member = getSessionMember(req);
		resp.sendRedirect(req.getContextPath() + "/views/06_User/signup.jsp");
		//response 기본 객체에서 많이 사용되는 기능 중 하나이다.
		//웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = new Member();
		try {
			member.setUser_id(req.getParameter("newId").trim());//사용자가 입력한 id, pw 등등을 불러와서 member에 넣는과정
			member.setUser_name(req.getParameter("userName").trim());
			member.setUser_pw(req.getParameter("userPwd"));//trim은 공백을 지우는 메서드 왜 해주는지 모르겠다 그냥하자
			member.setUser_phone(req.getParameter("phone").trim());
			member.setUser_birth(req.getParameter("Birth").trim());
			member.setUser_email(req.getParameter("email").trim());
	
			System.out.println("회원가입 : " + member);
			int result = service.save(member);//회원가입에 성공하면 MemberService에 save메서드로 넘어가서 저장됨
			
			if(result > 0) {
				req.setAttribute("msg", "회원가입에 성공하였습니다!"); //알림메세지에 보낼 값 설정
				req.setAttribute("location", "/"); //페이지 이동에 쓰일 값이 설정
			}else {
				req.setAttribute("msg", "회원가입 실패!! (code:101=DB이슈)");//알림메세지에 보낼 값 설정
				req.setAttribute("location", "/");//페이지 이동에 쓰일 값이 설정
			}
			req.getRequestDispatcher("/views/07_common/msg.jsp").forward(req, resp); //위에서 설정한 값들이 msg.jsp로 넘어감
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "회원가입 실패!! (code:100=입력값 문제)"); //알림메세지에 보낼값 설정
			req.setAttribute("location", "/member/enroll"); //페이지 이동에 쓰일 값 설정
			req.getRequestDispatcher("/views/07_common/msg.jsp").forward(req, resp); //위에 설정된 값들은 msg.jsp로 이동
//			sendCommonPage("회원가입 실패", "/member/enroll", req, resp);
			return;
		}
		
	}

}
