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
    <style>
      body {
        padding: 0px;
        margin: 0px;
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
      }
      .jb-text {
        position: absolute;
        top: 30%;
        width: 100%;
        text-align: center;
      }
      .jb-text h2 {
        color: #ffffff;
      }
      .jb-text p {
        margin-top: 8px;
        font-size: 24px;
        color: #ffffff;
      }
      .jb-text a {
        margin-top: 18px;
      	text-decoration : none;
		cursor:pointer;
        padding: 12px 34px;
        border: 1px solid red;
        color: #ffffff;
      }
      .jb-text a:hover{
      	border : 1px solid red;
      	background-color: red;
      	transition: 1000ms
      }
    </style>
  </head>
  <body>
    <div class="jb-box">
      <video muted autoplay loop>
        <source src="/resources/static/video/night.mp4" type="video/mp4" />
      </video>
      <div class="jb-text">
        <h2>TEST</h2>
        <p>여러분의 오늘은 어떤 감정이었는지 저장해볼까요.</p>
        <a href="/login">시작하기</a>
      </div>
    </div>
  </body>
</html>
