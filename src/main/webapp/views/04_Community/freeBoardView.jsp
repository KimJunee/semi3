<%@page import="com.camping.mvc.member.model.vo.Member"%>
<%@page import="com.camping.mvc.community.model.vo.Reply"%>
<%@page import="com.camping.mvc.community.model.vo.Community"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/07_common/header.jsp" %>
<%
Community community = (Community)request.getAttribute("community");
%>

    <!-- 헤더 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover " style="background-image:  url(<%= path%>/resources/img/img_semi/inquiry01_01.png); height: 350px; margin: 60px;">
        <!-- 헤더 이미지 글씨 -->
        <div class="container">
        </div>
    </section>
    <!-- 메인이미지끝 -->
    <section class="py-10">
        <div class="container">
            <div class="col-lg-12 mb-5  ">
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
    <!-- 게시글제목  부분 -->
    <section class="pt-0 pb-1 p-print-0">
        <div class="container">
            <div class="col-lg-12 ">
                <div class="mx-4 mt-2" style="background-color:#A3D2CA ; height: 80px; font-weight: bolder; font-size: 23px;">
                    <div class="row    ps-lg-5 ">
                    	<input type="hidden" id="communityNo"  name="communityNo" value="<%=community.getCo_no()%>" />
                        <div class=" col-lg-12   mt-4 ms-4"><%=community.getCo_title() %></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 게시글 작성자 -->
    <section class="pt-2 pb-1 p-print-0 ">
        <div class="container ">
            <div class="row mx-6 mt-2">
                <div class="col-md-5  " style="font-size: 15px; font-weight:bolder ;">
                    <img src="<%= path%>/resources/img/img_semi/campfire01.png " width="8%">
					<%=community.getWriter_id() %>
                </div>
                <div class="col-md-3 ">
                    <a style="color: #232222;">
                    <%=community.getCo_regist() %>
                </a>
                </div>
                
                <div class="col-md-2 ">
                    <a style="color:#232222;">
                    조회 수  <%=community.getCo_hit() %>
                </a>
                </div>
                
            </div>
        </div>
    </section>
    <!-- 게시글 부분 -->
    <section class="pt-0 pb-6 p-print-0">
        <div class="container">
            <div class="col-lg-12 ">
                <div class="mx-2 mt-2" style="background-color:#fff ; height: 80px; font-size: 18px;">
                    <div class="row    px-sm-6 ">
                        <div class=" col-lg-12   mt-4 ms-4 me-4">
                           <%=community.getCo_content()%>
                        </div>
                    </div>
                </div>
            </div>
           </div>   
    </section>
    <section class="pt-0 pb-3 p-print-0">
        <div class="container">
            <div class="col-lg-12">
                <div class="row    ps-lg-5 ">
                <%
						if(loginMember != null){
							if(loginMember.getUser_id().equals(community.getWriter_id())){
					%>
                    <!-- 수정하기 버튼 -->
                    <div class="col-lg-20  ">
                        <button onclick="#" class="btn btn-primaryCuntom rounded-top " style="height: 50px; width: 120px; font-size: 16px;" type="submit "> 수정하기 </button>
                    </div>
                    <!-- 삭제하기 버튼 -->
                    <div class="col-lg-20 ">
                        <button  class="btn btn-primary rounded-top " style="height: 50px; width: 120px; font-size: 16px;" type="button"  onclick="deleteboard()" id="deleteBoard"  value="삭제">삭제하기 </button>
                    </div>
                   <%			
							}
						}
					%>
                    
                </div>
                         <script type="text/javascript">
                          function deleteboard() {
                           if(confirm("정말로 삭제하시겠습니까?!")) {
                              location.replace('<%= request.getContextPath() %>/board/delete?communityNo=<%=community.getCo_no()%>');
                           }
                          }
            </script>
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
    <section class="pt-0 pb-3 ps-7 ">
        <div class="container">
            <div class="col-lg-12 ">
                <div class=" fs-4 mb-3" style="font-weight:bolder; color: #F05945;"> 댓글  </div>
            </div>
        </div>
    </section>
    
    
    <!-- 댓글 작성하기 -->
    <section class="pt-0 pb-3 p-print-0">
        <div class="container ">
     <form action="<%=request.getContextPath()%>/board/reply" method="post">
            <div class="row my-3">
                <div class="col-md-3" style="font-size: 20px; font-weight:bolder ; text-align: center;">
                    <img class=" avatar avatar-sm   " src="<%= path%>/resources/img/img_semi/campfire01.png" alt=""> <%=community.getWriter_id() %>
                </div>
                
                <div class="col-md-9 ">
                 <!--    <form action="#"> -->
                        <div class="row pe-6">
                            <!-- 검색창 -->
                            <div class="col-lg-11 d-flex  form-group" style="height: 60px; width:1200px;">
                               <input type="hidden" name="communityNo" value="<%=community.getCo_no()%>" />
                                <input type="hidden" name="writer" value="<%=loginMember != null ? loginMember.getUser_id() : "" %>" />
                               <input type="text" name="content"  class="form-control" style="font-size: 15px; color: rgb(203, 203, 203);" placeholder="댓글을 입력하세요">
   
                                <!-- 검색버튼 -->
                                <div class="col-lg-1 d-grid ps-4" style="height: 60px;">
                                    <button type="submit"  class=" btn btn-primaryCuntom rounded-top" style="font-size: 20px; width: 100px; ">등록</button>
                                </div>
                            </div>
                        </div>
                   <!--  </form> -->
                </div>
             </div>
            </form>
           </div>
    </section>
    <!-- 작성한 댓글  -->
    <section class="pt-0 pb-3 p-print-0">
    <%for(Reply reply: community.getReplies()) { %>
        <div class="container ">
            <!-- 댓글1 -->
            <div class="row my-3 pb-4">
                <div class="col-md-3" style="font-size: 20px; font-weight:bolder ; text-align: center;">
                    <img class=" avatar avatar-sm   " src="<%= path %>/resources/img/img_semi/campfire01.png" alt=""> <%=reply.getWriter_id() %>
                </div>
                
                <div class="col-md-9 ">
                   <%if(loginMember != null && loginMember.getUser_id().equals(reply.getWriter_id())){ %>
						<form action="<%=request.getContextPath()%>/reply/delete" method="get">
                        <div class="row pe-6">
                        <input type="hidden" name="replyNo" value="<%=reply.getRep_no()%>">			
							<input type="hidden" name="communityNo" value="<%=community.getCo_no()%>">	
                            <div class="col-lg-11 d-flex form-group" style="color:#232222; height: 60px; width:1200px; ">
                              <%= reply.getRep_content() %>
                                </div>
                                
                               <div   style="height: 30px; padding-left:900px;">
                                    <button type="submit"  class=" btn btn-primary rounded-top" style="font-size: 10px; width: 80px; ">댓글삭제</button>
                                </div>
                        </div>
                    </form>
                    <%} %>
                </div>

            </div>
            <hr>
        </div>
        	<%} %>
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
   
   <script type="text/javascript">
    // get 방식으로 페이지 요청하는 코드
	
     //댓글삭제
	function deleteReply(replyNo, communityNo){
		var url = '<%=request.getContextPath()%>/reply/delete?replyNo=';
		var requestURL = url + replyNo + '&communityNo=' + communityNo;
		location.replace(requestURL);
	}
	
</script>