<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.camping.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.camping.mvc.camping.model.vo.CampingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/views/07_common/header.jsp"%>

<%
	List<CampingVO> list = (List<CampingVO>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	String bookingDate = "";
	String searchValue = "";
	String searchAddr1 = "";
	String searchPersonnel = "2";
	String campTypes[] = null;
	String checkBoxs[] = null;
	List<String> searchCampType = new ArrayList<String>();
	List<String> searchType = new ArrayList<String>();
	
	searchValue = request.getParameter("searchValue");
	if(searchValue == null){
		searchValue = "";
	}
	
	bookingDate = request.getParameter("bookingDate");
	if(bookingDate == null){
		bookingDate = "";
		}

	
//	String searchParamValue = request.getParameter("searchWord");
//	if()

	searchAddr1 = request.getParameter("searchAddr1");
	if(searchAddr1 != null){
		searchAddr1 = request.getParameter("searchAddr1");
	}else{
		searchAddr1 = "";
	}
	
//	searchPersonnel  = request.getParameter("searchPersonnel");
//	if(searchPersonnel == null){
//		searchPersonnel = "";
//	}
	
	campTypes  = request.getParameterValues("searchCampType");
	if(campTypes != null){
		searchCampType = new ArrayList<>(Arrays.asList(campTypes));
	}else{
		searchCampType = new ArrayList<>();
	}
	
	checkBoxs  = request.getParameterValues("searchType");
	if(checkBoxs != null){
		searchType = new ArrayList<>(Arrays.asList(checkBoxs));
	}else{
		searchType = new ArrayList<>();
	}
	
	
//	searchType = new ArrayList<>(Arrays.asList(checkBoxs));
%>

<!-- 헤더 큰 이미지 -->
<section class="d-flex align-items-center dark-overlay bg-cover "
	style="background-image: url(<%=path %>/resources/img/img_semi/캠핑_호수_02_01.png); height: 350px; margin: 60px;">
	<!-- 헤더 이미지 글씨 -->
</section>
<!-- 메인이미지끝 -->

<!-- ============================================================================================================================== -->

<%--
<%= "@@@@@@@@@@@@@@@@"+Arrays.toString(checkBoxs)%>
<%= "@@@@@@@@@@@@@@@@"+searchCampType%>
<%= "@@@@@@@@@@@@@@@@"+searchType%>
 --%>
<%= "@@@@"+searchCampType%>
<%= "@@@@"+searchType%>
<%= "@@@@"+searchAddr1%>
<%= "@@@@"+bookingDate%>
<%= "@@@@"+searchValue%>
<%= "@@@@"+searchPersonnel%>
<div class="container-fluid py-5 px-lg-5">
	<div class="row">
		<div class="col-lg-3 pt-3">
			<form class="pe-xl-3" action="<%=path %>/camping/list" method="get">
				<div class="mb-4">
					<label class="form-label" for="form_dates"></label>
					<div class="datepicker-container datepicker-container-left">
						<input class="form-control" type="text" name="bookingDate"
							id="form_dates" placeholder="날짜를 선택하세요" value="<%=bookingDate%>">
					</div>
				</div>
				<div class="mb-4">
					<label class="form-label" for="form_search"></label>
					<div class="input-label-absolute input-label-absolute-right">
						<div class="label-absolute">
							<i class="fa fa-search"></i>
						</div>
						<input class="form-control pe-4" type="search" name="searchValue"
							placeholder="캠핑장명" id="searchValue" value="<%=searchValue%>">
					</div>
				</div>
				<div class="mb-4">
					<label class="form-label" for="form_neighbourhood"></label> 
					<select
						class="selectpicker form-control" name="searchAddr1"
						id="form_neighbourhood" placeholder="지역선택" multiple
						data-style="btn-selectpicker" data-live-search="true"
						data-selected-text-format="count &gt; 1"
						data-none-selected-text="">
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
				<script type="text/javascript">
				  	var selectValue = '<%=searchAddr1%>';
	  				var selectedElement = document.getElementById("form_neighbourhood");
	  				var options = selectedElement.options;
	  				for(var i = 0; i < options.length; i++){
						if(options[i].value == selectValue){
							selectedElement.selectedIndex = i;
							break;
						}
					}
		  		</script>
				
				
				
				<!--<div class="mb-4">
                        <label class="form-label">인원</label>
                        <div class="d-flex align-items-center">
                            <div class="btn btn-items btn-items-decrease">-</div>
                            <input class="form-control pe-4" type="text" value="2" disabled>
                            <div class="btn btn-items btn-items-increase">+</div>
                        </div>
                    </div>-->
				<div class="mb-4">
					<label class="form-label">인원</label>
					<div class="d-flex align-items-center">
						<button type="button" vriant="items"
							class="btn-items-decrease btn btn-primary">-</button>
						<input type="text" id="searchPersonnel" name="searchPersonnel"
							class="input-items input-items-greaterthan form-control"
							value="<%=searchPersonnel%>">
						<button type="button" vriant="items"
							class="btn-items-increase btn btn-primary">+</button>
					</div>
				</div>
				<!--<div class="mb-4">
                        <label class="form-label" for="form_category"></label>
                        <select class="selectpicker form-control" name="category" id="form_category" placeholder="인원선택" multiple data-style="btn-selectpicker" data-selected-text-format="count &gt; 1" data-none-selected-text="">
                          <option value="category_0">1명</option>
                          <option value="category_1">2명</option>
                          <option value="category_2">3명</option>
                          <option value="category_3">4명</option>
                          <option value="category_4">5명</option>
                          <option value="category_5">6명</option>
                          <option value="category_5">7명</option>
                          <option value="category_5">8명</option>
                          <option value="category_5">9명</option>
                          <option value="category_5">10명</option>
                          <option value="category_5">11명</option>
                          <option value="category_5">12명</option>
                          <option value="category_5">13명</option>
                          <option value="category_5">14명</option>
                          <option value="category_5">15명</option>
                          <option value="category_5">16명</option>
                          <option value="category_5">17명</option>
                          <option value="category_5">18명</option>
                          <option value="category_5">19명</option>
                          <option value="category_5">20명</option>
                        </select>
                    </div>-->
				<div class="mb-4" name="frm1">
					<label class="form-label">숙소유형</label>
					<div class="row">
						<!-- row: 단나누는 코드  하단에 col-lg-6로 2개 넣으면 2단락-->
						<div class="list-unstyled col-lg-6 pt-3 ">
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_0"
										name="searchCampType" value="일반야영장"
										<%=searchCampType.contains( "일반야영장") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_0">일반야영장</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_1"
										name="searchCampType" value="일반야영장"
										<%=searchCampType.contains( "자동차야영장") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_1">자동차야영장</label>
								</div>
							</li>
						</div>
						<div class="list-unstyled col-lg-6 pt-3  ">
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_2"
										name="searchCampType" value="카라반"
										<%=searchCampType.contains( "카라반") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_2">카라반</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_3"
										name="searchCampType" value="글램핑"
										<%=searchCampType.contains( "글램핑") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_3">글램핑</label>
								</div>
							</li>
						</div>
					</div>
				</div>
				<div class="mb-4 ">
					<label class="form-label">주요시설</label>
					<div class="row">
						<!-- row: 단나누는 코드  하단에 col-lg-6로 2개 넣으면 2단락-->
						<div class="list-unstyled col-lg-6 pt-3 ">
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_4"
										name="searchType" value="수영장"
										<%=searchType.contains( "수영장") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_4">수영장</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_5"
										name="searchType" value="농어촌체험시설"
										<%=searchType.contains( "농어촌체험시설") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_5">농어촌체험시설</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_6"
										name="searchType" value="산책로"
										<%=searchType.contains( "산책로") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_6">산책로</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_7"
										name="searchType" value="계곡"
										<%=searchType.contains( "계곡") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_7">계곡</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_8"
										name="searchType" value="수상레저"
										<%=searchType.contains( "수상레저") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_8">수상레저</label>
								</div>
							</li>


						</div>
						<div class="list-unstyled col-lg-6 pt-3  ">

							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_9"
										name="searchType" value="어린이놀이시설"
										<%=searchType.contains( "어린이놀이시설") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_9">어린이 놀이시설</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_10"
										name="searchType" value="낚시"
										<%=searchType.contains( "낚시") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_10">낚시</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_11"
										name="searchType" value="운동장"
										<%=searchType.contains( "운동장") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_11">운동장</label>
								</div>
							</li>
							<li>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="type_12"
										name="searchType" value="해수욕"
										<%=searchType.contains( "해수욕") ? "checked" : "" %> /> <label
										class="form-check-label" for="type_12">해수욕</label>
								</div>
							</li>

						</div>
					</div>
				</div>
				<!--<div class="form-group row mb-2">
                        <div class="col-12"><button type="button" class="btn font-size-h3" style="background-color:#F05945; color: white">전체 해제</button></div>
                    </div>-->
				<button onclick="deselect()" type="button" class="btn btn-primary">전체해제</button>
				<!--<input type="checkbox" class="btn-check" name="" id="btn-check" autocomplete="off">
                    <label class="btn btn-primary" for="btn-check">전체해제</label>-->
				<script>
                                                    function deselect() {
                                                        $('.form-check-input').prop('checked', false);
                                                    }
                                                </script>
				<!-- <script>
                        function clear_onclick() {
                            for (var i = 0; i < document.frm1.length; i++) {
                                document.frm1.elements[i].checked = true;
                            }
                        }
                    </script> -->
				<div class="pb-4"></div>
				<div class="pb-4"></div>
				<div class="mb-4">
					<button class="form-control pe-4" type="submit"
						style="background-color: #F05945; color: white">
						<i class="fas fa-filter me-1"></i>캠핑장검색
					</button>
				</div>
			</form>
		</div>
		<div class="col-lg-9">
			<!-- 캠핑징리스트 출력하는부분 -->
			<!--<div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                    <div class="mr-3">
                        <p class="mb-3 mb-md-0"><strong>12</strong> results found</p>
                    </div>
                    <div>
                        <label class="form-label mr-2" for="form_sort">Sort by</label>
                        <select class="selectpicker" name="sort" id="form_sort" data-style="btn-selectpicker" title="">
                <option value="sortBy_0">Most popular   </option>
                <option value="sortBy_1">Recommended   </option>
                <option value="sortBy_2">Newest   </option>
                <option value="sortBy_3">Oldest   </option>
                <option value="sortBy_4">Closest   </option>
              </select>
                    </div>
                </div>-->
			<div class="row">
				<!-- place item-->
				<%if(list == null || list.isEmpty()){ %>
				<%--캠핑장을 조회했는데 없다면 --%>
				<tr>
					<td style="text-align: center">조회된 캠핑장이 없습니다.</td>
				</tr>

				<%}else {%>
				<%--캠핑장 목록 시작 리스트 --%>
				<%for(CampingVO c : list) {%>
				<%if(c.getCs_image() == null) {
                    		continue;
                    	}%>


				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e33b1527bfe2abaf92">
					<!-- 반복문이 들어가야되는 부분 -->
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden gradient-overlay">
							<img class="img-fluid" src="<%=c.getCs_image()%>"
								alt="Modern, Well-Appointed Room" /> <a class="tile-link"
								href="<%=path+"/camping/Detail?campingNo="+ c.getCs_no()%>"></a>
							<!--<div class="card-img-overlay-bottom z-index-20">
                                    <div class="media text-white text-sm align-items-center"><img class="avatar avatar-border-white mr-2" src="img/avatar/avatar-0.jpg" alt="Pamela" />
                                        <div class="media-body">Pamela</div>
                                    </div>
                                </div>-->
							<!--<div class="card-img-overlay-top text-right">
                                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                        <svg class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg></a>
                                </div>-->
						</div>
						<div class="card-body d-flex align-items-center">
							<div class="w-100">
								<h6 class="card-title">
									<a class="text-decoration-none text-dark"
										href="detail-rooms.html"> <%=c.getCs_name() %>
									</a>
								</h6>
								<div class="d-flex card-subtitle mb-3">
									<p class="flex-grow-1 mb-0 text-muted text-sm">
										<%=c.getCs_addr1()%>
									</p>
									<p class="flex-shrink-1 mb-0 card-stars text-xs text-right">
										<i class="fa fa-star text-warning"></i><i
											class="fa fa-star text-warning"></i><i
											class="fa fa-star text-warning"></i><i
											class="fa fa-star text-warning"></i> <i
											class="fa fa-star text-warning"></i>
									</p>
								</div>
								<p class="card-text text-muted">
									<span class="h4 text-primary">₩</span><span
										class="h4 text-primary"><%=c.getCs_accom_fee() %></span> 1박
								</p>
							</div>
						</div>
					</div>
				</div>
				<%} %>
				<%--반복문 끝나는지점 --%>
				<%} %>
			</div>
			<!-- Pagination -->

			<nav aria-label="Page navigation example">
				<ul
					class="pagination pagination-template d-flex justify-content-center">
					<li class="page-item"><a class="page-link"
						onclick="movePage('<%=path %>/camping/list?page=<%=pageInfo.getStartPage() %>');">
							<i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>
					</a></li>
					<li class="page-item"><a class="page-link"
						onclick="movePage('<%=path %>/camping/list?page=<%=pageInfo.getPrvePage()%>');">
							<i class="fa fa-angle-left"></i>
					</a></li>
					<%--10개 목록 출력하기 --%>
					<% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
					<%if(i == pageInfo.getCurrentPage()){ %>
					<li class="page-item active"><button class="page-link"
							disabled><%=i%></button></li>
					<%} else{%>
					<li class="page-item"><button class="page-link"
							onclick="movePage('<%=path %>/camping/list?page=<%=i%>');"><%=i%></button></li>
					<%} %>
					<%} %>

					<%--다음으로 가기 --%>
					<li class="page-item"><a class="page-link"
						onclick="movePage('<%=path %>/camping/list?page=<%=pageInfo.getNextPage() %>');">
							<i class="fa fa-angle-right"></i>
					</a></li>
					<li class="page-item"><a class="page-link"
						onclick="movePage('<%=path %>/camping/list?page=<%=pageInfo.getEndPage() %>');">
							<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
					</a></li>
				</ul>
			</nav>

		</div>
		<!-- 캠핑징리스트 출력하는부분 끝-->
	</div>
