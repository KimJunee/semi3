<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
%>

<!-- 헤더 큰 이미지 -->
<section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%=mypath%>/resources/img/img_semi/camp_02_01.png); height: 650px; margin: 60px;">

</section>

<!-- 메인 검색창 -->
<div class="container ">
    <div class="search-bar rounded-4 p-0 p-lg-3 position-relative mt-n7 z-index-20 ">
        <form action="# ">
            <div class="row ">

                <!-- 체크인 -->
                <div class="col-lg-2 d-flex align-items-center form-group">
                    <div class="input-label-absolute input-label-absolute-right w-100">
                        <div style="color: #F05945; text-align:center;">체크인</div>
                        <input class="form-control border-0 shadow-0" type="date" name="checkIn" placeholder="checkIn" id="checkIn">
                    </div>
                </div>

                <!-- 체크아웃 -->
                <div class="col-lg-2 d-flex align-items-center form-group">
                    <div class="input-label-absolute input-label-absolute-right w-100">
                        <div style="color: #F05945; text-align:center;">체크아웃</div>
                        <input class="form-control border-0 shadow-0" type="date" name="checkout" placeholder="checkout" id="checkout">
                    </div>
                </div>

                <!-- 지역선택 -->
                <div class="col-lg-2 d-flex align-items-center form-group no-divider ">
                    <svg xmlns="http://www.w3.org/2000/svg " width="40 " height="40 " fill="currentColor " class="bi bi-geo-alt-fill " viewBox="0 0 16 16 " color="#F05945 ">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z "/>
                      </svg>
                    <select class="selectpicker " title="지역선택 " data-style="btn-form-control ">
                         <option value="small ">서울시</option>
                         <option value="small ">부산시</option> 
                         <option value="small ">대구시</option>
                         <option value="small ">인천시</option>
                         <option value="small ">광주시</option>
                         <option value="small ">대전시</option>
                         <option value="small ">울산시</option>
                         <option value="small ">세종시</option>
                         <option value="small ">경기도</option>
                         <option value="small ">강원도</option>
                         <option value="small ">충청북도</option>
                         <option value="small ">충청남도</option>
                         <option value="small ">전라북도</option>
                         <option value="small ">전라남도</option>
                         <option value="small ">경상북도</option>
                         <option value="small ">경상남도</option>
                         <option value="small ">제주도</option>
                    </select>

                </div>

                <!-- 테마선택 -->
                <div class="col-lg-2 d-flex align-items-center form-group no-divider ">
                    <svg xmlns="http://www.w3.org/2000/svg " width="40 " height="40 " fill="currentColor " class="bi bi-hash " viewBox="0 0 16 16 " color="#F05945 ">
                        <path d="M8.39 12.648a1.32 1.32 0 0 0-.015.18c0 .305.21.508.5.508.266 0 .492-.172.555-.477l.554-2.703h1.204c.421 0 .617-.234.617-.547 0-.312-.188-.53-.617-.53h-.985l.516-2.524h1.265c.43 0 .618-.227.618-.547 0-.313-.188-.524-.618-.524h-1.046l.476-2.304a1.06
                    1.06 0 0 0 .016-.164.51.51 0 0 0-.516-.516.54.54 0 0 0-.539.43l-.523 2.554H7.617l.477-2.304c.008-.04.015-.118.015-.164a.512.512 0 0 0-.523-.516.539.539 0 0 0-.531.43L6.53 5.484H5.414c-.43 0-.617.22-.617.532 0 .312.187.539.617.539h.906l-.515
                    2.523H4.609c-.421 0-.609.219-.609.531 0 .313.188.547.61.547h.976l-.516 2.492c-.008.04-.015.125-.015.18 0 .305.21.508.5.508.265 0 .492-.172.554-.477l.555-2.703h2.242l-.515 2.492zm-1-6.109h2.266l-.515 2.563H6.859l.532-2.563z "/>
                      </svg>
                    <select class="selectpicker " title="테마선택 " data-style="btn-form-control ">
                <option value="small ">전체</option>
                <option value="small ">해변</option>
                <option value="small ">섬</option>
                <option value="small ">산</option>
                <option value="small ">숲</option>
                <option value="small ">계곡</option>
                <option value="small ">강</option>   
                </select>
                </div>

                <!-- 검색창 -->
                <div class="col-lg-3 d-flex align-items-center form-group ">
                    <input class="form-control border-0 shadow-0 " type="search " name="search " placeholder="검색어를 입력해주세요 ">
                </div>

                <!-- 검색버튼 -->
                <div class="col-lg-1 form-group d-grid mb-0 ">
                    <button class="btn btn-primary rounded-pill h-100 " style="font-weight: bolder ; " type="submit ">검색 </button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 헤더 끝 -->
