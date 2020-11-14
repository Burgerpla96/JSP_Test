<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UrlTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>url tag</legend>
		<!-- 
		url 생성시 사용
		-절대경로 생성시에는 context path제외
		-var속성 미 지정시 해당위치에 url이 출력 된다.
			(param태그에 지정한 파라미터가 쿼리 스트링으로 연결됨)
		-->		
		<h2>var 속성 미 지정</h2>
		<c:url value="/JSTL10/ImportedPage.jsp">
			<c:param name="user" value="KIM"/>
			<c:param name="pass" value="1234"/>
		</c:url>	
		
		<h2>var 속성 지정</h2>
		<c:url value="/JSTL10/ImportedPage.jsp" var="url">
			<c:param name="user" value="KIM"/>
			<c:param name="pass" value="1234"/>
		</c:url>	
		<h2>내가 원하는 위치에서 URL사용</h2>
		<a href="${url }">링크 페이지</a>
		
		<h2>HTMl태그안에서 JSTL로 절대경로 지정/h2>
		<a href='<c:url value='/JSTL10/ImportedPage.jsp?user=LEE&pass=5656'/>'>ImportedPage.jsp</a>
		
	</fieldset>
</body>
</html>