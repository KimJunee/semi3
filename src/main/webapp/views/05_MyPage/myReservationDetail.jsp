<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.camping.mvc.member.model.vo.Member"%>
<%@page import="com.camping.mvc.camping.model.vo.Reservation"%>
<%@page import="com.camping.mvc.camping.model.dao.ReservationDAO"%>
<%@ page import="java.text.*" %>
<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
Reservation reservation = (Reservation)request.getAttribute("reservation");
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
DecimalFormat df = new DecimalFormat("###,###");
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
                        <h3 class="mb-0">예약번호 <%=sdf.format(reservation.getResv_success())%>-<%=loginMember.getUser_no() %>-<%=reservation.getResv_no()%></h3>
                        <p class="mb-0">Issued on <%=reservation.getResv_success() %></p>
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
                            <h5><%=reservation.getResv_checkin()%></h5>
                        </div>
                        <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">체크아웃</h6>
                        <div class="mb-4 mt-1">
                            <h5><%=reservation.getResv_checkout()%></h5>
                        </div>
                        <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">인원수</h6>
                        <div class="mb-4 mt-1">
                            <h5><%=reservation.getResv_headcount() + " 명"%></h5>
                        </div>
                    </div>
                    <!-- 캠핑장 정보 -->
                    <div class="col-6 pe-lg-3">
                        <h2 class="h4 text-uppercase mb-4">캠핑장 정보</h2>
                        <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">주소</h6>
                        <div class="mb-4 mt-1">
                            <h5><%=reservation.getCs_addr1()%><%=reservation.getCs_addr2() != null ? reservation.getCs_addr2() : ""%></h5>
                        </div>
                        <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">전화번호</h6>
                        <div class="mb-4 mt-1">
	                        <% if(reservation.getCs_tel() != null) { %>
                            <h5><%=reservation.getCs_tel()%></h5>
                            <%} else { %>
                            <h5>캠핑장 연락처가 없습니다.</h5>
                            <%} %>
                        </div>
                        <h6 class="mb-1" style="color:rgb(113, 113, 113) ;">홈페이지</h6>
                        <div class="mb-4 mt-1">
                        	<% if(reservation.getCs_homepage() != null){ %>
                            <a href="<%=reservation.getCs_homepage()%>" target="_blank"><h5><%=reservation.getCs_homepage()%></h5></a>
                            <%} else { %>
                            <h5>캠핑장 홈페이지가 없습니다.</h5>
                            <%} %>
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
                                	<% 
                                    int surtax = Integer.parseInt(reservation.getCs_accom_fee()) * 10 / 110 ;
                                    %>
                                    <td class="text-center fw-bold"><%=reservation.getCs_name()%></td>
                                    <td class="text-center"><%=reservation.getResv_success()%></td>
                                    <td class="text-center"><%=df.format(Integer.parseInt(reservation.getCs_accom_fee()) - surtax)%>원</td>
                                    
                                    <td class="text-center"><%=df.format(surtax)%>원</td>
                                    <td class="text-center"><%=df.format(Integer.parseInt(reservation.getCs_accom_fee()))%>원 </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer  p-4  border-0  text-sm" style="background-color:#F7F3E9;">
                    <p class="mb-0 " style="margin-left: 620px;">모닥불을 이용해 주셔서 감사합니다. 즐거운 캠핑여행 되세요.
                        <button class="btn btn-primary  " onclick="location.href = '<%= path%>/myreservation/review?resvno=<%=reservation.getResv_no() %>' " style="width:135px ; font-size: 12px; margin-left: 10px;">
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