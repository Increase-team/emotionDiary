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
<style>
.pagination{
    text-align: center;
    margin-top: 50px;
}

.pagination a{
    padding: 0.5rem 0.75rem;
    text-decoration: none;
    background-color: white;
    color: blue;
    border: 1px solid #dddfeb;
    line-height: 1.45;
    font-size: 18px;
}
.pagination a:hover{
    background-color: blue;
    color: white;
}
#searchBar{
	position: relative;
	left: 85%;
}
.search button{
	position: relative;
	left: 85%;
}
    </style>
<link rel="stylesheet" href="/resources/static/css/calendar.css">
</head>
<body>
	<div class="container">
		<!-- 통계 팝업 -->
		<div id="layer">
			<div class="inner">
				<div class="cont">
					<div id="estimate">
						<div class="cardBox">
							<div class="card">
								<div>
									<div id="happycnt" class="numbers">0</div>
									<div class="cardName">기쁨</div>
								</div>
								<div class="iconBx">
									<ion-icon name="school-outline"></ion-icon>
								</div>
							</div>
							<div class="card">
								<div>
									<div id="sosocnt" class="numbers">0</div>
									<div class="cardName">보통</div>
								</div>
								<div class="iconBx">
									<ion-icon name="book-outline"></ion-icon>
								</div>
							</div>
							<div class="card">
								<div>
									<div id="romancecnt" class="numbers">0</div>
									<div class="cardName">설렘</div>
								</div>
								<div class="iconBx">
									<ion-icon name="code-slash-outline"></ion-icon>
								</div>
							</div>
							<div class="card">
								<div>
									<div id="angrycnt" class="numbers">0</div>
									<div class="cardName">분노</div>
								</div>
								<div class="iconBx">
									<ion-icon name="eye-outline"></ion-icon>
								</div>
							</div>
							<div class="card">
								<div>
									<div id="sadcnt" class="numbers">0</div>
									<div class="cardName">슬픔</div>
								</div>
								<div class="iconBx">
									<ion-icon name="eye-outline"></ion-icon>
								</div>
							</div>
							<div class="card">
								<div>
									<div id="irritationcnt" class="numbers">0</div>
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
				<input id="memberName" type="hidden" value="${list.list[0].memberName}"></input>
				<input id="memberId" type="hidden" value="${list.list[0].memberId}">
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
				<li class="picture"><a
					href="/calendar/list?membername=${list.list[0].memberName}">달력</a></li>
				<li class="statistics"><a href="#layer" id="player"
					class="status">통계</a></li>
				<li class="logout"><a href="/logout">Logout</a></li>
			</ul>
		</div>
		<div class="update-popup">
			<div class="editor">
				<h3 class="changeEmotion">
					변경전 <input id="DBemotion" readonly value="">
				</h3>
				<h3 class="changeEmotion">
					변경후 <input type="text" id="upt-title" readonly value="">
				</h3>
				<div class="color-select">
					<input id="inputHidden" type="hidden" val="" />
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
					<textarea id="upt-content" rows="10" cols="65"
						placeholder="내용을 간단히 적어주세요..."></textarea>
				</div>
				<div class="btn-area">
					<a id="contentClose" href="#" class="btn-close">닫기</a> <a
						id="contentUpdate" href="#" class="btn-update">수정</a> <a
						id="contentDelete" href="#" class="btn-delete">삭제</a>
				</div>
			</div>
		</div>

		<main>
			<div class="diary">
				<div class="diary-title">
					<h2>Diary-List</h2>
			<div class="search">
          		<label>
            		<input
              			type="text"
              			id="searchBar"
              			placeholder="감정을 검색해보세요"
            		/>
            		<input id="keyword" type="hidden" value="null" />
          		</label>
          		<button onclick="getDiaryList(${list.list[0].memberName},1,15)">첫페이지</button>
        	</div>
        	
				</div>
				<div class="diary-content">
					<table>
						<thead>
							<tr>
								<th>코드번호</th>
								<th>감정</th>
								<th>내용</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list.list) > 0}">
									<c:forEach items="${list.list}" var="item">
										<tr onclick="getList(${item.calendarId})">
											<td>${item.calendarCode}</td>
											<td>${item.calendarEmotion}</td>
											<td>${item.content}</td>
											<td>${item.createAt}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan=4 style="text-align: center">작성글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
                            <!-- <tr>
                                <td>1</td>
                                <td>설렘</td>
                                <td>나는전설이다</td>
                                <td>2022-06-06</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>분노</td>
                                <td>운빨X망겜</td>
                                <td>2022-06-22</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>보통</td>
                                <td>특별할것 없는 하루</td>
                                <td>2022-06-25</td>
                            </tr> -->
                             		
						</tbody>
					</table>
					 <div class="pagination">
            			<!-- <a href="#">Previous</a>
            			<a href="#">1</a>
            			<a href="#">2</a>
            			<a href="#">3</a>
            			<a href="#">4</a>
            			<a href="#">5</a>
            			<a href="#">Next</a> -->
						<%-- <c:if test="${list.hasPreviousPage}">
		                	<!-- <a onclick="getLogsList(1, 20)">처음</a> -->
		                 	<a onclick="getDiaryList(${list.list[0].memberName}, ${list.pageNum - 1}, 20)">이전</a>
		                </c:if>
		         		<c:forEach begin="${list.navigateFirstPage}" end="${list.navigateLastPage}" var="pageNum">
		          			<a id="pageNum${pageNum}" onclick="getDiaryList(${list.list[0].memberName}, ${pageNum}, 20)">${pageNum}</a>
		         		</c:forEach>
		         		<c:if test="${list.hasNextPage}">
		                	<a onclick="getLogsList(${list.pageNum + 1}, 20)"> > </a>
		                	<a onclick="getDiaryList(${list.list[0].memberName}, ${list.pages}, 20)">다음</a>
		                </c:if> --%>
		                <c:choose>
						<c:when test="list.list.calendarEmotion.equals('null')">
							<c:if test="${list.hasPreviousPage}">
								<a onclick="getDiaryList(${list.list[0].memberName}, ${pageNum-1} ,15)">Previous</a>
							</c:if>
							<c:forEach begin="${list.navigateFirstPage}"
								end="${list.navigateLastPage}" var="pageNum">
								<a id="pageNum${pageNum}" onclick="getDiaryList(${list.list[0].memberName}, ${pageNum},15)">${pageNum}</a>
							</c:forEach>
							<c:if test="${list.hasNextPage}">
								<a onclick="getDiaryList(${list.list[0].memberName},${list.pageNum+1},15)">Next</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${list.hasPreviousPage}">
								<a onclick="getSearchFirstPage(${list.list[0].memberName},${list.pageNum-1},15,'${param.search}')">Previous</a>
							</c:if>
							<c:forEach begin="${list.navigateFirstPage}"
								end="${list.navigateLastPage}" var="pageNum">
								<a id="pageNum${pageNum}"
									onclick="getSearchFirstPage(${list.list[0].memberName},${pageNum},15,'${param.search}')">${pageNum}
								</a>
							</c:forEach>
							<c:if test="${list.hasNextPage}">
								<a
									onclick="getSearchFirstPage(${list.list[0].memberName},${list.pageNum+1},15,'${param.search}')">Next</a>
							</c:if>
						</c:otherwise>
					</c:choose>
 				</div>
			<input id="nowPageNum" type="hidden" value="${list.pageNum}">
				</div>
			</div>
		</main>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script>
  		//시계 함수
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
      $('.btn-close').click(function(){
          $('.update-popup').css('display', 'none');
      })

