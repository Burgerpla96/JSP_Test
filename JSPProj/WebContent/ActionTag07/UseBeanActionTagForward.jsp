<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanActionTagForward.jsp</title>
</head>
<body>
<!-- 
	자바코드(scripting요소)에서 사용한 인스턴스 변수는
	액션 태그에서 사용불가   중요!!! 
	단, 액션태그에서 사용한 변수(id속성에 지정한 값)는 
	자바코드(scripting요소)에서도 사용가능
	
 -->
 <!-- 자바코드(scripting요소)로 영역에 있는 객체 얻기 -->
 	<%-- MemberDTO member = (MemberDTO)request.getAttribute("member");--%>
 	<%--= member.getName() --%>
 	<%-- 아래에러
 	<jsp:getProperty property="id" name="member"/>
 	--%>
 	
 	<jsp:useBean id="member" type="model.MemberDTO" scope="request"/>
 	<!-- scope에 있다고  되면 class가 아닌 type에 넣을 수 있다.-->
 	<h2>액션태그로 읽어오기</h2>
 	<ul>
 		<li>아이디: <jsp:getProperty property="id" name="member"/></li>
 		<li>비번: <jsp:getProperty property="pwd" name="member"/></li>
 		<li>이름: <jsp:getProperty property="name" name="member"/></li>
 		<li>나이: <jsp:getProperty property="age" name="member"/></li>
 	</ul>
 	<h2>자바코드(스크립팅요소)로 읽어오기</h2>
 	<ul>
 		<li>아이디: <%= member.getName() %></li>
 		<li>비번: <%= member.getPwd() %></li>
 		<li>이름: <%= member.getName() %></li>
 		<li>나이: <%= member.getAge() %></li>
 	</ul>
</body>
</html>