<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ActionTagPage.jsp -->
    
<%
    //이 페이지는 서블릿으로 변환
    //즉 다른 페이지이다.
    //실행결과가 페이지에 포함된다. 단, request영역은 공유!!!!!!!!
    
    //변수 사용 불가능
    String actionTagString = "액션테그로 삽인된 페이지 안에서 선언한 변수";
	
%>

<h4>DirecActionTagPagetivePage.jsp페이지입니다.</h4>
<ul>
	<!-- 안 되고 -->
	<li>페이지 영역: <%= pageContext.getAttribute("pageVar") %></li>
	<!-- 된다. -->
	<li>리퀘스트 영역: <%= request.getAttribute("requestVar") %></li>

</ul>