<!-- ============================================================================================================================== -->

<body>

        <!-- Shadow box-->
    <section class="container mb-3 pt-5 pb-0">
        <div class="fs-1 d-flex mt-5 " style="text-align: left; color: #F05945;">
            <img src="<%=mypath%>/resources/img/img_semi/tenticon01_02.png" alt="Image" width="50px">캠핑장 소개

            <!-- 날씨 이미지 -->
            <img style="width:200px; height:55px; margin-left: 840px;" src="<%=mypath%>/resources/img/img_semi/weather.JPG">
        </div>
        <div class="bg-white shadow-sm rounded-1 overflow-hidden">
            <div class="row">
                <!-- Content-->
                <section class="col-md-6">
                    <a class="gallery-item rounded-1 mb-grid-gutter" href="<%=mypath%>/resources/img/camping/img1.png" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;이미지 미리보기&lt;/h6&gt;"><img style="width: 130%;" src="<%=path%>/resources/img/img_semi/hongs03.JPG" alt="Gallery preview"><span class="gallery-item-caption">이미지 확대하여 보기</span></a>
                </section>

                <!-- Sidebar 캠핑장 상세 내용 및 홈페이지-->
                <aside class="col-6 ps-1">
                    <div class="bg-white h-100 p-3 ms-1 border-start">
                        <div class="px-lg-1">
                            <div class="accordion accordion-flush" id="licenses">
                                <div class="accordion-item border-bottom">
                                    <div class="accordion-header d-flex justify-content-center align-bottom py-3">
                                        <div class="form-check" data-bs-toggle="collapse" data-bs-target="#standard-license">
                                            <label class="form-check-inline fw-bold text-dark" style="font-size:x-large" for="license-std">hongs 글램핑</label>
                                        </div>
                                    </div>
                                    <div class="accordion-collapse collapse show" id="standard-license" data-bs-parent="#licenses">
                                        <div class="accordion-body py-0 pb-2">

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <ul class="list-unstyled fs-sm">
                                <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">주소</span><span class="text-muted">제주특별자치도 제주시 애월읍 어음13길 25-45</span></li>
                                <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">캠핑장 유형</span><span class="text-muted">일반야영장, 글램핑</span></li>
                                <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">운영기간/운영일</span><span class="text-muted">연중무휴</span></li>
                                <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">시설정보</span><span class="text-muted">전기, 와이파이, 장작판매, 온수</span></li>
                                <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">주변이용가능시설</span><span class="text-muted">등산로, 농어촌체험시설, 마트 및 편의점</span></li>
                                <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">홈페이지</span><a class="text-muted" href="#">바로가기 링크를 눌러주세요.</a></li>
                            </ul>
                            <div class="text-center">
                                <button class="btn btn-primary w-75 mt-4" style="font-size:20px; height:60px;" type="button"><i class="ci-cart fs-lg me-2"></i>예약하기</button>

                            </div>

                            <br>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </section>
    <!--  -->


    <!-- Body-->

    <section class="container pt-4">
        <div class="form-control">
            * 모닥불에서 제공하는 정보는 다소 다를 수 있으니 원활한 캠핑을 위해 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
        </div>

    </section>
    <main class="page-wrapper">



        <!-- 캠핑장 상세보기 + 후기 + 문의게시판-->
        <section class="container mb-4 mb-lg-5">


            <ul class="nav nav-tabs nav-justified mt-4 mt-lg-5 mb-0" role="tablist">
                <li class="nav-item" style="font-size:20px"><a class="nav-link p-401 active" href="#details" data-bs-toggle="tab" role="tab">상세보기</a></li>
                <li class="nav-item" style="font-size:20px"><a class="nav-link p-401" href="#reviews" data-bs-toggle="tab" role="tab">후기</a></li>
                <!-- 문의게시판 은빈님 링크 연결 -->
                <li class="nav-item" style="font-size:20px"><a class="nav-link p-401" href="#comments" data-bs-toggle="tab" role="tab">문의게시판</a></li>
            </ul>
            <div class="tab-content pt-2">
                <!-- 캠핑장 상세보기-->
                <div class="tab-pane fade active show" id="details" role="tabpanel">
                    <div class="row py-4">
                        <div class="col-12">
                            <p class="fs-1" style="height: 20px">
                                <h2 class="h3 mb-3 pt-2">캠핑장 특징</h2>
                                <!-- Nav tabs-->
                                <ul>
                                    <li>수목원/휴양림/해수욕장 주변</li>
                                    <li>가족/고급/럭셔리/단체/MT/워크샵/커플/풀빌라 여행으로 제격!</li>
                                    <li>매점/편의점/바베큐장/수영장/족구장/공용스파 등 다양한 시설 구비 완료</li>
                                </ul>
                                <br>
                            </p>

                            <div class="border-bottom pb-5 mb-5">
                                <h2 class="h3 mb-3 pt-2">캠핑장 위치 정보</h2>

                                <!-- 지도가 보여질 영역 -->
                                <div id="map" style="width:100%;height:500px;"></div>

                                <!-- 자바스크립트 키-->
                                <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=239fc78d5f0e8c75d0c25dc713fdd676"></script>
                                <script>
                                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                        mapOption = {
                                            center: new kakao.maps.LatLng(33.402821, 126.347927), // hongs 글램핑 좌표
                                            level: 3 // 지도의 확대 레벨
                                        };

                                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                                    var map = new kakao.maps.Map(mapContainer, mapOption);

                                    // var markerPosition = new kakao.maps.LatLng(33.402821, 126.347927);

                                    // var marker = new kakao.maps.Marker({
                                    //     position: markerPosition
                                    // });

                                    var mapTypeControl = new kakao.maps.MapTypeControl();

                                    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
                                    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
                                    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

                                    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                                    var zoomControl = new kakao.maps.ZoomControl();
                                    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                                </script>
                            </div>
                        </div>
                    </div>

                </div>




                <!-- 후기-->
                <div class="tab-pane fade" id="reviews" role="tabpanel">
                    <div class="row py-4">
                        <!-- 후기 분류-->
                        <div class="col-md-12">
                            <div class="d-flex justify-content-end pb-4">
                                <label class="fs-sm text-muted text-nowrap me-2 d-none d-sm-block" for="sort-reviews">분류</label>
                                <select class="form-select form-select-sm w-25" id="sort-reviews">
                                        <option>---리뷰 전체보기---</option> 
                                        <option>최신순</option>
                                        <option>오래된순</option>
                                        <option>높은 별점순</option>
                                        <option>낮은 별점순</option>
                                    </select>
                            </div>
                        </div>
                        <!-- Review 1 -->
                        <div class="product-review pb-4 mb-4 border-bottom">
                            <div class="d-flex mb-2">
                                <div class="col-lg-4">
                                    <img style="height: 250px; width: 350px" src="<%=mypath%>/resources/img/img_semi/hongs01.JPG">
                                </div>
                                <div class="d-flex align-items-center me-4 pe-2">
                                    <div class="ps-3">
                                        <div class="d-flex mb-2">
                                            <div class="fs-sm mb-3" style="margin-right: 50px">
                                                <h6 class="fs-sm mb-0">서현동뒹굴이</h6>
                                                <span class="fs-ms text-muted">2022. 07. 13</span>
                                            </div>
                                            <!-- 별점 표시 -->
                                            <p class="flex-shrink-1 mb-0 card-stars text-bg-dark text-right">
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                            </p>
                                        </div>
                                        <div class="fs-md mb-2 pt-3 pb-3" style="font-size: 20px;">여기 캠핑장 인생캠핑장!!!</div>
                                        <div class="list-unstyled fs-ms pt-1">
                                            오늘 첫 방문했는데 너무 행복합니다. 젤 좋은게 화장실 깨끗하고 개수대도 깔끔하구요. 대만족 입니다^^
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Review 2 -->
                        <div class="product-review pb-4 mb-4 border-bottom">
                            <div class="d-flex mb-2">
                                <div class="col-lg-4">
                                    <img style="height: 250px; width: 350px" src="<%=mypath%>/resources/img/img_semi/hongs02.JPG">
                                </div>
                                <div class="d-flex align-items-center me-4 pe-2">
                                    <div class="d-flex align-items-center me-4 pe-2">
                                        <div class="ps-3">
                                            <div class="d-flex me-2">
                                                <div class="fs-sm mb-3" style="margin-right: 50px">
                                                    <h6 class="fs-sm mb-0">캠핑러버러버</h6>
                                                    <span class="fs-ms text-muted">2022. 07. 13</span>
                                                </div>
                                                <!-- 별점 표시 -->
                                                <p class="flex-shrink-1 mb-0 card-stars text-bg-dark text-right">
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-gray-300"></i>
                                                </p>
                                            </div>
                                            <div class="fs-md mb-2 pt-3 pb-3" style="font-size: 20px;">주변시설 마음에 들어요</div>
                                            <div class="list-unstyled fs-ms pt-1">
                                                1.캠핑장 환경이 너무나 좋음. 2.인근 큰마트들이 있어서 장보기 좋음. 3.캠핑장에서 실내등유도 팔아서 좋음. 4.시설 너무나 깨끗함.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Review 3 -->
                        <div class="product-review pb-4 mb-4 border-bottom">
                            <div class="d-flex mb-2">
                                <div class="col-lg-4">
                                    <img style="height: 250px; width: 350px" src="<%=mypath%>/resources/img/img_semi/hongs03.JPG">
                                </div>
                                <div class="d-flex align-items-center me-4 pe-2">
                                    <div class="ps-3">
                                        <div class="d-flex mb-2">
                                            <div class="fs-sm mb-3" style="margin-right: 50px">
                                                <h6 class="fs-sm mb-0">별스타캠핑</h6>
                                                <span class="fs-ms text-muted">2022. 05. 05</span>
                                            </div>
                                            <!-- 별점 표시 -->
                                            <p class="pl-3 flex-shrink-1 mb-0 card-stars text-bg-dark text-right">
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                                <i class="fa fa-star text-warning"></i>
                                            </p>
                                        </div>
                                        <div class="fs-md mb-2 pt-3 pb-3" style="font-size: 20px;">아이들과 함께 놀기 좋은 캠핑장</div>
                                        <div class="list-unstyled fs-ms pt-1">
                                            3살 6살 개구쟁이 아들 둘과 함께 정말 큰맘먹고 떠난 가족 캠핑이였어요. 시설도 깔끔하고 아이들이 너무 좋아해서 또 예약했어요. 집이랑도 가깝고 앞으로 자주 이용할께요^^
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- 페이지번호  -->
                        <div class="text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination pagination-template d-flex justify-content-center">
                                    <li class="page-item">
                                        <a class="page-link" href="#"> <i class="fa fa-angle-left"></i></a>
                                    </li>

                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>

                                    <li class="page-item">
                                        <a class="page-link" href="#"> <i class="fa fa-angle-right"></i></a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>

<!-- Vendor scrits: js libraries and plugins-->
<script src="<%=mypath%>/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=mypath%>/resources/vendor/simplebar/dist/simplebar.min.js"></script>
<script src="<%=mypath%>/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="<%=mypath%>/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="<%=mypath%>/resources/vendor/lightgallery.js/dist/js/lightgallery.min.js"></script>
<script src="<%=mypath%>/resources/vendor/lg-fullscreen.js/dist/lg-fullscreen.min.js"></script>
<script src="<%=mypath%>/resources/vendor/lg-zoom.js/dist/lg-zoom.min.js"></script>
<!-- Main theme script-->
<script src="<%=mypath%>/resources/js/theme.min.js"></script>


</body>

<!-- 푸터위에 사진바-->
<section>
    <div class="container-fluid px-0">
        <div class="swiper-container instagram-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-1.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-2.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-3.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-4.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-5.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-6.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-7.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-8.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-9.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=path%>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/views/07_common/footer.jsp" %>