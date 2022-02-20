<%@page import="kr.green.login.service.LoginServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>passwordOk</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	String password = (String) session.getAttribute("password");
	String inputPw = request.getParameter("inputPw");
	
	if (password.equals(inputPw)) {
		out.println("<script>alert('사용자의 정보가 확인되었습니다.');</script>");
		out.println("<script>location.href='memberPageUpdate2.jsp'</script>");
	} else {
		out.println("<script>alert('잘못된 값을 입력하셨습니다.');</script>");
		out.println("<script>history.back();</script>");
	}
	%>
</body>
</html>