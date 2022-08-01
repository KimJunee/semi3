package com.camping.mvc.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.inquiry.model.service.InquiryService;
import com.camping.mvc.inquiry.model.vo.Inquiry;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/board/viewInquiry")
public class InquiryViewServlet extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	
	private InquiryService service = new InquiryService();
	
	@Override
	public String getServletName() {

		return "InquiryView";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		

		
		
		System.out.println(req.getParameter("inquiryNo"));
		int inquiryNo = Integer.parseInt(req.getParameter("inquiryNo"));//파라메터 받아옴(데이터처리)

		//게시글 실제로 가져오기
		Inquiry inquiry = service.findInquiryByNo(inquiryNo, true);
		//findBoardByNo로 조회해서 보면 조회수 자동으로 증가

		//예외처리 해주기
		if(inquiry == null) {
			resp.sendRedirect(req.getContextPath() + "/views/01_Community/main.jsp");//메인으로보냄
			return;
		}
		req.setAttribute("inquiry", inquiry);
		req.getRequestDispatcher("/views/04_Community/inquiryBoardView.jsp").forward(req, resp);
	}


	}

	
	/*
	 * 여기 페이지에 이걸 추가하면 되지 않을까 싶은데 잘 안되... 
	 * try { 
	 * Member loginMember = getSessionMember(req);//로그인 멤버 땡겨옴 
	 * if(loginMember != null) { // 정상 흐름,글쓰기로 이동
	 * req.getRequestDispatcher("/views/04_Community/inquiryBoard.jsp").forward(req,
	 * resp); return; } } catch (Exception e) {}//로그인이 실패할 경우!
	 * sendCommonPage("로그인 이후 사용할수 있습니다.", "/views/01_Main/main.jsp", req,
	 * resp);//게시판홈으로 넘기기 //sendCommonPage ( 띄울메시지,이동할링크,req,resp)
	 */


	

