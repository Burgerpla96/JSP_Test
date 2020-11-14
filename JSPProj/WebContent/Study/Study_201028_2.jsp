<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study_201028_2.jsp</title>
</head>
<body>
	<fieldset>
		<legend>결과를 보기전에 추측해 보아요</legend>
		<c:set var="num1" value="11" scope="request"/>
		<c:set var="num2" value="9"/>
		<ul style="list-style: decimal;">
			<li>\${"11">'9' } : ${"11">'9' }</li>
			<li>\${11>num2 } : ${11>num2 }</li>
			<li>\${num1>9 } : ${num1>9 }</li>
			<li>\${11>9 } : ${11>9 }</li>
		</ul>
	</fieldset>
</body>
</html>