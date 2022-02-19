<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");

request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id");
String nickName = (String) session.getAttribute("nickName");

if (nickName == null) { // 넘어온 값이 null이라면 공백을 넣는다.
nickName = "";
}

String gender = null;
int height = 0;
int weight = 0; // weight
double heightp = 0;
double result = 0; // result
double bmi = 0;
String result2 = "";

gender = (String) request.getParameter("gender");
weight = Integer.parseInt(request.getParameter("weightbar"));
height = Integer.parseInt(request.getParameter("heightbar"));

heightp = Math.floor(height) * 1 / 100;
bmi = weight / (heightp * heightp);
result = Math.round(bmi * 100) / 100.0;

if (result >= 25) {
	result2 = "비만";
} else if (result >= 23) {
	result2 = "과체중";
} else if (result >= 18.5) {
	result2 = "정상";
} else {
	result2 = "저체중";
}

%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<title>BMI 결과창</title>

<head>

<!-- Gowun+Batang Font -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Font Awesome icons (free version) -->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<!-- Google fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<script type="/text/javascript" src="../js/bootstrap.js"></script>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<!-- jquery 3.3.1-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- google icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<script type="text/javascript">
	$(window).on("load", function() {
		loginCheck()
	});
	var str = "${nickName}";

	function loginCheck() {
		if (str != "") { // 넘어온 값이 공백이 아니라면 == 값이 있다면
			// display:none 속성을 지워 상단 로그아웃 버튼, 마이페이지${nickName}버튼을 나타나게 한다.
			$('a#logout').removeAttr('style');
			$('a#myPage').removeAttr('style');
		} else { // 공백이라면 == 값이 없다면
			$('a#login').removeAttr('style');
		}
	}

	function logoutCheck() {
		if (confirm('로그아웃 하시겠습니까?')) {
			alert('정상 로그아웃 되었습니다.');
			location.href = "../logout.jsp";
		}
		return false;
	}
</script>
<style>
h1 { 
	text-align: center;
}

p {
	text-size: 20px;
	padding: 15px;
}
</style>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg bg-success text-uppercase fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="../Main.jsp">SGAProject</a>
			<button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-black rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" id="login" style="display: none;" href="../login.jsp">login</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" id="myPage" style="display: none;" href="../memberpageUpdate.jsp"><%=nickName%>'s page
						</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" id="logout" style="display: none;" onclick="logoutCheck()">logout</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<header class="masthead text-white text-center">
		<div class="container d-flex align-items-center flex-column"></div>
	</header>
	<h1>측정 결과</h1>
	<div class="container d-flex flex-column">
	<div class="flex-center" style="padding-top: 1rem;">
	<hr />
	<!--체질량지수는 자신의 몸무게(kg)를 키의 제곱(m)으로 나눈 값-->

	<!-- ex) 키 170㎝에 몸무게 73kg이면, 
			계산식 : 73 / (1.7×1.7) = 25.26 → 과체중 -->

	<!-- 	키를 100으로 나누고 소수점 첫째자리까지  -->
	<p id="result">
	전체 변수 출력
	<br />
	성별 : <%=gender%>
	<br /> 
	신장 : <%=height%>
	<br /> 
	체중 : <%=weight%>
	</p>
	<hr />
	BMI측정결과 : 신체질량지수(BMI)는 <b><%=result%></b>로 <b><%=result2%></b> 입니다.
	<br />
	<br />
	<div style="text-align: center;">
	<button onclick="history.back()" class="btn btn-success btn-lg">이전 페이지</button>
	</div>
	<br />
	</div>
	</div>
	<script type="text/javascript">
		function check(result) {
			if (result >= 25) {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '비만'입니다.")
			} else if (result >= 23) {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '과체중'입니다.")
			} else if (result >= 18.5) {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '정상'입니다.")
			} else {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '저체중'입니다.")
			}
		}
		var result = <%=result%>
		check(result)
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	
</body>
</html>