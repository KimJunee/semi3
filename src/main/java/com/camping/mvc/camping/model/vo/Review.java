package com.camping.mvc.camping.model.vo;

import java.util.Date;

public class Review {
	

	private int	rev_no;				// 리뷰번호
    private String rev_title;		// 리뷰제목
    private String rev_content;  	// 리뷰내용
    private Date rev_regist; 		// 리뷰등록날짜
    private String rev_image; 		// 리뷰이미지
    private String rev_star; 		// 리뷰별점
    private String user_id; 		// 유저 아이디
    private int user_no; 		// 사용자번호
    private int cs_no; 			// 캠핑자번호
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int rev_no, String rev_title, String rev_content, Date rev_regist, String rev_image, String rev_star,
			String user_id, int user_no, int cs_no) {
		super();
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_regist = rev_regist;
		this.rev_image = rev_image;
		this.rev_star = rev_star;
		this.user_id = user_id;
		this.user_no = user_no;
		this.cs_no = cs_no;
	}
	@Override
	public String toString() {
		return "Review [rev_no=" + rev_no + ", rev_title=" + rev_title + ", rev_content=" + rev_content
				+ ", rev_regist=" + rev_regist + ", rev_image=" + rev_image + ", rev_star=" + rev_star + ", user_id="
				+ user_id + ", user_no=" + user_no + ", cs_no=" + cs_no + "]";
	}
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public Date getRev_regist() {
		return rev_regist;
	}
	public void setRev_regist(Date rev_regist) {
		this.rev_regist = rev_regist;
	}
	public String getRev_image() {
		return rev_image;
	}
	public void setRev_image(String rev_image) {
		this.rev_image = rev_image;
	}
	public String getRev_star() {
		return rev_star;
	}
	public void setRev_star(String rev_star) {
		this.rev_star = rev_star;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getCs_no() {
		return cs_no;
	}
	public void setCs_no(int cs_no) {
		this.cs_no = cs_no;
	}
	
    
    
    
  
	
	
}
