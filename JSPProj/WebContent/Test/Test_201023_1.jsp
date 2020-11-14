<%@ page language="java" contentType="text/html; charset=ASCII"
    pageEncoding="UTF-8"%>

<%--@ include file="JSPProj/Test/Test_201023.jsp" --%>
<!-- include에는 context경로를 포함시키면 안된다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test_201023_1.jsp</title>
</head>
<body>
<%
	//물리적 경로 얻기
	String path = application.getRealPath("Test_201023_1.jsp");
	out.println(path);
	
	out.println("안녕하세요.");
%>
	<h2>연습해 봅시다.</h2>
	<div style="background-color: red; color: blue;">
		charset=UTF-8을 <br/>
		charset=ASCII로 바꿀겁니다.<br/>
		All Korean language changed to "?".<br/>
		charset=ASCII를 하지 않고 contentType에 charset을 주지 않으면 한글이 나온다.  
	</div>
</body>
</html>