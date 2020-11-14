<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForTokensTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forTokens tag</legend>
		<%
			String colors = "red,green,blue,#ab7dff";
		
			out.println("<h2>String class</h2>");
			for(String color: colors.split(",")){
				out.println("<h4 style='color:"+color+"'>"+color+"</h4>");
			}
			
			out.println("<h2>StringTokenizer class</h2>");
			StringTokenizer tokenizer = new StringTokenizer(colors,",");
			out.println("토큰 수: "+tokenizer.countTokens());
			//hasMoreTokens(): 꺼내올 토큰이 있으면 true,아니면 false
			while(tokenizer.hasMoreTokens()){
				//토큰을 꺼내올 때는 nextToken()
				String color = tokenizer.nextToken();
				out.println("<h4 style='color:"+color+"'>"+color+"</h4>");
			}
		%>
		
		<h2>JSTL의 forTokens tag</h2>
		<c:set var="colors" value="<%= colors %>"/>
		<c:forTokens items="${colors }" delims="," var="color">
			<h4 style="color: ${color }">${color }</h4>
		</c:forTokens>
		
		
		
		
	
	
	</fieldset>
</body>
</html>