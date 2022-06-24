<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="UTF-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/resources/static/css/style.css" />
    <title>로그인</title>
  </head>
  <body>
    <div class="container">
      <h1>Login</h1>
      <div class="login-form">
        <div class="txt-field">
          <input id="userId" type="text" required />
          <label>아이디</label>
        </div>
        <div class="txt-field">
          <input id="userPassword" type="password" required />
          <label>비밀번호</label>
        </div>
        <input type="checkbox" id="checkId" name="checkId" />
        <label for="checkId">아이디 저장</label>
        <input class="login-btn" id="loginbtn" type="butten" value="로그인" />
        <div class="signup-link">회원이 아닌가요?<a href="/join">회원가입</a>
        </div>
      </div>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script>

      //버튼을 클릭할 때 실행
      $("#loginbtn").click(function () {
        var memberId = $("#userId").val();
        var memberPassword = $("#userPassword").val();

        if (memberId == "") {
        	alert("아이디를 입력하세요");
          $("#userId").focus();
          return false;
        }
        if (memberPassword == "") {
        	alert("비밀번호를 입력하세요");
          $("#userPassword").focus();
          return false;
        }

        var jsonData = {
          memberName: memberId,
          memberPassword: memberPassword,
        };
        
        $.ajax({
          url: "/login",
          type: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(jsonData),
          success: function (response) {
            if (response) {
            	location.href = "/calendar"; //페이지 이동!
            } else {
            	alert("비밀번호 혹은 이름이 틀렸습니다.");
            	$("#userPassword").val('');
            }
          },
        });
      });
      
      $(document).ready(function () {
          var userInputId = getCookie("userInputId"); //저장된 쿠기값 가져오기
          $("#userId").val(userInputId);

          if ($("#userId").val() != "") {
            // 그 전에 ID를 저장해서 처음 페이지 로딩
            // 아이디 저장하기 체크되어있을 시,
            $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
          }

          $("#checkId").change(function () {
            // 체크박스에 변화가 발생시
            if ($("#checkId").is(":checked")) {
              // ID 저장하기 체크했을 때,
              var userInputId = $("#userId").val();
              setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            } else {
              // ID 저장하기 체크 해제 시,
              deleteCookie("userInputId");
            }
          });

          // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
          $("#userId").keyup(function () {
            // ID 입력 칸에 ID를 입력할 때,
            if ($("#checkId").is(":checked")) {
              // ID 저장하기를 체크한 상태라면,
              var userInputId = $("#userId").val();
              setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }
          });
        });

        function setCookie(cookieName, value, exdays) {
          var exdate = new Date();
          exdate.setDate(exdate.getDate() + exdays);
          var cookieValue =
            escape(value) +
            (exdays == null ? "" : "; expires=" + exdate.toGMTString());
          document.cookie = cookieName + "=" + cookieValue;
        }

        function deleteCookie(cookieName) {
          var expireDate = new Date();
          expireDate.setDate(expireDate.getDate() - 1);
          document.cookie =
            cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }

        function getCookie(cookieName) {
          cookieName = cookieName + "=";
          var cookieData = document.cookie;
          var start = cookieData.indexOf(cookieName);
          var cookieValue = "";
          if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(";", start);
            if (end == -1) end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
          }
          return unescape(cookieValue);
        }
    </script>
  </body>
</html>
