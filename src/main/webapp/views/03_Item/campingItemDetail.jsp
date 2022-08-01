<%@page import="com.camping.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.camping.mvc.campingItem.model.vo.CampingItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/views/07_common/header.jsp"%>
<%
List<CampingItemVO> list = (List<CampingItemVO>)request.getAttribute("list");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
String[] searchType = request.getParameterValues("searchType");
String searchValue = request.getParameter("searchValue");

if(searchValue == null){
	searchValue = "";
}

String searchTypeStr = "ci_title";
if(searchType != null && searchType.length > 0){
	searchTypeStr = searchType[0];
}

%>
    <!-- 메인 큰 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(<%=path%>/resources/img/img_semi/campitem_04_01.png); height: 350px; margin: 60px;"></section>
    <!-- 메인 끝 -->
    
    <!-- 메인 검색창 -->
    <div class="container mb-5" style="margin-top: -130px;">
        <div class="search-bar rounded-4 p-0 p-lg-1 position-relative mt-n6 z-index-20 mx-7">
            <form action="<%=path%>/campingItem/Detail" method="get">
                <div class="row">
                    <!-- 카테고리 -->
                    <div class="col-lg-3 d-flex align-items-center form-group">
                        <div class="input-label-absolute input-label-absolute-right w-100">
                            <div style="color: #F05945; text-align:center; font-weight: bold;">캠핑용품</div>
                        </div>
                    </div>
                    <!-- 종류선택 -->
                    <div class="col-lg-3 d-flex align-items-center form-group no-divider-custom ">
                    <select class="selectpicker" name="searchType" id="searchType" data-style="btn-form-control">
                    	<option value="ci_title" <%=searchTypeStr.equals("ci_title") ? "selected" : "" %>>상품명</option>
                   	 	<option value="ci_brand" <%=searchTypeStr.equals("ci_brand") ? "selected" : "" %>>브랜드</option>
                    	<option value="ci_category3" <%=searchTypeStr.equals("ci_category3") ? "selected" : "" %>>키워드</option>
                    </select>
                    </div>
                    <!-- 검색창 -->
                    <div class="col-lg-5 d-flex align-items-center">
                        <input class="form-control border-0 shadow-0 " id="searchValue2" name="searchValue" type="search" value="<%=searchValue%>" placeholder="검색어를 입력해주세요 ">
                    </div>
                    <!-- 검색버튼 -->
                    <div class="col-lg-1 d-grid mb-0">
                        <button class="btn btn-primary rounded-pill h-100 " style="font-weight: bolder;" type="submit">검색 </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 메인 끝 -->

    <!-- 제품 시작 -->
    <section>
        <div class="container mb-6">
            <div class="row mb-5">
                <div class="col-md-12 fs-2" style="text-align: center; font-weight: bold; color: #F05945;">
                    <img src="<%=path%>/resources/img/img_semi/campitem01_02.png" alt="Image" width="50px">캠핑용품
                </div>
            </div>
         
         <div class="row">
         <%if(list == null || list.isEmpty()){ %>
						<div style="text-align:center;">조회된 상품이 없습니다.</div>
		<%} else { %>
	         <%for(CampingItemVO campingItem : list) {%>
	                <!-- place item-->
	                <div class="col-sm-6 col-lg-3 mb-30px hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
	                    <div class="card h-100 border-0 shadow">
	                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="<%=campingItem.getCi_image() %>" style="height: 220px; width: 306px;" />
	                            <a class="tile-link" href="<%=campingItem.getCi_link()%>"></a>
	                        </div>
	                        <div class="card-body d-flex align-items-center">
	                            <div class="w-100">
	                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="<%=campingItem.getCi_link()%>"><%=campingItem.getCi_title()%></a></h6>
	                                <div class="d-flex card-subtitle mb-3">
	                                    <p class="flex-grow-1 mb-0 text-muted text-sm"><%=campingItem.getCi_brand()%></p>
	                                </div>
	                                <p class="card-text text-mutedCustom1"><%=campingItem.getCi_price()%>원</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            <%} %>
	          <%} %>
            </div>
        </div>
        <!-- 제품 끝 -->
    </section>
    <section>
    <!-- 페이지 버튼 시작-->
    <nav aria-label="Page navigation example">
            <ul
               class="pagination pagination-template d-flex justify-content-center">
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/campingItem/Detail?page=<%=pageInfo.getStartPage() %>');">
                     <i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>
               </a></li>
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/campingItem/Detail?page=<%=pageInfo.getPrvePage()%>');">
                     <i class="fa fa-angle-left"></i>
               </a></li>
               <%--5페이지 출력하기 --%>
               <% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
               		<%if(i == pageInfo.getCurrentPage()){ %>
               		<li class="page-item active">
               		<button class="page-link" disabled><%=i%></button></li>
               		<%} else{%>
               		<li class="page-item">
               		<button class="page-link" onclick="movePage('<%=path %>/campingItem/Detail?page=<%=i%>');"><%=i%></button></li>
               		<%} %>
              	 <%} %>

               <%--다음으로 가기 --%>
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/campingItem/Detail?page=<%=pageInfo.getNextPage() %>');">
                     <i class="fa fa-angle-right"></i>
               </a></li>
               <li class="page-item"><a class="page-link"
                  onclick="movePage('<%=path %>/campingItem/Detail?page=<%=pageInfo.getEndPage() %>');">
                     <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
               </a></li>
            </ul>
         </nav>
    <!-- 페이지 버튼 끝-->   
    </section>
    
<script type="text/javascript">
	function movePage(pageUrl){
		var searchValue = document.getElementById("searchValue2");
		var searchType = document.getElementById("searchType");
		if(searchValue.value.length > 0){
			var selectValue = searchType.options[searchType.selectedIndex].value;
			pageUrl = pageUrl + '&searchType=' + selectValue + '&searchValue=' + searchValue.value; 
		}
//		alert(pageUrl);
		location.href = encodeURI(pageUrl);	
	}
</script>
    

    <!-- ============================================================================================================================== -->

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
    
    
    

<%@include file="/views/07_common/footer.jsp" %>
</body>
</html>