<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectScopeForwarded.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 XXXXScope계열 내장 객체(forward된 페이지)</legend>
		<h2>자바코드(스트립팅 요소)로 각 영역에 저장된 속성 읽기</h2>
		<ul style="list-style: upper-roman;">
			<li>pageContext 영역: <%= pageContext.getAttribute("scopeVar") %></li>
			<li>request 영역: <%= request.getAttribute("scopeVar") %></li>
			<li>session 영역: <%= session.getAttribute("scopeVar") %></li>
			<li>application 영역: <%= application.getAttribute("scopeVar") %></li>
		</ul>
		
		<h2>EL(Expression Language)로 각 영역에 저장된 속성 읽기</h2>
		<ul style="list-style: upper-roman;">
			<li>pageContext 영역: ${pageScope.scopeVar }</li>
			<li>request 영역: ${requestScope.scopeVar } </li>
			<li>session 영역: ${sessionScope.scopeVar }</li>
			<li>application 영역: ${applicationScope.scopeVar }</li>
		</ul>
	</fieldset>
</body>
</html>