<%@page import="java.util.ArrayList"%>
<%@page import="com.camping.mvc.camping.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();

List<Review> reviewList = new ArrayList<>();
reviewList = (List<Review>)request.getAttribute("reviewList");

%>

<!-- 헤더 큰 이미지 -->
<section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(<%= mypath%>/resources/img/img_semi/camp06.jpg); height: 520px; margin: 60px;">
    <!-- 헤더 이미지 글씨 -->
    <div class="container py-6 py-lg-7 text-white overlay-content text-center ">
        <div class="row">
            <div class="col-xl-10 mx-auto">
                <h1 class="display-3 fw-bold text-shadow" style="font-weight: bolder ;">오늘은 어디로 가볼까?</h1>
                <p class="text-lg text-shadow">다양한 캠핑장을 검색해보세요!</p>
            </div>
        </div>
    </div>
</section>
<!-- 메인 검색창 -->
<div class="container">
    <div class="search-bar rounded-4 p-0 p-lg-3 position-relative mt-n7 z-index-20 ">
        <form action="<%=path %>/camping/list" method="get">
            <div class="row ">
                <!-- 체크인 -->
                <div class="col-lg-2 d-flex align-items-center form-group">
                    <div class="input-label-absolute input-label-absolute-right w-100">
                        <div style="color: #F05945; text-align:center; font-weight:bolder ;">체크인</div>
                        <input class="form-control border-0 shadow-0 ps-5" style="color:#636262 ;" type="date" name="checkIn" placeholder="checkIn" id="checkIn">
                    </div>
                </div>
                <!-- 체크아웃 -->
                <div class="col-lg-2 d-flex align-items-center form-group">
                    <div class="input-label-absolute input-label-absolute-right w-100">
                        <div style="color: #F05945; text-align:center; font-weight:bolder ;">체크아웃</div>
                        <input class="form-control border-0 shadow-0 ps-5" style="color:#636262 ;" type="date" name="checkout" placeholder="checkout" id="checkout">
                    </div>
                </div>
                <!-- 지역선택 -->
                <div class="col-lg-2 d-flex align-items-center form-group no-divider " style="font-weight:bolder ;">
                    <svg xmlns="http://www.w3.org/2000/svg " width="40 " height="40 " fill="currentColor " class="bi bi-geo-alt-fill " viewBox="0 0 16 16 " color="#F05945 ">
                        <mypath d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z "/>
                      </svg>
                    <select class="selectpicker ps-4" name="searchAddr1" title="지역선택 " data-style="btn-form-control ">
                        <option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="인천">인천</option>
						<option value="강원도">강원도</option>
						<option value="대전">대전</option>
						<option value="충청북도">충정북도</option>
						<option value="충청남도">충청남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="광주">광주</option>
						<option value="경상북도">경상북도</option>
						<option value="대구">대구</option>
						<option value="경상남도">경상남도</option>
						<option value="울산">울산</option>
						<option value="부산">부산</option>
						<option value="제주">제주</option>
                    </select>
                </div>
                <!-- 테마선택 -->
                <div class="col-lg-2 d-flex align-items-center form-group no-divider ">
                    <svg xmlns="http://www.w3.org/2000/svg " width="40 " height="40 " fill="currentColor " class="bi bi-hash " viewBox="0 0 16 16 " color="#F05945 ">
                        <mypath d="M8.39 12.648a1.32 1.32 0 0 0-.015.18c0 .305.21.508.5.508.266 0 .492-.172.555-.477l.554-2.703h1.204c.421 0 .617-.234.617-.547 0-.312-.188-.53-.617-.53h-.985l.516-2.524h1.265c.43 0 .618-.227.618-.547 0-.313-.188-.524-.618-.524h-1.046l.476-2.304a1.06
                    1.06 0 0 0 .016-.164.51.51 0 0 0-.516-.516.54.54 0 0 0-.539.43l-.523 2.554H7.617l.477-2.304c.008-.04.015-.118.015-.164a.512.512 0 0 0-.523-.516.539.539 0 0 0-.531.43L6.53 5.484H5.414c-.43 0-.617.22-.617.532 0 .312.187.539.617.539h.906l-.515
                    2.523H4.609c-.421 0-.609.219-.609.531 0 .313.188.547.61.547h.976l-.516 2.492c-.008.04-.015.125-.015.18 0 .305.21.508.5.508.265 0 .492-.172.554-.477l.555-2.703h2.242l-.515 2.492zm-1-6.109h2.266l-.515 2.563H6.859l.532-2.563z "/>
                      </svg>
                    <select class="selectpicker  ps-4" name="maincategory" title="숙소유형 " data-style="btn-form-control ">
                <option value="일반야영장">일반야영장</option>
                <option value="카라반">카라반</option>
                <option value="글램핑">글램핑</option>
                <option value="자동차야영장">자동차야영장</option>
                </select>
                </div>
                <!-- 검색창 -->
                <div class="col-lg-3 d-flex align-items-center form-group ">
                    <input class="form-control border-0 shadow-0 ps-5" type="search " name="searchValue" id="searchValue" value="" placeholder="검색어를 입력해주세요 ">
                </div>
                <!-- 검색버튼 -->
                <div class="col-lg-1  d-grid mb-0 ">
                    <button class="btn btn-primary rounded-pill h-100 " style="font-weight: bolder ; " type="submit ">검색 </button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 헤더 끝 -->

