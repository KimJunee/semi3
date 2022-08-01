package com.camping.mvc.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.inquiry.model.service.InquiryService;
import com.camping.mvc.inquiry.model.vo.Inquiry;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/board/inquiryWrite")
public class InquiryWriteServlet extends MyHttpServlet {

	private static final long serialVersionUID = 1L;
	
	private InquiryService service = new InquiryService();

	@Override
	public String getServletName() {
		return "InquiryWrite";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);//로그인 멤버 땡겨옴
			if(loginMember != null) {
				// 정상 흐름,글쓰기로 이동
				req.getRequestDispatcher("/views/04_Community/inquiryBoard.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {}//로그인이 실패할 경우!
		sendCommonPage("로그인 이후 사용할수 있습니다.", "/views/04_Main/main.jsp", req, resp);//게시판홈으로 넘기기
		//sendCommonPage ( 띄울메시지,이동할링크,req,resp)
	}
		
		


	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try {
			Member loginMember = getSessionMember(req);//로그인멤버 가져옴
			
			if(loginMember ==null) {
				sendCommonPage("잘못된 접근입니다. (code=101)", "/board/listServlet", req, resp);
				return;
			}
			
			Inquiry inquiry = new Inquiry();
			inquiry.setInquir_title(req.getParameter("title").strip());
			inquiry.setUser_no(loginMember.getUser_no());
			inquiry.setInquir_content(req.getParameter("content").trim());
			
			System.out.println(inquiry.toString());
			int result = service.saveInquiry(inquiry);
			
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 등록되었습니다.", "/board/listServlet", req, resp);
				
			}else {
				sendCommonPage("게시글 등록에 실패하였습니다. (code=102)", "/board/listServlet", req, resp);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("정상적으로 처리할수 없습니다. (code=103)",  "/board/listServlet", req, resp);
		}
		
		
		
	}
	
}





















