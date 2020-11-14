<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="ErrorInfo.jsp"
    %>
<% 
	//사용자 입력값 받기
	String stringAge = request.getParameter("age");
	//out.println("stringAge:"+stringAge);
	String errorMessage = "";//에러 메세지 저장용
	int after10Years = -1;
	if(stringAge != null){
		/*
		try{
			after10Years = Integer.parseInt(stringAge)+10;
		} catch(NumberFormatException e){
			errorMessage = "나이는 숫자만...";
		}
		*/
		after10Years = Integer.parseInt(stringAge)+10;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>에러가 발생할 페이지</legend>
		<form>
			나이를 입력하세요?
			<input type="text" name="age">
			<input type="submit" value="확인">			
		</form>
		<% if(after10Years != -1){ %>
		당신의 10년후 나이는 <%= after10Years %>살이군요.
		<% } %>
		<%= errorMessage %>
	</fieldset>
</body>
</html>