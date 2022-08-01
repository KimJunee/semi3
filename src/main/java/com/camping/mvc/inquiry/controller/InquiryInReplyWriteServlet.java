package com.camping.mvc.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;

import com.camping.mvc.inquiry.model.service.InquiryService;
import com.camping.mvc.inquiry.model.vo.Inreply;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/board/inquiryreply")
public class InquiryInReplyWriteServlet extends MyHttpServlet{

	private static final long serialVersionUID = 1L;

	private InquiryService service = new InquiryService();
	
	@Override
	public String getServletName() {
		return "InquiryInReplyWrite";
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			
			if(loginMember.getUser_id().equals(req.getParameter("writer"))== false) {
				sendCommonPage("리플 등록 권한이 없습니다. (401)", "/board/listServlet" , req, resp);
				return;
			}
			
			int inquiryNo = Integer.parseInt(req.getParameter("inquiryNo"));
			String writer = req.getParameter("writer");
			String content = req.getParameter("content");
			
			Inreply inreply = new Inreply();
			inreply.setInquiry_no(inquiryNo);
			inreply.setInrwriter_id(writer);
			inreply.setUser_no(loginMember.getUser_no());
			inreply.setInr_content(content);
			
			int result = service.saveInReply(inreply);
			
			
			if(result > 0) {
				sendCommonPage("리플 등록에 성공하였습니다.", "/board/viewInquiry?inquiryNo="+inquiryNo, req, resp);
			}else {
				sendCommonPage("리플 등록에 실패하였습니다. (402)", "/board/viewInquiry?inquiryNo="+inquiryNo, req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 정상적으로 등록할수 없습니다. (403)", "/board/listServlet" , req, resp);
		}
	}

}
