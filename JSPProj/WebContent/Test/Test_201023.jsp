<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
 	String id = "ㅇ";
 	if(id != null){
 		response.sendRedirect(request.getContextPath()+"/BBS08/List.jsp");
 	}
 	else{
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>잘못된 아이디
</body>
</html>

<%
 	}
%>