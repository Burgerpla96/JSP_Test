<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error.jsp</title>
</head>
<body>
	<fieldset>
		<legend>web.xml에 설정을 통한 에러처리</legend>
		<%
			// 방법1. try, catch
			try{
				out.println("전송방식: "+request.getMethod()+"<br/>");
				out.println("파라미터 문자열 길이: "+request.getParameter("name").length()+"<br/>");
				
			} catch(NullPointerException e){
				out.println("<h2>관리자에게 문의</h2>");
			}
			//방법2. page지시어 이용
			//방법3. web.xml 의 설정으로 예외 처리
			//개발 완료후에 사용
			//web.xml에 설정
			/*
			<error-page>
				<error-code>500</error-code>
				<location>/Error15/ErrorCode.jsp</location>
			</error-page>
			
			사용자가 요청한 페이지에서 예외페이지로 이동한다.
			
			*/
			
			out.println("전송방식: "+request.getMethod()+"<br/>");
			out.println("파라미터 문자열 길이: "+request.getParameter("name").length()+"<br/>");
			
		
		
		%>
	</fieldset>
</body>
</html>