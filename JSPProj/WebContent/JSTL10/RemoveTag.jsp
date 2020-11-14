<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RemoveTag.jsp</title>
</head>
<body>
<!-- 
remove tag
- removeAttribute와 같은 역할
- 해당 scope 에 있는 변수를 제거하는 역할을 한다.
- 변수를 삭제하는 경우 scope이 맞지 않으면 삭제 되지 않는다.
- scope를 지정하지 않으면 동일한 이름으로 저장된 모든 영역의 변수가 삭제 됨.

 -->
	<fieldset>
		<legend>remove tag</legend>
		<!-- JSTL을 이용해 각 영역에 속성 저장 -->
		<my:set var="pagevar" value="페이지 영역" scope="page"/>
		<my:set var="pagevar" value="request 영역1" scope="request"/>
		<my:set var="requestvar" value="request 영역2" scope="request"/>
		<my:set var="sessionvar" value="session 영역" scope="session"/>
		<my:set var="applicationvar" value="application 영역" scope="application"/>
		<!-- remove시에는 영역을 지정하는게 좋다! 같은 이름의 다른 영역 객체가 전부 사라질 수 있다. -->
		<h2>삭제 전 출력</h2>
		<ul>
			<li>pagevar : ${pagevar }</li>
			<li>requestScope.pagevar : ${requestScope.pagevar }</li>
			<li>requestvar : ${requestvar }</li>
			<li>sessionvar : ${sessionvar }</li>
			<li>applicationvar : ${applicationvar }</li>
		</ul>
		
		<h2>속성명은 존재하나 영역이 다른 경우(에러NO, 삭제NO)</h2>	
		<my:remove var="requestvar" scope="session"/> 
		<h2>영역이 다른 속성을 삭제 시도 후 출력</h2>
		<ul>
			<li>pagevar : ${pagevar }</li>
			<li>requestScope.pagevar : ${requestScope.pagevar }</li>
			<li>requestvar : ${requestvar }</li>
			<li>sessionvar : ${sessionvar }</li>
			<li>applicationvar : ${applicationvar }</li>
		</ul>
		
		<h2>동일한 속성명이 여러 영역에 존재하는 경우(scope 미지정시-모두 삭제된다.) 출력</h2>
		<my:remove var="pagevar"/>
		<ul>
			<li>pagevar : ${pagevar }</li>
			<li>requestScope.pagevar : ${requestScope.pagevar }</li>
			<li>requestvar : ${requestvar }</li>
			<li>sessionvar : ${sessionvar }</li>
			<li>applicationvar : ${applicationvar }</li>
		</ul>
		
		
	</fieldset>
</body>
</html>