</div>
<script type="text/javascript">

      function movePage(pageUrl) {
    	  //alert('test!!')
          //pageUrl = pageUrl;

          var form_dates = document.getElementById("form_dates"); //날짜
          if(form_dates.value.length > 0){
         	pageUrl += '&bookingDate=' + form_dates.value;
     	  }
/*         if (bookingDate == undefined) {
              pageUrl += '';
          } else {
              pageUrl += '&bookingDate=' + bookingDate.value;
          }
*/
          var searchValue = document.getElementById("searchValue"); // 검색어
          if(searchValue.value.length > 0){
	          pageUrl += '&searchValue=' + searchValue.value;
          }

//          var searchAddr1 = document.getElementsById("searchAddr1"); //지역이름
//          if (searchAddr1 == undefined) {
//             pageUrl += "";
//         } else {
//             pageUrl += '&searchAddr1=' + searchAddr1.value;
//         }


          var searchAddr1 = document.getElementById("form_neighbourhood"); //지역이름
          if(searchAddr1.selectedIndex != 0){
	          pageUrl += '&searchAddr1=' + searchAddr1.options[selectedElement.selectedIndex].value;
          }
          
          
          /*
          var searchPersonnel = document.getElementsByName("searchPersonnel"); // 인원
          if (searchPersonnel == undefined) {
              pageUrl += "";
          } else {
              pageUrl += '&searchPersonnel=' + searchPersonnel.value;
          }
          */

          var searchPersonnel = document.getElementById("searchPersonnel");
          if(searchPersonnel.value.length > 0){
	          pageUrl += '&searchPersonnel=' + searchPersonnel.value;
          }
          
          /*
          var searchCampTypes = document.getElementsByName("searchCampType"); //숙소유형
          if (searchCampTypes != null) {
              for (var i = 0; i < searchCampTypes.length; i++) {
                  if (searchCampTypes[i].checked == true) {
                      searchCampType = searchCampTypes[i].value;
                      pageUrl += '&searchCampType=' + searchCampType;
                  }
              }
          } else {
              pageUrl += '';
          }
          */

		  
          var searchCampTypes = document.getElementsByName("searchCampType");
          if (searchCampTypes.length != null) {
			for (var i = 0; i < searchCampTypes.length; i++) {
                  if (searchCampTypes[i].checked == true) {
                      searchCampType = searchCampTypes[i].value;
                      pageUrl += '&searchCampType=' + searchCampType;
                  }
              }
		  }

          /*
          var searchTypes = document.getElementsByName("searchType"); //주요시설
          if (searchTypes != null) {
              for (var j = 0; j < searchTypes.length; j++) {
                  if (searchTypes[i].checked == true) {
                      searchType = searchTypes[i].value;
                      pageUrl += '&searchType=' + searchType;
                  }
              }
          } else {
              pageUrl += '';
          }
          */

		  var searchTypes = document.getElementsByName("searchType");
		  if (searchTypes.length != null) {
			for (var i = 0; i < searchTypes.length; i++) {
                  if (searchTypes[i].checked == true) {
					searchType = searchTypes[i].value;
                      pageUrl += '&searchType=' + searchType;
                  }
              }
		  }
          
          alert(pageUrl);
          location.href = encodeURI(pageUrl);
      }
  </script>

<!-- 푸터위에 사진바-->
<section>
	<div class="container-fluid px-0">
		<div class="swiper-container instagram-slider">
			<div class="swiper-wrapper">
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-1.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-2.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-3.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-4.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-5.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-6.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-7.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-8.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-9.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="/views/07_common/footer.jsp"%>