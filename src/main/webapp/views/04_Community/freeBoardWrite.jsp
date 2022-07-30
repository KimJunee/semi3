<%@page import="com.camping.mvc.member.model.vo.Member"%>
<%@page import="com.camping.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.camping.mvc.community.model.vo.Community"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/07_common/header.jsp" %>


    <!-- 헤더 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover " style="background-image:  url(<%= path%>/resources/img/img_semi/inquiry01_01.png); height: 350px; margin: 60px;">
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
    <!-- 주황 구분선 -->
    <section class="pt-0 pb-3 p-print-0">
        <div class="container">
            <div class="col-lg-12 ">
                <div class="mx-8 " style="background-color:#F05945; height: 2px;">
                </div>
            </div>
        </div>
    </section>
   
<form action="<%= request.getContextPath()%>/board/write" method="POST">    
    <!-- 게시글 작성자 -->
    <section class="pt-2 pb-4 p-print-0 ">
        <div class="container ">
            <div class="row mx-6 mt-2" >
           
                <div type=text  class="col-md-5" style="font-size: 15px; font-weight:bolder ;">
   					 <img src="<%= path%>/resources/img/img_semi/campfire01.png " width="8%">
   					 <input type="hidden" id="writer" name="writer">
   					  <%=loginMember.getUser_id()%>
   					  
                </div>
            </div>
        </div>
    </section>
    <!-- 회색구분선 -->
    <section class="pt-0 pb-3 p-print-0">
        <div class="container">
            <div class="col-lg-12 ">
                <div class="mx-8 " style="background-color:#c0c0c0; height: 0.2px;">
                </div>
            </div>
        </div>
    </section>
    <!-- 문의글  -->
    <section class="pt-0 pb-1 p-print-0">
        <div class="container">
            <div class=" mb-lg-1 ">
                <div class=" mt-4" id="leaveReview">
                    <form class="form">
                        <div class="row">
                            <div class="mb-4">
                                <label class="form-label fs-5" for="name">제목</label>
                                <textarea name="title" class="form-control" rows="2"  id="freeBoardTitle" placeholder="제목을 작성해 주세요"  required="required"></textarea>
                            </div>
                            <div class="mb-4">
                                <label class="form-label fs-5" for="review">문의 내용</label>
                                <textarea name="content" class="form-control" rows="10"  id="freeBoardContact" placeholder="내용을 작성해 주세요" required="required"></textarea>
                            </div>
                            <div class="container">
                                <div class="col-lg-12 mb-3  ">
                                    <button class="btn btn-primary col-lg-12" style="width: 200px; font-size: 16px;" type="submit">등  록</button>
                                </div>
                            </div>
                             </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</form>

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