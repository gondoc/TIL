<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>memberpageUpdate</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- jquery 3.3.1-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">
	function passwordCheck() {
		var p1 = document.getElementById('password').value;

		if (p1.length < 6) {
			alert('입력한 글자가 6글자 이상이어야 합니다.');
		}
		return false;
	}
</script>
<style type="text/css">
.jumbotron {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 550px;
	height: 260px;
	margin-top: -130px;
	margin-left: -260px;
}

#p_jumbotron {
	text-align: center;
}

#div_jumbotron {
	background-color: #198754;
	width: 400px;
	padding: 50px;
	margin: 0 auto;
}
</style>
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
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead bg-success bg-opacity-25 text-dark text-center">
		<div class="container d-flex align-items-center flex-column">
		<form action="passwordOk.jsp" method="post">
		<div class="jumbotron ">

			<div class="bg-success p-2 text-white" id="div_jumbotron">
				<p id="p_jumbotron">
					회원정보를 안전하게 보호하기 위해<br>비밀번호를 한번 더 확인해주세요.
				<p id="p_jumbotron">
					<label>비밀번호</label>
					<input type="password" name="inputPw" autofocus>
				</p>
				<button type="submit" class="btn btn-success d-grid gap-2 col-6 mx-auto btn btn-dark btn-sm">확인</button>
			</div>
		</div>
	</form>
	</div>
	</header>
</body>
</html>


