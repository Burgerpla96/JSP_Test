<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseForContentType.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Content-Type응답 헤더</legend>
		<h3>서블릿에서 직접 브라우저에 스트림 출력(이때는 반드시 setCotentType()메서드 사용)</h3>
		<!--  
			서블릿으로 요청을 보낼때 링크거는 방법
			절대경로: 
			/Context 루트 / 이후는 마음대로
			단, web.xml의 url-pattern요소에서는
			Context루트를 제외한 /로 시작
		 -->
		<a href="<%= request.getContextPath() %>/AniDir/SomeDir/SetContentType.kosmo">서블릿으로 요청 보내기</a><br/>
		<a href="/JSPProj/AniDir/SomeDir/SetContentType.kosmo">서블릿으로 요청 보내기2</a>
				
	</fieldset>
</body>
</html>