<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div class="form-structor">
  <div class="signup">
    <h2 class="form-title" id="signup">ShallWeShare?</h2>
    <form method="post" action="../users/userSignIn_yn">
    <div class="form-holder">
      <input type="text" class="input11"name="u_sns_id" class="input" placeholder="Id" />
      <input type="password" class="input11" name="u_pwd" placeholder="Password" />
    </div>
    <input type="submit" class="submit-btn" value="로그인">
  </div>
</form>
  <div class="wrap">
    <div>
        <a class="kakao"
            href="https://kauth.kakao.com/oauth/authorize?client_id=97b3eb27ba108e2e3f48aa5cbed11254&redirect_uri=http://localhost:8181/shallweshare/users/kakaoLogin&response_type=code">

            <img
            src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_wide.png"
            style="height: 60px">
        </a>
    </div>
</div>
    <div class="ttext">
<!--     ><a class="nav-link" href="list"> -->
        <a class= linkyun1 href="#">아이디 찾기</a>
        <span class="txt">|</span>
        <a class= linkyun2  href="#">비밀번호 찾기</a>
        <span class="txt">|</span>
        <a class= linkyun2  href="userSignUp">회원가입</a>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>