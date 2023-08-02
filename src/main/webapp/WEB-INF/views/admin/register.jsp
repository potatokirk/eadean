<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table board="1" align="center">
		<form method="post" action="registerOk">
			<tr height="50">
				<td colspan="2">
					<h1>회원가입 신청</h1>
				</td>
			</tr>
			<tr height="30">
				<td width="80">User ID</td>
				<td><input type="text" size="20" name="u_id"></td>
			</tr>

			<tr height="30">
				<td width="80">암호</td>
				<td><input type="password" size="20" name="u_pwd"></td>
			</tr>

			<tr height="30">
				<td width="80">별명</td>
				<td><input type="text" size="20" name="u_name"></td>
			</tr>

			<tr height="30">
				<td width="80">이메일</td>
				<td><input type="text" size="20" name="u_email"></td>
			</tr>

				<td colspan="2">
				<input type="submit" value="등록">
				</td>
			</tr>


		</form>
	</table>
</body>
</html>