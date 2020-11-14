<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OutTag.jsp</title>
</head>
<body>
	<!-- EL에 없는 기능이 있어 가끔 사용한다. -->
	<fieldset>
		<legend>out tag</legend>
		<c:set var="htmlString"><h3>h3 tag로 감싼 문자열</h3></c:set>
		<h2>EL로 출력</h2>
		\${htmlString } : ${htmlString }
		
		<h2>escapeXml="false": html tag실행(EL과 동일)</h2>
		<c:out value="${htmlString }" escapeXml="false"/>
		
		<h2>escapeXml="true"(default): html tag가 그대로 문자열로 출력</h2>
		<c:out value="${htmlString }" escapeXml="true"/>
		
		<h2>default 속성</h2>
		<!-- 
		out tag의 value속성의 값이 없을떄,
		default속성에 지정한 값을 출력함
		-->
		<h3>빈 문자열인 경우: 값이 있는 경우</h3>
		<c:out value="" default="빈 문자열이다."/>
		<h3>null인 경우: 값이 없는 경우</h3>
		<c:out value="${param.name }" default="null이다."/>
		
		<h3>페이지 링크에 응용</h3>
		<c:url value="/BBS08/List.jsp?nowPage="/><br/>
		<c:out value="${param.nowPage }" default="2"/><br/>
		<a href='<c:url value="/BBS08/List.jsp?nowPage="/><c:out value="${param.nowPage }" default="2"/>'>리스트</a>
		
	</fieldset>
</body>
</html>