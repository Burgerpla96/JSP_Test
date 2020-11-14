<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
	<li><a href="<%= request.getContextPath() %>/Directive01/Index.jsp">HOME</a></li>
	<% if(session.getAttribute("USER_ID")==null){ %>
		<li><a href="<%= request.getContextPath() %>/Session06/Login.jsp">로그인</a></li>
	<% }else{ %>
		<li><a href="<%= request.getContextPath() %>/Session06/Logout.jsp">로그아웃</a></li>
	<% } %>
	
	<li><a href="<%= request.getContextPath() %>/Directive01/Member.jsp">회원가입</a></li>
	<li>공지사항</li>
	<li><a href='<c:url value='/BBS08/List.jsp'/>'>게시판</a></li>
	<li>Q&A</li>
</ul>