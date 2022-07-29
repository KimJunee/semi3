package com.camping.mvc.community.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.PageInfo;
import com.camping.mvc.community.model.service.CommunityService;
import com.camping.mvc.community.model.vo.Community;

@WebServlet("/board/freeBoard")
public class CommunityListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private	CommunityService service = new CommunityService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("나오니?");
		int page = 1;
		int CommunityCount = 0;
		PageInfo pageInfo = null;
		List<Community> list = null;
		String searchValue = null;
		
		
		try {
			searchValue = req.getParameter("searchValue");
			
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
		}
		

		CommunityCount = service.getCommunityCount(searchValue);
		pageInfo = new PageInfo(page, 10, CommunityCount, 10);
		list = service.getCommunityList(pageInfo, searchValue);
		
		req.setAttribute("list", list);//리스트로 넘기고
		req.setAttribute("pageInfo", pageInfo);//페이지인포로넘기고
		req.getRequestDispatcher("/views/04_Community/freeBoard.jsp").forward(req, resp);
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
