<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormatDateTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>국제화 tag: formatDate tag</legend>
		<c:set var="today" value="<%= new Date() %>"/>
		<!-- 
		- 문자열로 표시되는 날짜 및 시간 값을 java.util.Date로 파싱해주는 기능
		- var 와 scope속성을 제외한 모든 속성은 EL식과 표현식 지정 가능
		
		
		value는 필수 속성, 단 Date type이 와야한다.
		type은 기본값이 date
		dateStyle 기본값: default
		-->
		<h2>필수 속성만 사용</h2>
		<h4>EL로 출력</h4>
		\${today } : ${today }
		
		<h4>JSTL의 formatDate tag로 출력</h4>
		<fmt:formatDate value="${today }" dateStyle="default"/>
		<h4>type="date"(default), dateStyle="short"</h4>
		<fmt:formatDate value="${today }" dateStyle="short"/>
		<h4>type="date"(default), dateStyle="medium"</h4>
		<fmt:formatDate value="${today }" dateStyle="medium"/>	
		<!-- medieum과 default가 같다. -->	
		<h4>type="date"(default), dateStyle="long"</h4>
		<fmt:formatDate value="${today }" dateStyle="long"/>	
		<h4>type="date"(default), dateStyle="full"</h4>
		<fmt:formatDate value="${today }" dateStyle="full"/>	
		
		<h4>type="time" timeStyle="default"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="default"/>
		<h4>type="time", timeStyle="short"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="short"/>
		<h4>type="time", timeStyle="medium"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="medium"/>	
		<!-- medieum과 default가 같다. -->	
		<h4>type="time", timeStyle="long"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="long"/>	
		<h4>type="time", timeStyle="full"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="full"/>	

		<h2>pattern 속성-type속성이 의미 없다.(주로 사용)</h2>
		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd a HH:mm:ss"/><br/>
		<fmt:formatDate value="${today }" pattern="yyyy년  MM월 dd일"/><br/>
		<fmt:formatDate value="${today }" pattern="yyyy년  MM월 dd일 HH시 입니다."/><br/>
		<fmt:formatDate value="${today }" pattern="yyyy년  MM월 dd일 EEEE"/><br/>
		
		<h2>var속성 지정해서 원하는 위치에 출력</h2>
		<fmt:formatDate value="${today }" pattern="yyyy년  MM월 dd일 EEEE" var="promise"/>
		<h4>아래에 출력</h4>
		모임 날짜는 <span style="color: red;font-size: 1.5em">${promise }</span> 입니다.
		
		
		
	</fieldset>
</body>
</html>