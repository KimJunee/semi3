package com.camping.mvc.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.camping.mvc.inquiry.model.service.InquiryService;
import com.camping.mvc.inquiry.model.vo.Inquiry;

@WebServlet("/board/viewInquiry")
public class InquiryViewServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private InquiryService service = new InquiryService();
	
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
	
	

