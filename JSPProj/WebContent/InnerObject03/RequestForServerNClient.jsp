<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForServerNClient.jsp</title>
</head>
<body>
	<fieldset>
		<legend>요청한 서버와 클라이언트에 대한 정보</legend>
		<form method="post">
			<input type="submit" value="서버로 전송"/>
		</form>
		<ul style="list-style: upper-roman;">
			<li>전송방식: <%= request.getMethod() %></li>
			<li>전체 URL: <%= request.getRequestURL() %></li>	
			<li>도메인을 제외한 전체 URI: <%= request.getRequestURI() %></li>
			<li>요청 프로토콜: <%= request.getProtocol() %></li>	
			<li>요청 서버명: <%= request.getServerName() %></li>	
			<li>요청 서버포트: <%= request.getServerPort() %></li>	
			
			<li>클라이언트의 IP주소: <%= request.getRemoteAddr() %></li>
			<li>클라이언트의 IP주소: <%= request.getRemoteHost() %></li>
			<li>요청과 관련된 세션객체 얻기(서블릿에서 사용-로그인처리시): <%= request.getSession() %></li>
			<li>세션 내장 객체: <%= session %></li>
			
			<!-- 
			 JSP에서 웹어플리케이션 전체를 Context라고 함
			getContextPath()하면 Server에 있는 server.xml의 
			context태그에 path 값을 읽는다.
			 -->
		</ul>
	</fieldset>
	<fieldset>
		<legend>Context ROOT얻기</legend>
		<h3>프로젝트 생성 후, server.xml의 Context요소의 path속성 미 변경시</h3>
		Context Path(프로젝트명): <%= request.getContextPath() %>
		<h3>프로젝트 생성 후, server.xml의 Context요소의 path속성 변경시("" 혹은 "/")</h3>
		Context Path(빈 문자열): <%= request.getContextPath() %>
	
	
	</fieldset>
</body>
</html>