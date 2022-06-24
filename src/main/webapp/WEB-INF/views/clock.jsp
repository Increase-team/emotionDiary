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
    <link rel="stylesheet" href="/resources/static/css/clock.css" />
  </head>
  <body>
    <div class="container">
      <div class="menu">
        <ul>
          <li><a href="/login">로그인</a></li>
          <li><a href="/join">회원가입</a></li>
          <li><a href="#">도움말</a></li>
        </ul>
      </div>
      <div id="time" class="time"></div>
      <div id="date" class="date"></div>
    </div>
  </body>
  <script src="/resources/static/js/clock.js"></script>
</html>
