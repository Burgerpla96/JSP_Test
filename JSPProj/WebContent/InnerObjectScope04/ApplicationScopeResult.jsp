<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationScopeResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>application 영역에 저장된 속성 읽기</legend>
		<h2>list 계열 Collection</h2>
		<ul style="list-style: upper-roman;">
			<% List<MemberDTO> list = (List<MemberDTO>)application.getAttribute("list"); 
				for(MemberDTO m : list){
			%>
			<li>	<%= m %></li>
			<%	} %>
		</ul>
		
		<h2>map 계열 Collection</h2>
		<ul style="list-style: upper-roman;">
			<% Map<String,MemberDTO> map = (Map<String, MemberDTO>)application.getAttribute("map"); 
				Set<String> keys = map.keySet();
				for(String key : keys){
			%>
			<li>	<%= map.get(key) %></li>
			<%	} %>
		</ul>
		
		
	</fieldset>
</body>
</html>