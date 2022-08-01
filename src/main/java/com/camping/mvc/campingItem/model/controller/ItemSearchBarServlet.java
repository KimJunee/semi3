package com.camping.mvc.campingItem.model.controller;

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
import com.camping.mvc.campingItem.model.service.CampingItemService;
import com.camping.mvc.campingItem.model.vo.CampingItemVO;

@WebServlet("/campingItem/Detail")
public class ItemSearchBarServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private CampingItemService service = new CampingItemService();

	@Override
	public String getServletName() {
		return "CampingItemServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CampingItemVO> list = null;
		Map<String, String> searchMap = new HashMap<>();
		int campingItemCount = 0;
		PageInfo pageInfo = null;
		int page = 1;

//		try {
//			page = Integer.parseInt(req.getParameter("page"));
//		} catch (Exception e) {}
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
			System.out.println("page없음");
		}
		
		try {
				String searchTypeNames[] = req.getParameterValues("searchType");
				if (searchTypeNames == null) {
					System.out.println("값이 없음!");
				} else {
					System.out.println("카테고리");
					for (String searchTypeName : searchTypeNames) {
						System.out.println(searchTypeName + " ");
						System.out.println("\n");
						String searchValues = req.getParameter("searchValue");
						System.out.println("검색어 : " + searchValues);
						searchMap.put(searchTypeName, searchValues);
					}
			}
				campingItemCount = service.getSearchCount(searchMap);
				pageInfo = new PageInfo(page, 5, campingItemCount, 12);
				list = service.getCampItemList(pageInfo, searchMap);
				System.out.println(list.toString());
				System.out.println(campingItemCount);
				req.setAttribute("list", list);
				req.setAttribute("pageInfo", pageInfo);
				req.getRequestDispatcher("/views/03_Item/campingItemDetail.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
