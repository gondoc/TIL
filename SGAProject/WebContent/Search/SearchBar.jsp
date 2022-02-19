<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchBar</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
</head>
<body>
	<div class="container-fluid" style="text-align: center;">
		<form action="${pageContext.request.contextPath}/Search/searchBarAction.jsp" method="POST">
			<input style="height: 57px;" size=80 class="btn btn-outline-success btn-lg" id="searchBar" name="searchBar" aria-label="Search" placeholder="Enter the search word and click the icon below.">
			<br /> <br />
			<%-- naver --%>
			<button style="height: 55px;" class="btn btn-outline-success" value="naver" id="searchEngine" name="searchEngine">
				<img style="height: 32px;" src="${pageContext.request.contextPath}/Search/Naver.png">
			</button>
			<%-- google --%>
			<button style="height: 55px;" class="btn btn-outline-success" value="google" id="searchEngine" name="searchEngine">
				<img style="height: 32px;" src="${pageContext.request.contextPath}/Search/Google.png">
			</button>
			<%-- daum --%>
			<button style="height: 55px;" class="btn btn-outline-success" value="daum" id="searchEngine" name="searchEngine">
				<img style="height: 32px;" src="${pageContext.request.contextPath}/Search/favicon_daum.ico">
			</button>
		</form>
	</div>
</body>
</html>