$('.btn-close').click(function(){
        $('.update-popup').css('display', 'none');
    })

    $("#data").click(function(){
        $('.update-popup').css('display', 'block');
    })

    //버튼클릭시 감정확인
    $("#happy").click(function () {
        var plate = $("#happy").val();
        $('#upt-title')[0].defaultValue = plate;
      });
      $("#soso").click(function () {
        var plate = $("#soso").val();
        $('#upt-title')[0].defaultValue = plate;
      });
      $("#romance").click(function () {
        var plate = $("#romance").val();
        $('#upt-title')[0].defaultValue = plate;
      });
      $("#angry").click(function () {
        var plate = $("#angry").val();
        $('#upt-title')[0].defaultValue = plate;
      });
      $("#sad").click(function () {
        var plate = $("#sad").val();
        $('#upt-title')[0].defaultValue = plate;
      });
      $("#irritation").click(function () {
        var plate = $("#irritation").val();
        $('#upt-title')[0].defaultValue = plate;
      });

      $(function () {
          var embed = $("#estimate"); //팝업 코드

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
          });

          $(".dim").on("click", function () {
            $(this).hide();
            $("#layer").hide();
            $(".cont").empty();
          });
        });

   
    </script>
	<script>
		
		var memberName = $("#memberName").val();
		var memberId = $("#memberId").val();
        var pageNum = 1;
        var pageSize = 15;
        
        
        var search = $('#searchBar').val().trim();
    	$('#keyword').val(search);
    	var keyword = $('#keyword').val();
        function getSearchFirstPage(memberName,pageNum, pageSize,keyword) {
        	location.href = "/calendar/search?memberName=" + memberName + "&pageNum=" + pageNum + "&pageSize=" + pageSize+"&search="+keyword;
        }
        
        function getDiaryList(memberName, pageNum, pageSize) {
        	location.href = "/calendar/diary?memberName="+memberName+"&pageNum=" + pageNum + "&pageSize=" + pageSize;
        }
		
        //내용 확인
        function getList(calendarId){
            $('.update-popup').css('display', 'block');
            $.ajax({
                url: "/calendar/id/"+calendarId,
                type: "Get",
                dataType: "json",
                success: (response) => {
                    $('#DBemotion').val(response.calendarEmotion);
                    $('#upt-content').val(response.content);
                    $('#inputHidden').val(response.calendarId);
                }
            })
        }
        $('#contentUpdate').click(function(){
            var calendarId = $("#inputHidden").val();
            var calendarEmotion = $("#upt-title").val();
            var content = $("#upt-content").val();
            
            var jsonData={
                calendarId : calendarId,
                calendarEmotion : calendarEmotion,
                content : content
            }
            $.ajax({
                url:"/calendar/update/"+calendarId,
                type: "PATCH",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(jsonData),
                success: (response) =>{
                    alert("수정이 완료되었습니다.")
                    $(".update-popup").css('display','block')
                    location.reload();
                }
            })
        })
        $("#contentDelete").click(function(){
            var calendarId = $("#inputHidden").val();
            $.ajax({
                url: "/calendar/delete/"+calendarId,
                type:"DELETE",
                dataType:"json",
                success:(response)=>{
                    alert("삭제가 완료되었습니다.");
                    $(".update-popup").css('display','none')
                    location.reload();
                }
            })
        })
              getcalendarEmotion(memberId);

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
            if(data.length == 0){
            	alert("검색결과가 없습니다.")
            	history.back();
            }
          }
        })
      }
      $('#searchBar').keyup(function (key) {
          var pageNum = 1;
          var pageSize = 15;
          if (key.keyCode == 13) {
            var search = $('#searchBar').val().trim();
            if (search != '') {
              location.href = "/calendar/search?memberName=" + memberName + "&pageNum=" + pageNum + "&pageSize=" + pageSize+"&search="+search;
            	
            }
            console.log(search);
          }
      })
    </script>
</body>
</html>