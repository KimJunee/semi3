<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
%>

<!-- 헤더 큰 이미지 -->
<section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(<%= mypath%>/resources/img/img_semi/camp06.jpg); height: 650px; margin: 60px;">
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
<div class="container ">
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
                    <select class="selectpicker ps-4 " title="지역선택 " data-style="btn-form-control ">
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
                    <select class="selectpicker  ps-4" title="숙소유형 " data-style="btn-form-control ">
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
<section class="py-7 ">
    <div class="container ">
        <div class="row mb-5 ">
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
                    <a class="tile-link " href="http://localhost:8081/semi3/camping/Detail?campingNo=2599"> </a>
                    <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 ">
                        <h3>하늘연캠핑장</h3>
                    </div>
                </div>
            </div>
            <div class="d-flex align-items-lg-stretch mb-1 col-lg-4 " style="height: 450px; ">
                <div class="card shadow-lg border-0 w-100 border-0 hover-animate " style="background: center center url(<%=mypath%>/resources/img/photo/photo-1429554429301-1c7d5ae2d42e.jpg) no-repeat; background-size: cover; ">
                    <a class="tile-link " href="http://localhost:8081/semi3/camping/Detail?campingNo=2759"> </a>
                    <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 ">
                        <h3>베어스 글램핑파크</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 인기캠핑장 끝-->

