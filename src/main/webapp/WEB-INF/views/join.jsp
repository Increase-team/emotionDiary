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
    <link rel="stylesheet" href="/resources/static/css/style.css" />
  </head>
  <body>
    <div class="container">
      <h1>회원가입</h1>
      <div class="login-form">
        <div class="txt-field">
          <input id="userId" type="text" required />
          <label>아이디</label>
        </div>
        <div class="txt-field">
          <input id="userPassword" type="password" required />
          <label>비밀번호</label>
        </div>
        <div class="txt-field">
          <input id="userrePassword" type="password" required />
          <label>비밀번호 재확인</label>
        </div>
        <input
          class="login-btn"
          id="loginbtn"
          type="butten"
          value="회원가입"
          onclick="join()"
        />
      </div>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script>
      function join() {
        var password = $("#userPassword").val();
        var rePassword = $("#userrePassword").val();
        var userId = $("#userId").val();

        if (password == "" || rePassword == "" || userId == "") {
        	alert("양식을 모두 적어주세요.");
          return false;
        }

        if (password !== rePassword) {
        	alert("입력한 비밀번호가 다릅니다.");
          $("#rePassword").focus();
          return false;
        }

        var jsonData = {
          memberName: userId,
          memberPassword: rePassword,
        };

        $.ajax({
          url: "/members",
          type: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(jsonData),
          success: function (response) {
            if (response) {
              location.href="/login"
            } else {
            	alert("비밀번호 혹은 이름이 틀렸습니다.");
            }
          },
        });
      }
    </script>
  </body>
</html>
