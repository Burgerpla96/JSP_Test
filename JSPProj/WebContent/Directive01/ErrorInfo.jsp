<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true" 
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorInfo.jsp</title>
</head>
<body>
	<fieldset>
		<legend>에러 발생</legend>
		<h2>관리자에게 문의하세요:010-1234-5678</h2>
		<!-- 
		exception 내장객체는
		isErrorPage="true" 일때 사용가능
		 -->
		<%= exception.getMessage() %>
	</fieldset>
</body>
</html>