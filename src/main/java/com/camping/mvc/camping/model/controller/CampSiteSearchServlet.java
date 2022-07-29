package com.camping.mvc.camping.model.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;

public class CampSiteSearchServlet extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	public static String[] paramNames;
	
	static {
		paramNames = new String[]{"check1", "check2"};
	}	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String> paramMap = new HashMap<>();
		for(String paramName : paramNames) {
			String value = req.getParameter(paramName);
			if(value != null) {
				paramMap.put(paramName, value);
			}
		}
	
	}


	@Override
	public String getServletName() {
		return "CampSiteSearchServlet";
	}

}
