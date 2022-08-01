package com.camping.mvc.camping.model.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.ReservationService;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/reservation")
public class ReservationServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

	private final ReservationService service = new ReservationService();
	
	@Override
	public String getServletName() {
		return "Reservation Action";
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 잘 넘어왔나 확인
//		System.out.println("여기로 잘 옴!!!!!!!!!!!!!!!!!!!!!!!!");
//		System.out.println("#############################");
//		System.out.println(req.getParameter("user_no"));
//		System.out.println(req.getParameter("cs_no"));
//		System.out.println(req.getParameter("resv_headcount"));
//		System.out.println(req.getParameter("resv_pay"));
//		System.out.println(req.getParameter("resv_checkin"));
//		System.out.println(req.getParameter("resv_checkout"));
//		System.out.println("#############################");
		try {
		// 인코딩
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		Member loginMember = getSessionMember(req); //로그인 멤버 땡겨옴
		
		// 파라메터 받은 변수
		int user_no = loginMember.getUser_no();
		int cs_no = Integer.parseInt(req.getParameter("cs_no"));
		int resv_headcount = Integer.parseInt(req.getParameter("resv_headcount"));
		String resv_pay = req.getParameter("resv_pay");
		Date resv_checkin =  Date.valueOf(req.getParameter("resv_checkin"));
		Date resv_checkout =  Date.valueOf(req.getParameter("resv_checkout"));
		
		// 예약 객체로 보낼거니까 초기화
		Reservation reservation = new Reservation();
		
		// 예약 객체에 파라메터 받은 변수들 넣어줌
		reservation.setUser_no(user_no);
		reservation.setCs_no(cs_no);
		reservation.setResv_headcount(resv_headcount);
		reservation.setResv_pay(resv_pay);
		reservation.setResv_checkin(resv_checkin);
		reservation.setResv_checkout(resv_checkout);
		reservation.setResv_no(0);
		
		System.out.println("뭔데이게"+reservation);
		
		// 결과값에 쓰려고 만든 변수(resultValue)를 정하기 위해 만든 변수
		int result = service.saveReservation(reservation); 
		String resultValue = ""; //결과값에 쓰려고 만든 변수임
		
		// 예약 DB 저장로직 굴려서 값이 1이면 - 영향을 받은 행이 있을 때
		if(result == 1) {
			resultValue = "success"; // 예약 성공
		// 예약 DB 저장로직 굴려서 값이 1이 아님 - 1 아니면 다 실패임
		}else {
			resultValue = "fail";	// 예약 실패
		}
		
		// 값 인코딩해줌
		resp.setContentType("text/html;charset=UTF-8");
		// 리퀘스트 객체 보낸 곳으로 보냄
        resp.getWriter().write(resultValue);
        System.out.println("가냐"+resultValue);

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}