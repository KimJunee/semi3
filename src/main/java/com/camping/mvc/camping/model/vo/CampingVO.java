package com.camping.mvc.camping.model.vo;

import java.util.Objects;

public class CampingVO {
	private int cs_no;
	private String cs_name;
	private String cs_line_intro;
	private String cs_intro;
	private String cs_allar;
	private String cs_insrnc_at;
	private String cs_bizr_no;
	private String cs_managesttus;
	private String cs_feature_name;
	private String cs_induty;
	private String cs_lct_cl;
	private String cs_do_name;
	private String cs_sigungu_name;
	private String cs_zipcode;
	private String cs_addr1;
	private String cs_addr2;
	private String cs_map_x;
	private String cs_map_y;
	private String cs_tel;
	private String cs_homepage;
	private String cs_resve_url;
	private String cs_resve_cl;
	private int cs_manager;
	private int cs_gnrl_site;
	private int cs_auto_site;
	private int cs_glamp_site;
	private int cs_carav_site;
	private int cs_indiv_carav_site;
	private String cs_animal_cmg;
	private String cs_postbl_fclty;
	private String cs_sbrs_cl;
	private String cs_accom_fee;
	private String cs_image;

	public CampingVO() {
		super();
	}

	public CampingVO(int cs_no, String cs_name, String cs_line_intro, String cs_intro, String cs_allar,
			String cs_insrnc_at, String cs_bizr_no, String cs_managesttus, String cs_feature_name, String cs_induty,
			String cs_lct_cl, String cs_do_name, String cs_sigungu_name, String cs_zipcode, String cs_addr1,
			String cs_addr2, String cs_map_x, String cs_map_y, String cs_tel, String cs_homepage, String cs_resve_url,
			String cs_resve_cl, int cs_manager, int cs_gnrl_site, int cs_auto_site, int cs_glamp_site,
			int cs_carav_site, int cs_indiv_carav_site, String cs_animal_cmg, String cs_postbl_fclty, String cs_sbrs_cl,
			String cs_accom_fee, String cs_image) {
		super();
		this.cs_no = cs_no;
		this.cs_name = cs_name;
		this.cs_line_intro = cs_line_intro;
		this.cs_intro = cs_intro;
		this.cs_allar = cs_allar;
		this.cs_insrnc_at = cs_insrnc_at;
		this.cs_bizr_no = cs_bizr_no;
		this.cs_managesttus = cs_managesttus;
		this.cs_feature_name = cs_feature_name;
		this.cs_induty = cs_induty;
		this.cs_lct_cl = cs_lct_cl;
		this.cs_do_name = cs_do_name;
		this.cs_sigungu_name = cs_sigungu_name;
		this.cs_zipcode = cs_zipcode;
		this.cs_addr1 = cs_addr1;
		this.cs_addr2 = cs_addr2;
		this.cs_map_x = cs_map_x;
		this.cs_map_y = cs_map_y;
		this.cs_tel = cs_tel;
		this.cs_homepage = cs_homepage;
		this.cs_resve_url = cs_resve_url;
		this.cs_resve_cl = cs_resve_cl;
		this.cs_manager = cs_manager;
		this.cs_gnrl_site = cs_gnrl_site;
		this.cs_auto_site = cs_auto_site;
		this.cs_glamp_site = cs_glamp_site;
		this.cs_carav_site = cs_carav_site;
		this.cs_indiv_carav_site = cs_indiv_carav_site;
		this.cs_animal_cmg = cs_animal_cmg;
		this.cs_postbl_fclty = cs_postbl_fclty;
		this.cs_sbrs_cl = cs_sbrs_cl;
		this.cs_accom_fee = cs_accom_fee;
		this.cs_image = cs_image;
	}

