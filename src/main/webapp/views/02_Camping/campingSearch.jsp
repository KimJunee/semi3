<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/views/07_common/header.jsp"%>
<%
String mypath = request.getContextPath();
%>

<!-- 헤더 큰 이미지 -->
<section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%=mypath %>/resources/img/img_semi/camp_02_01.png); height: 350px; margin: 60px;">
    <!-- 헤더 이미지 글씨 -->
</section>
<!-- 메인이미지끝 -->

<!-- ============================================================================================================================== -->

<div class="container-fluid py-5 px-lg-5">
    <div class="row">
        <div class="col-lg-3 pt-3">
            <form class="pe-xl-3" action="<%=mypath %>/camping/list" method="get">
                <div class="mb-4">
                    <label class="form-label" for="form_dates"></label>
                    <div class="datepicker-container datepicker-container-left">
                        <input class="form-control" type="text" name="bookingDate" id="form_dates" placeholder="날짜를 선택하세요">
                    </div>
                </div>
                <div class="mb-4">
                    <label class="form-label" for="form_search"></label>
                    <div class="input-label-absolute input-label-absolute-right">
                        <div class="label-absolute"><i class="fa fa-search"></i></div>
                        <input class="form-control pe-4" type="search" name="searchValue" placeholder="캠핑장명" id="form_search">
                    </div>
                </div>
                <div class="mb-4">
                    <label class="form-label" for="form_neighbourhood"></label>
                    <select class="selectpicker form-control" name="searchAddr1" id="form_neighbourhood" placeholder="지역선택" multiple data-style="btn-selectpicker" data-live-search="true" data-selected-text-format="count &gt; 1" data-none-selected-text="">
                          <option value="서울">서울</option>
                          <option value="경기도">경기도</option>
                          <option value="강원도">강원도</option>
                          <option value="대전">대전</option>
                          <option value="충북">충북</option>
                          <option value="충남">충남</option>
                          <option value="전북">전북</option>
                          <option value="전남">전남</option>
                          <option value="광주">광주</option>
                          <option value="경북">경북</option>
                          <option value="대구">대구</option>
                          <option value="경남">경남</option>
                          <option value="울산">울산</option>
                          <option value="부산">부산</option>
                          <option value="제주">제주</option>
                        </select>
                </div>
                <!--<div class="mb-4">
                    <label class="form-label">인원</label>
                    <div class="d-flex align-items-center">
                        <div class="btn btn-items btn-items-decrease">-</div>
                        <input class="form-control pe-4" type="text" value="2" disabled>
                        <div class="btn btn-items btn-items-increase">+</div>
                    </div>
                </div>-->
                <div class="mb-4"><label class="form-label">인원</label>
                    <div class="d-flex align-items-center"><button type="button" vriant="items" class="btn-items-decrease btn btn-primary">-</button><input disabled="" type="text" class="input-items input-items-greaterthan form-control" value="2"><button type="button" vriant="items" class="btn-items-increase btn btn-primary">+</button></div>
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
                                    <input class="form-check-input" type="checkbox" id="type_0" name="searchType" value = "일반야영장">
                                    <label class="form-check-label" for="type_0">일반야영장</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_1" name="searchType" value="자동차야영장">
                                    <label class="form-check-label" for="type_1">자동차야영장</label>
                                </div>
                            </li>
                        </div>
                        <div class="list-unstyled col-lg-6 pt-3  ">
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_2" name="searchType" value="카라반">
                                    <label class="form-check-label" for="type_2">카라반</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_3" name="searchType" value="글램핑">
                                    <label class="form-check-label" for="type_3">글램핑</label>
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
                                    <input class="form-check-input" type="checkbox" id="type_4" name="searchType" value="수영장">
                                    <label class="form-check-label" for="type_4">수영장</label>
                                </div>
                            </li>
                      		 <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_5" name="searchType" value="농어촌체험시설">
                                    <label class="form-check-label" for="type_5">농어촌체험시설</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_6" name="searchType" value="산책로">
                                    <label class="form-check-label" for="type_6">산책로</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_7" name="searchType" value="계곡">
                                    <label class="form-check-label" for="type_7">계곡</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_8" name="searchType" value="수상레저">
                                    <label class="form-check-label" for="type_8">수상레저</label>
                                </div>
                            </li>
                       
              
                        </div>
                        <div class="list-unstyled col-lg-6 pt-3  ">
                         
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_9" name="searchType" value="어린이놀이시설">
                                    <label class="form-check-label" for="type_9">어린이 놀이시설</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_10" name="searchType" value="낚시">
                                    <label class="form-check-label" for="type_10">낚시</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_11" name="searchType" value="운동장">
                                    <label class="form-check-label" for="type_11">운동장</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="type_12" name="searchType" value="해수욕">
                                    <label class="form-check-label" for="type_12">해수욕</label>
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
                <div class="pb-4">
                </div>
                <div class="pb-4">
                </div>
                <div class="mb-4">
                    <button class="form-control pe-4" type="submit" style="background-color:#F05945; color: white"> <i class="fas fa-filter me-1"></i>캠핑장검색                </button>
                </div>
            </form>
        </div>
        <div class="col-lg-9"> <!-- 캠핑징리스트 출력하는부분 -->
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
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                            <a class="tile-link" href="detail-rooms.html"></a>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">도림사오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">경기도 양주시 백석읍 기산로440번길 177</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩350000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent" />
                            <a class="tile-link" href="detail-rooms.html"></a>
                            <!--<div class="card-img-overlay-bottom z-index-20">
                                <div class="media text-white text-sm align-items-center"><img class="avatar avatar-border-white mr-2" src="img/avatar/avatar-7.jpg" alt="John" />
                                    <div class="media-body">John</div>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">당항포 오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">강원도 강릉시 성산면 어흘리</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩570000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!" />
                            <a class="tile-link" href="detail-rooms.html"></a>
                            <!--<div class="card-img-overlay-bottom z-index-20">
                                <div class="media text-white text-sm align-items-center"><img class="avatar avatar-border-white mr-2" src="img/avatar/avatar-8.jpg" alt="Julie" />
                                    <div class="media-body">Julie</div>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">청도 그린나래 오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">화천군 상서면 구운리 1174</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩</span><span class="h4 text-primary">123456</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment" />
                            <a class="tile-link" href="detail-rooms.html"></a>
                            <!--<div class="card-img-overlay-bottom z-index-20">
                                <div class="media text-white text-sm align-items-center"><img class="avatar avatar-border-white mr-2" src="img/avatar/avatar-9.jpg" alt="Barbora" />
                                    <div class="media-body">Barbora</div>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">천문대 별빛정원 </a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">충청남도 태안군 소원면 천리포1길 143-22</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩420000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise" />
                            <a class="tile-link" href="detail-rooms.html"></a>
                            <!--<div class="card-img-overlay-bottom z-index-20">
                                <div class="media text-white text-sm align-items-center"><img class="avatar avatar-border-white mr-2" src="img/avatar/avatar-10.jpg" alt="Jack" />
                                    <div class="media-body">Jack</div>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">라파엘 펜션 글램핑장 </a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">경남 밀양시 산외면 엄광리 1198-1</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩320000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan" />
                            <a class="tile-link" href="detail-rooms.html"></a>
                            <!--<div class="card-img-overlay-bottom z-index-20">
                                <div class="media text-white text-sm align-items-center"><img class="avatar avatar-border-white mr-2" src="img/avatar/avatar-11.jpg" alt="Stuart" />
                                    <div class="media-body">Stuart</div>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">래미안밸리캠핑장 </a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">전북 진안군 성수면 용포로 345</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩490000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                            <a class="tile-link" href="detail-rooms.html"></a>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">도림사오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">강원도 화천군 사내면 포화로 653-76</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩350000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                            <a class="tile-link" href="detail-rooms.html"></a>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">도림사오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">강원도 횡성군 갑천면 외갑천로 301</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩350000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                            <a class="tile-link" href="detail-rooms.html"></a>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">도림사오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">충청남도 당진시 신평면 산정길 112</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩350000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                            <a class="tile-link" href="detail-rooms.html"></a>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">도림사오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">경기도 포천시 관인면 삼율리 40-1번지</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩350000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                            <a class="tile-link" href="detail-rooms.html"></a>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">도림사오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">전라남도 담양군 금성면 비내동길 148</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩350000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=mypath %>/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room" />
                            <a class="tile-link" href="detail-rooms.html"></a>
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
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">도림사오토캠핑장</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">강원도 홍천군 내촌면 와야리</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-right"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">₩350000</span> 1박</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Pagination -->
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
        </div><!-- 캠핑징리스트 출력하는부분 끝-->
    </div>
</div>

<!-- 푸터위에 사진바-->
<section>
    <div class="container-fluid px-0">
        <div class="swiper-container instagram-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-1.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-2.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-3.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-4.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-5.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-6.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-7.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-8.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-9.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-10.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-11.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-12.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-13.jpg" alt=" "></a>
                </div>
                <div class="swiper-slide overflow-hidden">
                    <a href="#"><img class="img-fluid hover-scale" src="<%=mypath %>/resources/img/instagram/instagram-14.jpg" alt=" "></a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="/views/07_common/footer.jsp"%>