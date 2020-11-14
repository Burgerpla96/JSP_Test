<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Session 확인 페이지</legend>
		<ul style="list-style: upper-roman;">
			
			<li>Session ID: 
				<%= session.getId() %>
			</li>
			<li>method session의 유효시간 설정(초단위):
				<%= session.getMaxInactiveInterval() %>초
			</li>
			<li>리퀘스트 영역: <%= request.getAttribute("requestScope") %></li>
			<li>세션 영역: <%= session.getAttribute("sessionScope") %></li>
			
			
			
			
		</ul>
	</fieldset>
</body>
</html>