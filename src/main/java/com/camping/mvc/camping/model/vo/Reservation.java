package com.camping.mvc.camping.model.vo;

import java.sql.Date;
import java.util.Objects;

public class Reservation {
	private int resv_no;
	private int user_no;
	private int cs_no;
	private int resv_headcount;
	private String resv_pay;
	private Date resv_checkin;
	private Date resv_checkout;
	private String cs_name;
	private String cs_addr1;
	private String cs_addr2;
	private String cs_tel;
	private String cs_homepage;
	private String cs_accom_fee;
	
	public Reservation() {
		super();
	}

	public Reservation(int resv_no, int user_no, int cs_no, int resv_headcount, String resv_pay, Date resv_checkin,
			Date resv_checkout, String cs_name, String cs_addr1, String cs_addr2, String cs_tel, String cs_homepage,
			String cs_accom_fee) {
		super();
		this.resv_no = resv_no;
		this.user_no = user_no;
		this.cs_no = cs_no;
		this.resv_headcount = resv_headcount;
		this.resv_pay = resv_pay;
		this.resv_checkin = resv_checkin;
		this.resv_checkout = resv_checkout;
		this.cs_name = cs_name;
		this.cs_addr1 = cs_addr1;
		this.cs_addr2 = cs_addr2;
		this.cs_tel = cs_tel;
		this.cs_homepage = cs_homepage;
		this.cs_accom_fee = cs_accom_fee;
	}

	@Override
	public String toString() {
		return "ReservationVO [resv_no=" + resv_no + ", user_no=" + user_no + ", cs_no=" + cs_no + ", resv_headcount="
				+ resv_headcount + ", resv_pay=" + resv_pay + ", resv_checkin=" + resv_checkin + ", resv_checkout="
				+ resv_checkout + ", cs_name=" + cs_name + ", cs_addr1=" + cs_addr1 + ", cs_addr2=" + cs_addr2
				+ ", cs_tel=" + cs_tel + ", cs_homepage=" + cs_homepage + ", cs_accom_fee=" + cs_accom_fee + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cs_accom_fee, cs_addr1, cs_addr2, cs_homepage, cs_name, cs_no, cs_tel, resv_checkin,
				resv_checkout, resv_headcount, resv_no, resv_pay, user_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reservation other = (Reservation) obj;
		return Objects.equals(cs_accom_fee, other.cs_accom_fee) && Objects.equals(cs_addr1, other.cs_addr1)
				&& Objects.equals(cs_addr2, other.cs_addr2) && Objects.equals(cs_homepage, other.cs_homepage)
				&& Objects.equals(cs_name, other.cs_name) && cs_no == other.cs_no
				&& Objects.equals(cs_tel, other.cs_tel) && Objects.equals(resv_checkin, other.resv_checkin)
				&& Objects.equals(resv_checkout, other.resv_checkout) && resv_headcount == other.resv_headcount
				&& resv_no == other.resv_no && Objects.equals(resv_pay, other.resv_pay) && user_no == other.user_no;
	}

	public int getResv_no() {
		return resv_no;
	}

	public void setResv_no(int resv_no) {
		this.resv_no = resv_no;
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

	public int getResv_headcount() {
		return resv_headcount;
	}

	public void setResv_headcount(int resv_headcount) {
		this.resv_headcount = resv_headcount;
	}

	public String getResv_pay() {
		return resv_pay;
	}

	public void setResv_pay(String resv_pay) {
		this.resv_pay = resv_pay;
	}

	public Date getResv_checkin() {
		return resv_checkin;
	}

	public void setResv_checkin(Date resv_checkin) {
		this.resv_checkin = resv_checkin;
	}

	public Date getResv_checkout() {
		return resv_checkout;
	}

	public void setResv_checkout(Date resv_checkout) {
		this.resv_checkout = resv_checkout;
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

	public String getCs_addr2() {
		return cs_addr2;
	}

	public void setCs_addr2(String cs_addr2) {
		this.cs_addr2 = cs_addr2;
	}

	public String getCs_tel() {
		return cs_tel;
	}

	public void setCs_tel(String cs_tel) {
		this.cs_tel = cs_tel;
	}

	public String getCs_homepage() {
		return cs_homepage;
	}

	public void setCs_homepage(String cs_homepage) {
		this.cs_homepage = cs_homepage;
	}

	public String getCs_accom_fee() {
		return cs_accom_fee;
	}

	public void setCs_accom_fee(String cs_accom_fee) {
		this.cs_accom_fee = cs_accom_fee;
	}
}