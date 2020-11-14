<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="none" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test_201030.jsp</title>
</head>
<body>
	<fieldset>
		<legend>test</legend>
		<% request.setAttribute("test", 10); %>
		<% String str = "안녕"; %>
		<h2>일부로 에러내고 에러내기 전까지 출력이 되는지 page지시어에 buffer='none'해보기</h2>
		
		${"안녕"+ "반가워" }
		<!-- @ page buffer="none"로 에러가 나지 않는다. -->
		<h3>에러이후의 문구(출력되지 않는다.)</h3>
		<!-- 
		buffer를 사용하지 않게 되어 바로 출력을 하기때문에 
		에러가 나기 전까지 출력이 되고, 그 이후는 출력이 없게 된다. 
		-->
		
		
	</fieldset>
</body>
</html>