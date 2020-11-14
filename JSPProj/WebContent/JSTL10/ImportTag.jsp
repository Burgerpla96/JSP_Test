<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImportTag.jsp</title>
</head>
<!-- jsp:include액션 태그와 동일하다! request영역 공유 -->
<!-- 
	uri 속성에 절대 경로 설정시 프로젝트명은 제외!!!
	server.xml의 context태그의 path속성값을 지운 졍우는 상관없다.
-->
<body>
	<fieldset>
		<legend>import tag</legend>
		<c:set var="requestvar" value="request 영역" scope="request"/>
		<h2>var 속성 미지정(현재 위치에 바로 삽입 jsp:include액션 태그와 동일)</h2>
		<c:import url="ImportedPage.jsp" >
			<c:param name="user" value="KIM"/>
			<c:param name="pass" value="1234"/>
		</c:import>
		
		<h2>var 속성 지정(원하는 위치에 바로 삽입하고자 할때)</h2>
		<!-- 변수에 넣어서 EL로 원하는 위치에 넣는다. -->
		<c:import url="ImportedPage.jsp" var="content" charEncoding="UTF-8">
			<c:param name="user" value="PARK"/>
			<c:param name="pass" value="9999"/>
		</c:import>
		<h3>아래에 import된 페이지 내용 출력</h3>
		${content }
		<h2>외부에 있는 content 삽입</h2>
		<%-- 
		<c:import url="https://www.nate.com"/>
		--%>
		<iframe style="border: none; width: 100%;height: 500px" src="ImportedNate.jsp"></iframe>
		
	</fieldset>
</body>
</html>