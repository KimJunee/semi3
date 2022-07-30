package com.camping.mvc.inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.PageInfo;
import com.camping.mvc.inquiry.model.service.InquiryService;
import com.camping.mvc.inquiry.model.vo.Inquiry;

@WebServlet("/board/listServlet")
public class InquiryListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private InquiryService service = new InquiryService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int page = 1;
		int InquiryCount = 0;
		PageInfo pageInfo = null;
		List<Inquiry> list = null;
		String searchValue = null;
		
		try {
			searchValue = req.getParameter("searchValue");
			
			page = Integer.parseInt(req.getParameter("page")); 
		}catch (Exception e) {
		}
		
		
		
		
		
	}
}
	
