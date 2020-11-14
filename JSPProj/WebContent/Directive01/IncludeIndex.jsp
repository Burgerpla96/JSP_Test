<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>시작 페이지입니다.</legend>
		<%@ include file="IncludePage.jsp" %>
		<!-- 소스그대로 삽입된다. -->
		<!--  include file에는 contextPath가 없어야한다.(여기선, JSPProj) -->
		<h2>오늘은 <%= getDate("yyyy-MM-dd") %> 일입니다.</h2>
		현재 페이지는 <%= currentPage %> 입니다.
	</fieldset>
</body>
</html>
