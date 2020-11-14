<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  DirectivePage.jsp -->
    
<%
	//독립적인 서블릿으로 변환안된다. 코드가 그대로 복사되어 간다.
	//즉 페이지에 포함되서 서블릿으로 변환된다. -> 같은 페이지이다.

	//변수선언 -- 가능
	String directiveString = "지시어로 삽입된 페이지 안에서 선언한 변수";
	
%>
<h4>DirectivePage.jsp페이지입니다.</h4>
<ul>
	<li>페이지 영역: <%= pageContext.getAttribute("pageVar") %></li>
	<li>리퀘스트 영역: <%= request.getAttribute("requestVar") %></li>

</ul>