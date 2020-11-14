<%@page import="eltag.MyTagLib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyTagLib.jsp</title>
</head>
<body>
	<fieldset>
		<legend>내가 만든 태그 라이브러리 사용하기</legend>
		<h2>자바코드로 메서드 호출</h2>
		<%= MyTagLib.isNumber("1000사") %><br/>
		<%= MyTagLib.isNumber("1004") %><br/>

	
		<h2>EL로 메서드 호출(스크립팅 요소 사용안한다.)</h2>
		\${my:isNumber("1000사") } : ${my:isNumber("1000사") }<br/>
		\${my:isNumber("1004") } : ${my:isNumber("1004") }<br/>
		\${my:getGender("123456-1234567") } : ${my:getGender("123456-1234567") }<br/>
		\${my:getGender("123456-2234567") } : ${my:getGender("123456-2234567") }<br/>
		
		
	</fieldset>
</body>
</html>