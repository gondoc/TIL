<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchBar</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>

</head>
<body >
</br></hr></br></hr>
 <div class="container-fluid" style=" text-align: center;" >
	<form  action="${pageContext.request.contextPath}/Search/searchBarAction.jsp" method="POST"> 
		<input  size=35 class="btn btn-outline-primary btn-lg" id="searchBar" name="searchBar" aria-label="Search" placeholder="Search" > 
	
		</br></hr></br></hr>
		<button type="radio" class="btn btn-outline-success" value="naver" id="searchEngine" name="searchEngine" ><img src="${pageContext.request.contextPath}/Search/Naver.png"></button>
		
		<button type="radio" class="btn btn-outline-info" value="daum" id="searchEngine" name="searchEngine" ><img src="${pageContext.request.contextPath}/Search/Daum.png"></button>
		
		<button type="radio" class="btn btn-outline-primary" value="google" id="searchEngine" name="searchEngine"><img src="${pageContext.request.contextPath}/Search/Google.png"></button>
		
</br></br></br></br>

      </div>
    
	</form>
 
</body>
</html>