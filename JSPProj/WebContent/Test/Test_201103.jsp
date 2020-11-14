<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test_201103.jsp</title>
</head>
<body>
	<fieldset>
		<legend>form tag enctype</legend>
		<form action="#" enctype="multipart/form-data" method="post">
		<!-- 
		enctype="application/x-www-form-urlencoded"가 default라
		다른 enctype을 주면 getParameter를 할 수 없다.
		-->
			<input type="text" value="이름" name="name"/>
			<input type="submit" value="제출"/> 
		</form>
		
	</fieldset>
	
	<fieldset>
		<legend>정답확인</legend>
		나오나?   = >   <%= name %>
	</fieldset>
</body>
</html>