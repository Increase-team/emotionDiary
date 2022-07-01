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
    <link rel="stylesheet" href="/resources/static/css/calendar.css">
  </head>

  <body>
    <div class="container">
      <!-- 팝업창 -->
      <div class="write-popup">
        <div class="editor">
          <input type="text" id="selected-color" readonly value="아래 버튼을 클릭해주세요.">
          <div class="color-select">
            <input id="hidden" type="hidden" val="" />
            <div id="positive">
              <button id="happy" value="기쁨"></button>
              <button id="soso" value="보통"></button>
              <button id="romance" value="설렘"></button>
            </div>
            <div id="negetive">
              <button id="angry" value="분노"></button>
              <button id="sad" value="슬픔"></button>
              <button id="irritation" value="짜증"></button>
            </div>
          </div>
          <div class="input-box">
            <textarea
              id="content"
              rows="7"
              cols="50"
              placeholder="내용을 간단히 적어주세요..."
            ></textarea>
          </div>
          <div class="btn-area">
            <input id="boardIdHidden" type="hidden" />
            <a href="#" class="cancel">취소</a>
            <a id="contentSubmit" href="#" class="success">등록</a>
          </div>
        </div>
      </div>
<!-- 통계 팝업 -->
      <div id="layer">
        <div class="inner">
          <div class="cont">
            <div id="estimate">
                <div class="cardBox">
                  <div class="card">
                      <div>
                        <div id="happycnt" class="numbers">1,400</div>
                        <div class="cardName">기쁨</div>
                      </div>
                      <div class="iconBx">
                        <ion-icon name="school-outline"></ion-icon>
                      </div>
                  </div>
                  <div class="card">
                    <div>
                        <div id="sosocnt" class="numbers">500</div>
                        <div class="cardName">보통</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="book-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div id="romancecnt" class="numbers">300</div>
                        <div class="cardName">설렘</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="code-slash-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div id="angrycnt" class="numbers">2,800</div>
                        <div class="cardName">분노</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="eye-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                  <div>
                      <div id="sadcnt" class="numbers">2,800</div>
                      <div class="cardName">슬픔</div>
                  </div>
                  <div class="iconBx">
                      <ion-icon name="eye-outline"></ion-icon>
                  </div>
              </div>
              <div class="card">
                <div>
                    <div id="irritationcnt" class="numbers">2,800</div>
                    <div class="cardName">짜증</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>
              </div>
            </div>
          </div>
          <a href="#none" class="close">close</a>
        </div>
      </div>
      <div class="dim"></div>
      <!-- 사이드 헤더 -->
            <div class="sideheader">
        <!-- 시간 및 날짜 -->
        <div id="date" class="date"></div>
        <div id="time" class="time"></div>
        <div class="hello">
         	<input id="memberId" type="hidden" value="${list[0].memberId}"></input>
      	</div>
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
            <div class="angry">
              <p>분노</p>
              <div class="angry-color"></div>
            </div>
            <div class="sad">
              <p>슬픔</p>
              <div class="sad-color"></div>
            </div>
            <div class="irritation">
              <p>짜증</p>
              <div class="irritation-color"></div>
            </div>
          </div>
        </div>
        <ul class="list">
          <li class="picture">
            <a href="/calendar/diary?memberid=${list[0].memberName}">일기장</a>
          </li>
          <li class="statistics">
            <a href="#layer" id="estimate" class="status">통계</a>
          </li>
          <li class="question">
            <a href="#">도움말</a>
          </li>
          <li class="logout">
            <a href="/main">Logout</a>
          </li>
        </ul>
      </div>
      <div class="calendarbox">
        <div class="calendar">
          <div class="header">
            <button class="calendar_btn" onclick="prevCal();">
              <i class="fa-solid fa-chevron-left"></i>
            </button>
            <div class="title">
              <span class="year"></span><span class="month"></span>
            </div>
            <button class="calendar_btn" onclick="nextCal();">
              <i class="fa-solid fa-chevron-right"></i>
            </button>
          </div>
          <div class="day">
            <div>S</div>
            <div>M</div>
            <div>T</div>
            <div>W</div>
            <div>T</div>
            <div>F</div>
            <div>S</div>
          </div>
          <div class="dates"></div>
        </div>
      </div>
    </div>
    <script
      src="https://kit.fontawesome.com/7f3a427fdf.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script>
      var CDate = new Date();
      var today = new Date();
      var selectCk = 0;

      var buildcalendar = function () {
        var htmlDates = "";
        var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날
        var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
        var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
        document.querySelector(".year").innerHTML = CDate.getFullYear() + "년"; // year에 년도 출력
        document.querySelector(".month").innerHTML = CDate.getMonth() + 1 + "월"; //month에 월 출력
        const dates = [];
        if (thisFirst.getDay() != 0) {
          for (var i = 0; i < thisFirst.getDay(); i++) {
            dates.unshift(prevLast.getDate() - i); // 지난 달 날짜 채우기
          }
        }
        for (var i = 1; i <= thisLast.getDate(); i++) {
          dates.push(i); // 이번 달 날짜 채우기
        }
        for (var i = 1; i <= 13 - thisLast.getDay(); i++) {
          dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
        }

        for (var i = 0; i < 42; i++) {
          valueDate = dates[i];
          if (i < thisFirst.getDay()) {
            htmlDates += '<div class="date last">' + dates[i] + "</div>";
          } else if (
            today.getDate() == dates[i] &&
            today.getMonth() == CDate.getMonth() &&
            today.getFullYear() == CDate.getFullYear()
          ) {
        	  htmlDates += '<div id="date_' + dates[i] + '" class="date-today" onclick="xx()">' + dates[i] + "</div>";
        	  $("#happy").click(function () {
                  $(".date-today").css("background-color", "yellow");
                });
                $("#soso").click(function () {
                  $(".date-today").css("background-color", "silver");
                });
                $("#romance").click(function () {
                  $(".date-today").css("background-color", "pink");
                });
                $("#angry").click(function () {
                  $(".date-today").css("background-color", "red");
                });
                $("#sad").click(function () {
                  $(".date-today").css("background-color", "blue");
                });
                $("#irritation").click(function () {
                  $(".date-today").css("background-color", "orangered");
                });
          } else if (i >= thisFirst.getDay() + thisLast.getDate()) {
            htmlDates += '<div class="date next">' + dates[i] + "</div>";
          } else if (
            i <= thisFirst.getDay() + thisLast.getDate() &&
            dates[i] < today.getDate()
          ) {
            htmlDates +=
              '<div id="date_' +
              dates[i] +
              '" class="date" >' +
              dates[i] +
              "</div>";
          } else if (
            i <= thisFirst.getDay() + thisLast.getDate() &&
            dates[i] > today.getDate()
          ) {
            htmlDates +=
              '<div id="date_' +
              dates[i] +
              '" class="date">' +
              dates[i] +
              "</div>";
          }
        }

        document.querySelector(".dates").innerHTML = htmlDates;
      };

      function prevCal() {
        CDate.setMonth(CDate.getMonth() - 1);
        buildcalendar();
      }
      function nextCal() {
        CDate.setMonth(CDate.getMonth() + 1);
        buildcalendar();
      }

      buildcalendar();

      $(function () {
        var embed = $("#player"); //동영상 코드

        $(".status").on("click", function () {
          //레이어 열때
          var path = $(this).attr("href");
          $(".cont").append(embed);
          $(path).show();
          $(".dim").show();
        });

        $(".close").on("click", function () {
          //레이어 닫을때
          $(this).parents("#layer").hide();
          $(".dim").hide();
          $(".cont").empty();
          location.reload();
        });

        $(".dim").on("click", function () {
          $(this).hide();
          $("#layer").hide();
          $(".cont").empty();
        });
      });
      //시계 함수
      function setClock(){
          var dateInfo = new Date(); 
          var hour = modifyNumber(dateInfo.getHours());
          var min = modifyNumber(dateInfo.getMinutes());
          var sec = modifyNumber(dateInfo.getSeconds());
          var year = dateInfo.getFullYear();
          var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해준다.
          var date = dateInfo.getDate();
          document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
          document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
          }
          function modifyNumber(time){
              if(parseInt(time)<10){
                  return "0"+ time;
              }
              else
                  return time;
          }
          window.onload = function(){
              setClock();
              setInterval(setClock,1000); //1초마다 setClock 함수 실행
          }

      //팝업관련
      // $('.space').click(function(){
      // $('.write-popup').css('display', 'block');
      // });
      // $('.cancel').click(function(){
      // $('.write-popup').css('display', 'none');
      // });

      function xx() {
        $(".write-popup").css("display", "block");
        $(".cancel").click(function () {
          $(".write-popup").css("display", "none");
          location.reload();
        });
      }

    </script>
    <script>
      $("#happy").click(function () {
        var plate = $("#happy").val();
        $('#selected-color')[0].defaultValue = plate;
      });
      //console.log($("#selected-color")[0].innerHTML);
      $("#soso").click(function () {
        var plate = $("#soso").val();
        $('#selected-color')[0].defaultValue = plate;
      });
      $("#romance").click(function () {
        var plate = $("#romance").val();
        $('#selected-color')[0].defaultValue = plate;
      });
      $("#angry").click(function () {
        var plate = $("#angry").val();
        $('#selected-color')[0].defaultValue = plate;
      });
      $("#sad").click(function () {
        var plate = $("#sad").val();
        $('#selected-color')[0].defaultValue = plate;
      });
      $("#irritation").click(function () {
        var plate = $("#irritation").val();
        $('#selected-color')[0].defaultValue = plate;
      });

   // 클릭시 사이드헤더 색 변경
      let list = document.querySelectorAll('.list li');
      function activeLink(){
        list.forEach((item) => {item.classList.remove('hovered')});
        this.classList.add('hovered');
      }
      list.forEach((item) => {item.addEventListener('mouseover',activeLink)});
      
      //달력 저장
      var time = new Date(+new Date() + 3240 * 10000)
        .toISOString()
        .split("T")[0]
        .replace("-", "")
        .replace("-", "");
      console.log(time);
      
      var memberId = $("#memberId").val();
      console.log(memberId)
      
      $("#contentSubmit").click(function () {

        var content = $("#content").val();
        var calendarEmotion = $("#selected-color")[0].defaultValue;
        var memberId = $("#memberId").val();

        var jsonData = {
          memberId : memberId,
          calendarEmotion: calendarEmotion,
          calendarCode: time,
          content: content,
        };
        
        // AJAX 세팅
        $.ajax({
          url: "/calendar/save",
          type: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(jsonData),
          success: function (response) {
            if (response) {
              alert("등록되었습니다.")
              $(".write-popup").css("display","none");
            } else {
              alert("이미 오늘은 등록을 하였습니다.");
            }
          },
        });
      });
      //달력 조회
      function getCalendarList(memberId) {
        $.ajax({
          url: "/calendar/" + memberId,
          type: "GET",
          dataType: "json",
          success: (response) => {
            console.log(response);
          },
        });
      }
      getcalendarEmotion(${list[0].memberId});

      function getcalendarEmotion(memberId){
        $.ajax({
          url: "/calendar/statistics/"+memberId,
          type:"GET",
          dataType:"json",
          success: (data) =>{
            console.log(data)
            $('#happycnt').text(data.happy);
            $('#sosocnt').text(data.soso);
            $('#romancecnt').text(data.romance);
            $('#angrycnt').text(data.angry);
            $('#sadcnt').text(data.sad);
            $('#irritationcnt').text(data.irritation);
          }
        })
      }
    </script>
  </body>
</html>
