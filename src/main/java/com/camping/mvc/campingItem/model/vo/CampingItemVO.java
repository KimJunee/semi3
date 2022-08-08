package com.camping.mvc.campingItem.model.vo;

public class CampingItemVO {
	private int rowNum;
	private int ci_no;
	private String ci_title;
	private String ci_link;
	private String ci_image;
	private String ci_price;
	private String ci_mall_name;
	private String ci_product_id;
	private String ci_maker;
	private String ci_brand;
	private String ci_category3;
	private String ci_category4;
	
	public CampingItemVO() {
		super();
	}

	public CampingItemVO(int rowNum, int ci_no, String ci_title, String ci_link, String ci_image, String ci_price,
			String ci_mall_name, String ci_product_id, String ci_maker, String ci_brand, String ci_category3,
			String ci_category4) {
		super();
		this.rowNum = rowNum;
		this.ci_no = ci_no;
		this.ci_title = ci_title;
		this.ci_link = ci_link;
		this.ci_image = ci_image;
		this.ci_price = ci_price;
		this.ci_mall_name = ci_mall_name;
		this.ci_product_id = ci_product_id;
		this.ci_maker = ci_maker;
		this.ci_brand = ci_brand;
		this.ci_category3 = ci_category3;
		this.ci_category4 = ci_category4;
	}

	public CampingItemVO(int ci_no, String ci_title, String ci_link, String ci_image, String ci_price,
			String ci_mall_name, String ci_product_id, String ci_maker, String ci_brand, String ci_category3,
			String ci_category4) {
		super();
		this.ci_no = ci_no;
		this.ci_title = ci_title;
		this.ci_link = ci_link;
		this.ci_image = ci_image;
		this.ci_price = ci_price;
		this.ci_mall_name = ci_mall_name;
		this.ci_product_id = ci_product_id;
		this.ci_maker = ci_maker;
		this.ci_brand = ci_brand;
		this.ci_category3 = ci_category3;
		this.ci_category4 = ci_category4;
	}

	public CampingItemVO(int rowNum, int ci_no, String ci_title, String ci_link, String ci_image, String ci_price,
			String ci_brand, String ci_category3, String ci_category4) {
		super();
		this.rowNum = rowNum;
		this.ci_no = ci_no;
		this.ci_title = ci_title;
		this.ci_link = ci_link;
		this.ci_image = ci_image;
		this.ci_price = ci_price;
		this.ci_brand = ci_brand;
		this.ci_category3 = ci_category3;
		this.ci_category4 = ci_category4;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getCi_no() {
		return ci_no;
	}

	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
	}

	public String getCi_title() {
		return ci_title;
	}

	public void setCi_title(String ci_title) {
		this.ci_title = ci_title;
	}

	public String getCi_link() {
		return ci_link;
	}

	public void setCi_link(String ci_link) {
		this.ci_link = ci_link;
	}

	public String getCi_image() {
		return ci_image;
	}

	public void setCi_image(String ci_image) {
		this.ci_image = ci_image;
	}

	public String getCi_price() {
		return ci_price;
	}

	public void setCi_price(String ci_price) {
		this.ci_price = ci_price;
	}

	public String getCi_mall_name() {
		return ci_mall_name;
	}

	public void setCi_mall_name(String ci_mall_name) {
		this.ci_mall_name = ci_mall_name;
	}

	public String getCi_product_id() {
		return ci_product_id;
	}

	public void setCi_product_id(String ci_product_id) {
		this.ci_product_id = ci_product_id;
	}

	public String getCi_maker() {
		return ci_maker;
	}

	public void setCi_maker(String ci_maker) {
		this.ci_maker = ci_maker;
	}

	public String getCi_brand() {
		return ci_brand;
	}

	public void setCi_brand(String ci_brand) {
		this.ci_brand = ci_brand;
	}

	public String getCi_category3() {
		return ci_category3;
	}

	public void setCi_category3(String ci_category3) {
		this.ci_category3 = ci_category3;
	}

	public String getCi_category4() {
		return ci_category4;
	}

	public void setCi_category4(String ci_category4) {
		this.ci_category4 = ci_category4;
	}

	@Override
	public String toString() {
		return "CampingItemVO [rowNum=" + rowNum + ", ci_no=" + ci_no + ", ci_title=" + ci_title + ", ci_link="
				+ ci_link + ", ci_image=" + ci_image + ", ci_price=" + ci_price + ", ci_brand=" + ci_brand
				+ ", ci_category3=" + ci_category3 + ", ci_category4=" + ci_category4 + "]";
	}	
}
