<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%
String mypath = request.getContextPath();
%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>모닥불 - 회원가입</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="<%=mypath%>/resources/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="<%=mypath%>/resources/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="<%=mypath%>/resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="<%=mypath%>/resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<%=mypath%>/resources/img/favicon.png">
    <!-- Tweaks for older IEs-->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<body>
    <div class="container-fluid px-3">
        <div class="row min-vh-100">
            <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
                <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
                    <div class="grid-image">
                        <img src="<%=mypath%>/resources/img/img_semi/hikingtrail.png" alt="" style="max-width: 4rem;">
                        <img src="<%=mypath%>/resources/img/img_semi/caravan.png" alt="" style="max-width: 4rem;">
                        <img src="<%=mypath%>/resources/img/img_semi/glamping.png" alt="" style="max-width: 4rem;">
                        <img src="<%=mypath%>/resources/img/img_semi/carbak01.png" alt="" style="max-width: 4rem;">
                        <h2>회원가입</h2>
                    </div>
                    <form class="form-validate" action="<%=request.getContextPath()%>/member/enroll" method="POST">
                        <div class="mb-4">
                            <input class="form-control" name="newId" id="newId" type="text" placeholder="ID" autocomplete="off" required data-msg="Please enter your email">
                        </div>
                        <div class="mb-4">
                            <input class="form-control" name="userName" id="userName" placeholder="NAME" type="text" required data-msg="Please enter your password">
                        </div>
                        <div class="mb-4">
                            <input class="form-control" name="userPwd" id="pass1" placeholder="PASSWORD" type="password" required data-msg="Please enter your password">
                        </div>
                        <div class="mb-4">
                            <input class="form-control" name="loginPassword2" id="pass2" placeholder="CONFIRMPASSWORD" type="password" required data-msg="Please enter your password">
                        </div>
                        <div class="mb-4">
                            <input class="form-control" name="phone" id="phone" placeholder="PHONE" type="tel" required data-msg="Please enter your password">
                        </div>
                        <div class="mb-4">
                            <input class="form-control" name="Birth" id="Birth" placeholder="Birth (YYYY-MM-DD)" type="text" required data-msg="Please enter your password">
                        </div>
                        <div class="mb-4">
                            <input class="form-control" name="email" id="email" placeholder="E-MAIL" type="email" required data-msg="Please enter your password">
                        </div>
                        <div class="d-grid gap-2">
                            <button class="btn btn-lg btn-primary" type="submit">회원등록</button>
                        </div>
                        <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
                        <div class="d-grid gap-2">
                            <button class="btn btn-lg btn-primary2"><img src="<%=mypath%>/resources/img/img_semi/kakao.jpg" width="40px" height="40px"> 카카오 로그인</button>
                        </div>
                        <hr class="my-4">
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" id="loginRemember" type="checkbox">
                                <label class="form-check-label text-muted" for="loginRemember"> <span class="text-sm">홈페이지 이용약관 및 개인정보 수집∙이용에 동의합니다.</span></label>
                            </div>
                        </div>
                    </form>
                    <a class="close-absolute me-md-5 me-xl-6 pt-5" href="<%=mypath%>/views/06_User/signin.jsp">
                        <svg class="svg-icon w-3rem h-3rem">
                <use xlink:href="#close-1"> </use>
              </svg></a>
                </div>
            </div>
            <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
                <!-- Image-->
                <div class="bg-cover h-100 me-n3" style="background-image: url(<%=mypath%>/resources/img/img_semi/img2.jpg);"></div>
            </div>
        </div>
    </div>
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
    <script src="<%=mypath%>/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="<%=mypath%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="<%=mypath%>/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="<%=mypath%>/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="<%=mypath%>/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="<%=mypath%>/resources/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="<%=mypath%>/resources/https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <!-- Main Theme JS file    -->
    <script src="<%=mypath%>/resources/js/theme.js"></script>
</body>
</html>