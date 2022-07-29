package com.camping.mvc.member.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * 로그아웃 기능 : 세션을 없애고 초기화 하는 과정
 */


@WebServlet(name="logout", urlPatterns = "/logout") //header.jsp /logout 에서 넘어온 친구이다
public class MemberLogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();//세션가져오기
		if(session != null) { //세션이 null이 아니라면
			session.invalidate(); // 세션을 없애는 코드  Invalidate : 영어의 의미로는 무효화 시키다 라는 뜻.
		}						//세션을 없애줌으로서 로그인정보를 없애줌 
		resp.sendRedirect(req.getContextPath()+"/");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
