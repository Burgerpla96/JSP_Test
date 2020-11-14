<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectParamResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 param 내장 객체</legend>
		<h2>자바코드로 영역에 저장된 속성 및 파라미터로 전달된 값 읽기</h2>
		<h4>영역에 저장된 속성</h4>
		<%
			MemberDTO member = (MemberDTO)request.getAttribute("dtoObject");
		%>
		<ul style="list-style: upper-roman;">
			<li>MemberDTO객체: <%= member %></li>
			<li>String객체: <%= request.getAttribute("stringObject") %></li>
			<li>Integer객체: <%= request.getAttribute("integerObject") %></li>
			
		</ul>
		
		<h4>파라미터로 전달된 값</h4>
		<%
			int first = Integer.parseInt(request.getParameter("first"));
			int second = Integer.parseInt(request.getParameter("second"));
		%>
		두 파라미터의 합: <%= first+second %>		
		
		
		<!--
		사용법  
		param.파라미터명   혹은 param["파라미터명"]
		
		EL은 ' 나 " 모두 사용가능
		
		 -->
		<h2>EL로 영역에 저장된 속성 및 파라미터로 전달된 값 읽기</h2>
		<h4>영역에 저장된 속성</h4>
		<ul style="list-style: upper-roman;">
			<li>MemberDTO객체: ${dtoObject }</li>
			<li>String객체: ${requestScope["stringObject"] }</li>
			<li>Integer객체: ${integerObject }</li>
		</ul>
		
		<h4>파라미터로 전달된 값</h4>
		두 파라미터의 합:${param.first + param['second'] }
		<!-- 숫자 더하기할때 형변환 불필요 -->
	</fieldset>
</body>
</html>