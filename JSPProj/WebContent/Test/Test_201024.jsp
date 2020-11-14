<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<% out.print(request.getRealPath("Test_201024.jsp"));%>
		<% out.print(request.getRealPath("Test_201024_jsp.java"));%>
		<!-- 
		위에 둘다 아래와같이 경로가 나온다.
		D:\LDK\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\
		tmp0\wtpwebapps\JSPProj\Test_201024_jsp.java
		 -->
		<!-- 
		 실제 servlet파일 위치 
		D:\LDK\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\
		tmp0\work\Catalina\localhost\JSPProj\org\apache\jsp\Test
		 -->
	</div>
	
</body>
</html>