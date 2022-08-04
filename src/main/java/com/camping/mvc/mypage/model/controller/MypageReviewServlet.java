package com.camping.mvc.mypage.model.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camping.common.util.MyFileRenamePolicy;
import com.camping.common.util.MyHttpServlet;
import com.camping.mvc.camping.model.vo.Review;
import com.camping.mvc.community.model.service.ReviewService;
import com.camping.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

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
			
			// 1. 저장 경로 지정
			String path = getServletContext().getRealPath("/resources/upload/review");
			// 2. 파일 사이즈 지정
			int maxSize = 104857600; // 100 MB
			// 3. 문자열 인코딩 설정
			String encoding = "UTF-8";
			// 4. 멀티파라메터 처리 객체 생성 - cos.jar 활용
			
			File file = new File(path);
			
			System.out.println(file.isDirectory());
			if(!file.isDirectory()) {
				System.out.println("폴더 생성 : "+ file.mkdirs());
			}
			
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());
			// 멀티 파라메터 선언 끝!
			System.out.println(path);
			
			Review review = new Review();
			
			int resvno = Integer.parseInt(mr.getParameter("resvno"));
			int csno = Integer.parseInt(mr.getParameter("csno"));
			
			//freeBoardWrite.jsp에서 작성한 게시글 처리
			review.setUser_no(loginMember.getUser_no());
			review.setRev_star(Integer.parseInt(mr.getParameter("reviewstar")));
			review.setCs_no(Integer.parseInt(mr.getParameter("csno")));
			review.setRev_title(mr.getParameter("reviewTitle"));
			review.setRev_content(mr.getParameter("reviewContent"));
			review.setRev_image(mr.getOriginalFileName("input-file"));
			review.setRev_image_rename(mr.getFilesystemName("input-file"));
			
			System.out.println(review.toString());
			int result = service.insertReview(review); // DB에 게시글 저장
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 등록되었습니다.", "/camping/Detail?campingNo=" + csno, req, resp);
				
			}else {
				sendCommonPage("게시글 등록에 실패하였습니다. (code=102)", "/myreservation/review?resvno=" + resvno, req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("정상적으로 처리할수 없습니다. (code=103)", "/myreservation/review?resvno=" + req.getParameter("resvno"), req, resp);
		}
	}
}