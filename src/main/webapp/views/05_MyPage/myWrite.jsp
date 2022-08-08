<%@page import="com.camping.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.camping.mvc.community.model.vo.Community"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/07_common/header.jsp" %>
<%
String mypath = request.getContextPath();
List<Community> list = (List<Community>)request.getAttribute("list");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
%>

    <!-- 헤더 큰 이미지 -->
    <section class="container bg-cover"  style="background-image: url(<%= path%>/resources/img/img_semi/mypage01_01.png);  width:1300px; height: 400px;"></section>
    <!-- 메인이미지끝 -->

    <!-- 문의게시판 검색창 시작 -->
    <section class="py-10">
        <div class="container">
            <div class="col-lg-12 mb-3  mb-lg-8">
                <div class="col-md-12">
                    <div class=" fs-1 mb-3" style="text-align: center; font-weight:bolder; color: #F05945;">
                        <img src="<%=path%>/resources/img/img_semi/user.png" width="60px"> 마이페이지
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
                                <img class="d-block avatar avatar-xxl p-2 mb-2" src="<%= path%>/resources/img/img_semi/campfire01.png" alt="">
                            </a>
                            <div style="font-weight: bolder; font-size: 25px;"><%=loginMember.getUser_name() %></div>
                        </div>
                        <!--프로필 카드 내부 메뉴  -->
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <button class="btn btn-primary-semi-custom" onclick="location.href = '<%=path%>/member/mypage' " style="width:260px; height: 50px; font-size: 20px;"> <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                </svg>나의 정보</button>
                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <button class="btn btn-primary-semi-custom" onclick="location.href = '<%=path %>/mypage/myfavorite'" style="width:260px; height: 50px; font-size: 20px;"> <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                                  </svg>찜한 캠핑장</button>
                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <button class="btn btn-primary-semi-custom" onclick="location.href = '<%=path%>/mypage/myreservation'" style="width:260px; height: 50px; font-size: 20px;">  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-clipboard2" viewBox="0 0 16 16">
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
						  </script>
   						</div>
                    </div>
                </div>
                <!-- 프로필 옆 기능부 -------------------------------------------------------------------------------->
                <div class="col-lg-9 ps-lg-5">
                    <div class="text-block">
                        <h4 class="mb-5">내 게시물</h4>
                        <div class="row">
                        <%if(list == null || list.isEmpty()){ %><!--  게시글이 없는 경우  -->
								<div style="text-align:center;">작성한 게시글이 없습니다.</div>
						<%} else { %><!-- 게시글이 있는경우 -->
	                        <%for(Community comm : list) {%>
	                            <!--게시글 01  -->
	                            <div class="col-6  col-md-4  mb-30px">
	                                <div class="card h-100 border-0 shadow hover-animate">
	                                    <div class="card-body">
	                                        <div class="mb-3">
	                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-all" viewBox="0 0 16 16">
	                                                    <path d="M8.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L2.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093L8.95 4.992a.252.252 0 0 1 .02-.022zm-.92 5.14.92.92a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 1 0-1.091-1.028L9.477 9.417l-.485-.486-.943 1.179z"/>
	                                                  </svg>
	                                        </div>
	                                        <!-- 게시글제목 -->
	                                        <h5 class="card-title mb-3">
	                                            <a class="text-decoration-none text-dark stretched-link" href="<%=path %>/board/view?communityNo=<%=comm.getCo_no() %>">
	                                                <%=comm.getCo_title() %>
	                                            </a>
	                                        </h5>
	                                        <!-- 게시글내용 -->
	                                        <p class="text-muted card-text text-sm"><%=comm.getCo_content() %></p>
	                                    </div>
	                                </div>
	                            </div>
	                            <%} %>
	                         <%} %>   
					 <section>
					    <!-- 페이지 버튼 시작-->
					    <nav aria-label="Page navigation example">
					            <ul
					               class="pagination pagination-template d-flex justify-content-center">
					               <li class="page-item"><a class="page-link"
					                  onclick="movePage('<%=path %>/mypage/mywrite?page=<%=pageInfo.getStartPage() %>');">
					                     <i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>
					               </a></li>
					               <li class="page-item"><a class="page-link"
					                  onclick="movePage('<%=path %>/mypage/mywrite?page=<%=pageInfo.getPrvePage()%>');">
					                     <i class="fa fa-angle-left"></i>
					               </a></li>
					               <%--5페이지 출력하기 --%>
					               <% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
					               		<%if(i == pageInfo.getCurrentPage()){ %>
					               		<li class="page-item active">
					               		<button class="page-link" disabled><%=i%></button></li>
					               		<%} else{%>
					               		<li class="page-item">
					               		<button class="page-link" onclick="movePage('<%=path %>/mypage/mywrite?page=<%=i%>');"><%=i%></button></li>
					               		<%} %>
					              	 <%} %>
					
					               <%--다음으로 가기 --%>
					               <li class="page-item"><a class="page-link"
					                  onclick="movePage('<%=path %>/mypage/mywrite?page=<%=pageInfo.getNextPage() %>');">
					                     <i class="fa fa-angle-right"></i>
					               </a></li>
					               <li class="page-item"><a class="page-link"
					                  onclick="movePage('<%=path %>/mypage/mywrite?page=<%=pageInfo.getEndPage() %>');">
					                     <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
					               </a></li>
					            </ul>
					         </nav>
					    <!-- 페이지 버튼 끝-->   
					    </section>
    
                    </div>
                </div>
            </div>
        </div>
	</div>        
</section>
    
<script type="text/javascript">
   function movePage(pageUrl){//페이지url받아옴
       location.href = encodeURI(pageUrl);	//로케이션을 바꾸는 코드	
   }
</script>

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