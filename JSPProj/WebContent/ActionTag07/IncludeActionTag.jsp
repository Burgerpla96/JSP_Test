<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//페이지명 변수에 저장
	String directivePath = "DirectivePage.jsp";
	String actionPath = "ActionTagPage.jsp";
	//페이지 및 리퀘스트 영역에 속성 저장
	pageContext.setAttribute("pageVar", "페이지 영역입니다.");
	request.setAttribute("requestVar", "리퀘스트 영역입니다.");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeActionTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>include지시어와 &lt;jsp:include&gt;액션태그</legend>
		<h2>include 지시어로 페이지 포함하기</h2>
		<!-- file 속성에 표현식 불가 -->
		<%--@ include file="<%= directivePath%>" --%>
		<!-- 파일에 있는 자바코드가 그대로 변환된다. -->
		<%@ include file="DirectivePage.jsp" %>
		
		
		<h2>include 액션태그로 페이지 포함하기</h2>
		<!-- page속성에 표현식 사용으로 동적 변경 가능!!! -->
		<jsp:include page="<%= actionPath %>"></jsp:include>
		<!-- Action tag는 반드시 종료태그가 있어야 한다.!!! -->
		<!-- 표현식만 와야한다.!!!!! -->
		
		<!--
		include지시어로 불러온 변수를 액션태그에서 쓸 수 있지만,
		반대로  
		액션 태그로 불러온 페이지의 변수를 스크립트 요소안에서 사용할 수 없다.
		 
		-->
		
		<h2>삽입된 페이지 안에서 선언한 변수 사용하기</h2>
		<ul>
			<li>directiveString: <%= directiveString %></li>
			<li>actionTagString: <%--= actionTagString --%></li>
			<!-- actionTagString는 페이지가 달라져서 사용불가. -->
		</ul>
		
	</fieldset>
</body>
</html>