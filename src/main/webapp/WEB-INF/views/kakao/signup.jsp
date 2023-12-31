<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<%
request.setCharacterEncoding("utf-8");
%>
</head>
<style>
div{
margin:20px;
}
</style>
<body class="bg-light">
	<div class="bg-light">
		<header>
			<%@include file="../header.jsp"%>
		</header><br>
		<main>
		<br>
		<h1></h1>
		
			<div class="container">
				<div class="py-5 text-center"></div>

				<div class="row g-5">
					<div class="col-md-12 col-lg-12">
						<form name="signup_form" class="needs-validation" novalidate
							action="signUpOk" method="post">
							<div class="row g-3">
							
								<div class="col-sm-12">

									<label for="u_id" class="form-label" id="idMatchLabel"></label><br>
									 <label	for="u_id" class="form-label">아이디</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" name="u_id" id="u_id" placeholder="아이디를 적어주세요." required minlength="4">
											 <input	type="button" onclick="idchk()" value="중복확인">
									</div>
								</div>

								<div class="col-sm-6">
									<label for="u_pwd" class="form-label">비밀번호</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" name="u_pwd"
											id="u_pwd" placeholder="비밀번호를 적어주세요.  " required>

									</div>
								</div>

								<div class="col-sm-6">
									<label for="u_pwd_cnf" class="form-label">비밀번호 확인</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" name="u_pwd_cnf"
											id="u_pwd_cnf" placeholder="비밀번호를 확인해주세요. " required>
									</div>
								</div>

								<div class="col-sm-12">
									<label for="u_name" class="form-label">이름</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" name="u_name"
											id="u_name" placeholder="이름을 적어주세요." required>

									</div>
								</div>

								<div class="col-12">
									<label for="u_phone" class="form-label">전화번호</label>
									<div class="input-group has-validation">
										<input type="tel" class="form-control" maxlength="12"
											name="ur_phone" id="u_phone" required
											placeholder="'-'를 제외한 번호만 입력해주세요.">
									</div>
								</div>


								<div class="col-12">
									<label for="u_email" class="form-label">이메일</label> <input
										type="email" class="form-control" name="u_email" id="u_email"
										placeholder="이메일을 적어주세요." required>

								</div>

								<div class="col-md-4">
									<label for="member_postcode" class="form-label">우편번호</label>
									<div class="input-group">
										<input type="text" class="form-control" name="member_postcode"
											id="member_postcode" placeholder="우편번호" readonly required>
										<input type="button" class="btn btn-secondary"
											onclick="execDaumPostcode()" value="우편번호 찾기"></input>
									</div>

								</div>

								<div id="wrap"
									style="display: none; border: 1px solid; width: 100%; height: 400px; margin: 5px 0; position: relative">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
										id="btnFoldWrap"
										style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
										onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>

								<div class="col-md-12">
									<label for="u_address" class="form-label">주소</label> <input
										type="text" class="form-control" name="u_address"
										id="u_address" placeholder="도로명주소" readonly required>

								</div>

								<div class="col-md-6">
									<input type="text" class="form-control"
										name="member_extraAddress" id="member_extraAddress"
										placeholder="상세주소">
								</div>

								<div class="col-md-6">
									<input type="text" class="form-control"
										name="member_detailAddress" id="member_detailAddress"
										placeholder="참고항목 (선택)">
								</div>

								<hr class="my-4">

								<input class="w-100 btn btn-success btn-lg mb-3" type="button"
									onclick="signUpCheck()" value="가입하기"> <input
									class="w-100 btn btn-outline-danger btn-lg" type="reset"
									value="재작성">

							</div>
						</form>
					</div>
				</div>

			</div>
		</main>
	</div>

	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	<!-- ---------------------------------비밀번호 일치 확인  ------------------------------------------------- -->
	document.addEventListener("DOMContentLoaded", function() {
		  var pwdInput = document.getElementById("u_pwd");
		  var cPassInput = document.getElementById("u_pwd_cnf");
		  var resultLabel = document.createElement("span");
		  resultLabel.id = "passwordMatchLabel";
		  resultLabel.style.display = "block";

		  cPassInput.parentElement.appendChild(resultLabel);

		  pwdInput.addEventListener("keyup", function() {
		    checkPasswordMatch();
		  });

		  cPassInput.addEventListener("keyup", function() {
		    checkPasswordMatch();
		  });

		  function checkPasswordMatch() {
		    var password = pwdInput.value;
		    var confirmPassword = cPassInput.value;

		    if (password === confirmPassword) {
		      resultLabel.textContent = "비밀번호가 일치합니다. ";
		      resultLabel.style.color = "green";
		    } else {
		      resultLabel.textContent = "비밀번호가 일치하지 않습니다. ";
		      resultLabel.style.color = "red";
		    }
		  }
		});

	
	
	<!-- -------------------------------- 아이디 중복 확인  ------------------------------------------------- -->	
		function idchk() {
			var u_id = $("#u_id").val();
			var resultLabel = $("#idMatchLabel");
			if(u_id===""){
			resultLabel.text("아이디를 입력하세요");
	     	resultLabel.css("color", "red");
			return false;				
			}
			$.ajax({
				type : 'POST', // HTTP 요청 방식 설정 (GET 또는 POST)
				url : 'idChk', // 요청을 보낼 URL
				data : {
					u_id : u_id
				}, // 전송할 데이터 설정
				success : function(response) {
					console.log(response)
					if (response === 1) {
						resultLabel.text("사용가능한 아이디 입니다.");
						resultLabel.css("color", "green");
					}else{
						resultLabel.text("중복된 아이디가 있습니다.");
						resultLabel.css("color", "red");
					}
				},
				error : function() {
					$('#result').html('에러가 발생했습니다.'); // 에러 시 처리
				}
			});

		}
	</script>
	
	<!-- --------------------------------주소 찾기  ------------------------------------------------- -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');
		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}
		function execDaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수
							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("member_extraAddress").value = extraAddr;
							} else {
								document.getElementById("member_extraAddress").value = '';
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('member_postcode').value = data.zonecode;
							document.getElementById("u_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("member_detailAddress")
									.focus();
							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_wrap.style.display = 'none';
							// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							document.body.scrollTop = currentScroll;
						},
						// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
						onresize : function(size) {
							element_wrap.style.height = size.height + 'px';
						},
						width : '100%',
						height : '100%'
					}).embed(element_wrap);
			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		}
	</script>
</body>
</html>