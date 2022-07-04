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
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
    />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <style>
    @font-face {
    font-family: 'ParkYongJun';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/ParkYongJun.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      html,body {
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
      /* .jb-text p {
        margin-top: 8px;
        padding: 30px;
        font-size: 24px;
        color: #ffffff;
      } */
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
      .swiper-button-next,
      .swiper-button-prev{
      	color: white;
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
            <div class="swiper-slide">Slide 1</div>
            <div class="swiper-slide">Slide 2</div>
            <div class="swiper-slide">Slide 3</div>
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
