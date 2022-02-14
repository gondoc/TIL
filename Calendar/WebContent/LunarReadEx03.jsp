<%@page import="kr.green.lunar.vo.LunarUtil"%>
<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.green.lunar.vo.LunarVO"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음력 데이터를 읽어보자</title>
<style type="text/css">
	table {
		width: 80%;
		margin: auto;
	}
</style>
</head>
<body>
 <%
 	List<LunarVO> list = LunarUtil.getLunarData(application.getRealPath("lunarData"), 2022, 1);
 	for(LunarVO vo : list){
 		out.println(vo + "<br>");
 	}
 	out.println("<hr>");
 	
 	list = LunarUtil.getLunarData(application.getRealPath("lunarData"), 2002, 8);
 	for(LunarVO vo : list){
 		out.println(vo + "<br>");
 	}
 	out.println("<hr>");
 %>

</body>
</html>
