<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
%>
<script src="<%=mypath%>/resources/vendor/jquery/jquery.min.js"></script>
<script>
	$(function(){
		console.log("로그야 찍혀라 젠장할"); //javascript에서 로그찍는거 - java에서 system.out.println 같은 기능
	})
	
	// Ajax - Post방식
	function ajaxReservation() {
		
		console.log("ajaxReservation start");
		
		//날짜 가져오기
		var startday = $("b.start-day").html();
		var endday = $("b.end-day").html();
		var date = new Date();
		var today = date.getFullYear()+"-"+(("00"+(date.getMonth()+1).toString()).slice(-2))+"-"+(("00"+date.getDate().toString()).slice(-2))
		
		if(startday == '...'){
			startday = today;
		}
		
		if(endday == '...'){
			endday = today;
		}
		
		//인원수 가져오기.
		console.log("wtf ~~ "+$("#headcount_value").val());
		
		var headcount = $("#headcount_value").val();
		
		var data = {
				user_no : 1,
            	cs_no : 1,
            	resv_headcount : headcount,
            	resv_pay : 100000000,
            	resv_checkin : startday,
            	resv_checkout : endday
		}
        
        $.ajax({
            type: 'POST',
            url: '/reservation',
            data: data,
            success: (result) => {
            	console.log(result);     
            	if(result == "success"){
            		alert("예약 성공");
            		//location.href="/myReservation"; -- 마이페이지 예약목록 서블릿 주소 넣으면 됨
            	}else{
            		alert("예약 실패");
            		//location.href="/error"; -- 에러 페이지 서블릿 주소 넣으면 됨
            	}
            },
            error: (e) => {
               	alert("예약 에러");
              //location.href="/error"; -- 에러 페이지 서블릿 주소 넣으면 됨
            }
        });
    }
	// GET방식 요청을 위해 만들었던 귀여운 함수들.. 지우기 아까워서 냄겨둠
	/* //버튼 눌렀을 때 쓸 함수 만들기
	function reservationFunc(){
		
		//날짜 가져오기
		var startday = $("b.start-day").html();
		var endday = $("b.end-day").html();
		var date = new Date();
		var today = date.getFullYear()+"-"+(("00"+(date.getMonth()+1).toString()).slice(-2))+"-"+(("00"+date.getDate().toString()).slice(-2))
		
		if(startday == '...'){
			startday = today;
		}
		
		if(endday == '...'){
			endday = today;
		}
		
		//인원수 가져오기.
		console.log("wtf ~~ "+$("#headcount_value").val());
		
		var headcount = $("#headcount_value").val();
		
		var url = "";
		url += "user_no="+"유저번호";
		url += "&cs_no="+"캠핑장번호";
		url += "&resv_headcount="+headcount;
		url += "&resv_pay="+"가격";
		url += "&resv_checkin="+startday;
		url += "&resv_checkout="+endday;
		
		//? 뒤에 붙을 주소 만들기
		location.href='/reservation?'+url;
	} */
</script>

<!-- 헤더 큰 이미지 -->
<section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%=mypath%>/resources/img/img_semi/camp_07_01.jpg); height: 350px; margin: 60px;"></section>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-7 col-xl-5 px-4 pb-4 ps-xl-5 pe-xl-5">
            <section class="mx-n4 mx-xl-n5 mb-4 mb-xl-5">
                <!-- Slider main container-->
            </section>
            <!-- Breadcrumbs -->
            <div class="text-block">
                <h1 class="hero-heading mb-3">은하수 캠핑장</h1>
            </div>
            <div class="text-block">
                <div class="row mb-3">
                    <div class="col-md-6 d-flex align-items-center mb-3 mb-md-0">
                        <div class="date-tile me-3" id="start_form_dates">
                            <div class="text-uppercase"> <span class="text-sm" id="start_month">AUG</span><br><strong class="text-lg" id="start_date">16</strong></div>
                            <label class="form-label"></label>
                            <div class="datepicker-container datepicker-container-left">
                            </div>
                        </div>
                        <p class="text-sm mb-0" id="start_day">화요일 check-in<br>3PM ~</p>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <div class="date-tile me-3">
                            <div class="text-uppercase"> <span class="text-sm" id="end_month">AUG</span><br><strong class="text-lg" id="end_date">19</strong></div>
                        </div>
                        <p class="text-sm mb-0" id="end_day">금요일 check-out<br>~ 12PM</p>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <div class="row">
                    <div class="col-sm">
                        <h6>주소</h6>
                        <p class="text-muted">경기 양주시 남면 감악산로514번길 468-8</p>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <div class="col-sm">
                    <h6>캠핑장 전화번호</h6>
                    <p class="text-muted">010-7894-7878</p>
                </div>
            </div>
            <div class="text-block">
                <h6 class="mb-3">예약 인원 수</h6>
                <div class="mb-2">
                    <div class="d-flex align-items-center">
                        <div onclick="reservationHeadCount()" class="btn btn-items btn-items-decrease">-</div>
                        <input class="form-control input-items input-items-greaterthan" id="headcount_value" type="text" value="1" disabled>
                        <div class="btn btn-items btn-items-increase">+</div>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <div class="row">
                    <div class="col">
                        <h6>총 결제 요금</h6>
                        <p class="text-muted">330,000원</p>
                    </div>
                    <div class="col align-self-center">
                        <p class="text-end d-print-none"><a class="btn btn-link text-muted" href="user-invoice.html"><i class="far fa-file me-2"></i>결제내용 상세보기</a></p>
                    </div>
                </div>
            </div>
            <div style="padding-top: 30px; padding-left: 50px">
                <button onclick="ajaxReservation()" class="btn btn-reserv-one rounded-top" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview" style="margin-left: 50px; margin-right: 50px;">
                예약하기
                </button>
                <button onclick="location.href='/reservation'" class="btn btn-reserv-two rounded-top" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview">
                수정하기
                </button>
            </div>

            <div class="text-block d-print-none">
                <button class="btn btn-link ps-0" onclick="window.print()"><i class="fa fa-print me-2"></i>Print </button>
            </div>
        </div>
        <!-- 카카오 지도 - 서버 연결해야 보임 / 도메인(기본) 확인 완료 : http://localhost -->
        <div class="col-lg-5 col-xl-7">
           <!-- // 기존 테마 지도 (구글)
             <div class="map-full shadow-left" id="detailSideMap"></div> -->
            <!--// 카카오 지도-->
            <div id="map" style="position: relative; width:100%;height:775px;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22780b0b907f50aa26b26eca2a5dbd9a"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667),
                    level: 3
                };
                var map = new kakao.maps.Map(container, options);
            </script>
        </div>
    </div>
</div>
<!-- ============================================================================================================================== -->
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
	<!-- Map -->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
	<!-- Available tile layers-->
	<script src="<%=request.getContextPath()%>/resources/js/map-layers.js">
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/map-detail.js">
	</script>
	<script>
		createDetailMap({
		mapId: 'detailSideMap',
		mapZoom: 18,
		mapCenter: [40.732346, -74.0014247],
		markerShow: true,
		markerPosition: [40.732346, -74.0014247],
		markerPath: 'img/marker.svg',
		})
	</script>
<%@ include file="/views/07_common/footer.jsp" %>