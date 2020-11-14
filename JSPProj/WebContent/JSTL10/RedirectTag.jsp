<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!--  RedirectTag.jsp -->
<!-- 
	redirect 방식으로 페이지 이동
	request 영역에 공유 안함
	
	절대경로로 설정시 url속성에 역시 contextpath지정 안함
	단, JSP 내장객체response의 sendRedirect()로 이동시에는 contextpath 포함
 -->
 
<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>
<!-- 자바코드로 리다이렉트 -->
<%--
	response.sendRedirect(request.getContextPath()+"/JSTL10/ImportedPage.jsp?user=KIM&pass=1234");
--%>

<!-- JSTL태그로 리다이렉트(같은 웹 어플 안에서) -->
<%-- 
<c:redirect url="/JSTL10/ImportedPage.jsp">
	<c:param name="user" value="PARK"/>
	<c:param name="pass" value="1234"/>
</c:redirect>
--%>
<!-- JSTL태그로 리다이렉트(다른 어플안에 있는 페이지로) -->
<%-- 
<c:redirect url="/Test.jsp" context="/TestProj">
	<c:param name="user" value="LEe"/>
	<c:param name="pass" value="4321"/>
</c:redirect>
--%>


