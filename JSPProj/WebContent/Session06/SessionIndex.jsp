<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionIndex.jsp</title>
</head>
<body>
<!--
 - session개체의 주요 메서드

	String getId(): 해당 세션의 세션 ID를 return
	long getCreationTime(): 
	session의 생성된 시간을 1970년 1월1일 이후 흘러온 
	시간을 1/1000초단위로  return
	long getLastAccessedTime():
	웹 브라우저의 요청이 마지막으로 시도된 시간을 
	1970년 1월1일 이후 흘러온 시간을 1/1000초단위로  return
	void setMaxInactiveInterval(time): 
	session을 유지할 시간을 초 단위로 설정
	int getMaxInactiveInterval():세션유지 시간 얻기				
	void invalidate():세션 기본개체가 삭제됨.
	즉 할당된 세션의 속성값을 모두 제거,주로 세션을 종료할 때 사용.
	boolean isNew(): 새로운 클라이언트인지 판단. 
	즉 새로운 세션이면 true ,아니면 false 리턴
 -->
	<fieldset>
		<legend>session(HttpSession type)내장객체의 주요 메서드</legend>
		<ul style="list-style: upper-roman;">
			<li>세션의 유효시간 얻기(web.xml:분단위):
				<%= session.getMaxInactiveInterval() %>초
			</li>
			<% session.setMaxInactiveInterval(60); %>
			<li>method session의 유효시간 설정(초단위):
				<%= session.getMaxInactiveInterval() %>초
			</li>
			<li>Session ID: 
				<a href="SessionResult.jsp"><%= session.getId() %></a>
			</li>
			<% 
				//세션의 최초 생성시간
				long createTime = session.getCreationTime();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String creationTimeString = dateFormat.format(new Date(createTime));
				//서버가 클라이언트가 마지막으로 요청한 시간
				long accessTime = session.getLastAccessedTime();
				String accessTimeString = dateFormat.format(new Date(accessTime));
			%>
			<li>Session의 최초 생성 시간: 
				<%= creationTimeString %>
			</li>
			<li>클라이언트의 최근 요청 시간:
			 	<%= accessTimeString %>
			</li>
		</ul>
		
		<h2>session및 reguest영역에 저장</h2>
		<%
			request.setAttribute("requestScope", "request 영역입니다.");
			session.setAttribute("sessionScope", "session 영역입니다.");
		
		
		%>
		
	</fieldset>
	
	
	
</body>
</html>