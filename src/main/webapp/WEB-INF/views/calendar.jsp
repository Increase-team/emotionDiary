<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/static/css/cal.css">
</head>
<body>
  <div class="container">
    <div class="sideheader">
      <div class="emotion">
        <div class="positive">
          <div class="happy">
            <p>기쁨</p>
            <div class="happy-color"></div>
          </div>
          <div class="soso">
            <p>보통</p>
            <div class="soso-color"></div>
          </div>
          <div class="romance">
            <p>설렘</p>
            <div class="romance-color"></div>
          </div>
        </div>
        <div class="negetive">
          <div class="angly">
            <p>분노</p>
            <div class="angly-color"></div>
          </div>
          <div class="sad">
            <p>슬픔</p>
            <div class="sad-color"></div>
          </div>
          <div class="issitation">
            <p>짜증</p>
            <div class="issitation-color"></div>
          </div>
        </div>
      </div>
      <div class="list">
        <div class="picture">
          <a href="#">시작화면</a>
        </div>
        <div class="statistics">
          <a href="#">통계</a>
        </div>
        <div class="question">
          <a href="#">도움말</a>
        </div>
        <div class="logout">
          <a href="/main">Logout</a>
        </div>
      </div>
    </div>
      <div class="cleanderbox">
        <div class="calendar">
          <div class="header">
            <div class="nav">
              <button class="nav-btn go-prev" onclick="prevMonth()"><i class="fa-solid fa-chevron-left"></i></button>
              <!-- <button class="nav-btn go-today" onclick="goToday()">Today</button> -->
              <div class="year-month"></div>
              <button class="nav-btn go-next" onclick="nextMonth()"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
          </div>
          <div class="main">
            <div class="days">
              <div class="day">일</div>
              <div class="day">월</div>
              <div class="day">화</div>
              <div class="day">수</div>
              <div class="day">목</div>
              <div class="day">금</div>
              <div class="day">토</div>
            </div>
            <div class="dates"></div>
          </div>
        </div>
      </div>
  </div>
  <script src="https://kit.fontawesome.com/7f3a427fdf.js" crossorigin="anonymous"></script>    
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="/resources/static/js/cal.js"></script>
   
</body>
</html>