<!-- 인기캠핑장 시작-->
<section class="py-5">
</section>
<section class="py-0">
	<div class="container mb-5">
            <div class="row mb-0">
	            <div class="col-md-8 fs-2 mb-3 " style="font-weight: bolder ; ">
	                <img src="<%= mypath%>/resources/img/img_semi/like.png" alt="Image " width="50px "> 인기캠핑장
	            </div>
	            <div class="col-md-4 d-md-flex align-items-center justify-content-end ">
	                <a class="text-mutedCustom text-base " style="font-weight: bolder ; " href="<%=path%>/camping/list">
	                        캠핑장 더보기
	                        <i class="fas fa-angle-double-right ms-2 "></i>
	                </a>
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
<!--     <div class="container ">
        <div class="row mb-5">
            <div class="col-md-8 fs-2 mb-3 " style="font-weight: bolder ; ">
                <svg xmlns="http://www.w3.org/2000/svg" width="30 " height="30 " fill="currentColor " class="bi bi-heart-fill " viewBox="0 0 16 16 ">
                    <mypath fill-rule="evenodd " d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z "/>
                </svg> 인기캠핑장
            </div>
            <div class="col-md-4 d-md-flex align-items-center justify-content-end ">
                <a class="text-mutedCustom text-base " style="font-weight: bolder ; " href="<%=path%>/camping/list">
                        캠핑장 더보기
                        <i class="fas fa-angle-double-right ms-2 "></i>
                </a>
            </div>
        </div>
        <div class="row ">
            <div class="d-flex align-items-lg-stretch mb-1 col-lg-8 " style="height: 450px; ">
                <div class="card shadow-lg border-0 w-100 border-0 hover-animate " style="background: center center url(<%=mypath%>/resources/img/img_semi/camp03.jpg) no-repeat; background-size: cover; ">
                    <a class="tile-link " href="<%=path %>/camping/Detail?campingNo=2599"> </a>
                    <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 ">
                        <h3>하늘연캠핑장</h3>
                    </div>
                </div>
            </div>
            <div class="d-flex align-items-lg-stretch mb-1 col-lg-4 " style="height: 450px; ">
                <div class="card shadow-lg border-0 w-100 border-0 hover-animate " style="background: center center url(<%=mypath%>/resources/img/photo/photo-1429554429301-1c7d5ae2d42e.jpg) no-repeat; background-size: cover; ">
                    <a class="tile-link " href="<%=path %>/camping/Detail?campingNo=2759"> </a>
                    <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 ">
                        <h3>베어스 글램핑파크</h3>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
</section>
<!-- 인기캠핑장 끝-->

