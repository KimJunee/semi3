package com.camping.mvc.camping.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;

@WebServlet("/myReservationDetail")
public class CampingReview extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	public String getServletName() {
		return "myReservationDetail";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.doGet(req, resp);
	}

	
}