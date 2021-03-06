<%@page import="java.util.HashMap"%>
<%@page import="kr.green.login.dao.MemberDAO"%>
<%@page import="kr.green.login.dao.MemberDAOImpl"%>
<%@page import="kr.green.login.vo.MemberVO"%>
<%@page import="kr.green.login.service.LoginServiceImpl"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
String nickName = (String) session.getAttribute("nickName");
String phone = (String) session.getAttribute("phone");
String Email = (String) session.getAttribute("Email");
int question = (Integer) session.getAttribute("question");
String answer = (String) session.getAttribute("answer");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Hello JSP</title>
<style type="text/css">
/* 1110 260 */
.container {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 550px;
	height: 260px;
	margin-top: -130px;
	margin-left: -260px;
}

/* 메인으로 이동 버튼 컨테이너 안의 중앙으로 */
div#Main {
	text-align: center;
}
</style>
</head>
<body class="container">
	<div class="jumbotron">
		<h1>Welcome</h1>
		<p><%=nickName%>님 반갑습니다.
		</p>
		<div id=Main>
			<a href="Main.jsp" class="btn btn-primary btn-success" autofocus>메인페이지 접속</a>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<Script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<Script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>