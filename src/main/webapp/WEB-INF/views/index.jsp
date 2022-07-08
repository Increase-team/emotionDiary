<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>emotionDiary</title>
<link rel="shortcut icon" href="/resources/static/images/favicon.ico">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<style>
@font-face {
	font-family: 'ParkYongJun';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/ParkYongJun.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'CBNUJIKJI';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202@1.0/CBNUJIKJI.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.jb-box {
	width: auto;
	height: 100%;
	overflow: hidden;
	margin: 0px auto;
	position: relative;
}

video {
	width: 100%;
	height: auto;
	object-fit: cover;
}

.jb-text {
	position: absolute;
	top: 15%;
	width: 100%;
	text-align: center;
}

.jb-text h1 {
	color: #ffffff;
	margin-bottom: 30px;
	font-family: 'ParkYongJun';
}

.jb-text a {
	text-decoration: none;
	cursor: pointer;
	padding: 12px 28px;
	border: 1px solid red;
	color: #ffffff;
	font-size: 20px;
}

.jb-text a:hover {
	border: 1px solid red;
	background-color: red;
	transition: 1000ms;
}

.swiper {
	width: 800px;
	height: 500px;
	text-align: center;
	margin-top: 70px;
	margin-bottom: 50px;
}

.swiper-button-next, .swiper-button-prev {
	color: white;
}

.slide-img0 {
	border-radius: 10px;
	width: 100%;
	height: 400px;
}

.slide-img1 {
	border-radius: 10px;
	width: 100%;
	height: 400px;
	background-image: url(/resources/static/images/캡처1.PNG);
	background-position: center;
	background-size: cover;
}

.slide-img2 {
	border-radius: 10px;
	width: 100%;
	height: 400px;
	background-image: url(/resources/static/images/캡처2.PNG);
	background-position: center;
	background-size: cover;
}

.slide-img3 {
	border-radius: 10px;
	width: 100%;
	height: 400px;
	background-image: url(/resources/static/images/캡처3.PNG);
	background-position: center;
	background-size: cover;
}

.slide-img4 {
	border-radius: 10px;
	width: 100%;
	height: 400px;
	background-image: url(/resources/static/images/캡처4.PNG);
	background-position: center;
	background-size: cover;
}

.slide-img5 {
	border-radius: 10px;
	width: 100%;
	height: 400px;
	background-image: url(/resources/static/images/캡처5.PNG);
	background-position: center;
	background-size: cover;
}

.menual {
	font-family: 'CBNUJIKJI';
	font-weight: 800;
}

.start {
	text-align: center;
	font-size: 50px;
	margin-top: 200px;
}
</style>
</head>
<body>
	<div class="jb-box">
		<video muted autoplay loop>
			<source src="/resources/static/video/night.mp4" type="video/mp4" />
		</video>
		<div class="jb-text">
			<h1>여러분의 오늘은 어떤 감정이었는지 저장해볼까요.</h1>
			<!-- Slider main container -->
			<div class="swiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<div class="swiper-slide">
						<div class="slide-img0">
							<h1 class="start">사용 방법 설명</h1>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide-img1"></div>
						<div class="menual">화면 아래에 시작하기를 클릭후 로그인을 하게되면 달력이 등장합니다.</div>
					</div>
					<div class="swiper-slide">
						<div class="slide-img2"></div>
						<div class="menual">달력 좌측에 6개의 버튼 중 하나를 선택하여 오늘 하루 나의 감정과
							일상을 기록 후 등록해보세요.</div>
					</div>
					<div class="swiper-slide">
						<div class="slide-img3"></div>
						<div class="menual">오늘 하루 나의 감정과 일상을 등록하면 해당 감정의 색상이 달력에 기록이
							됩니다.</div>
					</div>
					<div class="swiper-slide">
						<div class="slide-img4"></div>
						<div class="menual">메뉴를 활성화하여 일기장으로 이동하면 등록하였던 내용들을 확인할 수
							있습니다.</div>
					</div>
					<div class="swiper-slide">
						<div class="slide-img5"></div>
						<div class="menual">메뉴를 활성화하여 통계를 클릭하면 등록했던 감정의 횟수를 확인할 수
							있습니다.</div>
					</div>
				</div>
				<!-- If we need pagination -->
				<div class="swiper-pagination"></div>

				<!-- If we need navigation buttons -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
			<a href="/login">시작하기</a>
		</div>
	</div>
	<script>
      const swiper = new Swiper(".swiper", {
        // Optional parameters
        loop: true,

        // If we need pagination
        pagination: {
          el: ".swiper-pagination",
        },

        // Navigation arrows
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
</body>
</html>
