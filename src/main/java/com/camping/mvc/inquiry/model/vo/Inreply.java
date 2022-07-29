package com.camping.mvc.inquiry.model.vo;

import java.util.Date;

public class Inreply {
	private int inr_no; 				// --댓글번호
	private String inr_content;			 // --댓글내용
	private Date inr_regist; 			// --댓글등록날짜
	private String inrwriter_id;		//추가
	private int user_no; 				// --댓글작성자번호(커뮤니티게시판 테이블 컬럼)
	private int inquiry_no;				// 댓글이 작성된게시글번호(문의게시판 테이블 컬럼)
	
	public Inreply() {
		super();
		
	}

	public Inreply(int inr_no, String inr_content, Date inr_regist, String inrwriter_id, int user_no, int inquiry_no) {
		super();
		this.inr_no = inr_no;
		this.inr_content = inr_content;
		this.inr_regist = inr_regist;
		this.inrwriter_id = inrwriter_id;
		this.user_no = user_no;
		this.inquiry_no = inquiry_no;
	}

	@Override
	public String toString() {
		return "Inreply [inr_no=" + inr_no + ", inr_content=" + inr_content + ", inr_regist=" + inr_regist
				+ ", inrwriter_id=" + inrwriter_id + ", user_no=" + user_no + ", inquiry_no=" + inquiry_no + "]";
	}

	public int getInr_no() {
		return inr_no;
	}

	public void setInr_no(int inr_no) {
		this.inr_no = inr_no;
	}

	public String getInr_content() {
		return inr_content;
	}

	public void setInr_content(String inr_content) {
		this.inr_content = inr_content;
	}

	public Date getInr_regist() {
		return inr_regist;
	}

	public void setInr_regist(Date inr_regist) {
		this.inr_regist = inr_regist;
	}

	public String getInrwriter_id() {
		return inrwriter_id;
	}

	public void setInrwriter_id(String inrwriter_id) {
		this.inrwriter_id = inrwriter_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	
	
	
	
}
