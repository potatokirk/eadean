<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면 </title>
<%
request.setCharacterEncoding("utf-8");
%>
<style>@import'../css/kakao/css_kakaoSignIn.css'</style>
</head>
<body>
<header><%@include file="../header.jsp"%></header>


<div class="form-structor">
  <div class="signup">
    <h2 class="form-title" id="signup">Eadean</h2><br>
      <form method="post" action="kakaoLoIn">
    <div class="form-holder">
      <input type="text" class="input11"name="u_id" class="input" placeholder="Id" /><br>
      <h1></h1><br>
      <input type="password" class="input11" name="u_pwd" placeholder="Password" />
    </div>
    <input type="button" class="submit-btn" value="로그인 " onclick="nomal()"/>
  </div>
  <div class="wrap">
    <div>
        <!-- KAKAO REST API 값넣기  -->
        <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=01ca1a5b4ae88407008da4b96f448cbc&redirect_uri=http://localhost:8282/kakaoLogin">
            <img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_wide.png" style="height: 60px">
        </a>
    </div>
</div>
    <div class="ttext">
<!--     ><a class="nav-link" href="list"> -->
        <a class= linkyun1 href="#">아이디 찾기</a>
        <span class="txt">|</span>
        <a class= linkyun2  href="#">비밀번호 찾기</a>
        <span class="txt">|</span>
        <a class= linkyun2  href="register">회원가입</a>
    </div>
    
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<footer><%@include file="../footer.jsp"%></footer>
</body>
</form>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function nomal() {
            // 입력한 값 가져오기
            var userId = $(".input11[name='u_id']").val();
            var userPwd = $(".input11[name='u_pwd']").val();

            // 값이 비어있지 않은지 확인
            if (userId && userPwd) {
                // 값이 존재하면 loginyn으로 보내기
                $.ajax({
                    type: "POST",
                    url: "loginyn",  // 여기에 실제로 데이터를 처리하는 서버 엔드포인트를 지정하세요
                    data: {
                        u_id: userId,
                        u_pwd: userPwd
                    },
                    success: function(response) {
                    	if(response==200){
                    		location.href="/";
                    	}else if(response==400){
                    		alert("비밀번호가 일치하지 않습니다. ");
                    	}else{
                    		alert("아이디가 없습니다. ");
                    	}
                        // 서버 응답에 대한 처리 (optional)
                    },
                    error: function(xhr, status, error) {
                        // 에러 처리 (optional)
                    }
                });
            } else {
                alert("아이디와 비밀번호를 모두 입력하세요.");
            }
        }
    </script>





















</html>
