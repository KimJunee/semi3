<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.camping.mvc.camping.model.vo.CampingVO"%>
<%@page import="com.camping.mvc.camping.model.dao.CampDetailDAO"%>
<%@page import="com.camping.mvc.member.model.vo.Member"%>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
CampingVO campingVO = (CampingVO)request.getAttribute("campingVO");

if(campingVO == null){
	campingVO = new CampingVO();
}
%>
<script src="<%=mypath%>/resources/vendor/jquery/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<script>
	$(function(){
//		console.log("로그야 찍혀라 젠장할"); //javascript에서 로그찍는거 - java에서 system.out.println 같은 기능
		
		//단위 가격 콤마
		var payvalue = <%=campingVO.getCs_accom_fee()%>
		$("#pay").text(payvalue.toLocaleString("ko-KR") + " 원");
	})
	// 결제 - https://www.bootpay.co.kr/
	function payReservation(){
		console.log("payReservation");
		var payvalue = $("#pay").text();
		
		var payment = payvalue.replace(",","");
		console.log("price얼마" + payment);
		
		var camp_name = '<%=campingVO.getCs_name()%>';
		
		BootPay.request({
			application_id: "62e4a782d01c7e001c33b19d", //BootPay Javascript 키 
			price: payment,
			name: camp_name,
			pg: 'kakao',
			method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: '나는 아이템', //상품명
					qty: 1, //수량
					unique: '123', //해당 상품을 구분짓는 primary key
					price: 1000, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '사용자 이름',
				email: '사용자 이메일',
				phone: '010-1234-4567'
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {
				callback1: '그대로 콜백받을 변수 1', 
				callback2: '그대로 콜백받을 변수 2', 
				customvar1234: '변수명도 마음대로'
			},
			account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    expire_month: '12', // 정기걸제 시 사용됨, 정기결제가 적용되는 개월 수, 미설정시 12개월
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용

			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			
			if (data != null) { // 재고 수량 관리 로직 혹은 다른 처리
				//결제 되면
				this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				ajaxReservation();
			} else {
				this.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
		});
	}
	
	// Ajax - Post방식
	function ajaxReservation() {
		
		console.log("ajaxReservation start");
		
		var payvalue = $("#pay").text();
		var payment = payvalue.replace(" ","").replace("원","").replace(",","");
		
		// 날짜 가져오기
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
		
		// 인원 수 가져오기
		console.log("wtf ~~ "+$("#headcount_value").val());
		
		var headcount = $("#headcount_value").val();
		
		
		var campsite = '<%=campingVO.getCs_no()%>';
		
		var data = {
            	cs_no : campsite,
            	resv_headcount : headcount,
            	resv_pay : payment,
            	resv_checkin : startday,
            	resv_checkout : endday
		}
		
        $.ajax({
            type: 'POST',
            url: '/semi3/reservation',
            data: data,
            success: (result) => {
            	console.log(result);     
            	if(result == "success"){
            		alert("예약 성공");
            		location.href="/semi3/mypage/myreservation";
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
                <h1 class="hero-heading mb-3"><%=campingVO.getCs_name()%></h1>
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
                        <p class="text-muted"><%=campingVO.getCs_addr1()%><%=campingVO.getCs_addr2() != null ? campingVO.getCs_addr2() : ""%></p>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <div class="col-sm">
                    <h6>캠핑장 전화번호</h6>
                    <p class="text-muted"><%=campingVO.getCs_tel() != null ? campingVO.getCs_tel() : ""%></p>
                </div>
            </div>
            <div class="text-block">
                <h6 class="mb-3">예약 인원 수</h6>
                <div class="mb-2">
                    <div class="d-flex align-items-center">
                        <div class="btn btn-items btn-items-decrease">-</div>
                        <input class="form-control input-items input-items-greaterthan" id="headcount_value" type="text" value="1" disabled>
                        <div class="btn btn-items btn-items-increase">+</div>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <div class="row">
                    <div class="col">
                        <h6>총 결제 요금</h6>
                        <p class="text-muted" id="pay"></p>
                        <input type="hidden" id="pay_value" value="<%=campingVO.getCs_accom_fee()%>"/>
                    </div>
                    <div class="col align-self-center">
                        <p class="text-end d-print-none"><a class="btn btn-link text-muted" href="user-invoice.html"><i class="far fa-file me-2"></i>결제내용 상세보기</a></p>
                    </div>
                </div>
            </div>
            <div style="padding-top: 30px; padding-left: 50px">
                <button onclick="payReservation()" class="btn btn-reserv-one rounded-top" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview" style="margin-left: 50px; margin-right: 50px;">
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
        <!-- https://apis.map.kakao.com/web/sample/ -->
        <div class="col-lg-5 col-xl-7">
            <!-- 카카오 지도-->
            <div id="map" style="position: relative; width:100%;height:775px;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22780b0b907f50aa26b26eca2a5dbd9a"></script>
            <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(<%=campingVO.getCs_map_y() %>, <%=campingVO.getCs_map_x() %>),	// 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

	        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	        var map = new kakao.maps.Map(mapContainer, mapOption);
			
	     	// 지도를 클릭한 위치에 표출할 마커입니다
	        var marker = new kakao.maps.Marker({
	            position: map.getCenter() 
	        });
	        
	   		// 지도에 마커를 표시합니다
	        marker.setMap(map);
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
	<script src="<%=request.getContextPath()%>/resources/vendor/nouislider/nouislider.min.js"></script>
<%@ include file="/views/07_common/footer.jsp" %>