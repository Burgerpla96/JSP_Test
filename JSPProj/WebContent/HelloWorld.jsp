<%@page import="model.PBKDF2"%>
<%@page import="model.BBSDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP 및 서블릿 테스트용 페이지"
    session="true"
    %>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY.MM.dd HH:mm:ss");
	String dateString = dateFormat.format(new Date());
	//<  > 로 감싸져있는 부분은 서버 측에서 실행시킨다.
	//BBSDao dao = new BBSDao(application, "JSP","jsp");
	//dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Hello World(동규)</h2>
	<fieldset>
		<legend>JSP테스트</legend>
		<h3>오늘은  <%= dateString %> 일입니다.</h3>
	</fieldset>
	<fieldset>
		<legend>Servlet Test</legend>
		<h3><a href="HelloServlet.do">Hello Servlet</a></h3>
		<span style="color:red;font-size:1.2em;font-weight: bold;">${message}</span>
		<h2>임금님 귀는 당나귀 귀</h2>
		<h2>계산기</h2>
		<form action="Calcurator.kosmo">
			<input type="text" name ="firstNum" size="10" maxlength="10"/>
			<select name="operator">
				<option value="+">더하기</option>
				<option value="-">빼기</option>
				<option value="*">곱하기</option>
				<option value="/">나누기</option>
			</select>
			<input type="text" name ="secondNum" size="10" maxlength="10"/>
			<input type="submit" value="결과는"/>
			<span style="color:green;font-size:1.4em;font-weight:bold">${result}</span>
		</form>
	</fieldset>
	<%
		out.println(PBKDF2.createHash("1234").length());
	
		
	
	
	%>
</body>
</html>