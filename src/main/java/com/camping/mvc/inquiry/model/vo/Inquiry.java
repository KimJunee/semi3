package com.camping.mvc.inquiry.model.vo;

import java.util.Date;
import java.util.List;

public class Inquiry {

	private int inquiry_no; 		// 문의글번호
	private int rowNum;				//추가
	private int user_no; 			// 문의글 작성자번호
	private String writer_id;		//추가함
	private String inquir_title; 	// 문의글 제목
	private String inquir_content;  // 문의글 내용
	private Date inquir_regist; 	// 등록날짜
	private int inquir_hit;			// 조회수
	private List<Inreply> inreplies;//추가함
	
	public Inquiry() {
		super();
		
	}

	public Inquiry(int inquiry_no, int rowNum, int user_no, String writer_id,
			String inquir_title, String inquir_content, Date inquir_regist, int inquir_hit, List<Inreply> inreplies) {
		super();
		this.inquiry_no = inquiry_no;
		this.rowNum = rowNum;
		this.user_no = user_no;
		this.writer_id = writer_id;
		this.inquir_title = inquir_title;
		this.inquir_content = inquir_content;
		this.inquir_regist = inquir_regist;
		this.inquir_hit = inquir_hit;
		this.inreplies = inreplies;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiry_no=" + inquiry_no + ", rowNum=" + rowNum + ", user_no=" + user_no + ", writer_id="
				+ writer_id +  ", inquir_title=" + inquir_title
				+ ", inquir_content=" + inquir_content + ", inquir_regist=" + inquir_regist + ", inquir_hit="
				+ inquir_hit + ", inreplies=" + inreplies + "]";
	}

	public int getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}


	public String getInquir_title() {
		return inquir_title;
	}

	public void setInquir_title(String inquir_title) {
		this.inquir_title = inquir_title;
	}

	public String getInquir_content() {
		return inquir_content;
	}

	public void setInquir_content(String inquir_content) {
		this.inquir_content = inquir_content;
	}

	public Date getInquir_regist() {
		return inquir_regist;
	}

	public void setInquir_regist(Date inquir_regist) {
		this.inquir_regist = inquir_regist;
	}

	public int getInquir_hit() {
		return inquir_hit;
	}

	public void setInquir_hit(int inquir_hit) {
		this.inquir_hit = inquir_hit;
	}

	public List<Inreply> getInreplies() {
		return inreplies;
	}

	public void setInreplies(List<Inreply> inreplies) {
		this.inreplies = inreplies;
	}

	
	
	
	
	
	
}
