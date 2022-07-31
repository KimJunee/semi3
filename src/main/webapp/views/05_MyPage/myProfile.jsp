<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@page import="com.camping.mvc.member.model.vo.Member"%>
<%@include file="/views/07_common/header.jsp"%>

<%
	Member member = (Member)request.getAttribute("member");
%>

    <!-- 헤더 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%=path%>/resources/img/img_semi/mypage01_01.png); height: 350px; margin: 60px;"></section>
    <!-- 메인이미지끝 -->

    <!-- 문의게시판 검색창 시작 -->
    <section class="py-10">
        <div class="container">
            <div class="col-lg-12 mb-3  mb-lg-8">
                <div class="col-md-12">
                    <div class=" fs-1 mb-3" style="text-align: center; font-weight:bolder; color: #F05945;">
                        <img src="<%=path%>/resources/img/img_semi/inquiry01_01.png" width="60px"> 마이페이지
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 문의게시판 검색창 끝 -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <!-- 프로필카드 -->
                <div class="col-lg-3 me-lg-auto">
                    <div class="card border-0 shadow mb-6 mb-lg-0">
                        <div class="card-header bg-gray-100 py-4 border-0 text-center">
                            <a class="d-inline-block" href="#">
                                <img class="d-block avatar avatar-xxl p-2 mb-2" src="<%=path%>/resources/img/img_semi/campfire01.png" alt="">
                            </a>
                            <div style="font-weight: bolder; font-size: 25px;">홍길동</div>
                        </div>
                        <!--프로필 카드 내부 메뉴  -->
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <button class="btn btn-primary-semi-custom" onclick="location.href = 'myPagePost.html' " style="width:260px; height: 50px; font-size: 20px;"> <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                </svg>나의 정보</button>
                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <button class="btn btn-primary-semi-custom" onclick="location.href = 'myPageCamping.html'" style="width:260px; height: 50px; font-size: 20px;"> <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                                  </svg>찜한 캠핑장</button>
                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <button class="btn btn-primary-semi-custom" onclick="location.href = 'myPageReservation.html'" style="width:260px; height: 50px; font-size: 20px;">  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-clipboard2" viewBox="0 0 16 16">
                                    <path d="M3.5 2a.5.5 0 0 0-.5.5v12a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-12a.5.5 0 0 0-.5-.5H12a.5.5 0 0 1 0-1h.5A1.5 1.5 0 0 1 14 2.5v12a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-12A1.5 1.5 0 0 1 3.5 1H4a.5.5 0 0 1 0 1h-.5Z"/>
                                    <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5Z"/>
                                  </svg>예약 목록</button>
                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <button class="btn btn-primary-semi-custom " onclick="location.href = '<%=path%>/mypage/mywrite'" style="width:260px; height: 50px; font-size: 20px;">  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                  </svg>내 게시물</button>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-3 ms-6 ">
   						<button class="btn btn-primaryCuntom01 rounded-top " style="height: 50px; width: 110px; font-size: 16px;" type="button"  onclick="deleteMember()" id="deleteMember" value="탈퇴"> 회원탈퇴 </button>                        
              			  <script type="text/javascript">
              				function deleteMember() {
              		    	if(confirm("정말로 탈퇴하시겠습니까?!")) {
              		   	 	location.replace('<%= request.getContextPath() %>/member/delete');
              		    	}
              		    	}  
              			  
              			  
						
              			<%-- $("#deleteMember").on("click", (e) => {
									if(confirm("정말로 탈퇴하시겠습니까?!")) {
										location.replace('<%= request.getContextPath() %>/member/delete');<%--MemberDeleteServlet.java로 넘어감 --%>
						<%--			}
								});
								
								$('#deleteMember').click(function(){
									alert();
									})--%>  
									
				</script>
   					</div>
                    </div>
                </div>
                <!-- 프로필 옆 기능부 -->
                <div class="col-lg-9 ps-lg-5">
                    <div class="text-block">
                        <h4 class="mb-5">나의 정보 수정하기</h4>
                        <!-- 현재 등록 정보 -->
                        <div class="row mb-3">
                            <div class="col-sm-9">
                                <h5>현재 정보</h5>
                            </div>
                        </div>
                        <p class="text-sm text-muted">
                            <i class="fa fa-id-card fa-fw me-2">
                            </i><%=member.getUser_name() %><br>
                            <i class="fa fa-birthday-cake fa-fw me-2">
                            </i><%=member.getUser_birth() %><br>
                            <i class="fa fa-envelope-open fa-fw me-2">
                            </i><%=member.getUser_email() %>
                            <span class="mx-2"> | </span>
                            <i class="fa fa-phone fa-fw me-2">
                            </i><%=member.getUser_phone() %>
                        </p>
                        <!-- 나의정보 변경 -->
                        <div id="personalDetails">
                        <form name=memberFrm action="<%=request.getContextPath()%>/member/update" method="POST">
                            <div class="row pt-4">
                       			 <h6>나의정보 변경</h6>
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="name">이름</label>
                                    <input class="form-control" type="text" name="name" id="name" value="<%=member.getUser_name() %>">
                                </div>
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="date">생년월일</label>
                                    <input class="form-control" type="text" name="date" id="date" value="<%=member.getUser_birth() %>">
                                </div>
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="email">이메일주소</label>
                                    <input class="form-control" type="email" name="email" id="email" value="<%=member.getUser_email() %>">
                                </div>
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="phone">전화번호</label>
                                    <input class="form-control" type="text" name="phone" id="phone" value="<%=member.getUser_phone() %>">
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit" value="정보수정">정보수정</button>
                            </form>
                        </div>
                        <!-- 비밀번호 변경 부분 -->
                        <hr>
                        <div class="row">
                            <div class="col-sm-8">
                                <h6>비밀번호 변경</h6>
                                <p class="text-sm text-muted">3개월 전에 마지막으로 변경됨.</p>
                            </div>
                        </div>
                        <div id="updatePassword">
                        <form name=memberPwUpdate action="<%=request.getContextPath()%>/member/updatePwd" method="POST">
                            <div class="row mt-2">
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="password-new">새 비밀번호</label>
                                    <input class="form-control" type="password" name="password-new" id="password-new">
                                </div>
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="password-confirm">비밀번호 확인</label>
                                    <input class="form-control" type="password" name="password-confirm" id="password-confirm">
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit" value="비밀번호 변경하기">비밀번호 변경하기</button>
                        	</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 하단 이미지바 시작-->
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
    <!-- 하단 이미지바 끝-->
<%@include file="/views/07_common/footer.jsp"%>
 