<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
%>

    <!-- 헤더 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%= path%>/resources/img/img_semi/inquiry01_01.png); height: 350px; margin: 60px;">
        <!-- 헤더 이미지 글씨 -->
        <div class="container">
        </div>
    </section>
    <!-- 메인이미지끝 -->

    <section class="py-10">
        <div class="container">
            <div class="col-lg-12 mb-3  mb-lg-8">
                <div class="col-md-12">
                    <div class=" fs-1 mb-3" style="text-align: center; font-weight:bolder; color: #F05945;"><img src="<%= path%>/resources/img/img_semi/community01.png" width="60px"> 자유 게시판 </div>
                    <div class=" fs-5 mb-1" style="text-align: center; color: gray;"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                        <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                      </svg>불쾌감을 줄 수 있는 글 작성 시 삭제조치 될 수 있습니다.</div>
                    <div class=" fs-5 mb-1" style="text-align: center; color: gray;"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                        <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                      </svg>캠핑과 관련없는 글은 숨김 및 삭제조치 될 수 있습니다.</div>
                </div>
            </div>
        </div>
    </section>

    <!-- 문의게시판 검색창 시작 -->
    <section class="py-10">
        <div class="container">
            <div class="col-lg-12  mb-lg-4">
                <div class="row">
                    <div class="col-xl-12">
                        <!--검색바 둥근 모양 사이즈 조절하는 부분 -->
                        <form action="#">
                            <div class="row">
                                <!-- 검색창 -->
                                <div class="col-lg-11 d-flex  form-group" style="height: 60px;">
                                    <input type="text" class="form-control" style="font-size: 15px; color: rgb(203, 203, 203);" placeholder="        검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
                                </div>
                                <!-- 검색버튼 -->
                                <div class="col-lg-1 d-grid " style="height: 60px;">
                                    <button class=" btn btn-primaryCuntom rounded-top h-100 " type="submit " style="font-size: 20px;"><img src="<%= path%>/resources/img/img_semi/검색.png" width="35px"> </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 문의게시판 검색창 끝 -->
    <!-- 문의글 쓰기 버튼 -->
    <div class="container">
        <div class=" mb-lg-1 ">
            <button class="btn btn-primary rounded-top" type="button" style="font-size: 16px;" onclick="location.href = 'freeBoard03.html' ">
              <img src="<%= path%>/resources/img/img_semi/write01_03.png" width="35px">글 작성
            </button>
        </div>
    </div>
    <!-- 게시글 부분 -->
    <section class="pt-0 pb-1 p-print-0">
        <div class="container">
            <div class="card-body p-5 p-print-0">
                <div class="table-responsive text-sm mb-5">
                    <table class="table table-striped">
                        <thead class="bg-blueCustom10">
                            <tr class="border-0">
                                <th class="text-center col-md-1">NO</th>
                                <th class="text-center col-md-6">제목</th>
                                <th class="text-center col-md-2">작성자</th>
                                <th class="text-center col-md-2">작성날짜</th>
                                <th class="text-center col-md-1">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center col-md-1">1</td>
                                <td class="fw-bold text-center  col-md-6"><a href="freeBoard02.html" style="color:black ;">캠핑이 너무 좋아요</a></td>
                                <td class="text-center col-md-2">
                                    <img class="d-inline-block avatar avatar-xxm   align-text-top" src="<%= path%>/resources/img/img_semi/campfire01.png" alt=""> 캠핑러버
                                </td>
                                <td class="text-center col-md-2">2022-07-08</td>
                                <td class="text-center col-md-1">3</td>
                            </tr>
                            <tr>
                                <td class="text-center col-md-1">1</td>
                                <td class="fw-bold text-center  col-md-6"><a href="freeBoard02.html" style="color:black ;">캠핑이 너무 좋아요</a></td>
                                <td class="text-center col-md-2">
                                    <img class="d-inline-block avatar avatar-xxm   align-text-top" src="<%= path%>/resources/img/img_semi/campfire01.png" alt=""> 캠핑러버
                                </td>
                                <td class="text-center col-md-2">2022-07-08</td>
                                <td class="text-center col-md-1">3</td>
                            </tr>
                            <tr>
                                <td class="text-center col-md-1">1</td>
                                <td class="fw-bold text-center  col-md-6">
                                    <a href="freeBoard02.html" style="color:black ;">캠핑이 너무 좋아요</a></td>
                                <td class="text-center col-md-2">
                                    <img class="d-inline-block avatar avatar-xxm   align-text-top" src="<%= path%>/resources/img/img_semi/campfire01.png" alt=""> 캠핑러버
                                </td>
                                <td class="text-center col-md-2">2022-07-08</td>
                                <td class="text-center col-md-1">3</td>
                            </tr>
                            <tr>
                                <td class="text-center col-md-1">1</td>
                                <td class="fw-bold text-center  col-md-6">
                                    <a href="freeBoard02.html" style="color:black ;">캠핑이 너무 좋아요</a></td>
                                <td class="text-center col-md-2">
                                    <img class="d-inline-block avatar avatar-xxm   align-text-top" src="<%= path%>/resources/img/img_semi/campfire01.png" alt=""> 캠핑러버
                                </td>
                                <td class="text-center col-md-2">2022-07-08</td>
                                <td class="text-center col-md-1">3</td>
                            </tr>
                            <tr>
                                <td class="text-center col-md-1">1</td>
                                <td class="fw-bold text-center  col-md-6">
                                    <a href="freeBoard02.html" style="color:black ;">캠핑이 너무 좋아요</a></td>
                                <td class="text-center col-md-2">
                                    <img class="d-inline-block avatar avatar-xxm   align-text-top" src="<%= path%>/resources/img/img_semi/campfire01.png" alt=""> 캠핑러버
                                </td>
                                <td class="text-center col-md-2">2022-07-08</td>
                                <td class="text-center col-md-1">3</td>
                            </tr>
                            <tr>
                                <td class="text-center col-md-1">1</td>
                                <td class="fw-bold text-center  col-md-6">
                                    <a href="freeBoard02.html" style="color:black ;">캠핑이 너무 좋아요</a></td>
                                <td class="text-center col-md-2">
                                    <img class="d-inline-block avatar avatar-xxm   align-text-top" src="<%= path%>/resources/img/img_semi/campfire01.png" alt=""> 캠핑러버
                                </td>
                                <td class="text-center col-md-2">2022-07-08</td>
                                <td class="text-center col-md-1">3</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 페이지번호  -->
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
    </section>
    
           <!-- 하단 이미지바 시작-->
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
    <!-- 하단 이미지바 끝-->

<%@ include file="/views/07_common/footer.jsp" %>
