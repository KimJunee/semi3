<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none ">
        <hr size="4 ">
        <!-- Main block - menus, subscribe form-->
        <div class=" pt-4 text-muted ">
            <div class="container ">
                <div class="row ">
                    <div class="col-lg-8 ">
                        <img src="<%=request.getContextPath()%>/resources/img/img_semi/logo05.png " width="100px ">
                        <p style="font-size:12px; ">서울 특별시 강남구 테헤란로 14길 6 남도빌딩 2층,3층4층 R강의실(06234)</p>
                        <p style="font-size:12px; ">Email : KHINFO1234@gmail.com</p>
                    </div>
                    <div class="col-lg-2 " style=" text-align: center; ">
                        <h6 class="text-dark ">CUSTOMER INFO</h6>
                        <p style="font-weight: bolder; color: #F05945; "> 02-169-9852</p>
                        <p style="font-size:11px; "> 평일 : 오전 09:00~오후 06:00</p>
                    </div>
                    <div class="col-lg-2 " style=" text-align: center; ">
                        <h6 class="text-dark ">BANK INFO</h6>
                        <p style="font-weight: bolder; color: #F05945; "> 123-45-6789</p>
                        <p style="font-size:11px; "> KH은행 예금주 (주)모닥불 디자인하우스</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright section of the footer-->
        <div class="py-4 fw-light text-dark mb-5 ">
            <div class="col-lg-12 text-center ">
                <hr>
                <p class="text-sm mb-md-3 ">팀원소개 | 캠핑장 등록안내 | 캠핑용품등록안내 | 개인정보 취급방침 | 이용안내 | 회원이용약관</p>
                <p class="text-sm mb-md-3 ">&copy; 2021, Your company. All rights reserved.</p>
            </div>
        </div>
    </footer>
    <!-- JavaScript files-->
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
    <!-- jQuery-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="<%=request.getContextPath()%>/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="<%=request.getContextPath()%>/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="<%=request.getContextPath()%>/resources/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <!-- datePicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js">
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js">
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/my_datepicker-category.js"></script>
    <!-- Main Theme JS file    -->
    <script src="<%=request.getContextPath()%>/resources/js/theme.js"></script>

    <%--// ------------------------------------------------------- // // Inject SVG Sprite - // see more here // https://css-tricks.com/ajaxing-svg-sprite/ // ------------------------------------------------------ // function injectSvgSprite(path) { var ajax
    = new XMLHttpRequest(); ajax.open("GET", path, true); ajax.send(); ajax.onload = function(e) { var div = document.createElement("div"); div.className = 'd-none'; div.innerHTML = ajax.responseText; document.body.insertBefore(div, document.body.childNodes[0]);
    } } // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite // use your own URL in production, please :) // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg //- injectSvgSprite('${path}icons/orion-svg-sprite.svg');
    injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); --%>
	
    <!-- Daterange picker-->
    <script src="<%=request.getContextPath()%>/resources/js/datepicker-category.js">
    </script>
    <!-- Price Slider-->
    <script src="<%=request.getContextPath()%>/resources/vendor/nouislider/nouislider.min.js"></script>
    <script>
        /* var snapSlider = document.getElementById('slider-snap');
        noUiSlider.create(snapSlider, {
            start: [40, 110],
            snap: false,
            connect: true,
            step: 1,
            range: {
                'min': 40,
                'max': 110
            }
        });
        var snapValues = [
            document.getElementById('slider-snap-value-from'),
            document.getElementById('slider-snap-value-to')
        ];
        var inputValues = [
            document.getElementById('slider-snap-input-from'),
            document.getElementById('slider-snap-input-to')
        ];
        snapSlider.noUiSlider.on('update', function(values, handle) {
            snapValues[handle].innerHTML = values[handle];
            inputValues[handle].value = values[handle];
        }) */
    </script>
  <%--   <!-- Map -->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
	<!-- Available tile layers-->
	<script src="<%=request.getContextPath()%>/resources/js/map-layers.js">
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/map-detail.js">
	</script>
	<script>
		createDetailMap({
		mapId: 'detailSideMap',
		mapZoom: 18,
		mapCenter: [40.732346, -74.0014247],
		markerShow: true,
		markerPosition: [40.732346, -74.0014247],
		markerPath: 'img/marker.svg',
		})
	</script> --%>
</body>
</html>