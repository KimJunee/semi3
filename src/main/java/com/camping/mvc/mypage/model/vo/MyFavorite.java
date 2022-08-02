package com.camping.mvc.mypage.model.vo;

import java.util.Objects;

public class MyFavorite {
	private int like_no; 
	private int cs_no;
	private int user_no;
	
	public MyFavorite() {
		super();
	}

	public MyFavorite(int like_no, int cs_no, int user_no) {
		super();
		this.like_no = like_no;
		this.cs_no = cs_no;
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "MyFavorite [like_no=" + like_no + ", cs_no=" + cs_no + ", user_no=" + user_no + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cs_no, like_no, user_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MyFavorite other = (MyFavorite) obj;
		return cs_no == other.cs_no && like_no == other.like_no && user_no == other.user_no;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getCs_no() {
		return cs_no;
	}

	public void setCs_no(int cs_no) {
		this.cs_no = cs_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	
	
}