<!-- 캠핑용품 시작 -->
<section class="py-0">
        <div class="container mb-2">
            <div class="row mb-0">
                <div class="col-md-8 fs-2 mb-3 " style="font-weight: bolder ; ">
                <img src="<%= mypath%>/resources/img/img_semi/campitem01.png" alt="Image " width="55px "> 캠핑용품
            </div>
            <div class="col-md-4 d-md-flex align-items-left justify-content-end ">
                <a class="text-mutedCustom text-base " style="font-weight: bolder ; " href="<%=path%>/views/03_Item/campingItem.jsp">
       캠핑용품 더보기<i class="fas fa-angle-double-right ms-2 "></i></a>
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
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_8321518/83215184526.3.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=83215184526"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=83215184526">프리미엄 멀티 화로대 테이블 캠핑 경량 아이언 메쉬 불멍 BBQ</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">울루루</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">109,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-cover" src="https://shopping-phinf.pstatic.net/main_8373156/83731561285.3.jpg" alt="" height="296px"/>
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=83731561285"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=83731561285">빌리지 5.0 감성텐트 캐빈 쉘터</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">네이처하이크 </p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">425,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_3169556/31695564161.20220409214238.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=31695564161"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=31695564161">클래식 감성 캠핑 랜턴 레트로 호롱불 led램프</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">살반</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">39,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_2888797/28887976587.20220418151614.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=28887976587"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=28887976587">감성 우드 로우체어 중형 C107</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">다니고</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">38,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://shopping-phinf.pstatic.net/main_2369609/23696091490.20200922163559.jpg" alt="" />
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=23696091490"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=23696091490">제드 블랙 오토 듀얼 팔레스 카 텐트 ZHATE0306</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">제드코리아</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">340,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-cover" src="https://shopping-phinf.pstatic.net/main_8253591/82535913106.2.jpg" alt="" height="296px"/>
                                    <a class="tile-link" href="https://search.shopping.naver.com/gate.nhn?id=82535913106"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="https://search.shopping.naver.com/gate.nhn?id=82535913106">우드롤테이블 브라운 내추럴 감성캠핑 높이조절</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">위모캠 </p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">108,000원</p>
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
</section>
<!-- 캠핑용품 끝 -->

<section class="py-5 bg-gray-100">
    <div class="container ">
        <div class="row ">
            <div class="col-lg-6 me-lg-auto ">
                <div class="col-md-6 fs-2 mb-3 " style="font-weight: bolder ; ">
                    <img src="<%= mypath%>/resources/img/img_semi/speaker.png" alt="Image " width="50px "> 공지사항
                </div>
                <div class="accordion" id="accordionPanelsStayOpenExample">
                    <div class="accordion-item ">
                         <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                           <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                             문의사항 이용시 주의사항
                        </button>
                        </h2>
                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">여러분 이번 겨울철 캠핑을 즐길 때, 안전캠핑 5대 수칙과 함께 하셨나요? <br>지난달부터 약 한달 간 진행되었던 “초캠러(초보캠퍼)를 위한 동계 안전캠핑 5대수칙 알리기 이벤트” 당첨자를 발표합니다!<br> 당첨자는 페이스북과 인스타그램 전체 참여자 중 무작위 추첨으로 선정했으며, 당첨되신 분들께 21일(월)에 개별 DM을 보내드릴 예정입니다!<br> DM을 받으신 당첨자분들께서는 2월 23일(수)까지 보내드린
                                폼으로 개인정보 회신 부탁드립니다~ <br>개인 정보 확인 후, 순차적으로 경품을 보내드릴 예정 입니다.<br> 참여 해주신 모든 분께 감사 인사를 드리며 계속해서 #고캠핑 #안전캠핑에 많은 관심과 참여 부탁드립니다<br> 여러분의 안전 캠핑, 고캠핑이 응원합니다.<br> ** 개인 정보는 상품 발송 목적으로 만 활용되며 발송 후 폐기합니다.<br> ** 기한 내 네이버폼으로 개인정보를 회신주시지 않을 경우, 당첨이
                                취소 될 수 있습니다.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item ">
                       <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                           <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                             [이벤트] 홍천 랄라캠핑장 숙박권 이벤트 당첨자 안내
                        </button>
                        </h2>
                       <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                <div class="accordion-body">
                            축하드립니다!!<br>아이디<br>test님, juni님, eunbin님, jisu님<br>taeim님, yeeun님, saingil님, 거제님<br> 본인의 이메일을 통해 숙박권을 수령하세요!!</div>
                        </div>
                    </div>
                    <div class="accordion-item ">
                         <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                            초보캠핑을 위한 5대 안전수칙!
                         </button>
                        </h2>
                         <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                <div class="accordion-body">
                            1.난로 등 화기∙난방기기 사용 시 일산화탄소 경보기를 꼭! 사용하고 텐트를 자주 환기해주세요<br>
							2. 휴대용 가스레인지 사용 시 화구보다 큰 조리기구를 쓰지 않고 화기 근처에 두지 않아야 해요!<br>
							3. 전기용량 체크! 총 600W 미만으로 전기를 사용해야해요<br>
							4. 텐트에서 잠을 잘 때는 가스랜턴 등은 반드시 소등해서 가스중독을 예방해야해요!<br>
							5. 난로 등 난방기기는 꼭 끄고 텐트 밖에 두고 자야해요!</div>
                        </div>
                    </div>
                    <div class="accordion-item ">
                       <h2 class="accordion-header" id="panelsStayOpen-headingfour">
                                <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapsefour" aria-expanded="false" aria-controls="panelsStayOpen-collapsefour">
                            [모닥불] 회원가입/로그인 이용안내
                         </button>
                        </h2>
                        <div id="panelsStayOpen-collapsefour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingfour">
                                <div class="accordion-body">
                            제1조 (회원 정보의 관리)<br>
							①    회원은 웹사이트 또는 앱 내에 구비된 정보수정 기능 내지 고객센터 등을 통해 개인정보를 열람∙변경∙수정 할 수 있습니다. 다만, 일부 개인정보의 경우 본인인증 절차가 필요할 수 있습니다.<br>
