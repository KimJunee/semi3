package com.camping.mvc.mypage.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.vo.Review;
import com.camping.mvc.community.model.service.ReviewService;
import com.camping.mvc.member.model.vo.Member;

// 후기 등록하는 서블릿(Write, insert)
@WebServlet("/myreview")
public class MypageReviewServlet extends MyHttpServlet{
private static final long serialVersionUID = 1L;
	
	private final ReviewService service = new ReviewService();

	public String getServletName() {
		return "Myreservation Review";
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		try {
			Member loginMember = getSessionMember(req);//로그인멤버 가져옴
			
			if(loginMember ==null) {
				sendCommonPage("잘못된 접근입니다. (code=101)", "/main", req, resp);
				return;
			}
			
			Review review = new Review();
			
			//freeBoardWrite.jsp에서 작성한 게시글 처리
			review.setUser_no(loginMember.getUser_no());
			review.setCs_no(Integer.parseInt(req.getParameter("csno")));
			review.setRev_title(req.getParameter("reviewTitle"));
			review.setRev_content(req.getParameter("reviewContent"));
			
			System.out.println(review.toString());
			int result = service.insertReview(review); // DB에 게시글 저장
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 등록되었습니다.", "/mypage/mywrite", req, resp);
				
			}else {
				sendCommonPage("게시글 등록에 실패하였습니다. (code=102)", "/myreservation/review", req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("정상적으로 처리할수 없습니다. (code=103)",  "/myreservation/review", req, resp);
		}
	}
}