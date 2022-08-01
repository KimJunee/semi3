package com.camping.mvc.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.inquiry.model.service.InquiryService;

@WebServlet("/inreply/delete")
public class InquiryInReplyDeleteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private InquiryService service = new InquiryService();
	
	@Override
	public String getServletName() {
		return "InquiryInReplyDelete";
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int inreplyNo = Integer.parseInt(req.getParameter("inreplyNo"));
			int inquiryNo = Integer.parseInt(req.getParameter("inquiryNo"));
			
			int result = service.deleteInquiry(inreplyNo);
			
			if(result > 0) {
				sendCommonPage("리플 삭제에 성공하였습니다.", "/board/viewInquiry?inquiryNo="+inquiryNo, req, resp);
			}else {
				sendCommonPage("리플 삭제를 실패하였습니다. (501)", "/board/viewInquiry?inquiryNo="+inquiryNo, req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 삭제할수 없습니다. (505)", "/board/listServlet", req, resp);
		}
		
	}
	
}
