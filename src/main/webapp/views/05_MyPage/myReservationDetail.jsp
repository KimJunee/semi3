<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
%>
    <!-- 헤더 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%= path%>/resources/img/img_semi/mypage01_01.png); height: 350px; margin: 60px;"></section>
    <!-- 메인이미지끝 -->

    <section class="py-5 p-print-0">
        <div class="container">
            <div class="card border-0 shadow shadow-print-0">
                <div class="card-header p-4 border-0 px-print-0" style="background-color:#F7F3E9 ;">
                    <div class="row" style="background-color:#F7F3E9 ;">
                        <div class="col-6 d-flex align-items-center"><img src="<%= path%>/resources/img/img_semi/logo05.png" style="width:150px ;"></div>
                        <div class="col-6 text-end">
                            <h3 class="mb-0">예약번호 202009001</h3>
                            <p class="mb-0">Issued on 2022-08-16</p>
                        </div>
                    </div>
                </div>
                <div class="card-body p-5 p-print-0">
                    <div class="row mb-4">
                        <!-- 예약자 정보 -->
                        <div class="col-6 pe-lg-3">
                            <h2 class="h4 text-uppercase mb-4">예약자 정보</h2>
                            <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">체크인</h6>
                            <div class="mb-4 mt-1">
                                <h5>2022-08-16</h5>
                            </div>
                            <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">체크아웃</h6>
                            <div class="mb-4 mt-1">
                                <h5>2022-08-19</h5>
                            </div>
                            <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">인원수</h6>
                            <div class="mb-4 mt-1">
                                <h5>3명</h5>
                            </div>
                        </div>
                        <!-- 캠핑장 정보 -->
                        <div class="col-6 pe-lg-3">
                            <h2 class="h4 text-uppercase mb-4">캠핑장 정보</h2>
                            <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">주소</h6>
                            <div class="mb-4 mt-1">
                                <h5>경기도 성남시 분당구 서현로 11번길 1-1</h5>
                            </div>
                            <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">전화번호</h6>
                            <div class="mb-4 mt-1">
                                <h5>031-123-4567</h5>
                            </div>
                            <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">홈페이지</h6>
                            <div class="mb-4 mt-1">
                                <h5>www.campcamp.com</h5>
                            </div>
                        </div>
                        <!-- 예약 금액 표 -->
                        <div class="table-responsive text-sm mb-2">
                            <table class="table table-striped">
                                <thead class="bg-gray-200">
                                    <tr class="border-0">
                                        <th class="text-center">캠핑장 이름</th>
                                        <th class="text-center">결제일자</th>
                                        <th class="text-center">이용요금</th>
                                        <th class="text-center">부가세</th>
                                        <th class="text-center">결제금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center fw-bold">은하수 캠핑장</td>
                                        <td class="text-center">2022-07-21</td>
                                        <td class="text-center">300,000원</td>
                                        <td class="text-center">30,000원</td>
                                        <td class="text-center">330,000원</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer  p-4  border-0  text-sm" style="background-color:#F7F3E9 ;">
                        <p class="mb-0 " style="margin-left: 620px;">모닥불을 이용해 주셔서 감사합니다. 즐거운 캠핑여행 되세요.
                            <button class="btn btn-primary  " onclick="location.href = 'campingReview.html' " style="width:135px ; font-size: 12px; margin-left: 10px; ">
                                <i class="fa fa-check fa-fw " > </i>후기작성하기
                            </button>
                        </p>
                    </div>
                </div>
            </div>
    </section>
    
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
<%@ include file="/views/07_common/footer.jsp" %>