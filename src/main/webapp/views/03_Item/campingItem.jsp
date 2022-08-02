<%@page import="com.camping.common.util.PageInfo"%>
<%@page import="com.camping.mvc.campingItem.model.vo.CampingItemVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/views/07_common/header.jsp" %>
<%
List<CampingItemVO> list = (List<CampingItemVO>)request.getAttribute("list");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
String[] searchType = request.getParameterValues("searchType");
String searchValue = request.getParameter("searchValue");
if(searchValue == null){
	searchValue = "";
}
%>

    <!-- 메인 큰 이미지 -->
    <section class="container" style="background-image: url(<%=path%>/resources/img/img_semi/itemmain.png); height: 600px;"></section>
    <!-- 메인 검색창 -->
    <div class="container mb-5">
        <div class="search-bar rounded-4 p-0 p-lg-1 position-relative mt-n6 z-index-20 mx-7">
            <form action="<%=path%>/campingItem/Detail" method="get">
                <div class="row">
                    <!-- 카테고리 -->
                    <div class="col-lg-3 d-flex align-items-center form-group">
                        <div class="input-label-absolute input-label-absolute-right w-100">
                            <div style="color: #F05945; text-align:center; font-weight: bold;">캠핑용품</div>
                        </div>
                    </div>
                    <!-- 종류선택 -->
                    <div class="col-lg-3 d-flex align-items-center form-group no-divider-custom ">
                    <select class="selectpicker" name="searchType" data-style="btn-form-control">
                    <option value="" selected disabled>카레고리 선택</option>
                    <option value="ci_title">상품명</option>
                    <option value="ci_brand">브랜드</option>
                    <option value="ci_category3">키워드</option>
                    </select>
                    </div>
                    <!-- 검색창 -->
                    <div class="col-lg-5 d-flex align-items-center">
                        <input class="form-control border-0 shadow-0 " id="searchValue" name="searchValue" type="search" value="<%=searchValue%>" placeholder="검색어를 입력해주세요 ">
                    </div>
                    <!-- 검색버튼 -->
                    <div class="col-lg-1 d-grid mb-0">
                        <button class="btn btn-primary rounded-pill h-100 " style="font-weight: bolder;" type="submit">검색 </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 메인 끝 -->

    <!-- 신제품 -->
    <section class="py-6">
        <div class="container mb-6">
            <div class="row mb-5">
                <div class="col-md-12 fs-2" style="text-align: center; font-weight: bold; color: #F05945;">
                    <img src="<%= path%>/resources/img/img_semi/new01_02.png" alt="Image" width="50px">신제품
                </div>
            </div>
            <!-- Slider main container-->
            <div class="swiper-container swiper-container-mx-negative swiper-init pt-3" data-swiper="{&quot;slidesPerView&quot;:4,&quot;spaceBetween&quot;:20,&quot;loop&quot;:true,&quot;roundLengths&quot;:true,&quot;breakpoints&quot;:{&quot;1200&quot;:{&quot;slidesPerView&quot;:3},&quot;991&quot;:{&quot;slidesPerView&quot;:2},&quot;565&quot;:{&quot;slidesPerView&quot;:1}},&quot;pagination&quot;:{&quot;el&quot;:&quot;.swiper-pagination&quot;,&quot;clickable&quot;:true,&quot;dynamicBullets&quot;:true}}">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5">
                    <!-- Slides-->
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_8314854/83148546349.1.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=83148546349"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=83148546349">돔 텐트 그늘막 이너 캐노피 감성 거실형 케페우스 웜그레이 고래 스콜피오</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">POLARIS 3-4인용</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">249,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_8439757/84397574731.1.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=84397574731"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=84397574731">3way 테이블 캠핑용품 접이식 식탁 휴대용 폴딩 알루미늄 쓰리 3웨이 탁자</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">카고컨테이너</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">259,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_8434088/84340885867.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=84340885867"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=84340885867">그늘막 원터치 감성 텐트 베이지톤 캐노피 폴대 포함</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">하우롱디자인 3-4인용</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">89,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_3203520/32035208620.20220429090313.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=32035208620"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=32035208620">모던 감성 캠핑 LED 랜턴</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">살반</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">26,990원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_8252406/82524063019.3.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=82524063019"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=82524063019">감성 캠핑 휴대용 폴딩 로우 피크닉 좌식 미니 우드 백패킹 릴렉스 경량 의자</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">네이처하이크</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">79,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_2701359/27013591582.4.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=27013591582"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=27013591582">구름침낭이불</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">네이처아머</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">89,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- If we need pagination-->
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <!-- 신제품 끝 -->

        <!-- 이 달의 추천상품 -->
        <div class="container mb-6">
            <div class="row mb-5">
                <div class="col-md-12 fs-2" style="text-align: center; font-weight: bold; color: #5EAAA8;">
                    <img src="<%= path%>/resources/img/img_semi/best01_05.png" alt="Image" width="50px">이 달의 추천제품
                </div>
            </div>
            <div class="row">
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-8">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(<%= path%>/resources/img/img_semi/campitem_16.png) no-repeat; background-size: cover;">
                        <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=33285688969"> </a>
                        <h3 class="text-shadow text-white pt-5" style="margin-left: 50px;">800도씨 3WAY</h3>
                        <h2 class="text-shadow text-white" style="margin-left: 50px;">거북선 화로대</h2>
                        <h2 class="text-shadow text-mutedCustom" style="margin-left: 80px;"> 105,000원</h2>
                        <div class="d-flex h-100 text-white justify-content-around py-6 py-lg-7 mb-10">
                        </div>
                    </div>
                </div>
                <div class="mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 h-48 border-0 hover-animate" style="background: center center url(<%= path%>/resources/img/img_semi/campitem_16_01.png) no-repeat; background-size: cover;">
                        <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=33285688969"> </a>
                    </div>
                    <div class="card shadow-lg border-0 w-100 h-48 border-0 hover-animate mt-3" style="background: center center url(<%= path%>/resources/img/img_semi/campitem_16_02.png) no-repeat; background-size: cover;">
                        <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=33285688969"> </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 이 달의 추천상품 끝 -->

        <!-- 특별 할인 -->
        <div class="container mt-0">
            <div class="row mb-5">
                <div class="col-md-12 fs-2" style="text-align: center; font-weight: bold; color: #5EAAA8;">
                    <img src="<%= path%>/resources/img/img_semi/good01_05.png" alt="Image" width="50px">특별할인
                </div>
            </div>
        </div>
        <div class="container">
            <div class="swiper-container guides-slider mx-n2 pt-3" style="height: 350px;">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5">
                    <!-- Slides-->
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/campchair.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=84103772758"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">스노우피크<br>접이식 캠핑의자</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/sleepingbag.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=82992029759"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">네이처하이크<br>사계절 침낭</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/Lantern1.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="https://search.shopping.naver.com/product/82413973605"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">베어본즈<br>레일로드 랜턴</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/tent3.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="https://search.shopping.naver.com/product/83017792351"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">캠플 인디언<br>그늘막 원터치 텐트</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/table2.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="https://search.shopping.naver.com/product/29451284618"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">우드 롤<br>접이식 테이블</h5>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination d-md-none"> </div>
            </div>
        </div>
    </section>
    <!-- 특별 할인 끝 -->

    <!-- ============================================================================================================================== -->

    <!-- 푸터위에 사진바-->
    <section>
        <div class="container-fluid px-0">
            <div class="swiper-container instagram-slider">
                <div class="swiper-wrapper">
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-1.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-2.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-3.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-4.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-5.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-6.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-7.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-8.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-9.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="<%= path%>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="/views/07_common/footer.jsp" %>
</body>
</html>