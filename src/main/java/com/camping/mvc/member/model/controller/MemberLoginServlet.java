package com.camping.mvc.member.model.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.member.model.service.MemberService;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/member/login")
public class MemberLoginServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService(); 

	@Override
	public String getServletName() {
		return "MemberLoginServlet";
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("loginUsername");// 사용자가 입력한 id pw 아이디저장에 체크한것을 읽어오는부분
		String userPwd = req.getParameter("loginPassword");
		String saveId = req.getParameter("loginRemember");
		System.out.println(userId + ", " + userPwd + ", " + saveId);

		saveCookie(resp, saveId, userId);
		
		// 패턴2. 파라메터 처리를 위한 서비스 호출
		Member loginMember = service.login(userId, userPwd);//service에 있는 로그인메서드 사용
		// 패턴3. 응답할 페이지를 선택하고 파레메터 셋팅하기
		if(loginMember != null) { // 로그인 성공 경우
			// 세션에 로그인 결과를 남기고, 브라우저가 종료 될때까지 로그인 상태를 유지
			HttpSession session = req.getSession();// HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
			session.setAttribute("loginMember", loginMember); // 로그인 정보를 세션에 저장  session.setAttribute("설정한 세션아이디", 세션에 넣을 값);
			resp.sendRedirect(req.getContextPath() + "/"); // 메인페이지로 리다이렉트시킴(이동시킴)
			//response 기본 객체에서 많이 사용되는 기능 중 하나이다.
			//웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능
			// 위에 로직은 사용자가 로그인에 성공한 후 메인 페이지로 자동으로 이동하는 로직이다.
			// 이래야 기존 로그인폼을 로그인 성공 폼으로 변경 시킴
		}else{ // 로그인 실패한 경우
			// 로그인이 실패하면, 실패 결과를 알려주고 시작페이지로 이동한다.
			req.setAttribute("msg", "사용자 아이디나 비밀번호가 맞지 않습니다!!");//session.setAttribute("설정한 세션아이디", 세션에 넣을 값);
			req.setAttribute("location", "/views/06_User/signin.jsp");//session.setAttribute("설정한 세션아이디", 세션에 넣을 값);
			
			// 공통페이지로 이동하여 실패 결과 알리고 처음페이지로 돌아가는 코드
			// 메세지를 넘겨야함으로 forward로 넘겨야함
			req.getRequestDispatcher("/views/07_common/msg.jsp").forward(req, resp); //msg.jsp로 넘긴다.
//			RequestDispatcher 이란 클래스는 현재 request에 담긴 정보를 저장하고 있다가
//			그 다음 페이지 그 다음 페이지에도 해당 정보를 볼수있게 계속 저장하는 기능입니다.
		}

	}

	private void saveCookie(HttpServletResponse resp, String saveId, String userId) { // 이 기능은 참고만 하기
		// id를 쿠키로 저하여 사용자가 다시 브라우저에 온 경우 id가 저장되도록 하는기능
		if (saveId != null) {
			Cookie c = new Cookie("saveId", userId); // 사용자 ID를 쿠키로 만듬 //id저장을 눌렀다면 1시간동안 지속되게한다
			c.setMaxAge(60 * 60); // 1시간뒤에 사라지게 만듬
			resp.addCookie(c);
		} else {// 저장안함 옵션일때
			Cookie c = new Cookie("saveId", ""); // ID초기화 //id저장을 안눌렀다면 0초로 설정해준다 바로 사라지게 해줌
			c.setMaxAge(0); // 시간도 0으로 초기하
			resp.addCookie(c);

		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/");
		// response 기본 객체에서 많이 사용되는 기능 중 하나이다.
		// 웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능

	}
}
