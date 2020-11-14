<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Cookie 값 확인</legend>
		<%
		//클라이언트로 응답헤더에 실어서 보낸 쿠키는 
		//클라이언트가 다시 요청할때 //?요청헤더에 실어서 
		Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(Cookie cook:cookies){
					//쿠키명 얻기
					String name = cook.getName();
					//쿠키값 얻기
					String value = cook.getValue();
					out.println(String.format("%s : %s", name, value));
					
				}
			}
		
		%>
	</fieldset>
</body>
</html>