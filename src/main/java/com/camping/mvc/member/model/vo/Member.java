package com.camping.mvc.member.model.vo;

import java.util.Objects;

public class Member {
	
	private int user_no; 
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_email;
	private String user_birth;

	public Member() {
		super();
	}

	public Member(int user_no, String user_id, String user_pw, String user_name, String user_phone, String user_email,
			String user_birth) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_birth = user_birth;
	}

	@Override
	public int hashCode() {
		return Objects.hash(user_birth, user_email, user_id, user_name, user_no, user_phone, user_pw);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		return Objects.equals(user_birth, other.user_birth) && Objects.equals(user_email, other.user_email)
				&& Objects.equals(user_id, other.user_id) && Objects.equals(user_name, other.user_name)
				&& user_no == other.user_no && Objects.equals(user_phone, other.user_phone)
				&& Objects.equals(user_pw, other.user_pw);
	}

	@Override
	public String toString() {
		return "Member [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_phone=" + user_phone + ", user_email=" + user_email + ", user_birth=" + user_birth
				+ "]";
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	
	
}