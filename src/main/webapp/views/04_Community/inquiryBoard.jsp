<%@page import="com.camping.mvc.member.model.vo.Member"%>
<%@page import="com.camping.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.camping.mvc.inquiry.model.vo.Inquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/07_common/header.jsp" %>
<%
Member loginMember = (Member)session.getAttribute("loginMember");
 List<Inquiry> list = (List<Inquiry>)request.getAttribute("list"); 
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");

//String searchType = "title";
String searchValue = "";

if(request.getParameter("searchValue") != null){
	searchValue = request.getParameter("searchValue");
}
//String searchParamValue = request.getParameter("searchValue");
//if(searchParamValue != null && searchParamValue.length() > 0){
	//searchType = request.getParameter("searchType");
//	searchValue = request.getParameter("searchValue");
//}
%>

    <!-- 헤더 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover " style="background-image: url(<%= path%>/resources/img/img_semi/inquiry01.jpg); height: 350px; margin: 60px;"></section>
    <!-- 메인이미지끝 -->

    <!-- 문의게시판 검색창 시작 -->
    <section class="py-10">
        <div class="container">
            <div class="col-lg-12 mb-3  mb-lg-8">
                <div class="col-md-12">
                    <div class=" fs-1 mb-3" style="text-align: center; font-weight:bolder; color: #F05945;"><img src="<%= path%>/resources/img/img_semi/inquiryicon01.png" width="60px"> 문의 게시판 </div>
                    <div class=" fs-5 mb-3" style="text-align: center; color: gray;">궁금한 점이 있다면 언제든 물어보세요.</div>
                </div>
                <div class="row">
                    <div class="col-xl-12">
                        <!--검색바 둥근 모양 사이즈 조절하는 부분 -->
                        <form action="<%=path%>/board/listServlet">
                            <div class="row">
                                <!-- 검색창 -->
                                <div class="col-lg-11 d-flex  form-group" style="height: 60px;">
                                    <input id="searchValue" name="searchValue" type="text" value="<%= searchValue%>" class="form-control" style="font-size: 15px; color: rgb(203, 203, 203);" placeholder="        검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
                                </div>
                                <!-- 검색버튼 -->
                                <div class="col-lg-1 d-grid " style="height: 60px;">
                                    <button class=" btn btn-primaryCuntom rounded-top h-100 " type="submit " style="font-size: 20px;"><img src="<%= path%>/resources/img/img_semi/search.png" width="35px"> </button>
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
        <div class="mb-5 mb-lg-8  ">
         <% if(loginMember != null) {%>
            <button class="btn btn-primary rounded-top" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview" style="font-size: 16px;">
                <img src="<%= path%>/resources/img/img_semi/write01_03.png" width="35px">문의하기
            </button>
             <% } %>
            <div class="collapse mt-4" id="leaveReview">
                <form class="form" id="contact-form" method="get" action="#">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-4">
                                <label class="form-label" for="name">제목</label>
                                <input class="form-control" type="text" name="name" id="contactTitle" placeholder="제목을 입력하세요." required="required">
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="review">문의 내용</label>
                            <textarea class="form-control" rows="4" name="review" id="contact" placeholder="내용을 작성해 주세요" required="required"></textarea>
                        </div>
                        <div class="container">
                            <div class="col-lg-12 mb-3  ">
                                <button class="btn btn-primary col-lg-12" style="width: 200px; font-size: 16px;" type="submit">올리기</button>
                            </div>
                        </div>
                </form>
                </div>
            </div>
        </div>

        <!-- 공지사항 시작 -->
        <section class="py-4 ">
            <div class="container ">
                <div class="col-lg-12 mb-5 mb-lg-8 ">
                    <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                <button class="accordion-button" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-megaphone me-3" viewBox="0 0 16 16">
                                    <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z"/>
                                  </svg>
                                문의 게시판 이용시 주의사항!
                        </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">
                                    - 게시판 이용 안내 -<br><br> - 모든 게시판은 회원가입을 하신 후 이용하실 수 있습니다.<br> - 문의글을 등록 하시면 2~3일 이내에 답변드리겠습니다.<br> - 게시판에 맞는 글을 작성하셔야 합니다. 게시판 성격에 맞지 않는 경우 강제 삭제됨을 알려드립니다.<br> - 불법 사이트, 성인 사이트 글 작성시 강제 회원 탈퇴 처리합니다.<br>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-megaphone me-3" viewBox="0 0 16 16">
                                    <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z"/>
                                  </svg>
                                [이벤트] 홍천 랄라캠핑장 숙박권 이벤트 당첨자 안내
                             </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                <div class="accordion-body">
                                    안녕하세요. 모닥불입니다. 홍천 랄라캠핑장 숙박권 이벤트 숙박권 당첨자 안내드립니다.<br><br> <br> ※ 참고하세요. - 숙박권 당첨자에게는 9월 10일 (금) 숙박권이 지급됩니다. <br> - 숙박권은 모바일로 전송됩니다. <br> - 유효기간 만료 전 해당 쿠폰을 사용하여 예약 후 취소 시 쿠폰은 자동 복구됩니다.(유효기간 만료 시 복구 불가)
                                    <br> - 쿠폰의 유효기간은 지급일로부터 60일입니다. <br> - 5만원 초과 당첨금은 제세공과금 22%가 부여되며, 당사가 100% 부담합니다.<br> - 제세공과금 처리를 위하여 블랙 숙박권 당첨자 전원에게 신분증 사본을 요청, 수집하며 거부 시 당첨에서 제외됩니다.<br> - 제세공과금 처리를 위하여 9월 3일 (금) 여기어때 고객센터에서 당첨자에게 유선으로 연락드리며 9월
                                    8일 (수)까지 유선 연락이 불가한 (내정보 내 휴대폰 번호 미등록, 오류 등) 당첨자는 당첨에서 제외됩니다.<br> - 기 당첨자가 개인정보 수집 또는 당첨 거부 시 당첨자를 재 선정하지 않습니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-megaphone me-3" viewBox="0 0 16 16">
                                    <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z"/>
                                  </svg>
                                초보 캠핑을 위한 안전캠핑 5대수칙!
                        </button>
                            </h2>
                            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                <div class="accordion-body">
                                    1.난로 등 화기∙난방기기 사용 시 일산화탄소 경보기를 꼭! 사용하고 텐트를 자주 환기해주세요 <br> 2. 휴대용 가스레인지 사용 시 화구보다 큰 조리기구를 쓰지 않고 화기 근처에 두지 않아야 해요! <br> 3. 전기용량 체크! 총 600W 미만으로 전기를 사용해야해요 <br> 4. 텐트에서 잠을 잘 때는 가스랜턴 등은 반드시 소등해서 가스중독을 예방해야해요! <br> 5. 난로
                                    등 난방기기는 꼭 끄고 텐트 밖에 두고 자야해요! <br><br> 안전한 캠핑을 위해 주위 많은 분들께 5대 안전수칙을 알려주세요~ <br>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingfour">
                                <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapsefour" aria-expanded="false" aria-controls="panelsStayOpen-collapsefour">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-megaphone me-3" viewBox="0 0 16 16">
                                    <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z"/>
                                  </svg>
                                [모닥불] 아이디/비밀번호 이용안내
                        </button>
                            </h2>
                            <div id="panelsStayOpen-collapsefour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingfour">
                                <div class="accordion-body">
                                    [아이디 찾기]<br><br> 1. 이메일 주소로 가입한 회원 : 가입 시 등록한 닉네임이나 이메일 주소 일부를 고객센터에 조회 요청<br> 2. 카카오톡 계정으로 가입한 회원 : 해당 계정관리 업체의 고객센터에 문의<br><br> [비밀번호 찾기]<br> - 이메일주소 가입만 해당<br><br> 1. 이메일로 로그인하기 > 비밀번호 재설정 <br> 2. 가입 시 등록한 이메일 주소
                                    입력
                                    <br> 3. 인증수단 선택 (휴대폰번호 또는 이메일 주소)<br> 4. 발급받은 인증번호 입력을 통해 새로운 비밀번호 생성<br><br> 위 방법으로도 이용에 불편을 겪으실 경우 모닥불 고객센터로 문의해주시길 바랍니다.<br>
                                </div>
                            </div>
                        </div>
                        
                        <div class="accordion-item ">
                            <h2 class="accordion-header" id="panelsStayOpen-headingfive">
                                <button class="accordion-button collapsed" style="font-weight: bolder;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapsefive" aria-expanded="false" aria-controls="panelsStayOpen-collapsefive">
                                <div>NO.1</div>
                                 <div>캠핑장 취사관련 문의드립니다</div>
                        </button>
                            </h2>
                            <div id="panelsStayOpen-collapsefive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingfive">
                                <div class="accordion-body">
                                    캠핑장 텐트 안에서 라면 먹으려고 하는데 취사가 가능한가요? 답변 부탁드립니다.
                                </div>
                                <div class="container ">
                                    <div class="row ">
                                        <div class="col-md-5 pb-3  " style="font-size: 15px; font-weight:bolder ;">
                                            <img src="<%= path%>/resources/img/img_semi/man.png" width="8%"> 사용자닉네임
                                        </div>
                                        <div class="col-md-3 ">
                                            <a style="color: #5EAAA8;">
                                            작성일 : 2022-07-06
                                        </a>
                                        </div>
                                        <div class="col-md-2 ">
                                            <a class="text-base " style="color: #5EAAA8;" href="border01.html">
                                            답변 수
                                        </a>
                                        </div>
                                        <div class="col-md-2 ">
                                            <a style="color: #5EAAA8;">
                                            조회 수
                                        </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
       
        <!-- 공지사항 끝 -->
        
        
         <!-- 페이지번호  -->
             <nav aria-label="Page navigation example">
            <ul
               class="pagination pagination-template d-flex justify-content-center">
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/board/listServlet?page=<%=pageInfo.getStartPage() %>');">
                     <i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>
               </a></li>
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/board/listServlet?page=<%=pageInfo.getPrvePage()%>');">
                     <i class="fa fa-angle-left"></i>
               </a></li>
               <%--5페이지 12개 목록 출력하기 --%>
               <% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
                     <%if(i == pageInfo.getCurrentPage()){ %>
                     <li class="page-item active">
                     <button class="page-link" disabled><%=i%></button></li>
                     <%} else{%>
                     <li class="page-item">
                     <button class="page-link" onclick="movePage('<%=path %>/board/listServlet?page=<%=i%>');"><%=i%></button></li>
                     <%} %>
                  <%} %>

               <%--다음으로 가기 --%>
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/board/listServlet?page=<%=pageInfo.getNextPage() %>');">
                     <i class="fa fa-angle-right"></i>
               </a></li>
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/board/listServlet?page=<%=pageInfo.getEndPage() %>');">
                     <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
               </a></li>
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
       
    <script type="text/javascript">
function movePage(pageUrl){//페이지url받아옴
	var searchValue = document.getElementById("searchValue");  // 갤럭시라는 입력값 가져옴1번
	alert('나오니?');
	if(searchValue.value.length > 0){
		pageUrl = pageUrl + '&searchValue=' + searchValue.value; 
	}
	alert(pageUrl);
	location.href = encodeURI(pageUrl);	//로케이션을 바꾸는 코드	
}
</script>

<%@ include file="/views/07_common/footer.jsp" %>
     