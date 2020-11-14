<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study_201103_1.jsp</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<fieldset>
		<legend>2차 개인 프로젝트를 위해 MVC 2 방식에서 한글을 어떻게 가져올지 고민해봐요~</legend>
		<ol>
			<li>form tag의 method='post'를 이용해 post 방식으로 보낼거에용
				<form action='<c:url value="/Test/Test_post.jsp"/>' method="post">
					ID: <input type="text" name="username"/>
					Password: <input type="password" name="password"/>
					<input type="submit" value="post로 전달"/>
				</form>
			</li>
			<li>
				<a href='<c:url value="/Test/Test_get.jsp"/>'>
					a tag는 get방식으로 파라미터를 보내용		
				</a>
			</li>
		</ol>
	</fieldset>
	<fieldset>
		<legend>한글이 깨지지 않고 나오나요?</legend>
		<ol>
			<li>post 방식으로 요청시: ${method_post }</li>
			<li>get 방식으로 요청시: ${method_get }</li>
		</ol>
	</fieldset>	
</body>
</html>