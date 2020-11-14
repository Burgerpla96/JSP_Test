<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CatchTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>catch tag</legend>
		<!-- 
		catch tag: 
		-EL에서 오류날때 에러 처리시 주로 사용
		-에러 내용을 원하는 위치에서 출력할때 사용
		-JSTL문법오류는 catch가 안된다.
		-->
		<c:set var="fnum" value="100"/>
		<c:set var="snum" value="0"/>
		<h2>에러가 안나는 경우: 에러 내용이 저장 안됨</h2>
		<c:catch var="error">
			\${fnum/snum } : ${fnum/snum }<br/>
		</c:catch>
		\${error } : ${error }
		
		<h2>에러가 나는 경우: 에러 내용이 저장됨</h2>
		<c:catch var="error">
			\${"백"+100 } : ${"백"+100 }<br/>
		</c:catch>
		\${error } : ${error }
		
		<h2>JSTL문법오류는 catch가 안된다.</h2>
		<c:catch var="error">
			<!-- 원래 choose안에 주석 안된다. -->
			<c:choose>
				
				<c:when test="true">
					참이다.
				</c:when>
			</c:choose>
		</c:catch>
		<!-- 주로 EL오류를 잡는데 쓴다. -->
		
	</fieldset>
</body>
</html>