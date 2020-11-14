<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study_201029_1.jsp</title>
</head>
<body>
	<% String angel = "천사";%>
	<%-- 
	<c:set var="<%= angel %>" value="1004"/>
	--%>
	<%--
	<c:set var="${angel }" value="1004"/>
	--%>
	<c:set var="angel" value="1004"/>
	
	${angel }
</body>
</html>