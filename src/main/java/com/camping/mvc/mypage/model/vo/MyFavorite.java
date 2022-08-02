package com.camping.mvc.mypage.model.vo;

import java.util.Objects;

public class MyFavorite {
	private int like_no; 
	private int cs_no;
	private int user_no;
	private String cs_name;
	private String cs_addr1;
	private String cs_image;

	public MyFavorite() {
		super();
	}

	public MyFavorite(int like_no, int cs_no, int user_no, String cs_name, String cs_addr1, String cs_image) {
		super();
		this.like_no = like_no;
		this.cs_no = cs_no;
		this.user_no = user_no;
		this.cs_name = cs_name;
		this.cs_addr1 = cs_addr1;
		this.cs_image = cs_image;
	}

	@Override
	public String toString() {
		return "MyFavorite [like_no=" + like_no + ", cs_no=" + cs_no + ", user_no=" + user_no + ", cs_name=" + cs_name
				+ ", cs_addr1=" + cs_addr1 + ", cs_image=" + cs_image + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cs_addr1, cs_image, cs_name, cs_no, like_no, user_no);
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
		return Objects.equals(cs_addr1, other.cs_addr1) && Objects.equals(cs_image, other.cs_image)
				&& Objects.equals(cs_name, other.cs_name) && cs_no == other.cs_no && like_no == other.like_no
				&& user_no == other.user_no;
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

	public String getCs_name() {
		return cs_name;
	}

	public void setCs_name(String cs_name) {
		this.cs_name = cs_name;
	}

	public String getCs_addr1() {
		return cs_addr1;
	}

	public void setCs_addr1(String cs_addr1) {
		this.cs_addr1 = cs_addr1;
	}

	public String getCs_image() {
		return cs_image;
	}

	public void setCs_image(String cs_image) {
		this.cs_image = cs_image;
	}
	
	
	
}
