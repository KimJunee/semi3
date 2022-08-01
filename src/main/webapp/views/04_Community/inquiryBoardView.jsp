<%@page import="com.camping.mvc.member.model.vo.Member"%>
<%@page import="com.camping.mvc.inquiry.model.vo.Inreply"%>
<%@page import="com.camping.mvc.inquiry.model.vo.Inquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/views/07_common/header.jsp" %>

<%
Inquiry inquiry = (Inquiry)request.getAttribute("inquiry");
%>


    <!-- 헤더 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%= path%>/resources/img/img_semi/inquiry01.jpg); height: 350px; margin: 60px;"></section>
    <!-- 메인이미지끝 -->

    <section class="py-10">
        <div class="container">
            <div class="col-lg-12 mb-3  mb-lg-8">
                <div class="col-md-12">
                    <div class=" fs-1 mb-3" style="text-align: center; font-weight:bolder; color: #F05945;"><img src="<%= path%>/resources/img/img_semi/inquiryicon01.png" width="60px"> 문의 게시판 </div>
                    <div class=" fs-5 mb-3" style="text-align: center; color: gray;">궁금한 점이 있다면 언제든 물어보세요.</div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-4 ">
        <div class="container">
            <div class="col-lg-12">
                <div class="row    ps-lg-2 ">
                  <%
						if(loginMember != null){
							if(loginMember.getUser_id().equals(inquiry.getWriter_id())){
					%>
                    
                    <!-- 삭제하기 버튼 -->
                    <div class="col-lg-20 ">
                        <button class="btn btn-primary rounded-top " style="height: 50px; width: 120px; font-size: 16px;"  type="button"  onclick="deleteboard()" id="deleteBoard"  value="삭제">삭제하기 </button>
                    </div>
                  <%			
							}
						}
					%>
                </div>
               <script type="text/javascript">
                          function deleteboard() {
                           if(confirm("정말로 삭제하시겠습니까?!")) {
                              location.replace('<%= request.getContextPath() %>/board/inquirydelete?inquiryNo=<%=inquiry.getInquiry_no()%>');
                           }
                          }
            </script>
            </div>
        </div>
    </section>
    <section class="py-4">
        <div class="container">
            <div class="col-lg-12">
                <div class=" mt-3" style="background-color:#A3D2CA ; height: 80px; font-weight: bolder; font-size: 23px;">
                    <div class="row    ps-lg-6 ">
                       
                        <input type="hidden" id="inquiryNo"  name="inquiryNo" value="<%=inquiry.getInquiry_no()%>" />
                        <div class=" col-lg-10   mt-4 ms-4"><%=inquiry.getInquir_title() %></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 ">
                <div class=" mt-2" style="background-color:#fff ; height: auto;  font-size: 20px;">
                    <div class="row  px-lg-6 ">
                        <div class=" col-lg-12   mt-4 ">
                         <%=inquiry.getInquir_content()%>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-4">
        <div class="container">
            <div class="row ms-6">
                <div class="col-md-5 pb-3  " style="font-size: 15px; font-weight:bolder ;">
                    <img src="<%= path%>/resources/img/img_semi/man.png" width="8%"> <%=inquiry.getWriter_id() %>
                </div>
                <div class="col-md-3 ">
                    <a style="color: #5EAAA8;">
                    <%=inquiry.getInquir_regist() %>
                </a>
                </div>
                <div class="col-md-2 ">
                    <a class="text-base " style="color: #5EAAA8;" href="border01.html">
                 
                </a>
                </div>
                <div class="col-md-2 ">
                    <a style="color: #5EAAA8;">
                     조회 수  <%=inquiry.getInquir_hit() %>
                </a>
                </div>
            </div>
        </div>
    </section>

    <!-- 주황 구분선 -->
    <div class="col-lg-12 px-5">
        <div class="mx-7 " style="background-color:#F05945; height: 2px;">
        </div>
    </div>

    <!-- 답변창 -->
    <section class="py-4">
    <%for(Inreply inreply: inquiry.getInreplies()) { %>
        <div class="container">
            <div class="col-lg-12 ">
                <div class=" mt-5" style="background-color: #F7F3E9 ; height: auto; ">
                    <div class="row    ps-lg-6 ">
                        <div class=" col-lg-1  mt-9 badge  badge-semi-custom" style="height:35px; font-size: 18px;">답변내용</div>
                    </div>
                    
                   
                    
                     <%if(loginMember != null && loginMember.getUser_id().equals(inreply.getInrwriter_id())){ %>
						<form action="<%=request.getContextPath()%>/inreply/delete" method="get">
                    
                    <div class="row  px-lg-6 ">
                    <input type="hidden" name="inreplyNo" value="<%=inreply.getInr_no()%>">			
					<input type="hidden" name="inquiryNo" value="<%=inquiry.getInquiry_no()%>">	
                        <div class=" col-lg-12   mt-4 " style="font-size: 20px;">
                           <%= inreply.getInr_content() %>
                            <br>
                        </div>
                    </div>
                    <div class="container ">
                        <div class="row my-5">
                            <div class="col-md-10 pb-2  " style="font-size: 17px; font-weight:bolder ;">
                                <img src="<%= path%>/resources/img/img_semi/logo05.png" width="8%"> 
								 <%=inreply.getInrwriter_id()%>
                            </div>
                            <div class="col-md-2 ">
                                <a style="color: #5EAAA8;">
                            답변일 : 2022-07-06
                        </a>
                            </div>

                        </div>
                           <div   style="height: 30px; padding-left:900px;">
                                    <button type="submit"  class=" btn btn-primary " style="font-size: 10px; width: 80px; ">댓글삭제</button>
                           </div>
                    </div>
                    </form>
                        <%} %>
                </div>
            </div>
        </div>
        <%} %>
    </section>

    <!-- 답변 작성 양식 -->
    <section class="py-4">
        <div class="container">
          <form action="<%=request.getContextPath()%>/board/inquiryreply" method="post">
            <div class="col-lg-12 ">
                <div class="mt-1 mb-6 ">
                    <button class="btn btn-primaryCuntom rounded-top" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview" style="font-size: 16px;">답변 작성하기</button>
                    <div class="collapse mt-4" id="leaveReview">
                        
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-4">
                                    <input type="hidden" name="inquiryNo" value="<%=inquiry.getInquiry_no()%>" />
                                        <label class="form-label" for="name"></label>
                                        <input type="hidden" name="writer" value="<%=loginMember != null ? loginMember.getUser_id() : "" %>" />
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label" for="review">답변 작성</label>
                                    <textarea class="form-control" rows="4" type="text" name="content" id="content" placeholder="내용을 작성해 주세요" required="required"></textarea>
                                </div>
                                <div class="container">
                                    <div class="col-lg-12 mb-3  ">
                                        <button class="btn btn-primary col-lg-12" style="width: 200px; font-size: 16px;" type="submit">올리기</button>
                                    </div>
                                </div>
                        
                        </div>
                    </div>
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
	function deleteInquiry(inreplyNo, inquiryNo){
		var url = '<%=request.getContextPath()%>/inreply/delete?inreplyNo=';
		var requestURL = url + inreplyNo + '&inquiryNo=' + inquiryNo;
		location.replace(requestURL);
	}
	
</script>