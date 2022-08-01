package com.camping.mvc.inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camping.common.util.MyHttpServlet;
import com.camping.common.util.PageInfo;
import com.camping.mvc.inquiry.model.service.InquiryService;
import com.camping.mvc.inquiry.model.vo.Inquiry;
import com.camping.mvc.member.model.vo.Member;

@WebServlet("/board/listServlet")
public class InquiryListServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private InquiryService service = new InquiryService();
	
	@Override
	public String getServletName() {
		// TODO Auto-generated method stub
		return "InquiryList";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int page = 1;
		int InquiryCount = 0;
		PageInfo pageInfo = null;
		List<Inquiry> list = null;
		String searchValue = null;
		

		try {
			
			HttpSession session = req.getSession(); //HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
			System.out.println(session.getAttribute("loginMember"));
			Member member = (Member) session.getAttribute("loginMember");
			
			if(member == null) {
				sendCommonPage("로그인후 이용해주세요.", "/views/01_Main/main.jsp", req, resp);
				return;
			}
			searchValue = req.getParameter("searchValue");
			
			page = Integer.parseInt(req.getParameter("page")); 
		}catch (Exception e) {
		}
		
		InquiryCount = service.getInquiryCount(searchValue);
		pageInfo = new PageInfo(page, 10, InquiryCount, 10);
		list = service.getInquiryList(pageInfo, searchValue);
		
		
		req.setAttribute("list", list);//리스트로 넘기고
		req.setAttribute("pageInfo", pageInfo);//페이지인포로넘기고
		req.getRequestDispatcher("/views/04_Community/inquiryBoard.jsp").forward(req, resp);

	}

}