package com.camping.mvc.community.model.vo;

import java.util.Date;

public class Reply {
	private int	rep_no ;                 		   //댓글번호
	private String   rep_content ;                //댓글내용
	private Date   rep_regist ;           		  //댓글등록날짜
	private int   user_no ;                 	  //댓글작성자번호(커뮤니티게시판 테이블 컬럼)
	private String writer_id;						//추가
	private int   co_no ;                         //댓글이 작성된게시글번호(커뮤니티게시판 테이블 컬럼)
	
	public Reply() {
		super();
		
	}

	
	
	
	public Reply(int rep_no, String rep_content, Date rep_regist, int user_no, String writer_id, int co_no) {
		super();
		this.rep_no = rep_no;
		this.rep_content = rep_content;
		this.rep_regist = rep_regist;
		this.user_no = user_no;
		this.writer_id = writer_id;
		this.co_no = co_no;
	}




	@Override
	public String toString() {
		return "Reply [rep_no=" + rep_no + ", rep_content=" + rep_content + ", rep_regist=" + rep_regist + ", user_no="
				+ user_no + ", writer_id=" + writer_id + ", co_no=" + co_no + "]";
	}




	public int getRep_no() {
		return rep_no;
	}




	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}




	public String getRep_content() {
		return rep_content;
	}




	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}




	public Date getRep_regist() {
		return rep_regist;
	}




	public void setRep_regist(Date rep_regist) {
		this.rep_regist = rep_regist;
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




	public int getCo_no() {
		return co_no;
	}




	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	
	
	

}