<!-- 캠핑용품 시작 -->
<section class="py-3 bg-gray-100 ">
    <div class="container ">
        <div class="row mb-5 ">
            <div class="col-md-8 fs-2 mb-3 " style="font-weight: bolder ; ">
                <img src="<%= mypath%>/resources/img/img_semi/campitem01.png" alt="Image " width="50px "> 캠핑용품
            </div>
            <div class="col-md-4 d-md-flex align-items-center justify-content-end ">
                <a class="text-mutedCustom text-base " style="font-weight: bolder ; " href="<%=path%>/views/03_Item/campingItem.jsp">
       캠핑용품 더보기<i class="fas fa-angle-double-right ms-2 "></i></a>
            </div>
        </div>
    </div>

    <!-- 캠핑용품이미지 시작 -->
    <div class="container-fluid ">
        <!-- Slider main container-->
        <div class="swiper-container swiper-container-mx-negative items-slider-full px-lg-5 pt-3 ">
            <!-- Additional required wrapper-->
            <div class="swiper-wrapper pb-5 ">
                <!-- Slides-->
                <div class="swiper-slide h-auto px-2 ">
                    <div class="w-100 h-100 hover-animate " data-marker-id="59c0c8e33b1527bfe2abaf92 ">
                        <div class="card h-100 border-0 shadow ">
                            <div class="card-img-top overflow-hidden gradient-overlay "> <img class="img-fluid " src="<%= mypath%>/resources/img/img_semi/campbasket.png" style="height:250px;">
                                <a class="tile-link " href="https://smartstore.naver.com/buytop/products/6546351540?NaPm=ct%3Dl683y134%7Cci%3D0aae679a2a53d913526ec7db37a949e64cd0f347%7Ctr%3Dslsl%7Csn%3D577370%7Chk%3D2c060eff8b7254d53a293ed6de14be56f988dd0f"></a>
 <%--                               <div class="card-img-overlay-top text-end ">
                                    <a class="card-fav-icon position-relative z-index-40 " href="javascript: void(); ">
                                        <svg class="svg-icon text-white ">
                        <use xlink:href="#heart-1 "> </use>
                      </svg></a>
                                </div>--%>
                            </div>
                            <div class="card-body d-flex align-items-center ">
                                <div class="w-100 ">
                                    <h6 class="card-title "><a class="text-decoration-none text-dark " href="https://smartstore.naver.com/buytop/products/6546351540?NaPm=ct%3Dl683y134%7Cci%3D0aae679a2a53d913526ec7db37a949e64cd0f347%7Ctr%3Dslsl%7Csn%3D577370%7Chk%3D2c060eff8b7254d53a293ed6de14be56f988dd0f">캠핑바스켓</a></h6>
                                    <p class="text-sm text-muted text-uppercase ">캠핑바구니 하나로도 감성캠핑을 즐길 수 있어요</p>
                                    <span><i class="fa fa-tag text-primary opacity-4 text-xs me-1 "></i>10,900원</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide h-auto px-2 ">
                    <div class="w-100 h-100 hover-animate " data-marker-id="59c0c8e33b1527bfe2abaf92 ">
                        <div class="card h-100 border-0 shadow ">
                            <div class="card-img-top overflow-hidden gradient-overlay "> <img class="img-fluid " src="<%= mypath%>/resources/img/img_semi/tent01.png " style="height:250px;">
                                <a class=" tile-link " href="https://search.shopping.naver.com/gate.nhn?id=32695611628"></a>
  <%--                              <div class="card-img-overlay-top text-end ">
                                    <a class="card-fav-icon position-relative z-index-40 " href="javascript: void(); ">
                                        <svg class="svg-icon text-white ">
                      <use xlink:href="#heart-1 "> </use>
                    </svg></a>
                                </div>--%>
                            </div>
                            <div class="card-body d-flex align-items-center ">
                                <div class="w-100 ">
                                    <h6 class="card-title "><a class="text-decoration-none text-dark " href="https://search.shopping.naver.com/gate.nhn?id=32695611628">새턴2룸텐트</a></h6>
                                    <p class="text-sm text-muted text-uppercase ">내구성과 방수, 넓은 실내공간을 한번에 만족시켜주는 텐트</p>
                                    <span><i class="fa fa-tag text-primary opacity-4 text-xs me-1 "></i>980,000원</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide h-auto px-2 ">
                    <div class="w-100 h-100 hover-animate " data-marker-id="59c0c8e33b1527bfe2abaf92 ">
                        <div class="card h-100 border-0 shadow ">
                            <div class="card-img-top overflow-hidden gradient-overlay "> <img class="img-fluid " src="https://shopping-phinf.pstatic.net/main_3152259/31522594618.20220329213345.jpg" style="height:250px;">
                                <a class="tile-link " href="https://search.shopping.naver.com/gate.nhn?id=31522594618"></a>
  <%--                              <div class="card-img-overlay-top text-end ">
                                    <a class="card-fav-icon position-relative z-index-40 " href="javascript: void(); ">
                                        <svg class="svg-icon text-white ">
                    <use xlink:href="#heart-1 "> </use>
                  </svg></a>
                                </div>--%>
                            </div>
                            <div class="card-body d-flex align-items-center ">
                                <div class="w-100 ">
                                    <h6 class="card-title "><a class="text-decoration-none text-dark " href="https://search.shopping.naver.com/gate.nhn?id=31522594618">루프탑텐트</a></h6>
                                    <p class="text-sm text-muted text-uppercase ">손쉽게 즐기는 시스템 루프탑 텐트, 몇초만에 새로운 세상을 즐길수있어요</p>
                                    <span><i class="fa fa-tag text-primary opacity-4 text-xs me-1 "></i>4,200,000원</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide h-auto px-2 ">
                    <div class="w-100 h-100 hover-animate " data-marker-id="59c0c8e33b1527bfe2abaf92 ">
                        <div class="card h-100 border-0 shadow ">
                            <div class="card-img-top overflow-hidden gradient-overlay "> <img class="img-fluid " src="https://shopping-phinf.pstatic.net/main_8372674/83726746936.5.jpg" style="height:250px;">
                                <a class="tile-link " href="https://search.shopping.naver.com/gate.nhn?id=83726746936"></a>
 <%--                                <div class="card-img-overlay-top text-end ">
                                    <a class="card-fav-icon position-relative z-index-40 " href="javascript: void(); ">
                                        <svg class="svg-icon text-white ">
                  <use xlink:href="#heart-1 "> </use>
                </svg></a>
                                </div>--%>
                            </div>
                            <div class="card-body d-flex align-items-center ">
                                <div class="w-100 ">
                                    <h6 class="card-title "><a class="text-decoration-none text-dark " href="https://search.shopping.naver.com/gate.nhn?id=83726746936">존디 캠핑 우드 테이블</a></h6>
                                    <p class="text-sm text-muted text-uppercase ">원목이지만 탄탄한 방수처리로 물가에서도 사용할수 있어요</p>
                                    <span><i class="fa fa-tag text-primary opacity-4 text-xs me-1 "></i>165,000원</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide h-auto px-2 ">
                    <div class="w-100 h-100 hover-animate " data-marker-id="59c0c8e33b1527bfe2abaf92 ">
                        <div class="card h-100 border-0 shadow ">
                            <div class="card-img-top overflow-hidden gradient-overlay "> <img class="img-fluid " src="https://shopping-phinf.pstatic.net/main_2888797/28887976587.20220418151614.jpg" style="height:250px;">
                                <a class="tile-link " href="https://search.shopping.naver.com/gate.nhn?id=28887976587"></a>
 <%--                                <div class="card-img-overlay-top text-end ">
                                    <a class="card-fav-icon position-relative z-index-40 " href="javascript: void(); ">
                                        <svg class="svg-icon text-white ">
                  <use xlink:href="#heart-1 "> </use>
                </svg></a>
                                </div>--%>
                            </div>
                            <div class="card-body d-flex align-items-center ">
                                <div class="w-100 ">
                                    <h6 class="card-title "><a class="text-decoration-none text-dark " href="https://search.shopping.naver.com/gate.nhn?id=28887976587">다니고 캠핑의자</a></h6>
                                    <p class="text-sm text-muted text-uppercase ">원목이지만 탄탄한 방수처리로 물가에서도 사용할수 있어요</p>
                                    <span><i class="fa fa-tag text-primary opacity-4 text-xs me-1 "></i>38,000원</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 캠핑용품이미지 끝 -->

            <!-- If we need pagination-->
            <div class="swiper-pagination "></div>
        </div>
    </div>
