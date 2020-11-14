<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study_201029_2.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL은 어떤 값을 가져올까요?</legend>
		<c:set var="a" value="a1"/>
		<c:set var="a" value="a2" scope="request"/>
		<c:set var="b" value="b1" scope="session"/>
		
		<ul style="list-style: decimal;">
			<li>${a }</li>	
			<!-- <li>\${pageContext.request.a } : </li> -->	
			<li>\${requestScope.a } : ${requestScope.a }</li>		
			<li><%=request.getAttribute("a") %></li>
			<li>${b }</li>		
		</ul>
	</fieldset>
</body>
</html>