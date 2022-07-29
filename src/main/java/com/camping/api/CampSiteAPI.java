package com.camping.api;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.camping.mvc.camping.model.vo.CampingVO;

public class CampSiteAPI {

	public static String key = "PCNxso2TMGeSrjPMsBxvOscmyUmaYllFFoSb%2BN%2BjMnDf4gSitSdIZjC3290UCja4ki92iGwbCXZv6utvCT0IAg%3D%3D";
	// 기본 정보 url
	public static String CAMPING_XML_URL = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList";

//	public static void main(String[] args) {
//		System.out.println(CampSiteAPI.callCampListByXML());
//		List<CampingVO> mylist = CampSiteAPI.callCampListByXML();
//		for (int i = 0; i < mylist.size(); i++) {
//			mylist.get(i).toString();
//		}
//	}

	public static List<CampingVO> callCampListByXML() {
		List<CampingVO> list = new ArrayList<>();
		int pageNo = 1;
		int cnt = 1;
		int numOfRows = 1000;
		while (true) {

			// 1. URL 가공
			System.out.println();
			System.out.println("pageNumber : " + pageNo);
			StringBuilder urlBuilder = new StringBuilder(CAMPING_XML_URL);

			urlBuilder.append("?" + "serviceKey=" + key);
			urlBuilder.append("&" + "pageNo=" + pageNo);
			urlBuilder.append("&" + "numOfRows=" + numOfRows);
			urlBuilder.append("&" + "MobileOS=ETC");
			urlBuilder.append("&" + "MobileApp=AppTest");
			System.out.println(urlBuilder);
			try {
				// 2. URL을 http 객체를 통해 요청
				URL url = new URL(urlBuilder.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				// conn.setRequestProperty("Content-type", "application/json");
				conn.setRequestProperty("Accept", "application/xml");

				int code = conn.getResponseCode();
				System.out.println("Response code: " + code);
				if (code < 200 || code >= 300) {
					System.out.println("페이지가 잘못되었습니다.");
					return null;
				}

				// 3. 해석부
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document doc = db.parse(conn.getInputStream());
				doc.getDocumentElement().normalize();

				System.out.println("Root Element : " + doc.getDocumentElement().getNodeName()); // XML의 최상위 tag값을 가져온다.
				System.out.println("=======================" + pageNo + "페이지 시작==============================");

				NodeList nList = doc.getElementsByTagName("item");
				//nList >> 가져오는 아이템 이고  얘가 없으면. break; while문 종료
				System.out.println("nList.getLength() : "+nList.getLength());
				if(nList.getLength() < 1) {
					break;
				}
				for (int j = 0; j < nList.getLength(); j++) {
					Node node = nList.item(j);
//					System.out.println("\nCurrent Element : " + node.getNodeName());

					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) node;

						String cs_name = eElement.getElementsByTagName("facltNm").item(0).getTextContent();
						
//						---------------------------------------------
//						 ★ 제7의 멤버분
						System.out.println("=========");
						String cs_line_intro = "";
						if(eElement.getElementsByTagName("lineIntro").item(0)!=null) {
							cs_line_intro = eElement.getElementsByTagName("lineIntro").item(0).getTextContent();
//							System.out.println("cs_line_intro : " + eElement.getElementsByTagName("lineIntro").item(0).getTextContent());
						}
						String cs_intro = "";
						if(eElement.getElementsByTagName("intro").item(0)!=null) {
							cs_intro = eElement.getElementsByTagName("intro").item(0).getTextContent();
//							System.out.println("cs_intro : " + eElement.getElementsByTagName("intro").item(0).getTextContent());

						}
						String cs_allar = "";
						if(eElement.getElementsByTagName("allar").item(0)!=null) {
							cs_allar = eElement.getElementsByTagName("allar").item(0).getTextContent();
						}
						String cs_insrnc_at = "";
						if(eElement.getElementsByTagName("insrncAt").item(0)!=null) {
							cs_insrnc_at = eElement.getElementsByTagName("insrncAt").item(0).getTextContent();
						}
						String cs_bizr_no = "";
						if(eElement.getElementsByTagName("bizrno").item(0)!=null) {
							cs_bizr_no = eElement.getElementsByTagName("bizrno").item(0).getTextContent();
//							System.out.println("cs_bizr_no : " + eElement.getElementsByTagName("bizrno").item(0).getTextContent());

						}
						String cs_managesttus = "";
						if(eElement.getElementsByTagName("manageSttus").item(0)!=null) {
							cs_managesttus = eElement.getElementsByTagName("manageSttus").item(0).getTextContent();
						}
						String cs_feature_name = "";
						if(eElement.getElementsByTagName("featureNm").item(0)!=null) {
							cs_feature_name = eElement.getElementsByTagName("featureNm").item(0).getTextContent();
//							System.out.println("cs_feature_name : " + eElement.getElementsByTagName("featureNm").item(0).getTextContent());

						}
						String cs_induty = "";
						if(eElement.getElementsByTagName("induty").item(0)!=null) {
							cs_induty = eElement.getElementsByTagName("induty").item(0).getTextContent();
						}
						String cs_lct_cl = "";
						if(eElement.getElementsByTagName("lctCl").item(0)!=null) {
							cs_lct_cl = eElement.getElementsByTagName("lctCl").item(0).getTextContent();
//							System.out.println("cs_lct_cl : " + eElement.getElementsByTagName("lctCl").item(0).getTextContent());

						}
						String cs_do_name = "";
						if(eElement.getElementsByTagName("doNm").item(0)!=null) {
							cs_do_name = eElement.getElementsByTagName("doNm").item(0).getTextContent();
						}
						String cs_sigungu_name = "";
						if(eElement.getElementsByTagName("sigunguNm").item(0)!=null) {
							cs_sigungu_name = eElement.getElementsByTagName("sigunguNm").item(0).getTextContent();
						}
						String cs_zipcode = "";
						if(eElement.getElementsByTagName("zipcode").item(0)!=null) {
							cs_zipcode = eElement.getElementsByTagName("zipcode").item(0).getTextContent();
						}
						String cs_addr1 = "";
						if(eElement.getElementsByTagName("addr1").item(0)!=null) {
							cs_addr1 = eElement.getElementsByTagName("addr1").item(0).getTextContent();
//						System.out.println("cs_addr1 : " + eElement.getElementsByTagName("addr1").item(0).getTextContent());

						}
//						String cs_addr1 = eElement.getElementsByTagName("addr1").item(0).getTextContent();
						String cs_addr2 = "";
						if(eElement.getElementsByTagName("addr2").item(0)!=null) {
							cs_addr2 = eElement.getElementsByTagName("addr2").item(0).getTextContent();
						}
//						String cs_addr2 = eElement.getElementsByTagName("addr2").item(0).getTextContent();
						
						String cs_map_x = "";
						if(eElement.getElementsByTagName("mapX").item(0)!=null) {
							cs_map_x = eElement.getElementsByTagName("mapX").item(0).getTextContent();
						}
						String cs_map_y = "";
						if(eElement.getElementsByTagName("mapY").item(0)!=null) {
							cs_map_y = eElement.getElementsByTagName("mapY").item(0).getTextContent();
						}
						String cs_tel = "";
						if(eElement.getElementsByTagName("tel").item(0)!=null) {
							cs_tel = eElement.getElementsByTagName("tel").item(0).getTextContent();
//							System.out.println("cs_tel : " + eElement.getElementsByTagName("tel").item(0).getTextContent());

						}
						String cs_homepage = "";
						if(eElement.getElementsByTagName("homepage").item(0)!=null) {
							cs_homepage = eElement.getElementsByTagName("homepage").item(0).getTextContent();
//							System.out.println("cs_homepage : " + eElement.getElementsByTagName("homepage").item(0).getTextContent());

						}
						
						String cs_resve_url = "";
						if(eElement.getElementsByTagName("resveUrl").item(0)!=null) {
							cs_resve_url = eElement.getElementsByTagName("resveUrl").item(0).getTextContent();
//							System.out.println("cs_resve_url : " + eElement.getElementsByTagName("resveUrl").item(0).getTextContent());

						}
						String cs_resve_cl = "";
						if(eElement.getElementsByTagName("resveCl").item(0)!=null) {
							cs_resve_cl = eElement.getElementsByTagName("resveCl").item(0).getTextContent();
//							System.out.println("cs_resve_cl : " + eElement.getElementsByTagName("resveCl").item(0).getTextContent());

						}
						int cs_manager = Integer.parseInt(eElement.getElementsByTagName("manageNmpr").item(0).getTextContent());
//						if(eElement.getElementsByTagName("manageNmpr").item(0)!=null) {
//							cs_manager = eElement.getElementsByTagName("manageNmpr").item(0).getTextContent();
//						}
						int cs_gnrl_site = Integer.parseInt(eElement.getElementsByTagName("gnrlSiteCo").item(0).getTextContent());
//						if(eElement.getElementsByTagName("gnrlSiteCo").item(0)!=null) {
//							cs_gnrl_site = eElement.getElementsByTagName("gnrlSiteCo").item(0).getTextContent();
//						}
						int cs_auto_site = Integer.parseInt(eElement.getElementsByTagName("autoSiteCo").item(0).getTextContent());
//						if(eElement.getElementsByTagName("autoSiteCo").item(0)!=null) {
//							cs_auto_site = eElement.getElementsByTagName("autoSiteCo").item(0).getTextContent();
//						}
						int cs_glamp_site = Integer.parseInt(eElement.getElementsByTagName("glampSiteCo").item(0).getTextContent());
//						if(eElement.getElementsByTagName("glampSiteCo").item(0)!=null) {
//							cs_glamp_site = eElement.getElementsByTagName("glampSiteCo").item(0).getTextContent();
//						}
						int cs_carav_site = Integer.parseInt(eElement.getElementsByTagName("caravSiteCo").item(0).getTextContent());
//						if(eElement.getElementsByTagName("caravSiteCo").item(0)!=null) {
//							cs_carav_site = eElement.getElementsByTagName("caravSiteCo").item(0).getTextContent();
//						}
						int cs_indiv_carav_site = Integer.parseInt(eElement.getElementsByTagName("indvdlCaravSiteCo").item(0).getTextContent());
//						if(eElement.getElementsByTagName("indvdlCaravSiteCo").item(0)!=null) {
//							cs_indiv_carav_site = eElement.getElementsByTagName("indvdlCaravSiteCo").item(0).getTextContent();
//						}
						String cs_animal_cmg = "";
						if(eElement.getElementsByTagName("animalCmgCl").item(0)!=null) {
							cs_animal_cmg = eElement.getElementsByTagName("animalCmgCl").item(0).getTextContent();
						}
						String cs_postbl_fclty = "";
						if(eElement.getElementsByTagName("posblFcltyCl").item(0)!=null) {
							cs_postbl_fclty = eElement.getElementsByTagName("posblFcltyCl").item(0).getTextContent();
//							System.out.println("cs_postbl_fclty : " + eElement.getElementsByTagName("posblFcltyCl").item(0).getTextContent());

						}
						String cs_sbrs_cl = "";
						if(eElement.getElementsByTagName("sbrsCl").item(0)!=null) {
							cs_sbrs_cl = eElement.getElementsByTagName("sbrsCl").item(0).getTextContent();
//							System.out.println("cs_sbrs_cl : " + eElement.getElementsByTagName("sbrsCl").item(0).getTextContent());

						}
						
						// ★ 지인이 알려준 삼항연산자 사용 : 대신 println -> printf 로
						
//						String csResveCl = eElement.getElementsByTagName("resveUrl").getLength() == 0 ? ""
//								: eElement.getElementsByTagName("resveUrl").item(0).getTextContent();
//						System.out.printf("%s : %s", "resveUrl", csResveCl);

//						---------------------------------------------
						
						System.out.println("cs_no : " + cnt); //캠핑장no
						System.out.println("cs_name : " + eElement.getElementsByTagName("facltNm").item(0).getTextContent());//캠핑장이름
//						System.out.println("cs_line_intro : " + eElement.getElementsByTagName("lineIntro").item(0).getTextContent());//한줄소개
//						System.out.println("cs_intro : " + eElement.getElementsByTagName("intro").item(0).getTextContent());//소개
//						System.out.println("cs_allar : " + eElement.getElementsByTagName("allar").item(0).getTextContent());//전체면적
//						System.out.println("cs_insrnc_at : " + eElement.getElementsByTagName("insrncAt").item(0).getTextContent());//영업배상책임보험여부
//						System.out.println("cs_bizr_no : " + eElement.getElementsByTagName("bizrno").item(0).getTextContent());//사업자번호
//						System.out.println("cs_managesttus : " + eElement.getElementsByTagName("manageSttus").item(0).getTextContent());//운영상태
//						System.out.println("cs_feature_name : " + eElement.getElementsByTagName("featureNm").item(0).getTextContent());//특징
//						System.out.println("cs_induty : " + eElement.getElementsByTagName("induty").item(0).getTextContent());//업종
//						System.out.println("cs_lct_cl : " + eElement.getElementsByTagName("lctCl").item(0).getTextContent());//입지구분
//						System.out.println("cs_do_name : " + eElement.getElementsByTagName("doNm").item(0).getTextContent());//도
//						System.out.println("cs_sigungu_name : " + eElement.getElementsByTagName("sigunguNm").item(0).getTextContent());//시군수
//						System.out.println("cs_zipcode : " + eElement.getElementsByTagName("zipcode").item(0).getTextContent());//우편번호
//						System.out.println("cs_addr1 : " + eElement.getElementsByTagName("addr1").item(0).getTextContent());//주소
//						System.out.println("cs_addr2 : " + eElement.getElementsByTagName("addr2").item(0).getTextContent());//주소상세
//						System.out.println("cs_map_x : " + eElement.getElementsByTagName("mapX").item(0).getTextContent());//경도
//						System.out.println("cs_map_y : " + eElement.getElementsByTagName("mapY").item(0).getTextContent());//위도
//						System.out.println("cs_tel : " + eElement.getElementsByTagName("tel").item(0).getTextContent());//전화
//						System.out.println("cs_homepage : " + eElement.getElementsByTagName("homepage").item(0).getTextContent());//홈페이지
//						System.out.println("cs_resve_url : " + eElement.getElementsByTagName("resveUrl").item(0).getTextContent());//예약페이지
//						System.out.println("cs_resve_cl : " + eElement.getElementsByTagName("resveCl").item(0).getTextContent());//예약구분
//						System.out.println("cs_manager : " + eElement.getElementsByTagName("manageNmpr").item(0).getTextContent());//상주관리인원
//						System.out.println("cs_gnrl_site : " + eElement.getElementsByTagName("gnrlSiteCo").item(0).getTextContent());//주요시설 일반야영장
//						System.out.println("cs_auto_site : " + eElement.getElementsByTagName("autoSiteCo").item(0).getTextContent());//주요시설 자동차 야영장
//						System.out.println("cs_glamp_site : " + eElement.getElementsByTagName("glampSiteCo").item(0).getTextContent());//주요시설 글램핑
//						System.out.println("cs_carav_site : " + eElement.getElementsByTagName("caravSiteCo").item(0).getTextContent());//주요시설 카라반
//						System.out.println("cs_indiv_carav_site : " + eElement.getElementsByTagName("indvdlCaravSiteCo").item(0).getTextContent());//주요시설 개인카라반
//						System.out.println("cs_animal_cmg : " + eElement.getElementsByTagName("animalCmgCl").item(0).getTextContent());//애완동물 출입여부
//						System.out.println("cs_postbl_fclty : " + eElement.getElementsByTagName("posblFcltyCl").item(0).getTextContent());//주변 이용가능시설
//						System.out.println("cs_sbrs_cl : " + eElement.getElementsByTagName("sbrsCl").item(0).getTextContent());//부대시설

						CampingVO camp = new CampingVO(cnt++, cs_name, cs_line_intro, cs_intro, cs_allar, cs_insrnc_at
								, cs_bizr_no, cs_managesttus,cs_feature_name,cs_induty,cs_lct_cl,cs_do_name,cs_sigungu_name
								,cs_zipcode,cs_addr1,cs_addr2,cs_map_x,cs_map_y,cs_tel,cs_homepage,cs_resve_url,cs_resve_cl
								,cs_manager,cs_gnrl_site,cs_auto_site,cs_glamp_site,cs_carav_site,cs_indiv_carav_site
								,cs_animal_cmg,cs_postbl_fclty,cs_sbrs_cl);
						list.add(camp);
					}
				}
				pageNo++;
				System.out.println("WTF : "+pageNo);
				if(pageNo == 5) {
					break;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}