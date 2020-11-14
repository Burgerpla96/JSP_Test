<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글 잘보이게
	request.setCharacterEncoding("UTF-8");	

	//리퀘스트영역에 객체 저장
	request.setAttribute("member", new MemberDTO("KIM","1234","김길동",null,"20"));
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamActionTagInInclude.jsp</title>
</head>
<body>
	<fieldset>
		<!-- include와 다르게 실행되어 서블릿 생성된다. -->
		<legend>삽입하는 페이지에 파라미터 전달</legend>
		<jsp:include page="IncludedPage.jsp">
			<jsp:param value="쿼리스트링" name="query"/>
			<jsp:param value="박길동" name="name"/>
			<jsp:param value="PARK" name="id"/>
		</jsp:include>
		
	</fieldset>
</body>
</html>