<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//4가지 영역에 Scope를 붙여진 채로 내장객체 존재
	//pageScope: pageContext 기본 개체에 저장된 속성의 <속성,값> 매핑을 저장한 Map Collection
	//requestScope:request 기본 개체에 저장된 속성의 <속성,값> 매핑을 저장한 Map Collection
	//sessionScope:session 기본 개체에 저장된 속성의 <속성,값> 매핑을 저장한 Map Collection
	//applicationScope:application 기본 개체에 저장된 속성의 <속성,값> 매핑을 저장한 Map Collection
			
	//읽어올때: XXXXScope.속성명   혹은   XXXXScope["속성명"] single, double quotation 모두 가능
	//또한 XXXXScope 생략가능, 생략시 가장 작은 영역에 있는 걸 가져옴
	
	pageContext.setAttribute("scopeVar", "페이지영역");
	request.setAttribute("scopeVar", "request 영역");
	session.setAttribute("scopeVar", "session 영역");
	application.setAttribute("scopeVar", "application 영역");
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectScope.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 xxxxScope계열 내장 객체</legend>
		<h2>각 영역에 저장된 속성 읽기(xxxxScope 지정)</h2>
		<ul style="list-style: upper-roman;">
			<li>\${pageScope.scopeVar } : ${pageScope.scopeVar }</li>
			<li>\${requestScope.scopeVar } : ${requestScope.scopeVar }</li>
			<li>\${sessionScope['scopeVar'] } : ${sessionScope['scopeVar'] }</li>
			<li>\${applicationScope["scopeVar"] } : ${applicationScope["scopeVar"] }</li>
		</ul>
		
		<h2>각 영역에 저장된 속성 읽기(xxxxScope 미지정)</h2>
		<!-- scope미지정시 가장 작은 영역의 값으로 가져온다. -->
		<ul style="list-style: upper-roman;">
			<!-- null값은 빈칸으로 나온다. -->
			<li>\${scopeVar } : ${scopeVar }</li>
			<li>\${scopeVar } : ${scopeVar }</li>
			<li>\${scopeVar } : ${scopeVar }</li>
			<li>\${scopeVar } : ${scopeVar }</li>
		</ul>
		
	</fieldset>
	
	<jsp:forward page="InnerObjectScopeForwarded.jsp"/>
	
	
</body>
</html>