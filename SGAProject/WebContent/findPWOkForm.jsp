<%@page import="java.io.PrintWriter"%>
<%@page import="kr.green.login.service.LoginServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String foundPw = "";
String id = request.getParameter("id");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");
foundPw = LoginServiceImpl.getInstance().findPw(id, name, birth, phone);
if (foundPw == "") {
	out.println("<script>alert('해당 정보를 찾을 수 없습니다.');history.back();</script>");
} else {
	PrintWriter pw = response.getWriter();
	pw.println("<script>");
	pw.println("alert('고객님의 회원정보를 확인하였습니다.');");
	pw.println("if(confirm('소중한 개인정보 보호를 위해 비밀번호 재설정 페이지로\\n이동하시겠습니까?\\n\\n확인을 누르시면 비밀번호 재설정 페이지로 이동하며,\\n취소를 누르시면 다음 알림창에 비밀번호가 나타납니다.'))");
	pw.println("location.href='PasswordUpdateOKForm.jsp';");
	pw.println("else");
	pw.println("alert('고객님의 비밀번호는 " + foundPw + "입니다.');");
	pw.println("</script>");
	pw.close();
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPW</title>
</head>
<body>

</body>
</html>