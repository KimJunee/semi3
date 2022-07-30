package com.camping.mvc.camping.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.service.CampSiteService;
import com.camping.mvc.camping.model.service.ReservationService;
import com.camping.mvc.camping.model.vo.CampingVO;
import com.camping.mvc.camping.model.vo.Reservation;
import com.camping.mvc.camping.model.vo.Review;

@WebServlet("/camping/Reservation")
public class CampingReservationServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;

	private CampSiteService service = new CampSiteService();
	
	@Override
	public String getServletName() {
		return "Reservation";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Review> list = new ArrayList<>();
		int campNo = Integer.parseInt(req.getParameter("campingNo"));
		
		CampingVO campingVO = service.findCampDetailByNo(campNo);
		list  =  service.getReviewList(campNo);
		
		System.out.println(list.toString());
		System.out.println(campingVO);
		
		req.setAttribute("campingVO", campingVO);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/views/02_Camping/reservation.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}