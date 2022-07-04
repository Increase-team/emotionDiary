<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" href="/resources/static/css/index.css" />
<link rel="stylesheet" href="/resources/static/css/index.css" />
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
	rel="stylesheet" />
<title>calendar todo</title>
</head>
<body>
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
	<div class="sideheader">
		<!-- 시간 및 날짜 -->
		<div id="date" class="date"></div>
		<div id="time" class="time"></div>
		<input id="hidden" type="hidden" value="" /> <input id="memberName"
			type="hidden" value="${list[0].memberName}" />
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
			<li class="picture"><a
				href="/calendar/diary?memberid=${list[0].memberName}">일기장</a></li>
			<li class="statistics"><a href="#layer" id="estimate"
				class="status">통계</a></li>
			<li class="logout"><a href="/logout">Logout</a></li>
		</ul>
	</div>
	<div class="main">
		<div class="content-wrap">
			<div class="content-left">
				<div class="main-wrap">
					<div id="main-day" class="main-day"></div>
					<div id="main-date" class="main-date"></div>
				</div>
				<input type="text" id="selected-color" readonly
					value="아래 버튼을 클릭해주세요.">
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
				<div class="todo-wrap">
					<input id="boardIdHidden" type="hidden" />
					<div class="todo-title">그날의 기분을 적어보세요</div>
					<div class="input-wrap">
						<input type="text" placeholder="please write here!!"
							id="input-box" class="input-box" value="" />
						<button type="button" id="input-data" class="input-data">
							등록</button>
						<div id="input-list" class="input-list"></div>
					</div>
				</div>
			</div>
			<div class="content-right">
				<table id="calendar" align="center">
					<div class="hello">
						<input id="memberId" type="hidden" value="${list[0].memberId}"></input>
					</div>
					<thead>
						<tr class="btn-wrap clearfix">
							<td><label id="prev"> &#60; </label></td>
							<td align="center" id="current-year-month" colspan="5"></td>
							<td><label id="next"> &#62; </label></td>
						</tr>
						<tr>
							<td class="sun" align="center">Sun</td>
							<td align="center">Mon</td>
							<td align="center">Tue</td>
							<td align="center">Wed</td>
							<td align="center">Thu</td>
							<td align="center">Fri</td>
							<td class="sat" align="center">Sat</td>
						</tr>
					</thead>
					<tbody id="calendar-body" class="calendar-body"></tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="/resources/static/js/index.js"></script>
<script type="text/javascript">
//버튼클릭시 감정확인
	$("#happy").click(function () {
  		var plate = $("#happy").val();
  		$("#selected-color")[0].defaultValue = plate;
	});
	$("#soso").click(function () {
  		var plate = $("#soso").val();
  		$("#selected-color")[0].defaultValue = plate;
	});
	$("#romance").click(function () {
 		var plate = $("#romance").val();
  		$("#selected-color")[0].defaultValue = plate;
	});
	$("#angry").click(function () {
  		var plate = $("#angry").val();
  		$("#selected-color")[0].defaultValue = plate;
	});
	$("#sad").click(function () {
  		var plate = $("#sad").val();
  		$("#selected-color")[0].defaultValue = plate;
	});
	$("#irritation").click(function () {
  		var plate = $("#irritation").val();
  		$("#selected-color")[0].defaultValue = plate;
	});

  //달력 저장
  var time = new Date(+new Date() + 3240 * 10000)
    .toISOString()
    .split("T")[0]
    .replace("-", "")
    .replace("-", "");
  console.log(time);
  var monthFirstday = time.slice(0,6) + "01";
  console.log(monthFirstday);
  var day = new Date()
  console.log(day)
  day = "00"+day.getDate();
  var dayslice =  day.slice(1,3);
  console.log(dayslice)
  
  var memberId = $("#memberId").val();
  console.log("==>"+memberId)
  var memberName = $("#memberName").val();
  console.log("=>"+memberName);
  
  $("#input-data").click(function () {
	  
    var content = $("#input-box").val();
    var calendarEmotion = $("#selected-color")[0].defaultValue;
    var memberId = $("#memberId").val();
    
    if(calendarEmotion == "아래 버튼을 클릭해주세요."){
		alert("감정이 선택되지 않았습니다.")
    	return 0;
    }

    var jsonData = {
      memberId : memberId,
      calendarEmotion: calendarEmotion,
      calendarCode: time,
      calendarMonthFirstDay : monthFirstday,
      content: content
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
        } else {
          alert("이미 오늘은 등록을 하였습니다.");
        }
      },
    });
  });
  getCalendarList(${list[0].memberName})
  //달력 조회
  function getCalendarList(memberName) {
	  var calendarList = '';
    $.ajax({
      url: "/calendar/" + memberName+"/"+monthFirstday+"/"+time,
      type: "GET",
      dataType: "json",
      success: (response) => {
        console.log("---->"+response[0].calendarEmotion);
		for(i=0; i<2; i++){ //나중에 dayslice 사용.
			console.log(response[i].calendarEmotion)
		if(response[i].calendarEmotion == "기쁨"){
			$("#"+i).css('background-color',"yellow")
		}
		if(response[i].calendarEmotion == "보통"){
			$("#"+i).css('background-color',"silver")
		}
		if(response[i].calendarEmotion == "설렘"){
			$("#"+i).css('background-color',"pink")
		}
		if(response[i].calendarEmotion == "분노"){
			$("#"+i).css('background-color',"red")
		}
		if(response[i].calendarEmotion == "슬픔"){
			$("#"+i).css('background-color',"blue")
		}
		if(response[i].calendarEmotion == "짜증"){
			$("#"+i).css('background-color',"orengered")
		}
		
		}
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
  </script>
</html>
