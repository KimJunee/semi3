package com.camping.mvc.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.inquiry.model.service.InquiryService;


@WebServlet("/board/inquirydelete")
public class InquiryDeleteServlet extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	
	private InquiryService service = new InquiryService();
	
	@Override
	public String getServletName() {
		return "InquiryDelete";
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int inquiryNo = Integer.parseInt(req.getParameter("inquiryNo"));
			System.out.println("inquiryNo : " + inquiryNo);
			int result = service.deleteInquiry(inquiryNo);
			System.out.println(result);
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
		
		
		req.setAttribute("location","/board/listServlet");
		req.getRequestDispatcher("/views/07_common/msg.jsp").forward(req, resp);

	}
	
}
