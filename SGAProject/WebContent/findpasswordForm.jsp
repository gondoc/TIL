<%@page import="kr.green.login.service.LoginServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<title>비밀번호 찾기</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<head>

</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg bg-success text-uppercase fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="Main.jsp">SGAProject</a>
			<button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-success bg-opacity-25 text-dark text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<form action="findPWOkForm.jsp" method="post">
				<div id="findPW">
					<p style="font-size: 20pt; font-weight: bold">비밀번호 찾기</p>
					<br>
					<table>
						<tr>
							<td>아이디</td>
							<td>
								<input type="text" name="id" id="id" size="34" placeholder="사용자의 아이디를 입력해주세요">
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="name" id="name" size="34" placeholder="ex)홍길동">
							</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>
								<input type="text" name="birth" maxlength="6" size="34" placeholder="생년월일 6자리를 입력해주세요">
							</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
								<input type="text" name="phone" maxlength="11" placeholder="'-'없이 입력바랍니다. ex)01012345678" size="34">
							</td>
						</tr>
					</table>
					<br> <br>
					<button type="submit" class="btn btn-success btn-sm" id="id_confirm_btn">확인</button>
					<button type="submit" class="btn btn-success btn-sm" id="id_confirm_btn" onclick="location.href='login.jsp';">취소</button>
				</div>
			</form>
		</div>
	</header>
</body>
</html>
