<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String USER_ID = request.getParameter("newId");
	String USER_PW = request.getParameter("userPwd");
	String USER_NAME = request.getParameter("userName");
	String USER_PHONE = request.getParameter("phone");
	String USER_EMAIL = request.getParameter("email");
	String USER_BIRTH = request.getParameter("Birth");
	
	// 1.변수선언
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "SEMI";
	String upw = "SEMI";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "INSERT INTO USER_T VALUES(SEQ_UNO.NEXTVAL,?,?,?,?,?,?)";
	
	try{
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, USER_ID);
		pstmt.setString(2, USER_PW);
		pstmt.setString(3, USER_NAME);
		pstmt.setString(4, USER_PHONE);
		pstmt.setString(5, USER_EMAIL);
		pstmt.setString(6, USER_BIRTH);
		
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("join_succes.jsp");
		} else{ // 실패
			response.sendRedirect("join_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>