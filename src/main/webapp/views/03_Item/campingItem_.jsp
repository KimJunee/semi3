<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
%>

    <!-- 메인 큰 이미지 -->
    <section class="container" style="background-image: url(<%=mypath%>/resources/img/img_semi/itemmain.png); height: 600px;"></section>
    <!-- 메인 검색창 -->
    <div class="container mb-5">
        <div class="search-bar rounded-4 p-0 p-lg-1 position-relative mt-n6 z-index-20 mx-7">
            <form action="#">
                <div class="row">
                    <!-- 카테고리 -->
                    <div class="col-lg-3 d-flex align-items-center form-group">
                        <div class="input-label-absolute input-label-absolute-right w-100">
                            <div style="color: #F05945; text-align:center; font-weight: bold;">캠핑용품</div>
                        </div>
                    </div>
                    <!-- 종류선택 -->
                    <div class="col-lg-3 d-flex align-items-center form-group no-divider-custom ">
                    <select class="selectpicker" title="전체" data-style="btn-form-control">
                    <option value="ci_title">상품명</option>
                    <option value="ci_brand">브랜드</option>
                    <option value="ci_catogory3">키워드</option>
                    </select>
                    </div>
                    <!-- 검색창 -->
                    <div class="col-lg-5 d-flex align-items-center">
                        <input class="form-control border-0 shadow-0 " type="search" name="search" placeholder="검색어를 입력해주세요 ">
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
                    <img src="<%=mypath%>/resources/img/img_semi/new01_02.png" alt="Image" width="50px">신제품
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
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath%>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">새턴2룸텐트</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">내구성과 방수, 넓은 실내공간을 한번에 만족 시켜주는 텐트</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">850,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%= path%>/resources/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">노르망디 오토 루프탑 텐트</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">손쉽게 즐기는 시스템 루프탑텐트 몇초만에 펼쳐지는 새로운 세상</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">1,459,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%= path%>/resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">폴딩서랍장</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">상판이 포함되어 더 유용한 폴딩박스! 다용도 수납도 제격!</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">59,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%= path%>/resources/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">접이식 테이블</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">높이조절이 가능하여 모든체어와 완벽하게 호환되는 높낮이 조절테이블</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-mutedCustom1">99,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <!-- place item-->
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%= path%>/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">뷰티풀이타카체어</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">아웃도어 뿐만 아니라 인도어에서도 어울리는 슬림한 디자인의 의자</p>
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
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%= path%>/resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Brooklyn Life, Easy to Manhattan</a></h6>
                                        <div class="d-flex card-subtitle mb-3">
                                            <p class="flex-grow-1 mb-0 text-muted text-sm">Private room</p>
                                            <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                            </p>
                                        </div>
                                        <p class="card-text text-muted"><span class="h4 text-primary">$123</span> per night</p>
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
                        <a class="tile-link" href="category.html"> </a>
                        <h3 class="text-shadow text-white pt-5" style="margin-left: 50px;">800도씨 3WAY</h3>
                        <h2 class="text-shadow text-white" style="margin-left: 50px;">거북선 화로대</h2>
                        <h2 class="text-shadow text-mutedCustom" style="margin-left: 80px;"> 105,000원</h2>
                        <div class="d-flex h-100 text-white justify-content-around py-6 py-lg-7 mb-10">
                        </div>
                    </div>
                </div>
                <div class="mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 h-48 border-0 hover-animate" style="background: center center url(<%= path%>/resources/img/img_semi/campitem_16_01.png) no-repeat; background-size: cover;">
                        <a class="tile-link" href="campingItemDetail.html"> </a>
                    </div>
                    <div class="card shadow-lg border-0 w-100 h-48 border-0 hover-animate mt-3" style="background: center center url(<%= path%>/resources/img/img_semi/campitem_16_02.png) no-repeat; background-size: cover;">
                        <a class="tile-link" href="campingItemDetail.html"> </a>
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
                            <a class="tile-link" href="category.html"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">브리즈문<br>경량 캠핑의자</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/sleepingbag.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="category.html"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">더블맥스<br>사계절 침낭</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/Lantern1.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="category.html"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">미니멀웍스<br>에디슨랜턴</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/tent3.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="category.html"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">스노우라인<br>패밀리 텐트</h5>
                        </div>
                    </div>
                    <div class="swiper-slide h-50 px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0" style="background: center center url(<%= path%>/resources/img/img_semi/table2.jpg) no-repeat; background-size: contain;">
                            <a class="tile-link" href="category.html"></a>
                            <h5 class="text-shadow text-black mb-auto" style="margin-left: 20px; margin-top: 20px;">우드상판<br>접이식 테이블</h5>
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