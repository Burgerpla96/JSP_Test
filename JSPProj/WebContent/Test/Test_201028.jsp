<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test_201028.jsp</title>
</head>
<body>
﻿

	<c:set var="name" value="hong"/>
	<c:if test="   ${name == 'hong'}  " var="result">
		홍길동 이군요
	</c:if>

</body>
</html>