</section>
<!-- 캠핑용품 끝 -->

<section class="py-5 ">
    <div class="container ">
        <div class="row ">
            <div class="col-lg-6 me-lg-auto ">
                <div class="col-md-6 fs-2 mb-3 " style="font-weight: bolder ; ">
                    <svg xmlns="http://www.w3.org/2000/svg " width="30 " height="30 " fill="currentColor " class="bi bi-megaphone " viewBox="0 0 16 16 ">
                    <mypath d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02
                    0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9
                    6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z "/>
                  </svg> 공지사항
                </div>
                <div class="accordion accordion-flush " id="accordionFlushExample ">
                    <div class="accordion-item ">
                        <h2 class="accordion-header " id="flush-headingOne ">
                            <button class="accordion-button collapsed " type="button " style="font-weight: bolder ; " data-bs-toggle="collapse " data-bs-target="#flush-collapseOne " aria-expanded="false " aria-controls="flush-collapseOne ">
                             문의사항 이용시 주의사항
                        </button>
                        </h2>
                        <div id="flush-collapseOne " class="accordion-collapse collapse " aria-labelledby="flush-headingOne " data-bs-parent="#accordionFlushExample ">
                            <div class="accordion-body ">여러분 이번 겨울철 캠핑을 즐길 때, 안전캠핑 5대 수칙과 함께 하셨나요? 지난달부터 약 한달 간 진행되었던 “초캠러(초보캠퍼)를 위한 동계 안전캠핑 5대수칙 알리기 이벤트” 당첨자를 발표합니다! 당첨자는 페이스북과 인스타그램 전체 참여자 중 무작위 추첨으로 선정했으며, 당첨되신 분들께 21일(월)에 개별 DM을 보내드릴 예정입니다! DM을 받으신 당첨자분들께서는 2월 23일(수)까지 보내드린
                                폼으로 개인정보 회신 부탁드립니다~ 개인 정보 확인 후, 순차적으로 경품을 보내드릴 예정 입니다 . 참여 해주신 모든 분께 감사 인사를 드리며 계속해서 #고캠핑 #안전캠핑에 많은 관심과 참여 부탁드립니다 여러분의 안전 캠핑, 고캠핑이 응원합니다. ** 개인 정보는 상품 발송 목적으로 만 활용되며 발송 후 폐기합니다. ** 기한 내 네이버폼으로 개인정보를 회신주시지 않을 경우, 당첨이
                                취소 될 수 있습니다.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item ">
                        <h2 class="accordion-header " id="flush-headingTwo ">
                            <button class="accordion-button collapsed " type="button " style="font-weight: bolder ; " data-bs-toggle="collapse " data-bs-target="#flush-collapseTwo " aria-expanded="false " aria-controls="flush-collapseTwo ">
                             [이벤트] 홍천 랄라캠핑장 숙박권 이벤트 당첨자 안내
                        </button>
                        </h2>
                        <div id="flush-collapseTwo " class="accordion-collapse collapse " aria-labelledby="flush-headingTwo " data-bs-parent="#accordionFlushExample ">
                            <div class="accordion-body ">내용</div>
                        </div>
                    </div>
                    <div class="accordion-item ">
                        <h2 class="accordion-header " id="flush-headingThree ">
                            <button class="accordion-button collapsed " type="button " style="font-weight: bolder ; " data-bs-toggle="collapse " data-bs-target="#flush-collapseThree " aria-expanded="false " aria-controls="flush-collapseThree ">
                            초보캠핑을 위한 5대 안전수칙!
                         </button>
                        </h2>
                        <div id="flush-collapseThree " class="accordion-collapse collapse " aria-labelledby="flush-headingThree " data-bs-parent="#accordionFlushExample ">
                            <div class="accordion-body ">내용</div>
                        </div>
                    </div>
                    <div class="accordion-item ">
                        <h2 class="accordion-header " id="flush-headingfour ">
                            <button class="accordion-button collapsed " type="button " style="font-weight: bolder ; " data-bs-toggle="collapse " data-bs-target="#flush-collapsefour " aria-expanded="false " aria-controls="flush-collapsefour ">
                            [모닥불] 회원가입/로그인 이용안내
                         </button>
                        </h2>
                        <div id="flush-collapsefour " class="accordion-collapse collapse " aria-labelledby="flush-headingfour " data-bs-parent="#accordionFlushExample ">
                            <div class="accordion-body ">내용</div>
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
                </div>
                <div class="text-block1">
                    <a class="list-group-item list-group-item-action p-2" href="user-booking-detail.html">
                        <div class="row">
                            <div class="col-lg-4 align-self-center mb-4 mb-lg-0">
                                <div class="d-flex align-items-center ">
                                    <img class="img-fluid" src="<%= mypath%>/resources/img/img_semi/camp02.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class=" col-lg-12 py-3 ">
                                        <h6 class="label-heading">리뷰제목</h6>
                                        <div class="text-sm">리뷰글내용리뷰글내용리뷰글내용리뷰글내용리뷰글내용리뷰글내용</div>
                                        <div class="fs-7 pt-4">130,000원</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="text-block1">
                    <a class="list-group-item list-group-item-action p-2" href="user-booking-detail.html">
                        <div class="row">
                            <div class="col-lg-4 align-self-center mb-4 mb-lg-0">
                                <div class="d-flex align-items-center ">
                                    <img class="img-fluid" src="<%= mypath%>/resources/img/img_semi/camp02.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class=" col-lg-12 py-3 ">
                                        <h6 class="label-heading">리뷰제목</h6>
                                        <div class="text-sm">리뷰글내용리뷰글내용리뷰글내용리뷰글내용리뷰글내용리뷰글내용</div>
                                        <div class="fs-7 pt-4">130,000원</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
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