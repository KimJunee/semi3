package com.camping.mvc.camping.model.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.common.util.PageInfo;
import com.camping.mvc.camping.model.service.CampSiteService;
import com.camping.mvc.camping.model.vo.CampingVO;

@WebServlet("/camping/list")
public class CampingListServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CampSiteService service = new CampSiteService();
	@Override
	public String getServletName() {
		return "CampingListServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int campsiteCount = 0;
		PageInfo pageInfo = null;
		List<CampingVO> list = null;
		String campTypes[] = null;


		String searchDate = req.getParameter("bookingDate"); // 날짜

		System.out.println("선택한 날짜 : " + searchDate);

		String searchWord = req.getParameter("searchValue"); // 검색어
		System.out.println("검색어 : " + searchWord);

		String addr = req.getParameter("searchAddr1"); // 지역
		
		System.out.println("선택한 주소 : " + addr);
		

		String personnel = req.getParameter("searchPersonnel"); // 인원
		
		System.out.println("인원 : " + personnel);

		campTypes = req.getParameterValues("searchCampType");// 숙소유형
		if (campTypes == null) {
			System.out.println("선택한 값이 없습니다.");
		} else {
			Map<String, String> searchCampType = new HashMap<>();
			System.out.println("숙소유형");
			for (String campType : campTypes) {
				if (campType == null) {
					campType = null;
				}
				System.out.print(campType + " ");
			}
			System.out.println("\n");
		}

		String cate = req.getParameter("maincategory");
		if(cate != null && cate.length() > 0) {
			campTypes = new String[1];
			campTypes[0] = cate;
			req.setAttribute("searchCampType", campTypes);
		}

		String checkBoxs[] = req.getParameterValues("searchType"); // 체크박스
		if (checkBoxs == null) {
			System.out.println("선택한 값이 없습니다.");
		} else {
			Map<String, String> searchType = new HashMap<>();
			System.out.println("주요시설");
			for (String checkBox : checkBoxs) {
				if (checkBox == null) {
					checkBox = null;
				}
				System.out.print(checkBox + " ");
				System.out.println();
			}
		}
		
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
		}
		
		campsiteCount = service.getCampsiteCount(searchWord, addr, campTypes, checkBoxs);
		pageInfo = new PageInfo(page, 10, campsiteCount, 12);
		list = service.getCampsiteList(pageInfo, searchWord, addr, campTypes, checkBoxs);
		
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/02_Camping/campingSearch.jsp").forward(req, resp);
		
	}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