​
							②     회원은 등록한 E-mail 주소 또는 연락처가 변경된 경우 회원정보의 최신성 유지를 위해 제1항에 따라 변경해야 하며 이를 변경하지 않아 발생 할 수 있는 모든 불이익은 회원이 부담합니다.<br>
​
							제2조 (계정정보의 관리책임)<br>
​
							①    아이디, 비밀번호 등 계정정보의 관리책임은 회원에게 있으며, 회원은 계정정보를 타인에게 양도 내지 대여할 수 없습니다.<br>
​
							②    회사는 회사의 귀책사유로 인한 경우를 제외하고 계정정보의 유출, 양도, 대여, 공유 등으로 인한 손실이나 손해에 대하여 아무런 책임을 지지 않습니다.<br>
​
							③    회원은 제3자가 본인의 계정을 사용하고 있음(대여 포함)을 인지한 경우에는 즉시 비밀번호를 수정하는 등의 조치를 취하고 이를 회사에 통보하여야 합니다. 회원이 본 항에 따른 통지를 하지 아니하여 발생하는 모든 불이익에 대한 책임은 회원에게 있습니다.</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 캠핑후기 시작 -->
            <div class="col-lg-6 ps-lg-5 ">
                <div class="col-md-8 fs-2 mb-1 " style="font-weight: bolder ; ">
                    <svg xmlns="http://www.w3.org/2000/svg " width="30 " height="30 " fill="currentColor " class="bi bi-pencil-square " viewBox="0 0 16 16 ">
                    <mypath d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z "/>
                    <mypath fill-rule="evenodd " d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z "/>
                  </svg>캠핑후기
                  	<img src=<%=mypath %>/resources/img/img_semi/hugi.png" alt="Image" width="50px"> 캠핑후기
                </div>
                
              

				 <%if(reviewList == null){ %>
                <%-- 캠핑장 후기가 없으면 --%>
                
                <div>
				<div style="text-align: center">캠핑장 후기가 없습니다.</div>
				</div>
                
                <%}else {%>
				<%-- 리뷰 목록 --%>
				 <%for(Review review : reviewList) { %>
                
                
                <div class="text-block1">
                    <a class="list-group-item list-group-item-action p-2" href="">
                        <div class="row">
                            <div class="col-lg-4 align-self-center mb-4 mb-lg-0">
                                <div class="d-flex align-items-center ">
                                    <img class="img-fluid" src="<%=mypath%>/resources/upload/review/<%=review.getRev_image_rename()%>" alt="">
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class=" col-lg-12 py-3 ">
                                        <h6 class="label-heading"><%=review.getRev_title()%></h6>
                                        <div class="text-sm"><%=review.getRev_content()%></div>
                                        <div class="fs-7 pt-4">759,200원</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
                
                <%} %>
                <%} %>
                <!-- 캠핑후기 끝-->
                
                
            </div>
        </div>
    </div>
</section>

<!-- ============================================================================================================================== -->

<!-- 푸터위에 사진바-->
<section>
    <div class="container-fluid px-0">
        <div class="swiper-container instagram-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-1.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-2.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-3.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-4.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-5.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-6.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-7.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-8.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-9.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%= mypath%>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/views/07_common/footer.jsp" %>