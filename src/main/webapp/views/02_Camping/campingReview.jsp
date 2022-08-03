<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.camping.mvc.member.model.vo.Member"%>
<%@page import="com.camping.mvc.camping.model.vo.Review"%>
<%@page import="com.camping.mvc.camping.model.vo.Reservation"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
Reservation reservation = (Reservation)request.getAttribute("reservation");
%>

<!-- 헤더 큰 이미지 -->
<section class="d-flex align-items-center dark-overlay bg-cover " style="background-image:  url(<%=mypath%>/resources/img/img_semi/camp_07.png); height: 350px; margin: 60px;">
    <!-- 헤더 이미지 글씨 -->
    <div class="container"></div>
</section>
<!-- 메인이미지끝 -->

<section class="py-10">
    <div class="container">
        <div class="col-lg-12 mb-3  mb-lg-8">
            <div class="col-md-12">
                <div class=" fs-1 mb-3" style="text-align: center; font-weight:bolder; color: #F05945;"><img src="<%=mypath%>/resources/img/img_semi/community01.png" width="60px"> 어떤 점이 좋으셨나요? </div>
                <div class=" fs-5 mb-1" style="text-align: center; color: gray;"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                    <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                  </svg>고객님의 소중한 후기를 작성해주세요.</div>
                <div class=" fs-5 mb-1" style="text-align: center; color: gray;"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                    <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                  </svg>무관한 후기작성 시 무통보 삭제 될 수 있습니다.</div>
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

<!-- 게시글 작성자 -->
<section class="pt-2 pb-4 p-print-0">
    <div class="container">
        <div class="row mx-6 mt-2">
            <div class="col-md-5 " style="font-size: 15px; font-weight:bolder;">
                <img src="<%=mypath%>/resources/img/img_semi/campfire01.png" width="8%"><%=loginMember.getUser_name()%>
                <div class="mb-4">
                <label class="form-label" for="rating">Your rating *</label>
                <select class="form-select focus-shadow-0" name="rating" id="rating">
                  <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733; (5/5)</option>
                  <option value="4">&#9733;&#9733;&#9733;&#9733;&#9734; (4/5)</option>
                  <option value="3">&#9733;&#9733;&#9733;&#9734;&#9734; (3/5)</option>
                  <option value="2">&#9733;&#9733;&#9734;&#9734;&#9734; (2/5)</option>
                  <option value="1">&#9733;&#9734;&#9734;&#9734;&#9734; (1/5)</option>
                </select>
              </div>
            </div>
        </div>
    </div>
</section>

<!-- 회색구분선 -->
<section class="pt-0 pb-3 p-print-0">
    <div class="container">
        <div class="col-lg-12">
            <div class="mx-8" style="background-color:#c0c0c0; height: 0.2px;">
            </div>
        </div>
    </div>
</section>

<!-- 후기작성  -->
<section class="pt-0 pb-1 p-print-0">
    <div class="container">
        <div class=" mb-lg-1 ">
            <div class=" mt-4" id="leaveReview">
                <form class="form" id="contact-form" method="post" action="<%= path%>/myreview" enctype="multipart/form-data">
                	<input type="hidden" name="csno" id="csno" value="<%=reservation.getCs_no() %>"/>
                	<input type="hidden" name="resvno" id="resvno" value="<%=reservation.getResv_no()%>"/>
                    <div class="row">
                        <div class="mb-4">
                            <textarea class="form-control" rows="1" name="reviewTitle" id="reviewTitle" placeholder="제목을 입력해주세요" required="required"></textarea>
                        </div>
                        <div class="mb-4">
                            <textarea class="form-control" rows="10" name="reviewContent" id="reviewContent" placeholder="캠핑장 이용에 대한 후기를 남겨주세요." required="required"></textarea>
                        </div>
                    </div>
                    <div class="container">
                       <div class="col-lg-12 mb-3" style="text-align:right;">
                            <label class=" btn btn-primaryCuntom " for="input-file" style="width: 200px; font-size: 16px;" type="submit">파일첨부</label>
                            <input class="d-none" type="file" id="input-file" name="input-file"/>
                           <span style="display:inline-block; width:10px;"></span>
                            <button class="btn btn-primary col-lg-6 " style="width: 150px; font-size: 16px;" type="submit">등  록</button>
                        </div>
                    </div>
                </form>
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