	@Override
	public String toString() {
		return "CampingVO [cs_no=" + cs_no + ", cs_name=" + cs_name + ", cs_line_intro=" + cs_line_intro + ", cs_intro="
				+ cs_intro + ", cs_allar=" + cs_allar + ", cs_insrnc_at=" + cs_insrnc_at + ", cs_bizr_no=" + cs_bizr_no
				+ ", cs_managesttus=" + cs_managesttus + ", cs_feature_name=" + cs_feature_name + ", cs_induty="
				+ cs_induty + ", cs_lct_cl=" + cs_lct_cl + ", cs_do_name=" + cs_do_name + ", cs_sigungu_name="
				+ cs_sigungu_name + ", cs_zipcode=" + cs_zipcode + ", cs_addr1=" + cs_addr1 + ", cs_addr2=" + cs_addr2
				+ ", cs_map_x=" + cs_map_x + ", cs_map_y=" + cs_map_y + ", cs_tel=" + cs_tel + ", cs_homepage="
				+ cs_homepage + ", cs_resve_url=" + cs_resve_url + ", cs_resve_cl=" + cs_resve_cl + ", cs_manager="
				+ cs_manager + ", cs_gnrl_site=" + cs_gnrl_site + ", cs_auto_site=" + cs_auto_site + ", cs_glamp_site="
				+ cs_glamp_site + ", cs_carav_site=" + cs_carav_site + ", cs_indiv_carav_site=" + cs_indiv_carav_site
				+ ", cs_animal_cmg=" + cs_animal_cmg + ", cs_postbl_fclty=" + cs_postbl_fclty + ", cs_sbrs_cl="
				+ cs_sbrs_cl + ", cs_accom_fee=" + cs_accom_fee + ", cs_image=" + cs_image + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cs_accom_fee, cs_addr1, cs_addr2, cs_allar, cs_animal_cmg, cs_auto_site, cs_bizr_no,
				cs_carav_site, cs_do_name, cs_feature_name, cs_glamp_site, cs_gnrl_site, cs_homepage, cs_image,
				cs_indiv_carav_site, cs_induty, cs_insrnc_at, cs_intro, cs_lct_cl, cs_line_intro, cs_manager,
				cs_managesttus, cs_map_x, cs_map_y, cs_name, cs_no, cs_postbl_fclty, cs_resve_cl, cs_resve_url,
				cs_sbrs_cl, cs_sigungu_name, cs_tel, cs_zipcode);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CampingVO other = (CampingVO) obj;
		return Objects.equals(cs_accom_fee, other.cs_accom_fee) && Objects.equals(cs_addr1, other.cs_addr1)
				&& Objects.equals(cs_addr2, other.cs_addr2) && Objects.equals(cs_allar, other.cs_allar)
				&& Objects.equals(cs_animal_cmg, other.cs_animal_cmg) && cs_auto_site == other.cs_auto_site
				&& Objects.equals(cs_bizr_no, other.cs_bizr_no) && cs_carav_site == other.cs_carav_site
				&& Objects.equals(cs_do_name, other.cs_do_name)
				&& Objects.equals(cs_feature_name, other.cs_feature_name) && cs_glamp_site == other.cs_glamp_site
				&& cs_gnrl_site == other.cs_gnrl_site && Objects.equals(cs_homepage, other.cs_homepage)
				&& Objects.equals(cs_image, other.cs_image) && cs_indiv_carav_site == other.cs_indiv_carav_site
				&& Objects.equals(cs_induty, other.cs_induty) && Objects.equals(cs_insrnc_at, other.cs_insrnc_at)
				&& Objects.equals(cs_intro, other.cs_intro) && Objects.equals(cs_lct_cl, other.cs_lct_cl)
				&& Objects.equals(cs_line_intro, other.cs_line_intro) && cs_manager == other.cs_manager
				&& Objects.equals(cs_managesttus, other.cs_managesttus) && Objects.equals(cs_map_x, other.cs_map_x)
				&& Objects.equals(cs_map_y, other.cs_map_y) && Objects.equals(cs_name, other.cs_name)
				&& cs_no == other.cs_no && Objects.equals(cs_postbl_fclty, other.cs_postbl_fclty)
				&& Objects.equals(cs_resve_cl, other.cs_resve_cl) && Objects.equals(cs_resve_url, other.cs_resve_url)
				&& Objects.equals(cs_sbrs_cl, other.cs_sbrs_cl)
				&& Objects.equals(cs_sigungu_name, other.cs_sigungu_name) && Objects.equals(cs_tel, other.cs_tel)
				&& Objects.equals(cs_zipcode, other.cs_zipcode);
	}

	public int getCs_no() {
		return cs_no;
	}

	public void setCs_no(int cs_no) {
		this.cs_no = cs_no;
	}

	public String getCs_name() {
		return cs_name;
	}

	public void setCs_name(String cs_name) {
		this.cs_name = cs_name;
	}

	public String getCs_line_intro() {
		return cs_line_intro;
	}

	public void setCs_line_intro(String cs_line_intro) {
		this.cs_line_intro = cs_line_intro;
	}

	public String getCs_intro() {
		return cs_intro;
	}

	public void setCs_intro(String cs_intro) {
		this.cs_intro = cs_intro;
	}

	public String getCs_allar() {
		return cs_allar;
	}

	public void setCs_allar(String cs_allar) {
		this.cs_allar = cs_allar;
	}

	public String getCs_insrnc_at() {
		return cs_insrnc_at;
	}

	public void setCs_insrnc_at(String cs_insrnc_at) {
		this.cs_insrnc_at = cs_insrnc_at;
	}

	public String getCs_bizr_no() {
		return cs_bizr_no;
	}

	public void setCs_bizr_no(String cs_bizr_no) {
		this.cs_bizr_no = cs_bizr_no;
	}

	public String getCs_managesttus() {
		return cs_managesttus;
	}

	public void setCs_managesttus(String cs_managesttus) {
		this.cs_managesttus = cs_managesttus;
	}

	public String getCs_feature_name() {
		return cs_feature_name;
	}

	public void setCs_feature_name(String cs_feature_name) {
		this.cs_feature_name = cs_feature_name;
	}

	public String getCs_induty() {
		return cs_induty;
	}

	public void setCs_induty(String cs_induty) {
		this.cs_induty = cs_induty;
	}

	public String getCs_lct_cl() {
		return cs_lct_cl;
	}

	public void setCs_lct_cl(String cs_lct_cl) {
		this.cs_lct_cl = cs_lct_cl;
	}

	public String getCs_do_name() {
		return cs_do_name;
	}

	public void setCs_do_name(String cs_do_name) {
		this.cs_do_name = cs_do_name;
	}

	public String getCs_sigungu_name() {
		return cs_sigungu_name;
	}

	public void setCs_sigungu_name(String cs_sigungu_name) {
		this.cs_sigungu_name = cs_sigungu_name;
	}

	public String getCs_zipcode() {
		return cs_zipcode;
	}

	public void setCs_zipcode(String cs_zipcode) {
		this.cs_zipcode = cs_zipcode;
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

	public String getCs_map_x() {
		return cs_map_x;
	}

	public void setCs_map_x(String cs_map_x) {
		this.cs_map_x = cs_map_x;
	}

	public String getCs_map_y() {
		return cs_map_y;
	}

	public void setCs_map_y(String cs_map_y) {
		this.cs_map_y = cs_map_y;
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

	public String getCs_resve_url() {
		return cs_resve_url;
	}

	public void setCs_resve_url(String cs_resve_url) {
		this.cs_resve_url = cs_resve_url;
	}

	public String getCs_resve_cl() {
		return cs_resve_cl;
	}

	public void setCs_resve_cl(String cs_resve_cl) {
		this.cs_resve_cl = cs_resve_cl;
	}

	public int getCs_manager() {
		return cs_manager;
	}

	public void setCs_manager(int cs_manager) {
		this.cs_manager = cs_manager;
	}

	public int getCs_gnrl_site() {
		return cs_gnrl_site;
	}

	public void setCs_gnrl_site(int cs_gnrl_site) {
		this.cs_gnrl_site = cs_gnrl_site;
	}

	public int getCs_auto_site() {
		return cs_auto_site;
	}

	public void setCs_auto_site(int cs_auto_site) {
		this.cs_auto_site = cs_auto_site;
	}

	public int getCs_glamp_site() {
		return cs_glamp_site;
	}

	public void setCs_glamp_site(int cs_glamp_site) {
		this.cs_glamp_site = cs_glamp_site;
	}

	public int getCs_carav_site() {
		return cs_carav_site;
	}

	public void setCs_carav_site(int cs_carav_site) {
		this.cs_carav_site = cs_carav_site;
	}

	public int getCs_indiv_carav_site() {
		return cs_indiv_carav_site;
	}

	public void setCs_indiv_carav_site(int cs_indiv_carav_site) {
		this.cs_indiv_carav_site = cs_indiv_carav_site;
	}

	public String getCs_animal_cmg() {
		return cs_animal_cmg;
	}

	public void setCs_animal_cmg(String cs_animal_cmg) {
		this.cs_animal_cmg = cs_animal_cmg;
	}

	public String getCs_postbl_fclty() {
		return cs_postbl_fclty;
	}

	public void setCs_postbl_fclty(String cs_postbl_fclty) {
		this.cs_postbl_fclty = cs_postbl_fclty;
	}

	public String getCs_sbrs_cl() {
		return cs_sbrs_cl;
	}

	public void setCs_sbrs_cl(String cs_sbrs_cl) {
		this.cs_sbrs_cl = cs_sbrs_cl;
	}

	public String getCs_accom_fee() {
		return cs_accom_fee;
	}

	public void setCs_accom_fee(String cs_accom_fee) {
		this.cs_accom_fee = cs_accom_fee;
	}

	public String getCs_image() {
		return cs_image;
	}

	public void setCs_image(String cs_image) {
		this.cs_image = cs_image;
	}
}