package com.camping.mvc.community.model.vo;

import java.util.Date;
import java.util.List;

public class Community {
	private int co_no; 			//게시글번호
	private int rowNum;			//추가
	private int user_no; 		//게시글작성자번호
	private String writer_id;		//추가
	private String co_title; 	//게시글 제목
	private String co_content; 	// 내용
	private Date co_regist; 	//등록날짜
	private int co_hit; 		//조회수
	private List<Reply> replies;
	
	public Community() {
		super();
		
	}

	public Community(int co_no, int rowNum, int user_no, String writer_id, String co_title, String co_content,
			Date co_regist, int co_hit, List<Reply> replies) {
		super();
		this.co_no = co_no;
		this.rowNum = rowNum;
		this.user_no = user_no;
		this.writer_id = writer_id;
		this.co_title = co_title;
		this.co_content = co_content;
		this.co_regist = co_regist;
		this.co_hit = co_hit;
		this.replies = replies;
	}

	@Override
	public String toString() {
		return "Community [co_no=" + co_no + ", rowNum=" + rowNum + ", user_no=" + user_no + ", writer_id=" + writer_id
				+ ", co_title=" + co_title + ", co_content=" + co_content + ", co_regist=" + co_regist + ", co_hit="
				+ co_hit + ", replies=" + replies + "]";
	}

	public int getCo_no() {
		return co_no;
	}

	public void setCo_no(int co_no) {
		this.co_no = co_no;
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

	public String getCo_title() {
		return co_title;
	}

	public void setCo_title(String co_title) {
		this.co_title = co_title;
	}

	public String getCo_content() {
		return co_content;
	}

	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}

	public Date getCo_regist() {
		return co_regist;
	}

	public void setCo_regist(Date co_regist) {
		this.co_regist = co_regist;
	}

	public int getCo_hit() {
		return co_hit;
	}

	public void setCo_hit(int co_hit) {
		this.co_hit = co_hit;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	

}

