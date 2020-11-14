<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test_201022_path.jsp</title>
</head>
<body>
	<a href="../Cookie05/CookieExamIndex.jsp">쿠키공부로 이동: 상대경로</a><br/>
	<a href="http://localhost:8080/JSPProj/Cookie05/CookieExamIndex.jsp">쿠키공부로 이동: 절대경로</a>
	
	
	
	<!--
	파일 켜고 URL긁어 와서 찾은 절대경로  
	http://localhost:8080/JSPProj/Cookie05/CookieExamIndex.jsp -->
	<!--
	파일이 실제 내 컴퓨터에 저장된 경로
	 D:\LDK\Workspace는 서버에 들어가는 것이 아니라 빼고,
	 WebContent는 eclipse에서 임의로 만들어준 것이라 뺀다.
	 D:\LDK\Workspace\JSPProj\WebContent\Cookie05\CookieExamIndex.jsp 
	 
	 최종 절대경로: 
		/JSPProj/Cookie05\CookieExamIndex.jsp
	 -->
	 
	<!-- 정리  
	절대경로 : 
	ContextPath가 붙어야 한다.
	여기서는 JSPProj
	
	상대경로:
	ContextPath(프로젝트명)는 생략이 가능하다. 

	
	
	-->
</body>
</html>